-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2022 at 04:56 AM
-- Server version: 10.9.2-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chapters`
--

CREATE TABLE `tbl_chapters` (
  `ID` bigint(20) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `manga_id` int(11) NOT NULL,
  `wp_manga_id` int(11) NOT NULL,
  `wp_chapter_id` int(11) NOT NULL,
  `wp_chapter_name` varchar(255) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chats`
--

CREATE TABLE `tbl_chats` (
  `ID` bigint(20) NOT NULL,
  `room` varchar(50) NOT NULL,
  `mfrom` int(11) NOT NULL,
  `mto` text NOT NULL,
  `message` text NOT NULL,
  `mtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consts`
--

CREATE TABLE `tbl_consts` (
  `ID` bigint(20) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_consts`
--

INSERT INTO `tbl_consts` (`ID`, `type`, `value`, `text_value`, `comment`) VALUES
(12, 'work_group', 'data_work', 'CÃ³ data - nháº­p liá»‡u', ''),
(13, 'work_group', 'nodata_work', 'KhÃ´ng cÃ³ dá»¯ liá»‡u - nháº­p liá»‡u', ''),
(14, 'work_level', 'difficult', 'Phá»©c táº¡p', ''),
(15, 'work_level', 'normal', 'BÃ¬nh thÆ°á»ng', ''),
(16, 'work_level', 'easy', 'Dá»…', ''),
(23, 'manga', 'global', '{\"image_folder\":\"\\/home\\/default\\/public_html\\/data\"}', NULL),
(24, 'manga', 'manga_leech_config', '{\"domains\":{\"socimg.com\":{\"domain\":\"socimg.com\",\"icon\":\"\\/home\\/default\\/public_html\\/user\\/tools\\/manga\\/data\\/img\\/socimg.com.png\",\"username\":\"test\",\"password\":\"test1100\",\"cdn_uri\":\"https:\\/\\/cdn.socimg.com\",\"post_status\":\"publish\"}},\"sources\":{\"manhwa18.cc\":{\"domain\":\"manhwa18.cc\",\"icon\":\"\\/home\\/default\\/public_html\\/user\\/tools\\/manga\\/data\\/img\\/manhwa18.cc.png\"},\"mangabuddy.com\":{\"domain\":\"mangabuddy.com\",\"icon\":\"\\/home\\/default\\/public_html\\/user\\/tools\\/manga\\/data\\/img\\/mangabuddy.com.png\"},\"webtoon.xyz\":{\"domain\":\"webtoon.xyz\",\"icon\":\"\\/home\\/default\\/public_html\\/user\\/tools\\/manga\\/data\\/img\\/webtoon.xyz.png\"}}}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data`
--

CREATE TABLE `tbl_data` (
  `ID` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'tbl_data_type:ID',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `create_by` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `check_dup` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_meta`
--

CREATE TABLE `tbl_data_meta` (
  `ID` bigint(20) NOT NULL,
  `data_id` int(11) NOT NULL COMMENT 'tabl_data:ID',
  `data_type` int(11) NOT NULL,
  `meta_key` varchar(64) NOT NULL,
  `meta_value` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_source`
--

CREATE TABLE `tbl_data_source` (
  `ID` bigint(20) NOT NULL,
  `data_type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `ids` longtext NOT NULL,
  `total` bigint(20) NOT NULL,
  `data_source_query` text NOT NULL,
  `data_source_query_hash` varchar(32) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_type`
--

CREATE TABLE `tbl_data_type` (
  `ID` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `meta_fields` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT current_timestamp(),
  `source` tinyint(4) DEFAULT NULL,
  `create_by` int(11) NOT NULL COMMENT 'tbl_users:ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files`
--

CREATE TABLE `tbl_files` (
  `ID` int(11) NOT NULL,
  `file_id` varchar(64) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `hash` varchar(32) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  `cl_folder` varchar(255) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `info` text NOT NULL,
  `upload_time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files_shared`
--

CREATE TABLE `tbl_files_shared` (
  `ID` int(11) NOT NULL,
  `file_id` bigint(20) NOT NULL COMMENT 'tbl_files:file_id',
  `user_id` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `shared_user_id` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `share_time` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_indexing_history`
--

CREATE TABLE `tbl_indexing_history` (
  `ID` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `google_acc` varchar(32) NOT NULL,
  `json_file` varchar(255) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `request_day` date NOT NULL,
  `request_time` int(11) NOT NULL,
  `index_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mangas`
--

CREATE TABLE `tbl_mangas` (
  `ID` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `poster` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `chapters` longtext NOT NULL,
  `source_id` bigint(20) NOT NULL,
  `genres` text NOT NULL,
  `authors` text NOT NULL,
  `artists` text NOT NULL,
  `alternative` longtext NOT NULL,
  `rating` float NOT NULL,
  `rating_count` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `latest_chapter` varchar(255) NOT NULL,
  `latest_chapter_url` varchar(255) NOT NULL,
  `update_time` date NOT NULL,
  `total_images` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manga_sites`
--

CREATE TABLE `tbl_manga_sites` (
  `ID` int(11) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `manga_id` bigint(20) NOT NULL,
  `wp_manga_id` bigint(20) NOT NULL,
  `pubdate_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `last_chapter` varchar(255) NOT NULL,
  `total_images` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manga_update_logs`
--

CREATE TABLE `tbl_manga_update_logs` (
  `ID` int(11) NOT NULL,
  `run_time` int(11) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `chapters` longtext NOT NULL,
  `info` longtext NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manga_update_logs`
--

INSERT INTO `tbl_manga_update_logs` (`ID`, `run_time`, `domain`, `source_url`, `chapters`, `info`, `status`) VALUES
(1, 1663347634, 'mangakia.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":0,\"updated_mangas\":[]}', 0),
(2, 1663519688, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":0,\"updated_mangas\":[]}', 0),
(3, 1663519691, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"Manga source not found\"}', 0),
(4, 1663519692, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"Manga source not found\"}', 0),
(5, 1663519703, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":0,\"updated_mangas\":[]}', 0),
(6, 1663522932, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":1,\"updated_mangas\":[\"https:\\/\\/manhwa18.cc\\/webtoon\\/skirt-of-brothers-wife-raw\"]}', 0),
(7, 1663523016, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":0,\"updated_mangas\":[]}', 0),
(8, 1663523022, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":0,\"updated_mangas\":[]}', 0),
(9, 1663523056, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":1,\"updated_mangas\":[\"https:\\/\\/mangabuddy.com\\/arpeggio-on-sea-surface\"]}', 0),
(10, 1663523107, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"This source not available for you\"}', 0),
(11, 1663523116, 'socimg.com', '0', '0', '{\"status\":true,\"message\":\"success\",\"total_manga_updates\":1,\"updated_mangas\":[\"https:\\/\\/manhwa18.cc\\/webtoon\\/skirt-of-brothers-wife-raw\"]}', 0),
(12, 1663563001, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"cURL error 7: Failed to connect to localhost port 80: Connection refused (see https:\\/\\/curl.haxx.se\\/libcurl\\/c\\/libcurl-errors.html)\"}', 0),
(13, 1663563001, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"cURL error 7: Failed to connect to localhost port 80: Connection refused (see https:\\/\\/curl.haxx.se\\/libcurl\\/c\\/libcurl-errors.html)\"}', 0),
(14, 1663563301, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"Server error: `POST http:\\/\\/localhost\\/ajax` resulted in a `502 Bad Gateway` response:\\n<html>\\r\\n<head><title>502 Bad Gateway<\\/title><\\/head>\\r\\n<body bgcolor=\\\"white\\\">\\r\\n<center><h1>502 Bad Gateway<\\/h1><\\/center>\\r\\n (truncated...)\\n\"}', 0),
(15, 1663563301, 'socimg.com', '0', '0', '{\"status\":false,\"error\":\"Server error: `POST http:\\/\\/localhost\\/ajax` resulted in a `502 Bad Gateway` response:\\n<html>\\r\\n<head><title>502 Bad Gateway<\\/title><\\/head>\\r\\n<body bgcolor=\\\"white\\\">\\r\\n<center><h1>502 Bad Gateway<\\/h1><\\/center>\\r\\n (truncated...)\\n\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mmo_tools`
--

CREATE TABLE `tbl_mmo_tools` (
  `ID` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `token` varchar(32) NOT NULL,
  `service` varchar(64) NOT NULL,
  `expires` int(11) NOT NULL,
  `opts` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mmo_tools`
--

INSERT INTO `tbl_mmo_tools` (`ID`, `user_id`, `token`, `service`, `expires`, `opts`) VALUES
(1, 2, 'ed8d80b844ffbc6ee9b34422d3a18b1e', 'indexing', 1663243552, '{\"max\":100000,\"package_name\":\"Basic\"}'),
(2, 3, 'abdd78e9317a16ef147c34477fe9ad11', 'indexing', 1663243552, '{\"max\":1000,\"package_name\":\"Basic\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projects`
--

CREATE TABLE `tbl_projects` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`users`)),
  `current_ids` longtext DEFAULT NULL,
  `data_left` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `due_date` int(11) NOT NULL,
  `data_source` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_storage`
--

CREATE TABLE `tbl_storage` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `root` varchar(255) NOT NULL,
  `used` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `role` tinyint(4) NOT NULL,
  `last_activity` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `ID` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'Loại thành viên',
  `email` varchar(64) NOT NULL COMMENT 'Địa chỉ email của thành viên',
  `username` varchar(32) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(32) NOT NULL COMMENT 'Mật khẩu',
  `first_name` varchar(20) DEFAULT NULL COMMENT 'Họ và tên đệm',
  `last_name` varchar(20) DEFAULT NULL COMMENT 'Tên',
  `address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  `phone` varchar(15) DEFAULT NULL COMMENT 'Điện thoại',
  `gender` tinyint(1) DEFAULT NULL COMMENT 'Giới tính (0-nam, 1-nữ)',
  `dob` datetime DEFAULT NULL COMMENT 'Ngày sinh',
  `avatar` text DEFAULT NULL COMMENT 'Ảnh đại diện (có thể là url)',
  `last_login` datetime DEFAULT NULL COMMENT 'Thời điểm đăng nhập lần cuối cùng',
  `last_activity` text DEFAULT NULL COMMENT 'Hoạt động cuối cùng trên trang',
  `logout_time` datetime DEFAULT NULL,
  `biography` longtext DEFAULT NULL COMMENT 'Giới thiệu về bản thân',
  `url` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ website các nhân',
  `language` varchar(3) DEFAULT NULL,
  `social` text DEFAULT NULL COMMENT 'Thông tin mạng xã hội của thành viên',
  `other_infomations` text DEFAULT NULL COMMENT 'Thông tin thêm về thành viên',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`ID`, `type`, `email`, `username`, `password`, `first_name`, `last_name`, `address`, `phone`, `gender`, `dob`, `avatar`, `last_login`, `last_activity`, `logout_time`, `biography`, `url`, `language`, `social`, `other_infomations`, `create_time`, `update_time`) VALUES
(4, 3, 'admin@domain.com', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 'admin', NULL, '', '', NULL, '2022-10-09 00:00:00', '/img/avatars/4.jpg', '2022-09-19 04:56:05', '[\"2022-09-13T02:48:04.018Z\",\"\\/\"]', NULL, '<p><br></p>', '', NULL, 'null', NULL, '2022-09-10 16:39:11', '2022-09-19 04:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_works`
--

CREATE TABLE `tbl_works` (
  `ID` int(11) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_by` int(11) NOT NULL COMMENT 'tbl_users:ID',
  `modified_by` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `modified_time` int(11) NOT NULL,
  `work_type_id` bigint(20) NOT NULL COMMENT 'tbl_work_type::ID',
  `start_date` int(11) NOT NULL,
  `due_date` int(11) NOT NULL,
  `level` varchar(30) NOT NULL,
  `work_data_ids` longtext NOT NULL,
  `target` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 - in_progress\r\n2 - completed\r\n3 - expired\r\n4 - drop\r\n5 - wait_for_assign\r\n6 - assign_reject\r\n7 - request complete\r\n',
  `request_complete_time` int(11) NOT NULL,
  `approve_complete_time` int(11) NOT NULL,
  `approve_complete_by` int(11) NOT NULL,
  `refresh_num` tinyint(4) NOT NULL COMMENT 'Số lần làm mới trạng thái (trong trường hợp nhân viên để quá hạn công việc => cần làm mới trạng thái để nhân viên có thể tiếp tục nhập liệu).',
  `check_dup` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_assign`
--

CREATE TABLE `tbl_work_assign` (
  `ID` bigint(20) NOT NULL,
  `work_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `share_time` int(11) NOT NULL,
  `receive_time` int(11) NOT NULL,
  `reject_time` int(11) NOT NULL,
  `drop_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_comments`
--

CREATE TABLE `tbl_work_comments` (
  `ID` bigint(20) NOT NULL,
  `work_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `file_ids` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `modified_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_data`
--

CREATE TABLE `tbl_work_data` (
  `ID` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data_id` bigint(20) NOT NULL,
  `work_id` bigint(20) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_files`
--

CREATE TABLE `tbl_work_files` (
  `ID` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_id` varchar(255) NOT NULL,
  `work_id` bigint(20) NOT NULL,
  `work_data_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `share_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`share_to`)),
  `file_size` bigint(20) NOT NULL,
  `mime_type` varchar(127) NOT NULL,
  `upload_time` int(11) NOT NULL,
  `info` longtext NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_meta`
--

CREATE TABLE `tbl_work_meta` (
  `ID` int(11) NOT NULL,
  `work_data_id` bigint(11) NOT NULL COMMENT 'tbl_workds:ID',
  `meta_key` varchar(50) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_work_type`
--

CREATE TABLE `tbl_work_type` (
  `ID` int(11) NOT NULL,
  `work_group` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'Tên loại công việc',
  `slug` varchar(50) NOT NULL COMMENT 'Tên viết tắt loại công việc',
  `icon` text NOT NULL,
  `meta_fields` text NOT NULL COMMENT 'Các trường meta của công việc',
  `create_by` int(11) NOT NULL COMMENT 'Tạo bởi',
  `create_time` int(11) NOT NULL COMMENT 'Ngày tạo',
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_chapters`
--
ALTER TABLE `tbl_chapters`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `domain_2` (`domain`,`wp_manga_id`,`wp_chapter_id`),
  ADD KEY `domain` (`domain`),
  ADD KEY `manga_id` (`manga_id`),
  ADD KEY `wp_post_id` (`wp_manga_id`),
  ADD KEY `wp_chapter_id` (`wp_chapter_id`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `wp_chapter_name` (`wp_chapter_name`);

--
-- Indexes for table `tbl_chats`
--
ALTER TABLE `tbl_chats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `room` (`room`),
  ADD KEY `mfrom` (`mfrom`),
  ADD KEY `mtime` (`mtime`);

--
-- Indexes for table `tbl_consts`
--
ALTER TABLE `tbl_consts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `type_2` (`type`,`value`) USING HASH,
  ADD KEY `type` (`type`);

--
-- Indexes for table `tbl_data`
--
ALTER TABLE `tbl_data`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `check_dup` (`check_dup`),
  ADD KEY `type` (`type`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_time` (`update_time`);

--
-- Indexes for table `tbl_data_meta`
--
ALTER TABLE `tbl_data_meta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `data_id` (`data_id`),
  ADD KEY `meta_key` (`meta_key`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `data_type` (`data_type`);

--
-- Indexes for table `tbl_data_source`
--
ALTER TABLE `tbl_data_source`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `slug` (`slug`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `data_type` (`data_type`),
  ADD KEY `data_source_query_hash` (`data_source_query_hash`),
  ADD KEY `total` (`total`);
ALTER TABLE `tbl_data_source` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `tbl_data_type`
--
ALTER TABLE `tbl_data_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `short_name_2` (`short_name`),
  ADD KEY `short_name` (`short_name`),
  ADD KEY `name` (`name`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `source` (`source`);

--
-- Indexes for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `file_size` (`file_size`),
  ADD KEY `mime_type` (`mime_type`),
  ADD KEY `upload_time` (`upload_time`),
  ADD KEY `status` (`status`),
  ADD KEY `parent` (`parent`),
  ADD KEY `file_name` (`file_name`),
  ADD KEY `cl_parent` (`cl_folder`),
  ADD KEY `type` (`type`);
ALTER TABLE `tbl_files` ADD FULLTEXT KEY `file_name_2` (`file_name`,`info`);

--
-- Indexes for table `tbl_files_shared`
--
ALTER TABLE `tbl_files_shared`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shared_user_id` (`shared_user_id`),
  ADD KEY `share_time` (`share_time`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_indexing_history`
--
ALTER TABLE `tbl_indexing_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `status` (`status`),
  ADD KEY `request_time` (`request_day`),
  ADD KEY `type` (`type`),
  ADD KEY `url` (`url`),
  ADD KEY `project` (`json_file`),
  ADD KEY `google_acc` (`google_acc`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `request_time_2` (`request_time`),
  ADD KEY `index_status` (`index_status`),
  ADD KEY `domain` (`domain`);

--
-- Indexes for table `tbl_mangas`
--
ALTER TABLE `tbl_mangas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `source_url` (`source_url`),
  ADD UNIQUE KEY `source_id` (`source_id`),
  ADD KEY `rating` (`rating`),
  ADD KEY `rating_count` (`rating_count`),
  ADD KEY `type` (`type`),
  ADD KEY `latest_chapter` (`latest_chapter`),
  ADD KEY `latest_chapter_url` (`latest_chapter_url`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `total_images` (`total_images`);

--
-- Indexes for table `tbl_manga_sites`
--
ALTER TABLE `tbl_manga_sites`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `manga_id` (`manga_id`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `pubdate_time` (`pubdate_time`),
  ADD KEY `last_chapter` (`last_chapter`),
  ADD KEY `total_images` (`total_images`),
  ADD KEY `domain` (`domain`),
  ADD KEY `wp_manga_id` (`wp_manga_id`);

--
-- Indexes for table `tbl_manga_update_logs`
--
ALTER TABLE `tbl_manga_update_logs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `run_time` (`run_time`),
  ADD KEY `source_url` (`source_url`),
  ADD KEY `domain` (`domain`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_mmo_tools`
--
ALTER TABLE `tbl_mmo_tools`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `service` (`service`),
  ADD KEY `expires` (`expires`);
ALTER TABLE `tbl_mmo_tools` ADD FULLTEXT KEY `opts` (`opts`);

--
-- Indexes for table `tbl_projects`
--
ALTER TABLE `tbl_projects`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `status` (`status`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `data_source` (`data_source`),
  ADD KEY `due_date` (`due_date`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `category` (`category`),
  ADD KEY `completed` (`completed`),
  ADD KEY `data_left` (`data_left`);
ALTER TABLE `tbl_projects` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `tbl_projects` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `tbl_projects` ADD FULLTEXT KEY `users` (`users`);

--
-- Indexes for table `tbl_storage`
--
ALTER TABLE `tbl_storage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `usage` (`used`),
  ADD KEY `total` (`total`),
  ADD KEY `role` (`role`),
  ADD KEY `root` (`root`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `type` (`type`),
  ADD KEY `dob` (`dob`),
  ADD KEY `gender` (`gender`),
  ADD KEY `last_login` (`last_login`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `logout_time` (`logout_time`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `language` (`language`);
ALTER TABLE `tbl_users` ADD FULLTEXT KEY `email_2` (`email`,`username`,`first_name`,`last_name`);

--
-- Indexes for table `tbl_works`
--
ALTER TABLE `tbl_works`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `check_dup` (`check_dup`),
  ADD KEY `end_time` (`due_date`),
  ADD KEY `start_time` (`start_date`),
  ADD KEY `type` (`work_type_id`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `status` (`status`),
  ADD KEY `refresh_num` (`refresh_num`),
  ADD KEY `target` (`target`),
  ADD KEY `completed` (`completed`),
  ADD KEY `level` (`level`),
  ADD KEY `modified_time` (`modified_time`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `request_complete_time` (`request_complete_time`),
  ADD KEY `accept_complete_time` (`approve_complete_time`),
  ADD KEY `accept_complete_by` (`approve_complete_by`);
ALTER TABLE `tbl_works` ADD FULLTEXT KEY `title` (`title`,`content`);

--
-- Indexes for table `tbl_work_assign`
--
ALTER TABLE `tbl_work_assign`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `work_id` (`work_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `share_time` (`share_time`),
  ADD KEY `receive_time` (`receive_time`),
  ADD KEY `reject_time` (`reject_time`),
  ADD KEY `drop_time` (`drop_time`);

--
-- Indexes for table `tbl_work_comments`
--
ALTER TABLE `tbl_work_comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `work_id` (`work_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `modified_time` (`modified_time`);

--
-- Indexes for table `tbl_work_data`
--
ALTER TABLE `tbl_work_data`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `unique_work_data` (`data_id`,`work_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`),
  ADD KEY `data_id` (`data_id`),
  ADD KEY `work_id` (`work_id`),
  ADD KEY `create_time` (`create_time`);

--
-- Indexes for table `tbl_work_files`
--
ALTER TABLE `tbl_work_files`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `work_id` (`work_id`),
  ADD KEY `upload_time` (`upload_time`),
  ADD KEY `info` (`info`(768)),
  ADD KEY `status` (`status`),
  ADD KEY `share_to` (`share_to`(768)),
  ADD KEY `work_data_id` (`work_data_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `file_size` (`file_size`),
  ADD KEY `mime_type` (`mime_type`);
ALTER TABLE `tbl_work_files` ADD FULLTEXT KEY `info_2` (`info`);

--
-- Indexes for table `tbl_work_meta`
--
ALTER TABLE `tbl_work_meta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `work_id` (`work_data_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `tbl_work_type`
--
ALTER TABLE `tbl_work_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `name` (`name`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `create_time` (`create_time`),
  ADD KEY `work_group` (`work_group`),
  ADD KEY `update_time` (`update_time`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_chapters`
--
ALTER TABLE `tbl_chapters`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_chats`
--
ALTER TABLE `tbl_chats`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_consts`
--
ALTER TABLE `tbl_consts`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_data`
--
ALTER TABLE `tbl_data`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_data_meta`
--
ALTER TABLE `tbl_data_meta`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_data_source`
--
ALTER TABLE `tbl_data_source`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_data_type`
--
ALTER TABLE `tbl_data_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_files_shared`
--
ALTER TABLE `tbl_files_shared`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_indexing_history`
--
ALTER TABLE `tbl_indexing_history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_mangas`
--
ALTER TABLE `tbl_mangas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manga_sites`
--
ALTER TABLE `tbl_manga_sites`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manga_update_logs`
--
ALTER TABLE `tbl_manga_update_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_mmo_tools`
--
ALTER TABLE `tbl_mmo_tools`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_storage`
--
ALTER TABLE `tbl_storage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_works`
--
ALTER TABLE `tbl_works`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_assign`
--
ALTER TABLE `tbl_work_assign`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_comments`
--
ALTER TABLE `tbl_work_comments`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_data`
--
ALTER TABLE `tbl_work_data`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_files`
--
ALTER TABLE `tbl_work_files`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_meta`
--
ALTER TABLE `tbl_work_meta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_work_type`
--
ALTER TABLE `tbl_work_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
