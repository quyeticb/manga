#!/bin/bash
echo "LANG='en_US.UTF-8'
LC_ALL='en_US.UTF-8'
LC_CTYPE='en_US.UTF-8'" >> /etc/environment
cat /dev/null > /etc/sysconfig/selinux
echo "SELINUX=disabled
SELINUXTYPE=targeted" > /etc/sysconfig/selinux
setenforce 0
dnf update -y
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
dnf install wget -y
dnf install unzip zip -y
dnf install nano -y
dnf install -y git
dnf install -y firewalld
dnf install -y tar
dnf install -y policycoreutils-python-utils
dnf install -y sshpass
dnf install -y screen
dnf install -y nginx
systemctl start firewalld
sudo dnf module list PHP
sudo dnf module enable php:remi-8.1 -y
sudo dnf install -y php php-cli php-common php-devel php-xmlrpc php-swoole php-gd php-tidy php-zts php-pear php-fpm php-apcu php-mysqlnd php-opcache php-brotli php-solr
sudo dnf install bc lsof java -y
systemctl enable nginx
systemctl start nginx
systemctl enable php-fpm
systemctl start php-fpm
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
cd
rm -Rf *
mkdir ~/.ssh
echo "StrictHostKeyChecking=no" > ~/.ssh/config
service sshd restart
mkdir -p /home/default/public_html
mkdir /home/default/private_html
mkdir /home/default/logs
chmod 777 /home/default/logs
mkdir -p /var/log/nginx
chown -R nginx:nginx /var/log/nginx
chown -R nginx:nginx /var/lib/php/session
echo "<?php echo '403'; ?>" > /home/default/public_html/index.php
echo "net.core.somaxconn = 65535" >> /etc/sysctl.conf



mkdir -p /var/lib/php/session
chown -R nginx:nginx /var/lib/php
chown nginx:nginx /home/default
chown -R nginx:nginx /home/*/public_html
chown -R nginx:nginx /home/*/private_html
rm -rf /etc/nginx/conf.d/*
wget https://raw.githubusercontent.com/quyeticb/manga/main/default.conf
echo -e "y" | mv default.conf /etc/nginx/conf.d/default.conf
wget https://raw.githubusercontent.com/quyeticb/manga/main/fastcgi_params
echo -e "y" | mv fastcgi_params /etc/nginx/fastcgi_params
cd
rm -Rf *
semanage permissive -a httpd_t
echo "zend_extension=opcache.so
opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=1024
opcache.interned_strings_buffer=16
opcache.max_accelerated_files=100000
opcache.max_wasted_percentage=5
opcache.use_cwd=1
opcache.validate_timestamps=0
opcache.revalidate_freq=0
opcache.fast_shutdown=1
opcache.blacklist_filename=/etc/php.d/opcache-default.blacklist
opcache.enable=1 
opcache.jit_buffer_size=512M
opcache.jit=tracing
opcache.jit=1255" > /etc/php.d/*opcache*.ini
echo "expose_php = Off
memory_limit=1024M
post_max_size=256M
upload_max_filesize=100M
max_execution_time = 7200" >> /etc/php.d/custom.ini
systemctl restart nginx
systemctl restart php-fpm
echo "DefaultLimitNOFILE=65000
DefaultLimitNPROC=65000" >> /etc/systemd/system.conf

echo "/home/default" >> /etc/php.d/opcache-default.blacklist


wget https://raw.githubusercontent.com/quyeticb/manga/main/www.conf
echo -e "y" | mv www.conf /etc/php-fpm.d/www.conf
wget https://raw.githubusercontent.com/quyeticb/manga/main/_nginx.conf
echo -e "y" | mv _nginx.conf /etc/nginx/nginx.conf
systemctl restart php-fpm
systemctl restart nginx

git clone https://github.com/pmmp/pthreads.git
cd pthreads
zts-phpize
./configure --with-php-config=/usr/bin/zts-php-config
make && make install
echo "extension=pthreads.so" > /etc/php-zts.d/pthreads.ini
cd
wget https://getcomposer.org/installer
php installer
mv composer.phar /usr/bin/composer
rm -Rf *




wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
chmod +x mariadb_repo_setup
sudo ./mariadb_repo_setup
yum -y install MariaDB-server MariaDB-client mariadb-libs

systemctl restart mysql
wget -O manga_base.sql https://raw.githubusercontent.com/quyeticb/manga/main/manga_base.sql
mysql -e 'DROP DATABASE IF EXISTS wm'
mysql -e 'CREATE DATABASE IF NOT EXISTS wm CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci'
mysql wm < manga_base.sql

mysql_upgrade --force mysql

systemctl restart mysql.service
mysql -e "CREATE USER 'manga'@'localhost' IDENTIFIED BY 'Manga.m';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'manga'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

wget https://raw.githubusercontent.com/quyeticb/manga/main/manga.zip
mv manga.zip /home/default/public_html/manga.zip
cd /home/default/public_html/
unzip -o manga.zip
cd
rm -f /home/default/public_html/manga.zip
rm -f /etc/php-zts.d/40-swoole.ini

mkdir /home/default
mkdir /home/default/private_html
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip --no-check-certificate
unzip phpMyAdmin-5.2.0-all-languages.zip
rm -f phpMyAdmin-5.2.0-all-languages.zip
mv phpMyAdmin-5.2.0-all-languages /home/default/private_html/phpmyadmin
mkdir /home/default/private_html/phpmyadmin/tmp
chmod 0777 /home/default/private_html/phpmyadmin/tmp
wget https://raw.githubusercontent.com/quyeticb/manga/main/config.inc.php
echo -e 'y' | mv config.inc.php /home/default/private_html/phpmyadmin/config.inc.php
firewall-cmd --permanent --zone=public --add-port=5555/tcp
firewall-cmd --reload
systemctl enable mysql

echo "zend_extension=/home/default/public_html/ioncube.so" > /etc/php.d/000-ioncube.ini
echo "zend_extension=/home/default/public_html/ioncube_zts.so" > /etc/php-zts.d/000-ioncube.ini

cd
rm -Rf *

crontab -l > mycron
echo "*/5 * * * * php /home/default/public_html/update.php manhwa18.cc" >> mycron
crontab mycron
rm -f mycron

chown -R nginx:nginx /home

reboot

