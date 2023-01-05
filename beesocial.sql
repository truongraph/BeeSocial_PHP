-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2021 at 09:10 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beesocial`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_receipts`
--

DROP TABLE IF EXISTS `bank_receipts`;
CREATE TABLE IF NOT EXISTS `bank_receipts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fund_id` int(11) NOT NULL DEFAULT 0,
  `description` tinytext NOT NULL,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `mode` varchar(50) NOT NULL DEFAULT '',
  `approved` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `receipt_file` varchar(250) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_at` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fund_id` (`fund_id`),
  KEY `created_at` (`created_at`),
  KEY `approved_at` (`approved_at`),
  KEY `approved` (`approved`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
CREATE TABLE IF NOT EXISTS `broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `image` varchar(150) CHARACTER SET utf8 DEFAULT 'upload/photos/d-group.jpg',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `user_id_2` (`user_id`),
  KEY `time_2` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_users`
--

DROP TABLE IF EXISTS `broadcast_users`;
CREATE TABLE IF NOT EXISTS `broadcast_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `broadcast_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `broadcast_id` (`broadcast_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wondertage_settings`
--

DROP TABLE IF EXISTS `wondertage_settings`;
CREATE TABLE IF NOT EXISTS `wondertage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(20000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wondertage_settings`
--

INSERT INTO `wondertage_settings` (`id`, `name`, `value`) VALUES
(1, 'tag_trend', '1'),
(2, 'tag_header_layout', '1'),
(3, 'tag_welcome_layout', '1'),
(4, 'tag_prods_autoload', '1'),
(5, 'tag_expand_search', '1'),
(6, 'tag_show_side_trend', '1'),
(7, 'tag_auto_dark', '0'),
(8, 'tag_anron_ico_head', '1'),
(9, 'tag_prods_slider', '1'),
(10, 'tag_send_comment', '1'),
(11, 'tag_profile_donation', '1'),
(12, 'tag_profile_qr', '0'),
(13, 'tag_prods_cat_slider', '1'),
(14, 'tag_wallet_layout', '1'),
(15, 'tag_go_pro_layout', '1'),
(16, 'tag_show_password', '1'),
(17, 'tag_prods_layout', '1'),
(18, 'tag_ads_layout', '0'),
(19, 'tag_wallet_layout', '0'),
(20, 'tag_album_layout', '0'),
(21, 'tag_blog_layout', '0'),
(22, 'tag_friends_nearby_layout', '0'),
(23, 'tag_games_layout', '0'),
(24, 'tag_group_layout', '0'),
(25, 'tag_home_layout', '0'),
(26, 'tag_job_layout', '0'),
(27, 'tag_messages_layout', '0'),
(28, 'tag_page_layout', '0'),
(29, 'tag_search_layout', '0'),
(30, 'tag_settings_layout', '0'),
(31, 'tag_timeline_layout', '0'),
(32, 'tag_extra_opts', '0'),
(33, 'tag_posts_feed', '0'),
(34, 'tag_artplayer', '1'),
(35, 'tag_show_comments', '1'),
(36, 'tag_hide_menu', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wo_activities`
--

DROP TABLE IF EXISTS `wo_activities`;
CREATE TABLE IF NOT EXISTS `wo_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL DEFAULT 0,
  `post_id` int(255) NOT NULL DEFAULT 0,
  `reply_id` int(11) UNSIGNED DEFAULT 0,
  `comment_id` int(11) UNSIGNED DEFAULT 0,
  `follow_id` int(11) NOT NULL DEFAULT 0,
  `activity_type` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `activity_type` (`activity_type`),
  KEY `order1` (`user_id`,`id`),
  KEY `order2` (`post_id`,`id`),
  KEY `comment_id` (`comment_id`),
  KEY `reply_id` (`reply_id`),
  KEY `follow_id` (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_admininvitations`
--

DROP TABLE IF EXISTS `wo_admininvitations`;
CREATE TABLE IF NOT EXISTS `wo_admininvitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(300) NOT NULL DEFAULT '0',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_ads`
--

DROP TABLE IF EXISTS `wo_ads`;
CREATE TABLE IF NOT EXISTS `wo_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT '',
  `code` text DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_ads`
--

INSERT INTO `wo_ads` (`id`, `type`, `code`, `active`) VALUES
(1, 'header', '', '0'),
(2, 'sidebar', '', '0'),
(4, 'footer', '', '0'),
(5, 'post_first', '', '0'),
(6, 'post_second', '', '0'),
(7, 'post_third', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wo_affiliates_requests`
--

DROP TABLE IF EXISTS `wo_affiliates_requests`;
CREATE TABLE IF NOT EXISTS `wo_affiliates_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `full_amount` varchar(100) NOT NULL DEFAULT '',
  `iban` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `country` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `full_name` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `swift_code` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `address` varchar(600) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_agoravideocall`
--

DROP TABLE IF EXISTS `wo_agoravideocall`;
CREATE TABLE IF NOT EXISTS `wo_agoravideocall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'video',
  `room_name` varchar(50) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `called` int(11) NOT NULL DEFAULT 0,
  `declined` int(11) NOT NULL DEFAULT 0,
  `access_token` text CHARACTER SET utf8 DEFAULT NULL,
  `access_token_2` text CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `type` (`type`),
  KEY `room_name` (`room_name`),
  KEY `time` (`time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_albums_media`
--

DROP TABLE IF EXISTS `wo_albums_media`;
CREATE TABLE IF NOT EXISTS `wo_albums_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `order1` (`post_id`,`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_announcement`
--

DROP TABLE IF EXISTS `wo_announcement`;
CREATE TABLE IF NOT EXISTS `wo_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  `time` int(32) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_announcement_views`
--

DROP TABLE IF EXISTS `wo_announcement_views`;
CREATE TABLE IF NOT EXISTS `wo_announcement_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `announcement_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_apps`
--

DROP TABLE IF EXISTS `wo_apps`;
CREATE TABLE IF NOT EXISTS `wo_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_user_id` int(11) NOT NULL DEFAULT 0,
  `app_name` varchar(32) NOT NULL,
  `app_website_url` varchar(55) NOT NULL,
  `app_description` text NOT NULL,
  `app_avatar` varchar(100) NOT NULL DEFAULT 'upload/photos/app-default-icon.png',
  `app_callback_url` varchar(255) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `app_secret` varchar(55) NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `app_user_id` (`app_user_id`),
  KEY `app_id` (`app_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_appssessions`
--

DROP TABLE IF EXISTS `wo_appssessions`;
CREATE TABLE IF NOT EXISTS `wo_appssessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `session_id` varchar(120) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `platform_details` text DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wo_appssessions`
--

INSERT INTO `wo_appssessions` (`id`, `user_id`, `session_id`, `platform`, `platform_details`, `time`) VALUES
(37, 2, '1199b623c4c4ff732d3fb33c34a80004b9b666b5232d63b5b53f77b853cf5f16d2aa09a3539106699fdef890a0a6f2496628626367d39280', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632219856),
(38, 2, '5f7c3282d1350d87427b134a7231b097146dfe38da8ec33ae2d3506dae21367b94dc177c30135515f610a13de080fb8df6cf972fc01ad93f', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632220621),
(39, 2, 'ec84e06328c353e02ecdebc09798acc44b156aaa670a3885fb99fded4e2a0fd7e6947f8413597471c42af2fa7356818e0389593714f59b52', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632222032),
(40, 2, 'cb582a3087bd40043bba9216e85fb974661daef4141691a279db8165877b0093c8b80a5f933809349f9a2e9ab3dc74b58ef7c5b974807751', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632222169),
(42, 1, '96ac1f4ebc221fdd52426c127adfd3429937589e23171caf6e5698b3d2cbc9a959e252fe739751761e8a19426224ca89e83cef47f1e7f53b', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632222360),
(45, 2, 'b6e0fdc76ec28910e6f34f462290862f7f3b45a7ed63ed591c303d834380696f664dbf329432776816475e51b4ac5c7c9d726d9efb3642f2', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632222826),
(46, 2, '2c2391d3cc14c65f892b3958ec17b6d9631d4998997cbd90e49869cb3d4cc5bae366d33562679640bc37e109d92bdc1ea71da6c919d54907', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632228698),
(48, 1, 'b946b7cca86659a547fec34cdb03336ac2ffb7155c1bc9daab85c2f4444ea898aa89624351247044a18ad9f9bcd4e260979d102a260fc262', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632228726),
(49, 1, '6204045c94fa6039b14c3a0b82dd41010a05ae38516bf3039078146908c1154db40996ea930642293bff829dde3583558708865f6de7be37', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632228780),
(50, 1, '3de9a9e8c51c672209e937ebd7fd9495a90d4102c7cb05c17eea835157d94140e38f94b068695803db079083386e2e0885f278fbd1d8a476', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632228843),
(51, 1, '4059c69db0f5cffb59a2e1c3561899c2ce10f4c777b6f7db90116519e05544a568d8983049164569b7f91ee1b94f1ed3dbb2959607f4b784', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632228915),
(53, 2, 'bf4e819e39d11a4a080b4a0f5b99c715679d6b3cef7c31615df1cb3c7d4762f4a18113768436527889b9c689a57b82e59074c6ba09aa394d', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1633594480),
(54, 2, '614f4ef87e544ba411e81344709f028e18b72c6a80123ddace21fdb7311d647c51a63d023379917114c4f36143b4b09cbc320d7c95a50ee7', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36 Edg/93.0.961.52\",\"name\":\"Google Chrome\",\"version\":\"93.0.4577.82\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1632231574),
(70, 2, '89cf631314fd6b068525dc57d3e6c67d688a247b7c554681dc4982987a3c3302ba7b0443619169208ef99bfe02f6d9e5c920cfebe29ee9fb', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44\",\"name\":\"Google Chrome\",\"version\":\"95.0.4638.69\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1636621846),
(71, 1, '857782611b9f55a28b6462fd592c322fb11407f674cebac86b2b98b6230b79d2bb8cfb05506264834990974d150d0de5e6e15a1454fe6b0f', 'web', '{\"userAgent\":\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36\",\"name\":\"Google Chrome\",\"version\":\"95.0.4638.69\",\"platform\":\"windows\",\"pattern\":\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\",\"ip_address\":\"::1\"}', 1636621742);

-- --------------------------------------------------------

--
-- Table structure for table `wo_apps_hash`
--

DROP TABLE IF EXISTS `wo_apps_hash`;
CREATE TABLE IF NOT EXISTS `wo_apps_hash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_id` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `hash_id` (`hash_id`),
  KEY `active` (`active`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_apps_permission`
--

DROP TABLE IF EXISTS `wo_apps_permission`;
CREATE TABLE IF NOT EXISTS `wo_apps_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_audiocalls`
--

DROP TABLE IF EXISTS `wo_audiocalls`;
CREATE TABLE IF NOT EXISTS `wo_audiocalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` varchar(30) NOT NULL DEFAULT '0',
  `access_token` text DEFAULT NULL,
  `call_id_2` varchar(30) NOT NULL DEFAULT '',
  `access_token_2` text DEFAULT NULL,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `room_name` varchar(50) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `called` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `declined` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`),
  KEY `call_id` (`call_id`),
  KEY `called` (`called`),
  KEY `declined` (`declined`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_bad_login`
--

DROP TABLE IF EXISTS `wo_bad_login`;
CREATE TABLE IF NOT EXISTS `wo_bad_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_banned_ip`
--

DROP TABLE IF EXISTS `wo_banned_ip`;
CREATE TABLE IF NOT EXISTS `wo_banned_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blocks`
--

DROP TABLE IF EXISTS `wo_blocks`;
CREATE TABLE IF NOT EXISTS `wo_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocker` int(11) NOT NULL DEFAULT 0,
  `blocked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `blocker` (`blocker`),
  KEY `blocked` (`blocked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blog`
--

DROP TABLE IF EXISTS `wo_blog`;
CREATE TABLE IF NOT EXISTS `wo_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT 0,
  `title` varchar(120) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `posted` varchar(300) DEFAULT '0',
  `category` int(255) DEFAULT 0,
  `thumbnail` varchar(100) DEFAULT 'upload/photos/d-blog.jpg',
  `view` int(11) DEFAULT 0,
  `shared` int(11) DEFAULT 0,
  `tags` varchar(300) DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `title` (`title`),
  KEY `category` (`category`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blogcommentreplies`
--

DROP TABLE IF EXISTS `wo_blogcommentreplies`;
CREATE TABLE IF NOT EXISTS `wo_blogcommentreplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `posted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `comm_id` (`comm_id`),
  KEY `blog_id` (`blog_id`),
  KEY `order1` (`comm_id`,`id`),
  KEY `order2` (`blog_id`,`id`),
  KEY `order3` (`user_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blogcomments`
--

DROP TABLE IF EXISTS `wo_blogcomments`;
CREATE TABLE IF NOT EXISTS `wo_blogcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `posted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blogmoviedislikes`
--

DROP TABLE IF EXISTS `wo_blogmoviedislikes`;
CREATE TABLE IF NOT EXISTS `wo_blogmoviedislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_comm_id` int(20) NOT NULL DEFAULT 0,
  `blog_commreply_id` int(20) NOT NULL DEFAULT 0,
  `movie_comm_id` int(20) NOT NULL DEFAULT 0,
  `movie_commreply_id` int(20) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(50) NOT NULL DEFAULT 0,
  `movie_id` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `blog_comm_id` (`blog_comm_id`),
  KEY `movie_comm_id` (`movie_comm_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_commreply_id` (`blog_commreply_id`),
  KEY `movie_commreply_id` (`movie_commreply_id`),
  KEY `blog_id` (`blog_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blogmovielikes`
--

DROP TABLE IF EXISTS `wo_blogmovielikes`;
CREATE TABLE IF NOT EXISTS `wo_blogmovielikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_comm_id` int(20) NOT NULL DEFAULT 0,
  `blog_commreply_id` int(20) NOT NULL DEFAULT 0,
  `movie_comm_id` int(20) NOT NULL DEFAULT 0,
  `movie_commreply_id` int(20) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(50) NOT NULL DEFAULT 0,
  `movie_id` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_comm_id`),
  KEY `movie_id` (`movie_comm_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_commreply_id` (`blog_commreply_id`),
  KEY `movie_commreply_id` (`movie_commreply_id`),
  KEY `blog_id_2` (`blog_id`),
  KEY `movie_id_2` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_blogs_categories`
--

DROP TABLE IF EXISTS `wo_blogs_categories`;
CREATE TABLE IF NOT EXISTS `wo_blogs_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lang_key` (`lang_key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_blogs_categories`
--

INSERT INTO `wo_blogs_categories` (`id`, `lang_key`) VALUES
(2, '1421'),
(3, '1424'),
(4, '1427'),
(5, '1430'),
(6, '1433'),
(7, '1436'),
(8, '1439'),
(9, '1442'),
(10, '1445'),
(11, '1448'),
(12, '1451'),
(13, '1454'),
(14, '1457'),
(15, '1460'),
(16, '1463'),
(17, '1466'),
(18, '1469');

-- --------------------------------------------------------

--
-- Table structure for table `wo_blog_reaction`
--

DROP TABLE IF EXISTS `wo_blog_reaction`;
CREATE TABLE IF NOT EXISTS `wo_blog_reaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `reply_id` int(11) NOT NULL DEFAULT 0,
  `reaction` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  KEY `comment_id` (`comment_id`),
  KEY `reply_id` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_codes`
--

DROP TABLE IF EXISTS `wo_codes`;
CREATE TABLE IF NOT EXISTS `wo_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `app_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `user_id` (`user_id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_colored_posts`
--

DROP TABLE IF EXISTS `wo_colored_posts`;
CREATE TABLE IF NOT EXISTS `wo_colored_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_1` varchar(50) NOT NULL DEFAULT '',
  `color_2` varchar(50) NOT NULL DEFAULT '',
  `text_color` varchar(50) NOT NULL DEFAULT '',
  `image` varchar(250) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `color_1` (`color_1`),
  KEY `color_2` (`color_2`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_colored_posts`
--

INSERT INTO `wo_colored_posts` (`id`, `color_1`, `color_2`, `text_color`, `image`, `time`) VALUES
(1, '', '', '#000000', 'upload/photos/2021/09/fpLlzwP8ow6suk2wBurA_16_a55613ce162d1d9f5c687a639eccb8a9_image.jpg', '1631780692'),
(2, '', '', '#ffffff', 'upload/photos/2021/09/CCxc2ZyDdRUwU48aVbxx_16_66e898127222de36424aad9baa3bb48d_image.jpg', '1631780706'),
(3, '', '', '#ffffff', 'upload/photos/2021/09/xFDXALffITvyWtCWrmPU_16_819ab1c86e6332e3154649b19a3b722a_image.jpg', '1631780719'),
(4, '', '', '#ffffff', 'upload/photos/2021/09/74KvGPnCca7tIcd62GWE_16_956fabbbb1237894edd46d439dc04bd9_image.jpg', '1631780733'),
(5, '', '', '#000000', 'upload/photos/2021/09/McQJBkipLROPbMnDXCCa_18_a0c3fd4113ead85dbdb5954d7bdfefac_image.jpg', '1631951696');

-- --------------------------------------------------------

--
-- Table structure for table `wo_commentlikes`
--

DROP TABLE IF EXISTS `wo_commentlikes`;
CREATE TABLE IF NOT EXISTS `wo_commentlikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_comments`
--

DROP TABLE IF EXISTS `wo_comments`;
CREATE TABLE IF NOT EXISTS `wo_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record` varchar(255) NOT NULL DEFAULT '',
  `c_file` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`),
  KEY `order1` (`user_id`,`id`),
  KEY `order2` (`page_id`,`id`),
  KEY `order3` (`post_id`,`id`),
  KEY `order4` (`user_id`,`id`),
  KEY `order5` (`post_id`,`id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_comments`
--

INSERT INTO `wo_comments` (`id`, `user_id`, `page_id`, `post_id`, `text`, `record`, `c_file`, `time`) VALUES
(3, 1, 0, 2, 'sdasdas', '', '', 1631951390),
(5, 1, 0, 35, '', '', 'upload/photos/2021/09/36jfIdqjXKWAZWPWS1XX_url_image.jpg', 1631952289),
(6, 1, 0, 35, 'asaSas', '', '', 1631953292),
(7, 1, 0, 35, 'a', '', '', 1631980183),
(8, 1, 0, 35, 'dsad', '', '', 1631980185),
(9, 1, 0, 35, 'sadasdas', '', '', 1631980188),
(10, 1, 0, 35, 'asdasdasdas', '', '', 1631980190),
(11, 1, 0, 35, 'dasdasdasdas', '', '', 1631980192),
(12, 1, 0, 35, 'sadasdasdasdasdsa', '', '', 1631980196),
(13, 1, 0, 35, 'sad', '', '', 1631980315),
(14, 1, 0, 35, 'dasdas', '', '', 1631980317),
(15, 1, 0, 35, 'asdasd', '', '', 1631980317),
(16, 1, 0, 35, 'asdasdas', '', '', 1631980318),
(17, 1, 0, 35, 'asdasdas', '', '', 1631980319),
(18, 1, 0, 35, 'dasdasd', '', '', 1631980319),
(19, 1, 0, 35, 'asdasdas <br>d', '', '', 1631980320),
(20, 1, 0, 35, 'asd <br>sad', '', '', 1631980320),
(21, 1, 0, 35, 'a <br>sdas <br>d', '', '', 1631980321),
(22, 1, 0, 35, 'asd <br>as', '', '', 1631980321),
(23, 1, 0, 35, 'd <br>asd <br>sa', '', '', 1631980322),
(24, 1, 0, 35, 'd', '', '', 1631980322),
(25, 1, 0, 35, 'as <br>d', '', '', 1631980322),
(26, 1, 0, 35, 'as', '', '', 1631980322),
(27, 1, 0, 35, 'd <br>asd', '', '', 1631980323),
(28, 1, 0, 35, 'sad', '', '', 1631980323),
(29, 1, 0, 35, 'as <br>d', '', '', 1631980323),
(30, 1, 0, 35, 'a', '', '', 1631980324),
(31, 1, 0, 35, 'da <br>s', '', '', 1631980324),
(32, 1, 0, 35, 'd <br>as', '', '', 1631980324),
(33, 1, 0, 35, 'd <br>a <br>sd', '', '', 1631980325),
(34, 1, 0, 35, 'as', '', '', 1631980325),
(35, 1, 0, 35, '', '', 'upload/photos/2021/09/eZOCyFKlhoxpr3ULEBdV_19_a005c8e5528358b0ad38d21114d9b9e5_image.png', 1632042798),
(36, 1, 0, 35, '[a]https%3A%2F%2Fwww.facebook.com%2Ftruongvo.vd1503%2F[/a]', '', '', 1632042893),
(37, 1, 0, 11, 'dasdasdas', '', '', 1632772399);

-- --------------------------------------------------------

--
-- Table structure for table `wo_commentwonders`
--

DROP TABLE IF EXISTS `wo_commentwonders`;
CREATE TABLE IF NOT EXISTS `wo_commentwonders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_comment_replies`
--

DROP TABLE IF EXISTS `wo_comment_replies`;
CREATE TABLE IF NOT EXISTS `wo_comment_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_file` varchar(300) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`,`page_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_comment_replies_likes`
--

DROP TABLE IF EXISTS `wo_comment_replies_likes`;
CREATE TABLE IF NOT EXISTS `wo_comment_replies_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_comment_replies_wonders`
--

DROP TABLE IF EXISTS `wo_comment_replies_wonders`;
CREATE TABLE IF NOT EXISTS `wo_comment_replies_wonders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_config`
--

DROP TABLE IF EXISTS `wo_config`;
CREATE TABLE IF NOT EXISTS `wo_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(20000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_config`
--

INSERT INTO `wo_config` (`id`, `name`, `value`) VALUES
(1, 'siteName', 'Mạng Xã Hội Bee'),
(2, 'siteTitle', 'Mạng Xã Hội Bee'),
(3, 'siteKeywords', 'social, wowonder, social site'),
(4, 'siteDesc', 'WoWonder v3.0.2 is a Social Networking Platform. With our new feature, user can wonder posts, photos,'),
(5, 'siteEmail', 'truong.vd2000@gmail.com'),
(6, 'defualtLang', 'vietnammese'),
(7, 'emailValidation', '0'),
(8, 'emailNotification', '0'),
(9, 'fileSharing', '1'),
(10, 'seoLink', '1'),
(11, 'cacheSystem', '0'),
(12, 'chatSystem', '1'),
(13, 'useSeoFrindly', '1'),
(14, 'reCaptcha', '0'),
(15, 'reCaptchaKey', ''),
(16, 'user_lastseen', '1'),
(17, 'age', '1'),
(18, 'deleteAccount', '1'),
(19, 'connectivitySystem', '1'),
(20, 'profileVisit', '0'),
(21, 'maxUpload', '10000000000'),
(22, 'maxCharacters', '10000'),
(23, 'message_seen', '1'),
(24, 'message_typing', '1'),
(25, 'google_map_api', 'AIzaSyBOfpaMO_tMMsuvS2T4zx4llbtsFqMuT9Y'),
(26, 'allowedExtenstion', 'jpg,png,jpeg,gif,mkv,docx,zip,rar,pdf,doc,mp3,mp4,flv,wav,txt,mov,avi,webm,wav,mpeg'),
(27, 'censored_words', ''),
(28, 'googleAnalytics', ''),
(29, 'AllLogin', '0'),
(30, 'googleLogin', '1'),
(31, 'facebookLogin', '1'),
(32, 'twitterLogin', '0'),
(33, 'linkedinLogin', '0'),
(34, 'VkontakteLogin', '0'),
(35, 'facebookAppId', '31231231'),
(36, 'facebookAppKey', ''),
(37, 'googleAppId', '213'),
(38, 'googleAppKey', ''),
(39, 'twitterAppId', ''),
(40, 'twitterAppKey', ''),
(41, 'linkedinAppId', ''),
(42, 'linkedinAppKey', ''),
(43, 'VkontakteAppId', ''),
(44, 'VkontakteAppKey', ''),
(45, 'theme', 'beecore'),
(46, 'second_post_button', 'reaction'),
(47, 'instagramAppId', ''),
(48, 'instagramAppkey', ''),
(49, 'instagramLogin', '0'),
(50, 'header_background', '#ffffff'),
(51, 'header_hover_border', '#333333'),
(52, 'header_color', '#000000'),
(53, 'body_background', '#f0f2f5'),
(54, 'btn_color', '#ffffff'),
(55, 'btn_background_color', '#efa12b'),
(56, 'btn_hover_color', '#ffffff'),
(57, 'btn_hover_background_color', '#efa12b'),
(58, 'setting_header_color', '#ffffff'),
(59, 'setting_header_background', '#a84849'),
(60, 'setting_active_sidebar_color', '#ffffff'),
(61, 'setting_active_sidebar_background', '#a84849'),
(62, 'setting_sidebar_background', '#ffffff'),
(63, 'setting_sidebar_color', '#444444'),
(64, 'logo_extension', 'png'),
(65, 'online_sidebar', '1'),
(66, 'background_extension', 'jpg'),
(67, 'profile_privacy', '0'),
(68, 'video_upload', '1'),
(69, 'audio_upload', '1'),
(70, 'smtp_or_mail', 'mail'),
(71, 'smtp_username', ''),
(72, 'smtp_host', ''),
(73, 'smtp_password', '6qhyR04j2gN7noRYG/+mlw=='),
(74, 'smtp_port', '587'),
(75, 'smtp_encryption', 'tls'),
(76, 'sms_or_email', 'mail'),
(77, 'sms_username', ''),
(78, 'sms_password', ''),
(79, 'sms_phone_number', ''),
(80, 'is_ok', '1'),
(81, 'pro', '0'),
(82, 'paypal_id', ''),
(83, 'paypal_secret', ''),
(84, 'paypal_mode', 'sandbox'),
(85, 'weekly_price', '3'),
(86, 'monthly_price', '8'),
(87, 'yearly_price', '89'),
(88, 'lifetime_price', '259'),
(89, 'post_limit', '1000'),
(90, 'user_limit', '10'),
(91, 'css_upload', '0'),
(92, 'smooth_loading', '1'),
(93, 'header_search_color', '#ebebeb'),
(94, 'header_button_shadow', '#000000'),
(95, 'currency', 'USD'),
(97, 'games', '0'),
(98, 'last_backup', '00-00-0000'),
(99, 'pages', '1'),
(100, 'groups', '1'),
(101, 'order_posts_by', '1'),
(102, 'btn_disabled', '#efa12b'),
(103, 'developers_page', '1'),
(104, 'user_registration', '1'),
(105, 'maintenance_mode', '0'),
(106, 'video_chat', '1'),
(107, 'video_accountSid', 'AC829cbbd1f7af836af4bdbde678d61b90'),
(108, 'video_apiKeySid', 'SK908f67c388ea8494db44837765b3d5ec'),
(109, 'video_apiKeySecret', 's2uC7872gRZCYN3jsgdeZcEDUFTr0bJm'),
(110, 'video_configurationProfileSid', ''),
(111, 'eapi', ''),
(112, 'favicon_extension', 'png'),
(113, 'monthly_boosts', '5'),
(114, 'yearly_boosts', '20'),
(115, 'lifetime_boosts', '40'),
(116, 'chat_outgoing_background', '#fff9f9'),
(117, 'windows_app_version', '1.0'),
(118, 'widnows_app_api_id', '8636e9b036614839e6bac6cb3f734270'),
(119, 'widnows_app_api_key', '6be3203878e5a67f5375b690e192a30a'),
(120, 'stripe_id', ''),
(121, 'stripe_secret', ''),
(122, 'credit_card', 'no'),
(123, 'bitcoin', 'no'),
(124, 'm_withdrawal', '50'),
(125, 'amount_ref', '0.10'),
(126, 'affiliate_type', '0'),
(127, 'affiliate_system', '1'),
(128, 'classified', '0'),
(129, 'amazone_s3', '0'),
(130, 'bucket_name', ''),
(131, 'amazone_s3_key', ''),
(132, 'amazone_s3_s_key', ''),
(133, 'region', 'us-east-1'),
(134, 'alipay', 'no'),
(135, 'is_utf8', '1'),
(136, 'sms_t_phone_number', '(312) 313-3659'),
(137, 'audio_chat', '1'),
(138, 'sms_twilio_username', 'AC829cbbd1f7af836af4bdbde678d61b90'),
(139, 'sms_twilio_password', 'f0f4f59a7ccb1661db6b2d6c9114e0ed'),
(140, 'sms_provider', 'twilio'),
(141, 'footer_background', ''),
(142, 'footer_background_2', ''),
(143, 'footer_text_color', ''),
(144, 'classified_currency', 'USD'),
(145, 'classified_currency_s', '$'),
(146, 'mime_types', 'text/plain,video/mp4,video/mov,video/mpeg,video/flv,video/avi,video/webm,audio/wav,audio/mpeg,video/quicktime,audio/mp3,image/png,image/jpeg,image/gif,application/pdf,application/msword,application/zip,application/x-rar-compressed,text/pdf,application/x-pointplus,text/css'),
(147, 'footer_background_n', ''),
(148, 'blogs', '0'),
(149, 'can_blogs', '1'),
(150, 'push', '1'),
(151, 'android_m_push_id', ''),
(152, 'android_m_push_key', ''),
(153, 'events', '0'),
(154, 'forum', '0'),
(155, 'last_update', '1554124551'),
(156, 'movies', '0'),
(157, 'yandex_translation_api', 'trnsl.1.1.20170601T212421Z.5834b565b8d47a18.2620528213fbf6ee3335f750659fc342e0ea7923'),
(158, 'update_db_15', '1503149537'),
(159, 'ad_v_price', '0.01'),
(160, 'ad_c_price', '0.05'),
(161, 'emo_cdn', 'https://cdnjs.cloudflare.com/ajax/libs/emojione/2.1.4/assets/png/'),
(162, 'user_ads', '1'),
(163, 'user_status', '1'),
(164, 'date_style', 'd-F-Y'),
(165, 'stickers', '1'),
(166, 'giphy_api', '420d477a542b4287b2bf91ac134ae041'),
(167, 'find_friends', '1'),
(168, 'update_db_152', '1504450479'),
(169, 'android_push_native', '1'),
(170, 'android_push_messages', '1'),
(171, 'update_db_153', 'updated'),
(172, 'ads_currency', 'USD'),
(173, 'web_push', '1'),
(174, 'playtube_url', 'https://playtubescript.com'),
(175, 'connectivitySystemLimit', '5000'),
(176, 'video_ad_skip', '6'),
(177, 'update_user_profile', '120'),
(178, 'cache_sidebar', '1'),
(179, 'android_n_push_id', ''),
(180, 'android_n_push_key', ''),
(181, 'ftp_host', ''),
(182, 'ftp_port', '21'),
(183, 'ftp_username', ''),
(184, 'ftp_password', ''),
(185, 'ftp_upload', '0'),
(186, 'ftp_endpoint', ''),
(187, 'ftp_path', './'),
(188, 'transaction_log', 'yes'),
(189, 'coinpayments_secret', ''),
(190, 'coinpayments_id', ''),
(191, 'infobip_username', ''),
(192, 'infobip_password', ''),
(193, 'updatev2', 'done'),
(194, 'amount_percent_ref', '0'),
(195, 'gift_system', '0'),
(196, 'social_share_twitter', '1'),
(197, 'social_share_google', '1'),
(198, 'social_share_facebook', '1'),
(199, 'social_share_whatsup', '1'),
(200, 'social_share_pinterest', '1'),
(201, 'social_share_linkedin', '1'),
(202, 'social_share_telegram', '1'),
(203, 'stickers_system', '1'),
(204, 'dollar_to_point_cost', '1000'),
(205, 'comments_point', '10'),
(206, 'likes_point', '5'),
(207, 'dislikes_point', '2'),
(208, 'wonders_point', '3'),
(209, 'reaction_point', '5'),
(210, 'createpost_point', '15'),
(211, 'point_allow_withdrawal', '0'),
(212, 'sticky_video_player', '0'),
(213, 'point_level_system', '0'),
(214, 'comment_reports', '1'),
(215, 'popular_posts', '0'),
(216, 'auto_friend_users', ''),
(217, 'spaces_key', ''),
(218, 'spaces_secret', ''),
(219, 'space_name', ''),
(220, 'space_region', ''),
(221, 'spaces', '0'),
(222, 'watermark', '0'),
(223, 'google_map', '1'),
(224, 'login_auth', '1'),
(225, 'two_factor', '1'),
(226, 'two_factor_type', 'email'),
(227, 'last_notification_delete_run', '1636621111'),
(228, 'ios_push_messages', '1'),
(229, 'ios_m_push_id', ''),
(230, 'ios_m_push_key', ''),
(231, 'ios_push_native', '1'),
(232, 'ios_n_push_id', ''),
(233, 'ios_n_push_key', ''),
(234, 'web_push_id', ''),
(235, 'web_push_key', ''),
(236, 'profile_back', '1'),
(237, 'free_day_limit', '1000'),
(238, 'adult_images', '1'),
(239, 'adult_images_action', '1'),
(240, 'adult_images_file', ''),
(241, 'pro_day_limit', '2000'),
(242, 'vision_api_key', 'AIzaSyC5dnm7RnZzNoqA3iIj0P9TTMLUIFaCW58'),
(243, 'bank_payment', 'yes'),
(244, 'bank_transfer_note', 'In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it.'),
(245, 'bank_description', '<div class=\"bank_info\">\r\n                        <div class=\"dt_settings_header bg_gradient\">\r\n                            <div class=\"dt_settings_circle-1\"></div>\r\n                            <div class=\"dt_settings_circle-2\"></div>\r\n                            <div class=\"bank_info_innr\">\r\n                                <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path fill=\"currentColor\" d=\"M11.5,1L2,6V8H21V6M16,10V17H19V10M2,22H21V19H2M10,10V17H13V10M4,10V17H7V10H4Z\"></path></svg>\r\n                                <h4 class=\"bank_name\">Garanti Bank</h4>\r\n                                <div class=\"row\">\r\n                                    <div class=\"col col-md-12\">\r\n                                        <div class=\"bank_account\">\r\n                                            <p>4796824372433055</p>\r\n                                            <span class=\"help-block\">Account number / IBAN</span>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col col-md-12\">\r\n                                        <div class=\"bank_account_holder\">\r\n                                            <p>Antoian Kordiyal</p>\r\n                                            <span class=\"help-block\">Account name</span>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col col-md-6\">\r\n                                        <div class=\"bank_account_code\">\r\n                                            <p>TGBATRISXXX</p>\r\n                                            <span class=\"help-block\">Routing code</span>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col col-md-6\">\r\n                                        <div class=\"bank_account_country\">\r\n                                            <p>United States</p>\r\n                                            <span class=\"help-block\">Country</span>\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>'),
(246, 'recaptcha_secret_key', ''),
(247, 'createblog_point', '15'),
(248, 'deepsound_url', 'https://deepsoundscript.com'),
(249, 'english', '1'),
(250, 'arabic', '1'),
(251, 'dutch', '1'),
(252, 'french', '1'),
(253, 'german', '1'),
(254, 'italian', '1'),
(255, 'portuguese', '1'),
(256, 'russian', '1'),
(257, 'spanish', '1'),
(258, 'turkish', '1'),
(259, 'currency_array', '[\"USD\",\"EUR\",\"JPY\",\"TRY\",\"GBP\",\"RUB\",\"PLN\",\"ILS\",\"BRL\",\"INR\"]'),
(260, 'currency_symbol_array', '{\"USD\":\"$\",\"EUR\":\"u20ac\",\"TRY\":\"u20ba\",\"GBP\":\"u00a3\",\"RUB\":\"u0440u0443u0431\",\"PLN\":\"zu0142\",\"ILS\":\"u20aa\",\"BRL\":\"R$\",\"INR\":\"u20b9\"}'),
(261, 'paypal_currency', 'USD'),
(262, 'stripe_currency', 'USD'),
(263, '2checkout_currency', 'USD'),
(264, 'version', '3.2.2'),
(265, 'forum_visibility', '1'),
(266, 'events_visibility', '1'),
(267, 'product_visibility', '1'),
(268, 'paypal', 'no'),
(269, 'poke_system', '1'),
(270, 'afternoon_system', '0'),
(271, 'providers_array', ''),
(272, 'colored_posts_system', '1'),
(273, 'checkout_payment', 'no'),
(274, 'checkout_mode', 'sandbox'),
(275, 'checkout_seller_id', ''),
(276, 'checkout_publishable_key', ''),
(277, 'checkout_private_key', ''),
(278, 'job_system', '0'),
(279, 'weather_widget', '0'),
(280, 'common_things', '0'),
(281, 'funding_system', '1'),
(282, 'weather_key', ''),
(283, 'funding_request', 'all'),
(284, 'donate_percentage', '0'),
(285, 'post_approval', '0'),
(286, 'auto_page_like', ''),
(287, 'auto_group_join', ''),
(288, 'memories_system', '1'),
(289, 'membership_system', '0'),
(290, 'recurring_payment', 'off'),
(291, 'who_upload', 'all'),
(292, 'Who_call', 'all'),
(293, 'blog_approval', '0'),
(294, 'refund_system', '0'),
(295, 'paystack_payment', 'no'),
(296, 'paystack_secret_key', ''),
(297, 'cashfree_payment', 'no'),
(298, 'cashfree_client_key', ''),
(299, 'cashfree_secret_key', ''),
(300, 'msg91_authKey', ''),
(301, 'offer_system', '0'),
(302, 'nearby_shop_system', '0'),
(303, 'nearby_business_system', '0'),
(304, 'prevent_system', '0'),
(305, 'bad_login_limit', '4'),
(306, 'lock_time', '10'),
(307, 'password_complexity_system', '0'),
(308, 'invite_links_system', '1'),
(309, 'user_links_limit', '10'),
(310, 'expire_user_links', 'month'),
(311, 'shout_box_system', '0'),
(312, 'bank_withdrawal_system', '1'),
(313, 'live_video', '1'),
(314, 'live_token', ''),
(315, 'live_account_id', ''),
(316, 'razorpay_payment', 'no'),
(317, 'razorpay_key_id', ''),
(318, 'razorpay_key_secret', ''),
(319, 'paysera_payment', 'no'),
(320, 'paysera_project_id', ''),
(321, 'paysera_sign_password', ''),
(322, 'paysera_mode', '1'),
(323, 'cloud_upload', '0'),
(324, 'cloud_file_path', ''),
(325, 'cloud_bucket_name', ''),
(326, 'live_video_save', '1'),
(327, 'notify_new_post', '0'),
(328, 'agora_app_id', 'aa236068cd56402c9bdc05069f6de008'),
(329, 'agora_live_video', '1'),
(330, 'millicast_live_video', '0'),
(331, 'agora_customer_id', '973f98db847c4b9088ae461e2511c9a5'),
(332, 'agora_customer_certificate', 'fb5987f0156b4c7e9b04f8f73912c93d'),
(333, 'yahoo_consumer_key', ''),
(334, 'yahoo_consumer_secret', ''),
(335, 'cashfree_mode', 'sandBox'),
(336, 'amazone_s3_2', '0'),
(337, 'bucket_name_2', ''),
(338, 'amazone_s3_key_2', ''),
(339, 'amazone_s3_s_key_2', ''),
(340, 'region_2', 'eu-west-1'),
(341, 'node_socket_flow', '0'),
(342, 'redis', 'N'),
(343, 'youtube_api_key', ''),
(344, 'redis_port', '3080'),
(345, 'nodejs_port', '3000'),
(346, 'nodejs_ssl', '1'),
(347, 'nodejs_key_path', ''),
(348, 'nodejs_cert_path', ''),
(349, 'nodejs_ssl_port', '449'),
(350, 'nodejs_live_notification', '1'),
(351, 'auto_username', '0'),
(352, 'agora_app_certificate', 'a7c0a758a27847aba5d5182751c866cb'),
(353, 'agora_chat_video', '0'),
(354, 'agora_chat_app_id', 'aa236068cd56402c9bdc05069f6de008'),
(355, 'agora_chat_app_certificate', 'a7c0a758a27847aba5d5182751c866cb'),
(356, 'agora_chat_customer_id', '973f98db847c4b9088ae461e2511c9a5'),
(357, 'agora_chat_customer_certificate', 'fb5987f0156b4c7e9b04f8f73912c93d'),
(358, 'qqLogin', '0'),
(359, 'qqAppId', ''),
(360, 'qqAppkey', ''),
(361, 'WeChatLogin', '0'),
(362, 'WeChatAppId', ''),
(363, 'WeChatAppkey', ''),
(364, 'DiscordLogin', '0'),
(365, 'DiscordAppId', ''),
(366, 'DiscordAppkey', ''),
(367, 'MailruLogin', '0'),
(368, 'MailruAppId', ''),
(369, 'MailruAppkey', ''),
(370, 'twilio_video_chat', '1'),
(371, 'ffmpeg_binary_file', './ffmpeg/ffmpeg'),
(372, 'ffmpeg_system', 'on'),
(373, 'convert_speed', 'fast'),
(374, 'allowedffmpegExtenstion', 'mov,mp4,m4a,3gp,3g2,mj2,asf,avi,flv,webm,m4v,mpeg,mpeg,mpeg,ogv,mkv,webm,mov'),
(375, 'ffmpeg_mime_types', 'application/vnd.ms-asf,video/x-msvideo,video/x-flv,video/webm,video/x-m4v,video/mp4,video/mpeg,video/ogg,video/x-matroska,video/quicktime,video/x-ms-wmv,video/x-msvideo'),
(376, 'vietnammese', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wo_custompages`
--

DROP TABLE IF EXISTS `wo_custompages`;
CREATE TABLE IF NOT EXISTS `wo_custompages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `page_type` (`page_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_custom_fields`
--

DROP TABLE IF EXISTS `wo_custom_fields`;
CREATE TABLE IF NOT EXISTS `wo_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT '',
  `length` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `required` varchar(11) NOT NULL DEFAULT 'on',
  `options` text DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_egoing`
--

DROP TABLE IF EXISTS `wo_egoing`;
CREATE TABLE IF NOT EXISTS `wo_egoing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_einterested`
--

DROP TABLE IF EXISTS `wo_einterested`;
CREATE TABLE IF NOT EXISTS `wo_einterested` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_einvited`
--

DROP TABLE IF EXISTS `wo_einvited`;
CREATE TABLE IF NOT EXISTS `wo_einvited` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `inviter_id` int(11) NOT NULL,
  `invited_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `inviter_id` (`invited_id`),
  KEY `inviter_id_2` (`inviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_emails`
--

DROP TABLE IF EXISTS `wo_emails`;
CREATE TABLE IF NOT EXISTS `wo_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `email_to` (`email_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_events`
--

DROP TABLE IF EXISTS `wo_events`;
CREATE TABLE IF NOT EXISTS `wo_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `location` varchar(300) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `poster_id` int(11) NOT NULL,
  `cover` varchar(500) NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  PRIMARY KEY (`id`),
  KEY `poster_id` (`poster_id`),
  KEY `name` (`name`),
  KEY `start_date` (`start_date`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `end_date` (`end_date`),
  KEY `order1` (`poster_id`,`id`),
  KEY `order2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_family`
--

DROP TABLE IF EXISTS `wo_family`;
CREATE TABLE IF NOT EXISTS `wo_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `member` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `requesting` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `active` (`active`),
  KEY `user_id` (`user_id`),
  KEY `requesting` (`requesting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_followers`
--

DROP TABLE IF EXISTS `wo_followers`;
CREATE TABLE IF NOT EXISTS `wo_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `following_id` int(11) NOT NULL DEFAULT 0,
  `follower_id` int(11) NOT NULL DEFAULT 0,
  `is_typing` int(11) NOT NULL DEFAULT 0,
  `active` int(255) NOT NULL DEFAULT 1,
  `notify` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `following_id` (`following_id`),
  KEY `follower_id` (`follower_id`),
  KEY `active` (`active`),
  KEY `order1` (`following_id`,`id`),
  KEY `order2` (`follower_id`,`id`),
  KEY `is_typing` (`is_typing`),
  KEY `notify` (`notify`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_followers`
--

INSERT INTO `wo_followers` (`id`, `following_id`, `follower_id`, `is_typing`, `active`, `notify`, `time`) VALUES
(7, 2, 1, 0, 1, 0, 0),
(8, 1, 2, 0, 1, 0, 0),
(9, 10, 1, 0, 0, 0, 0),
(10, 13, 1, 0, 0, 0, 0),
(11, 9, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wo_forums`
--

DROP TABLE IF EXISTS `wo_forums`;
CREATE TABLE IF NOT EXISTS `wo_forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `sections` int(11) NOT NULL DEFAULT 0,
  `posts` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `description` (`description`(255)),
  KEY `posts` (`posts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_forumthreadreplies`
--

DROP TABLE IF EXISTS `wo_forumthreadreplies`;
CREATE TABLE IF NOT EXISTS `wo_forumthreadreplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL DEFAULT 0,
  `forum_id` int(11) NOT NULL DEFAULT 0,
  `poster_id` int(11) NOT NULL DEFAULT 0,
  `post_subject` varchar(300) NOT NULL DEFAULT '',
  `post_text` text NOT NULL,
  `post_quoted` int(11) NOT NULL DEFAULT 0,
  `posted_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`),
  KEY `forum_id` (`forum_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_subject` (`post_subject`(255)),
  KEY `post_quoted` (`post_quoted`),
  KEY `posted_time` (`posted_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_forum_sections`
--

DROP TABLE IF EXISTS `wo_forum_sections`;
CREATE TABLE IF NOT EXISTS `wo_forum_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(300) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `section_name` (`section_name`),
  KEY `description` (`description`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_forum_threads`
--

DROP TABLE IF EXISTS `wo_forum_threads`;
CREATE TABLE IF NOT EXISTS `wo_forum_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `headline` varchar(300) NOT NULL DEFAULT '',
  `post` text NOT NULL,
  `posted` varchar(20) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT 0,
  `forum` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `views` (`views`),
  KEY `posted` (`posted`),
  KEY `headline` (`headline`(255)),
  KEY `forum` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_funding`
--

DROP TABLE IF EXISTS `wo_funding`;
CREATE TABLE IF NOT EXISTS `wo_funding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashed_id` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(600) NOT NULL DEFAULT '',
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(200) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hashed_id` (`hashed_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_funding_raise`
--

DROP TABLE IF EXISTS `wo_funding_raise`;
CREATE TABLE IF NOT EXISTS `wo_funding_raise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funding_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `funding_id` (`funding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_games`
--

DROP TABLE IF EXISTS `wo_games`;
CREATE TABLE IF NOT EXISTS `wo_games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(50) NOT NULL,
  `game_avatar` varchar(100) NOT NULL,
  `game_link` varchar(100) NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_games_players`
--

DROP TABLE IF EXISTS `wo_games_players`;
CREATE TABLE IF NOT EXISTS `wo_games_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `game_id` int(11) NOT NULL DEFAULT 0,
  `last_play` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`game_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_gender`
--

DROP TABLE IF EXISTS `wo_gender`;
CREATE TABLE IF NOT EXISTS `wo_gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_id` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `gender_id` (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_gifts`
--

DROP TABLE IF EXISTS `wo_gifts`;
CREATE TABLE IF NOT EXISTS `wo_gifts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `media_file` varchar(250) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_groupadmins`
--

DROP TABLE IF EXISTS `wo_groupadmins`;
CREATE TABLE IF NOT EXISTS `wo_groupadmins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `general` int(11) NOT NULL DEFAULT 1,
  `privacy` int(11) NOT NULL DEFAULT 1,
  `avatar` int(11) NOT NULL DEFAULT 1,
  `members` int(11) NOT NULL DEFAULT 0,
  `analytics` int(11) NOT NULL DEFAULT 1,
  `delete_group` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `members` (`members`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_groupchat`
--

DROP TABLE IF EXISTS `wo_groupchat`;
CREATE TABLE IF NOT EXISTS `wo_groupchat` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(3000) NOT NULL DEFAULT 'upload/photos/d-group.jpg',
  `time` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_groupchatusers`
--

DROP TABLE IF EXISTS `wo_groupchatusers`;
CREATE TABLE IF NOT EXISTS `wo_groupchatusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL DEFAULT '1',
  `last_seen` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_groups`
--

DROP TABLE IF EXISTS `wo_groups`;
CREATE TABLE IF NOT EXISTS `wo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_title` varchar(40) NOT NULL DEFAULT '',
  `avatar` varchar(120) NOT NULL DEFAULT 'upload/photos/d-group.jpg ',
  `cover` varchar(120) NOT NULL DEFAULT 'upload/photos/d-cover.jpg  ',
  `about` varchar(550) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `sub_category` varchar(50) NOT NULL DEFAULT '',
  `privacy` enum('1','2') NOT NULL DEFAULT '1',
  `join_privacy` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `registered` varchar(32) NOT NULL DEFAULT '0/0000',
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `privacy` (`privacy`),
  KEY `time` (`time`),
  KEY `active` (`active`),
  KEY `group_title` (`group_title`),
  KEY `group_name` (`group_name`),
  KEY `registered` (`registered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_groups_categories`
--

DROP TABLE IF EXISTS `wo_groups_categories`;
CREATE TABLE IF NOT EXISTS `wo_groups_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_groups_categories`
--

INSERT INTO `wo_groups_categories` (`id`, `lang_key`) VALUES
(2, '1420'),
(3, '1423'),
(4, '1426'),
(5, '1429'),
(6, '1432'),
(7, '1435'),
(8, '1438'),
(9, '1441'),
(10, '1444'),
(11, '1447'),
(12, '1450'),
(13, '1453'),
(14, '1456'),
(15, '1459'),
(16, '1462'),
(17, '1465'),
(18, '1468');

-- --------------------------------------------------------

--
-- Table structure for table `wo_group_members`
--

DROP TABLE IF EXISTS `wo_group_members`;
CREATE TABLE IF NOT EXISTS `wo_group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`group_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_hashtags`
--

DROP TABLE IF EXISTS `wo_hashtags`;
CREATE TABLE IF NOT EXISTS `wo_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `last_trend_time` int(11) NOT NULL DEFAULT 0,
  `trend_use_num` int(11) NOT NULL DEFAULT 0,
  `expire` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_trend_time` (`last_trend_time`),
  KEY `trend_use_num` (`trend_use_num`),
  KEY `tag` (`tag`),
  KEY `expire` (`expire`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_hashtags`
--

INSERT INTO `wo_hashtags` (`id`, `hash`, `tag`, `last_trend_time`, `trend_use_num`, `expire`) VALUES
(1, 'a9fdc3cdd3359d4bd78c8fff020d2860', 'kmk', 1631853970, 1, '2021-09-24');

-- --------------------------------------------------------

--
-- Table structure for table `wo_hiddenposts`
--

DROP TABLE IF EXISTS `wo_hiddenposts`;
CREATE TABLE IF NOT EXISTS `wo_hiddenposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_html_emails`
--

DROP TABLE IF EXISTS `wo_html_emails`;
CREATE TABLE IF NOT EXISTS `wo_html_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wo_html_emails`
--

INSERT INTO `wo_html_emails` (`id`, `name`, `value`) VALUES
(1, 'activate', '<p> </p>\n<p>Actionable emails e.g. reset password</p>\n<table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"> </td>\n<td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\">\n<div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\">\n<table class=\"main\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\">\n<table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\n<h3>Hello {{USERNAME}},</h3>\nThank you for joining our community.</td>\n</tr>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">Please confirm your email address by clicking the link below.</td>\n</tr>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\"><a class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; color: #fff; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; text-transform: capitalize; background-color: #a84849; margin: 0; border-color: #a84849; border-style: solid; border-width: 10px 20px;\" href=\"{{SITE_URL}}/index.php?link1=activate&amp;email={{EMAIL}}&amp;code={{CODE}}\">Confirm email address</a></td>\n</tr>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">{{SITE_NAME}} Team.</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n</td>\n<td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"> </td>\n</tr>\n</tbody>\n</table>'),
(2, 'invite', '<p>Hi there, <br /><br /> You have received an invitation request from your friend <a style=\"color: {{backgound_color}};\" href=\"{{URL}}\">{{NAME}}</a> to join our social network community <a style=\"color: {{backgound_color}};\" href=\"{{SITE_URL}}/register?ref={{USERNAME}}\">{{SITE_NAME}}</a>.<br /><br /> <a style=\"color: &lt;?php echo $wo[\'config\'][\'btn_background_color\'];\" href=\"{{SITE_URL}}/register?ref={{USERNAME}}\">Let\'s contact &amp; find your friends !</a> <br /><br /> {{SITE_NAME}} Team. <br /> Best regards.</p>'),
(3, 'login_with', '<p>Hello {{FIRST_NAME}}, <br /><br /> Thank you for joining {{SITE_NAME}}!<br /><br /> Your temporary login credentials are: <br /><br /> Username: {{USERNAME}}<br /> Password: {{EMAIL}}<br /><br /> Please change your password as soon as possible to fully secure your account. <br /><br /> Best Regards,<br /> {{SITE_NAME}} Team.</p>'),
(4, 'notification', '<p> </p>\n<table class=\"body-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"> </td>\n<td class=\"container\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important; clear: both !important; margin: 0 auto;\" valign=\"top\" width=\"600\">\n<div class=\"content\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\">\n<table class=\"main\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"alert alert-warning\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: #e24141; margin: 0; padding: 10px;\" align=\"center\" valign=\"top\" bgcolor=\"#FF9F00\">New notification from {{SITE_NAME}}</td>\n</tr>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-wrap\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\">\n<table style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\"><a style=\"text-decoration: none; color: #444;\" href=\"{{NOTIFY_URL}}\"><img style=\"width: 60px; float: left; border-radius: 100px; margin-right: 10px;\" src=\"{{NOTIFY_AVATAR}}\" alt=\"\" /> {{NOTIFY_NAME}}</a>\n<div style=\"color: #666; font-size: 12px;\"><strong> {{TEXT_TYPE}}: </strong> {{TEXT}}</div>\n</td>\n</tr>\n<tr style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n<td class=\"content-block\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 5px;\" valign=\"top\"><a class=\"btn-primary\" style=\"font-family: \'Helvetica Neue\',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; color: #fff; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; text-transform: capitalize; background-color: #a84849; margin: 0; border-color: #a84849; border-style: solid; border-width: 4px 10px;\" href=\"{{URL}}\">View on {{SITE_NAME}}</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</div>\n</td>\n</tr>\n</tbody>\n</table>'),
(5, 'payment_declined', '<p>Hello {{name}}, <br /><br /> Unfortunately your payment of ${{amount}} was declined. <br /><br /> For more info, please reply to this email. <br /><br /> Kind regards,<br /> {{site_name}} Team</p>'),
(6, 'payment_approved', '<p>Hello {{name}}, <br /><br /> Your payment request of ${{amount}} is approved. <br /><br /> We have sent you money ! <br /><br /> Kind regards,<br /> {{site_name}} Team</p>'),
(7, 'recover', '<p>Hello {{USERNAME}}, <br /> <br /> To reset your password <a href=\"{{LINK}}\">Click Here</a> <br /><br /> {{SITE_NAME}} Team, <br /> Regards,</p>'),
(8, 'unusual_login', '<p>Hi {{USERNAME}},<br /><br /> Please verify that it’s you<br /><br /> Your sign in attempt seems a little different than usual. This could be because you are signing in from a different device or a different location.<br /><br /> If you are attempting to sign-in, please use the following code to confirm your identity:<br /><br /> {{CODE}}<br /><br /> Here are the details of the sign-in attempt:<br /> Date: {{DATE}}<br /> Account: {{EMAIL}}<br /> Location: {{COUNTRY_CODE}}<br /> IP Address: {{IP_ADDRESS}}<br /> City: {{CITY}}<br /><br /> If this wasn’t you, please reset your password.<br /><br /> Yours securely,<br /> Team {{SITE_NAME}}</p>'),
(9, 'account_deleted', 'Hi {{name}},<br><br> We are here to inform you that your account on {{SITE_NAME}} was deleted and all your data were erased.<br><br>Best regards,<br> {{SITE_NAME}} team.');

-- --------------------------------------------------------

--
-- Table structure for table `wo_invitation_links`
--

DROP TABLE IF EXISTS `wo_invitation_links`;
CREATE TABLE IF NOT EXISTS `wo_invitation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `invited_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(300) NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `code` (`code`(255)),
  KEY `invited_id` (`invited_id`),
  KEY `time` (`time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_invitation_links`
--

INSERT INTO `wo_invitation_links` (`id`, `user_id`, `invited_id`, `code`, `time`) VALUES
(1, 1, 0, '41950504761441b6edd2ef9.25090912', 1631853422);

-- --------------------------------------------------------

--
-- Table structure for table `wo_job`
--

DROP TABLE IF EXISTS `wo_job`;
CREATE TABLE IF NOT EXISTS `wo_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(200) NOT NULL DEFAULT '',
  `location` varchar(100) NOT NULL DEFAULT '',
  `lat` varchar(50) NOT NULL DEFAULT '',
  `lng` varchar(50) NOT NULL DEFAULT '',
  `minimum` varchar(50) NOT NULL DEFAULT '0',
  `maximum` varchar(50) NOT NULL DEFAULT '0',
  `salary_date` varchar(50) NOT NULL DEFAULT '',
  `job_type` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  `question_one` varchar(200) NOT NULL DEFAULT '',
  `question_one_type` varchar(100) NOT NULL DEFAULT '',
  `question_one_answers` text DEFAULT NULL,
  `question_two` varchar(200) NOT NULL DEFAULT '',
  `question_two_type` varchar(100) NOT NULL DEFAULT '',
  `question_two_answers` text DEFAULT NULL,
  `question_three` varchar(200) NOT NULL DEFAULT '',
  `question_three_type` varchar(100) NOT NULL DEFAULT '',
  `question_three_answers` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(300) NOT NULL DEFAULT '',
  `image_type` varchar(11) NOT NULL DEFAULT '',
  `currency` varchar(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 1,
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`),
  KEY `title` (`title`),
  KEY `category` (`category`),
  KEY `lng` (`lng`),
  KEY `lat` (`lat`),
  KEY `status` (`status`),
  KEY `job_type` (`job_type`),
  KEY `minimum` (`minimum`),
  KEY `maximum` (`maximum`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_job_apply`
--

DROP TABLE IF EXISTS `wo_job_apply`;
CREATE TABLE IF NOT EXISTS `wo_job_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `phone_number` varchar(50) NOT NULL DEFAULT '',
  `location` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `question_one_answer` varchar(200) NOT NULL DEFAULT '',
  `question_two_answer` varchar(200) NOT NULL DEFAULT '',
  `question_three_answer` varchar(200) NOT NULL DEFAULT '',
  `position` varchar(100) NOT NULL DEFAULT '',
  `where_did_you_work` varchar(100) NOT NULL DEFAULT '',
  `experience_description` varchar(300) NOT NULL DEFAULT '',
  `experience_start_date` varchar(50) NOT NULL DEFAULT '',
  `experience_end_date` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `job_id` (`job_id`),
  KEY `page_id` (`page_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_job_categories`
--

DROP TABLE IF EXISTS `wo_job_categories`;
CREATE TABLE IF NOT EXISTS `wo_job_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_job_categories`
--

INSERT INTO `wo_job_categories` (`id`, `lang_key`) VALUES
(1, '1580'),
(2, '1581'),
(3, '1582'),
(4, '1583'),
(5, '1584'),
(6, '1585'),
(7, '1586'),
(8, '1587'),
(9, '1588'),
(10, '1589'),
(11, '1590'),
(12, '1591'),
(13, '1592'),
(14, '1593'),
(15, '1594'),
(16, '1595'),
(17, '1596'),
(18, '1597'),
(19, '1598'),
(20, '1599'),
(21, '1600'),
(22, '1601'),
(23, '1602');

-- --------------------------------------------------------

--
-- Table structure for table `wo_langs`
--

DROP TABLE IF EXISTS `wo_langs`;
CREATE TABLE IF NOT EXISTS `wo_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `english` text DEFAULT NULL,
  `vietnammese` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_key` (`lang_key`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1851 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_langs`
--

INSERT INTO `wo_langs` (`id`, `lang_key`, `type`, `english`, `vietnammese`) VALUES
(1, 'login', '', 'Login', 'Đăng nhập'),
(2, 'register', '', 'Register', 'Register'),
(3, 'guest', '', 'Guest', 'Guest'),
(4, 'username', '', 'Username', 'Username'),
(5, 'email', '', 'E-mail', 'E-mail'),
(6, 'password', '', 'Password', 'Password'),
(7, 'new_password', '', 'New password', 'New password'),
(8, 'remember_me', '', 'Remember me', 'Remember me'),
(9, 'or_login_with', '', 'Or login with', 'Or login with'),
(10, 'forget_password', '', 'Forgot Password?', 'Forgot Password?'),
(11, 'email_address', '', 'E-mail address', 'E-mail address'),
(12, 'confirm_password', '', 'Confirm Password', 'Confirm Password'),
(13, 'lets_go', '', 'Let&#039;s Go !', 'Lets Go !'),
(14, 'recover_password', '', 'Recover', 'Recover'),
(15, 'reset_new_password_label', '', 'Reset Your Password', 'Reset Your Password'),
(16, 'reset_password', '', 'Reset', 'Reset'),
(17, 'invalid_token', '', 'Invalid Token', 'Invalid Token'),
(18, 'incorrect_username_or_password_label', '', 'Incorrect username or password', 'Incorrect username or password'),
(19, 'account_disbaled_contanct_admin_label', '', 'Your account has been disabled, please contact us .', 'Your account has been disabled, please contact us .'),
(20, 'account_not_active_label', '', 'You have to activate your account.', 'You have to activate your account.'),
(21, 'successfully_logged_label', '', 'Successfully Logged in, Please wait..', 'Successfully Logged in, Please wait..'),
(22, 'please_check_details', '', 'Please check your details.', 'Please check your details.'),
(23, 'username_exists', '', 'Username is already exists.', 'Username is already exists.'),
(24, 'username_characters_length', '', 'Username must be between 5 / 32', 'Username must be between 5 / 32'),
(25, 'username_invalid_characters', '', 'Invalid username characters', 'Invalid username characters'),
(26, 'password_invalid_characters', '', 'Invalid password characters', 'Invalid password characters'),
(27, 'email_exists', '', 'This e-mail is already in use', 'This e-mail is already in use'),
(28, 'email_invalid_characters', '', 'This e-mail is invalid.', 'This e-mail is invalid.'),
(29, 'password_short', '', 'Password is too short.', 'Password is too short.'),
(30, 'password_mismatch', '', 'Password not match.', 'Password not match.'),
(31, 'reCaptcha_error', 'Please check the re-captcha.', 'Please check the re-captcha.', 'Please check the re-captcha.'),
(32, 'successfully_joined_label', '', 'Successfully joined, Please wait..', 'Successfully joined, Please wait..'),
(33, 'account_activation', '', 'Account Activation', 'Account Activation'),
(34, 'successfully_joined_verify_label', '', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your email.', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your email.'),
(35, 'email_not_found', '', 'We can&#039;t find this email.', 'We cant find this email.'),
(36, 'password_rest_request', '', 'Password reset request', 'Password reset request'),
(37, 'email_sent', '', 'E-mail has been sent successfully', 'E-mail has been sent successfully'),
(38, 'processing_error', '', 'An error found while processing your request, please try again later.', 'An error found while processing your request, please try again later.'),
(39, 'password_changed', '', 'Password successfully changed !', 'Password successfully changed !'),
(40, 'please_choose_correct_date', '', 'Please choose a correct date.', 'Please choose a correct date.'),
(41, 'setting_updated', '', 'Setting successfully updated !', 'Setting successfully updated !'),
(42, 'current_password_mismatch', '', 'Current password not match', 'Current password not match'),
(43, 'website_invalid_characters', '', 'Website is invalid.', 'Website is invalid.'),
(44, 'account_deleted', '', 'Account successfully deleted, please wait..', 'Account successfully deleted, please wait..'),
(45, 'home', '', 'Home', 'Home'),
(46, 'advanced_search', '', 'Advanced Search', 'Advanced Search'),
(47, 'search_header_label', '', 'Search for people, pages, groups and #hashtags', 'Tìm kiếm ...'),
(48, 'no_result', '', 'No result to show', 'No result to show'),
(49, 'last_seen', '', 'Last Seen:', 'Last Seen:'),
(50, 'accept', '', 'Accept', 'Accept'),
(51, 'cancel', '', 'Cancel', 'Cancel'),
(52, 'delete', '', 'Delete', 'Delete'),
(53, 'my_profile', '', 'My Profile', 'My Profile'),
(54, 'saved_posts', '', 'Saved Posts', 'Saved Posts'),
(55, 'setting', '', 'Settings', 'Settings'),
(56, 'admin_area', '', 'Admin Area', 'Admin Area'),
(57, 'log_out', '', 'Log Out', 'Log Out'),
(58, 'no_new_notification', '', 'You do not have any notifications', 'You do not have any notifications'),
(59, 'no_new_requests', '', 'You do not have any requests', 'You do not have any requests'),
(60, 'followed_you', '', 'followed you', 'followed you'),
(61, 'comment_mention', '', 'mentioned you on a comment.', 'mentioned you on a comment.'),
(62, 'post_mention', '', 'mentioned you on a post.', 'mentioned you on a post.'),
(63, 'posted_on_timeline', '', 'posted on your timeline.', 'posted on your timeline.'),
(64, 'profile_visted', '', 'visited your profile.', 'visited your profile.'),
(65, 'accepted_friend_request', '', 'accepted your friend request.', 'accepted your friend request.'),
(66, 'accepted_follow_request', '', 'accepted your follow request.', 'accepted your follow request.'),
(67, 'liked_comment', '', 'liked your comment &quot;{comment}&quot;', 'liked your comment &quot;{comment}&quot;'),
(68, 'wondered_comment', '', 'wondered your comment &quot;{comment}&quot;', 'wondered your comment &quot;{comment}&quot;'),
(69, 'liked_post', '', 'liked your {postType} {post}', 'liked your {postType} {post}'),
(70, 'wondered_post', '', 'wondered your {postType} {post}', 'wondered your {postType} {post}'),
(71, 'share_post', '', 'shared your {postType} {post}', 'shared your {postType} {post}'),
(72, 'commented_on_post', '', 'commented on your {postType} {post}', 'commented on your {postType} {post}'),
(73, 'activity_liked_post', '', 'liked {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'liked {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(74, 'activity_wondered_post', '', 'wondered {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'wondered {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(75, 'activity_share_post', '', 'shared {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'shared {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(76, 'activity_commented_on_post', '', 'commented on {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'commented on {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(77, 'video_n_label', '', 'video.', 'video.'),
(78, 'post_n_label', '', 'post.', 'post.'),
(79, 'photo_n_label', '', 'photo.', 'photo.'),
(80, 'file_n_label', '', 'file.', 'file.'),
(81, 'vine_n_label', '', 'vine video.', 'vine video.'),
(82, 'sound_n_label', '', 'sound.', 'sound.'),
(83, 'avatar_n_label', '', 'profile picture.', 'profile picture.'),
(84, 'error_not_found', '', '404 Error', '404 Error'),
(85, 'sorry_page_not_found', '', 'Sorry, page not found!', 'Sorry, page not found!'),
(86, 'page_not_found', '', 'The page you are looking for could not be found. Please check the link you followed to get here and try again.', 'The page you are looking for could not be found. Please check the link you followed to get here and try again.'),
(87, 'your_account_activated', '', 'Your account have been successfully activated!', 'Your account have been successfully activated!'),
(88, 'free_to_login', '', 'You&#039;r free to &lt;a href=&quot;{site_url}&quot;&gt;{login}&lt;/a&gt; !', 'Your free to &lt;a href=&quot;{site_url}&quot;&gt;{login}&lt;/a&gt; !'),
(89, 'general_setting', '', 'General Setting', 'General Setting'),
(90, 'login_setting', '', 'Login Setting', 'Login Setting'),
(91, 'manage_users', '', 'Manage Users', 'Manage Users'),
(92, 'manage_posts', '', 'Manage Posts', 'Manage Posts'),
(93, 'manage_reports', '', 'Manage Reports', 'Manage Reports'),
(94, 'advertisement', '', 'Advertisement', 'Advertisement'),
(95, 'more', '', 'More', 'More'),
(96, 'cache_system', '', 'Cache System', 'Cache System'),
(97, 'chat_system', '', 'Chat System', 'Chat System'),
(98, 'email_validation', '', 'Email validation', 'Email validation'),
(99, 'email_notification', '', 'Email notification', 'Email notification'),
(100, 'smooth_links', '', 'Smooth links', 'Smooth links'),
(101, 'seo_friendly_url', '', 'SEO friendly url', 'SEO friendly url'),
(102, 'file_sharing', '', 'File sharing', 'File sharing'),
(103, 'themes', '', 'Themes', 'Themes'),
(104, 'user_setting', '', 'User Settings', 'User Settings'),
(105, 'site_setting', '', 'Site Setting', 'Site Setting'),
(106, 'cache_setting_info', '', 'Enable cache system to speed up your website, Recommended more than 10,000 active users.', 'Enable cache system to speed up your website, Recommended more than 10,000 active users.'),
(107, 'chat_setting_info', '', 'Enable chat system to chat with friends on the buttom of the page', 'Enable chat system to chat with friends on the buttom of the page'),
(108, 'email_validation_info', '', 'Enable email validation to send activation link when user registred.', 'Enable email validation to send activation link when user registred.'),
(109, 'email_notification_info', '', 'Enable email notification to send user notification via email.', 'Enable email notification to send user notification via email.'),
(110, 'smooth_links_info', '', 'Enable smooth links, e.g.{site_url}/home.', 'Enable smooth links, e.g.{site_url}/home.'),
(111, 'seo_frindly_info', '', 'Enable SEO friendly url, e.g.{site_url}//1_hello-how-are-you-doing.html', 'Enable SEO friendly url, e.g.{site_url}//1_hello-how-are-you-doing.html'),
(112, 'file_sharing_info', '', 'Enable File sharing to share &amp; upload videos,images,files,sounds, etc..', 'Enable File sharing to share &amp; upload videos,images,files,sounds, etc..'),
(113, 'cache', '', 'Cache', 'Cache'),
(114, 'site_information', '', 'Site Information', 'Site Information'),
(115, 'site_title_name', '', 'Site Name &amp; Title:', 'Site Name &amp; Title:'),
(116, 'site_name', '', 'Site name', 'Site name'),
(117, 'site_title', '', 'Site title', 'Site title'),
(118, 'site_keywords_description', '', 'Site Keywords &amp; Description:', 'Site Keywords &amp; Description:'),
(119, 'site_keywords', '', 'Site Keywords', 'Site Keywords'),
(120, 'site_description', '', 'Site Description', 'Site Description'),
(121, 'site_email', '', 'Site E-mail', 'Site E-mail'),
(122, 'site_lang', '', 'Default Language', 'Default Language'),
(123, 'theme_setting', '', 'Theme Setting', 'Theme Setting'),
(124, 'activeted', '', 'Activated', 'Activated'),
(125, 'version', '', 'Version:', 'Version:'),
(126, 'author', '', 'Author:', 'Author:'),
(127, 'user_status', '', 'User status', 'User status'),
(128, 'online_lastseen', '', '(online/last seen)', '(online/last seen)'),
(129, 'enable', '', 'Enable', 'Enable'),
(130, 'disable', '', 'Disable', 'Disable'),
(131, 'allow_users_to_delete', '', 'Allow users to delete their account', 'Allow users to delete their account'),
(132, 'profile_visit_notification', '', 'Profile visit notification', 'Profile visit notification'),
(133, 'display_user_age_as', '', 'Display user age as', 'Display user age as'),
(134, 'date', '', 'Date', 'Date'),
(135, 'age', '', 'Age', 'Age'),
(136, 'connectivity_system', '', 'Connectivity System', 'Connectivity System'),
(137, 'connectivity_system_note', '', '&lt;span style=&quot;color:red;&quot;&gt;Note:&lt;/span&gt; If you change the system to another one, all existing followings, followers, friends will be deleted.&lt;/small&gt;', '&lt;span style=&quot;color:red;&quot;&gt;Note:&lt;/span&gt; If you change the system to another one, all existing followings, followers, friends will be deleted.&lt;/small&gt;'),
(138, 'friends_system', '', 'Friends system', 'Friends system'),
(139, 'follow_system', '', 'Follow system', 'Follow system'),
(140, 'max_upload_size', '', 'Max upload size for videos, images, sounds, and files', 'Max upload size for videos, images, sounds, and files'),
(141, 'max_characters_length', '', 'Max characters length', 'Max characters length'),
(142, 'allowed_extenstions', '', 'Allowed extenstions', 'Allowed extenstions'),
(143, 'reCaptcha_setting', '', 'reCaptcha Setting', 'reCaptcha Setting'),
(144, 'reCaptcha_key_is_required', '', 'reCaptcha key is required', 'reCaptcha key is required'),
(145, 'reCaptcha_key', '', 'reCaptcha Key', 'reCaptcha Key'),
(146, 'google_analytics', '', 'Google Analytics', 'Google Analytics'),
(147, 'google_analytics_code', '', 'Google analytics code', 'Google analytics code'),
(148, 'cache_setting', '', 'Cache Setting', 'Cache Setting'),
(149, 'cache_recomended_clear', '', 'It&#039;s highly recommended to clear the cache.', 'Its highly recommended to clear the cache.'),
(150, 'cache_size', '', 'Cache Size:', 'Cache Size:'),
(151, 'clear_cache', '', 'Clear Cache', 'Clear Cache'),
(152, 'social_login', '', 'Social login', 'Social login'),
(153, 'social_login_api', '', 'Social login API&#039;S', 'Social login APIS'),
(154, 'facebook', '', 'Facebook', 'Facebook'),
(155, 'google', '', 'Google+', 'Google+'),
(156, 'twitter', '', 'Twitter', 'Twitter'),
(157, 'linkedin', '', 'Linkedin', 'Linkedin'),
(158, 'vkontakte', '', 'Vkontakte', 'Vkontakte'),
(159, 'facebook_api', '', 'Facebook API', 'Facebook API'),
(160, 'google_api', '', 'Google API', 'Google API'),
(161, 'twitter_api', '', 'Twitter API', 'Twitter API'),
(162, 'linkedin_api', '', 'Linkedin API', 'Linkedin API'),
(163, 'vkontakte_api', '', 'Vkontakte API', 'Vkontakte API'),
(164, 'app_id', '', 'App ID', 'App ID'),
(165, 'app_secret_key', '', 'App Secret Key', 'App Secret Key'),
(166, 'login_with', '', 'Login with', 'Login with'),
(167, 'id', '', 'ID', 'ID'),
(168, 'source', '', 'Source', 'Source'),
(169, 'status', '', 'Status', 'Status'),
(170, 'pending', '', 'Pending', 'Pending'),
(171, 'first_name', '', 'First name', 'First name'),
(172, 'last_name', '', 'Last name', 'Last name'),
(173, 'about_me', '', 'About me', 'About me'),
(174, 'website', '', 'Website', 'Website'),
(175, 'action', '', 'Action', 'Action'),
(176, 'show_more_users', '', 'Show more users', 'Show more users'),
(177, 'no_more_users_to_show', '', 'No more users to show', 'No more users to show'),
(178, 'user_delete_confirmation', '', 'Are you sure you want to delete this user?', 'Are you sure you want to delete this user?'),
(179, 'post_delete_confirmation', '', 'Are you sure you want to delete this post?', 'Are you sure you want to delete this post?'),
(180, 'show_more_posts', '', 'Show more posts', 'Show more posts'),
(181, 'no_more_posts', '', 'No more posts', 'No more posts'),
(182, 'no_posts_found', '', 'No posts to show', 'No posts to show'),
(183, 'publisher', '', 'Publisher', 'Publisher'),
(184, 'there_are_not_new_posts_for_now', '', 'There are not new post for now', 'There are not new post for now'),
(185, 'post_link', '', 'Post link', 'Post link'),
(186, 'time', '', 'Time', 'Time'),
(187, 'post', '', 'Post', 'Post'),
(188, 'no_posts_yet', '', '{name} has not posted anything yet', '{name} has not posted anything yet'),
(189, 'search', '', 'Search', 'Search'),
(190, 'on', '', 'On', 'On'),
(191, 'off', '', 'Off', 'Off'),
(192, 'save', '', 'Save', 'Save'),
(193, 'saved', '', 'Saved !', 'Saved !'),
(194, 'reporter', '', 'Reporter', 'Reporter'),
(195, 'time_reported', '', 'Time Reported', 'Time Reported'),
(196, 'there_are_no_new_reports', '', 'There are no new reports for now.', 'There are no new reports for now.'),
(197, 'open_post', '', 'Open Post', 'Open Post'),
(198, 'mark_safe', '', 'Mark Safe', 'Mark Safe'),
(199, 'delete_post', '', 'Delete Post', 'Delete Post'),
(200, 'advertisement_setting', '', 'Advertisement Setting', 'Advertisement Setting'),
(201, 'more_setting', '', 'More Setting', 'More Setting'),
(202, 'mailing_users', '', 'Mailing list', 'Mailing list'),
(203, 'send', '', 'Send', 'Send'),
(204, 'mailing_subject', '', 'Subject..', 'Subject..'),
(205, 'mailing_message', '', 'Message..', 'Message..'),
(206, 'announcement', '', 'Announcement', 'Announcement'),
(207, 'new_announcement', '', 'New announcement', 'New announcement'),
(208, 'add', '', 'Add', 'Add'),
(209, 'views', '', 'Views', 'Views'),
(210, 'there_are_no_active_announcements', '', 'There are no active announcements.', 'There are no active announcements.'),
(211, 'there_are_no_inactive_announcements', '', 'There are no inactive announcements.', 'There are no inactive announcements.'),
(212, 'add_friend', '', 'Add Friend', 'Add Friend'),
(213, 'follow', '', 'Follow', 'Follow'),
(214, 'following', '', 'Following', 'Following'),
(215, 'following_btn', '', 'Following', 'Following'),
(216, 'followers', '', 'Followers', 'Followers'),
(217, 'message', '', 'Message', 'Message'),
(218, 'requested', '', 'Requested', 'Requested'),
(219, 'friends_btn', '', 'Friends', 'Bạn bè'),
(220, 'online', '', 'Online', 'Online'),
(221, 'offline', '', 'Offline', 'Offline'),
(222, 'you_are_currently_offline', '', 'You are currently offline, turn on the chat to start chatting.', 'You are currently offline, turn on the chat to start chatting.'),
(223, 'no_offline_users', '', 'No offline users.', 'No offline users.'),
(224, 'no_online_users', '', 'No online users.', 'No online users.'),
(225, 'search_for_users', '', 'Search for users', 'Search for users'),
(226, 'no_users_found', '', 'No users to show', 'No users to show'),
(227, 'seen', '', 'Seen', 'Seen'),
(228, 'load_more_posts', '', 'Load more posts', 'Load more posts'),
(229, 'load_more_users', '', 'Load more users', 'Load more users'),
(230, 'there_are_no_tags_found', '', 'No results found for your query.', 'No results found for your query.'),
(231, 'there_are_no_saved_posts', '', 'You don&#039;t have any saved posts.', 'You dont have any saved posts.'),
(232, 'messages', '', 'Messages', 'Messages'),
(233, 'write_something', '', 'Write Something ..', 'Write Something ..'),
(234, 'no_more_message_to_show', '', 'No more message', 'No more message'),
(235, 'view_more_messages', '', 'View more messages', 'View more messages'),
(236, 'sorry_cant_reply', '', 'Sorry, you can&#039;t reply to this user.', 'Sorry, you cant reply to this user.'),
(237, 'choose_one_of_your_friends', '', 'Choose one of your friends', 'Choose one of your friends'),
(238, 'and_say_hello', '', 'And Say Hello !', 'And Say Hello !'),
(239, 'download', '', 'Download', 'Download'),
(240, 'update_your_info', '', 'Update your info', 'Update your info'),
(241, 'choose_your_username', '', 'Choose your username:', 'Choose your username:'),
(242, 'create_your_new_password', '', 'Create your new password:', 'Create your new password:'),
(243, 'update', '', 'Update', 'Update'),
(244, 'delete_comment', '', 'Delete Comment', 'Delete Comment'),
(245, 'confirm_delete_comment', '', 'Are you sure that you want to delete this comment ?', 'Are you sure that you want to delete this comment ?'),
(246, 'confirm_delete_post', '', 'Are you sure that you want to delete this post ?', 'Are you sure that you want to delete this post ?'),
(247, 'edit_post', '', 'Edit Post', 'Edit Post'),
(248, 'session_expired', '', 'Session Expired', 'Session Expired'),
(249, 'session_expired_message', '', 'Your Session has been expired, please login again.', 'Your Session has been expired, please login again.'),
(250, 'country', '', 'Country', 'Country'),
(251, 'all', '', 'All', 'Tất cả'),
(252, 'gender', '', 'Gender', 'Gender'),
(253, 'female', 'gender', 'Female', 'Female'),
(254, 'male', 'gender', 'Male', 'Male'),
(255, 'profile_picture', '', 'Profile Picture', 'Profile Picture'),
(256, 'result', '', 'Result', 'Result'),
(257, 'yes', '', 'Yes', 'Yes'),
(258, 'no', '', 'No', 'No'),
(259, 'verified_user', '', 'Verified User', 'Verified User'),
(260, 'change_password', '', 'Change Password', 'Change Password'),
(261, 'current_password', '', 'Current Password', 'Current Password'),
(262, 'repeat_password', '', 'Repeat password', 'Repeat password'),
(263, 'general', '', 'General', 'General'),
(264, 'profile', '', 'Profile', 'Profile'),
(265, 'privacy', '', 'Privacy', 'Privacy'),
(266, 'delete_account', '', 'Delete Account', 'Delete Account'),
(267, 'delete_account_confirm', '', 'Are You sure that you want to delete your account, and leave our network ?', 'Are You sure that you want to delete your account, and leave our network ?'),
(268, 'delete_go_back', '', 'No, I&#039;ll Think', 'No, Ill Think'),
(269, 'verified', '', 'Verified', 'Verified'),
(270, 'not_verified', '', 'Not verified', 'Not verified'),
(271, 'admin', '', 'Admin', 'Admin'),
(272, 'user', '', 'User', 'User'),
(273, 'verification', '', 'Verification', 'Verification'),
(274, 'type', '', 'Type', 'Type'),
(275, 'birthday', '', 'Birthday', 'Birthday'),
(276, 'active', '', 'Active', 'Active'),
(277, 'inactive', '', 'inactive', 'inactive'),
(278, 'privacy_setting', '', 'Privacy Setting', 'Privacy Setting'),
(279, 'follow_privacy_label', '', 'Who can follow me ?', 'Who can follow me ?'),
(280, 'everyone', '', 'Everyone', 'Everyone'),
(281, 'my_friends', '', 'My Friends', 'My Friends'),
(282, 'no_body', '', 'No body', 'No body'),
(283, 'people_i_follow', '', 'People I Follow', 'People I Follow'),
(284, 'people_follow_me', '', 'People Follow Me', 'People Follow Me'),
(285, 'only_me', '', 'Only me', 'Only me'),
(286, 'message_privacy_label', '', 'Who can message me ?', 'Who can message me ?'),
(287, 'timeline_post_privacy_label', '', 'Who can post on my timeline ?', 'Who can post on my timeline ?'),
(288, 'activities_privacy_label', '', 'Show my activities ?', 'Show my activities ?'),
(289, 'show', '', 'Show', 'Show'),
(290, 'hide', '', 'Hide', 'Hide'),
(291, 'confirm_request_privacy_label', '', 'Confirm request when someone follows you ?', 'Confirm request when someone follows you ?'),
(292, 'lastseen_privacy_label', '', 'Show my last seen ?', 'Show my last seen ?'),
(293, 'site_eg', '', '(e.g: http://www.siteurl.com)', '(e.g: http://www.siteurl.com)'),
(294, 'profile_setting', '', 'Profile Setting', 'Profile Setting'),
(295, 'pinned_post', '', 'Pinned', 'Pinned'),
(296, 'pin_post', '', 'Pin Post', 'Pin Post'),
(297, 'unpin_post', '', 'Unpin Post', 'Unpin Post'),
(298, 'open_post_in_new_tab', '', 'Open post in new tab', 'Open post in new tab'),
(299, 'unsave_post', '', 'Unsave Post', 'Unsave Post'),
(300, 'save_post', '', 'Save Post', 'Save Post'),
(301, 'unreport_post', '', 'Unreport Post', 'Unreport Post'),
(302, 'report_post', '', 'Report Post', 'Report Post'),
(303, 'shared_this_post', '', 'Shared this post', 'Shared this post'),
(304, 'changed_profile_picture_male', '', 'changed his profile picture', 'changed his profile picture'),
(305, 'changed_profile_picture_female', '', 'changed her profile picture', 'changed her profile picture'),
(306, 'post_login_requriement', '', 'Please log in to like, wonder, share and comment!', 'Please log in to like, wonder, share and comment!'),
(307, 'likes', '', 'Likes', 'Trang thích'),
(308, 'like', '', 'Like', 'Thích'),
(309, 'wonder', '', 'Wonder', 'Wonder'),
(310, 'wonders', '', 'Wonders', 'Wonders'),
(311, 'share', '', 'Share', 'Share'),
(312, 'comments', '', 'Comments', 'bình luận'),
(313, 'no_likes', '', 'No likes yet', 'No likes yet'),
(314, 'no_wonders', '', 'No wonders yet', 'No wonders yet'),
(315, 'write_comment', '', 'Write a comment and press enter', 'Write a comment and press enter'),
(316, 'view_more_comments', '', 'View more comments', 'View more comments'),
(317, 'welcome_to_news_feed', '', 'Welcome to your News Feed !', 'Welcome to your News Feed !'),
(318, 'say_hello', '', 'Say Hello !', 'Say Hello !'),
(319, 'publisher_box_placeholder', '', 'What\'s going on? #Hashtag.. @Mention.. Link..', 'Bạn đang nghĩ gì ?'),
(320, 'youtube_link', '', 'Youtube Link', 'Youtube Link'),
(321, 'vine_link', '', 'Vine Link', 'Vine Link'),
(322, 'soundcloud_link', '', 'SoundCloud Link', 'SoundCloud Link'),
(323, 'maps_placeholder', '', 'Where are you ?', 'Where are you ?'),
(324, 'post_label', '', 'Post', 'Post'),
(325, 'text', '', 'Text', 'Bài viết'),
(326, 'photos', '', 'Photos', 'Hình ảnh'),
(327, 'sounds', '', 'Sounds', 'Âm nhạc'),
(328, 'videos', '', 'Videos', 'Video'),
(329, 'maps', '', 'Maps', 'Maps'),
(330, 'files', '', 'Files', 'Files'),
(331, 'not_following', '', 'Not following any user', 'Not following any user'),
(332, 'no_followers', '', 'No followers yet', 'No followers yet'),
(333, 'details', '', 'Details', 'Details'),
(334, 'social_links', '', 'Social Links', 'Social Links'),
(335, 'online_chat', '', 'Chat', 'Chat'),
(336, 'about', '', 'About', 'About'),
(337, 'contact_us', '', 'Contact Us', 'Contact Us'),
(338, 'privacy_policy', '', 'Privacy Policy', 'Privacy Policy'),
(339, 'terms_of_use', '', 'Terms of Use', 'Terms of Use'),
(340, 'developers', '', 'Developers', 'Developers'),
(341, 'language', '', 'Language', 'Language'),
(342, 'copyrights', '', '© {date} {site_name}', '© {date} {site_name}'),
(343, 'year', '', 'year', 'year'),
(344, 'month', '', 'month', 'month'),
(345, 'day', '', 'day', 'day'),
(346, 'hour', '', 'hour', 'hour'),
(347, 'minute', '', 'minute', 'minute'),
(348, 'second', '', 'second', 'second'),
(349, 'years', '', 'years', 'years'),
(350, 'months', '', 'months', 'months'),
(351, 'days', '', 'days', 'days'),
(352, 'hours', '', 'hours', 'hours'),
(353, 'minutes', '', 'minutes', 'minutes'),
(354, 'seconds', '', 'seconds', 'seconds'),
(355, 'time_ago', '', 'ago', 'ago'),
(356, 'time_from_now', '', 'from now', 'from now'),
(357, 'time_any_moment_now', '', 'any moment now', 'any moment now'),
(358, 'time_just_now', '', 'Just now', 'Just now'),
(359, 'time_about_a_minute_ago', '', 'about a minute ago', 'about a minute ago'),
(360, 'time_minute_ago', '', '%d minutes ago', '%d minutes ago'),
(361, 'time_about_an_hour_ago', '', 'about an hour ago', 'about an hour ago'),
(362, 'time_hours_ago', '', '%d hours ago', '%d hours ago'),
(363, 'time_a_day_ago', '', 'a day ago', 'a day ago'),
(364, 'time_a_days_ago', '', '%d days ago', '%d days ago'),
(365, 'time_about_a_month_ago', '', 'about a month ago', 'about a month ago'),
(366, 'time_months_ago', '', '%d months ago', '%d months ago'),
(367, 'time_about_a_year_ago', '', 'about a year ago', 'about a year ago'),
(368, 'time_years_ago', '', '%d years ago', '%d years ago'),
(369, 'latest_activities', '', 'Latest Activities', 'Latest Activities'),
(370, 'no_activities', '', 'No new activities', 'No new activities'),
(371, 'trending', '', 'Trending !', 'Trending !'),
(372, 'load_more_activities', '', 'Load more activities', 'Load more activities'),
(373, 'no_more_actitivties', '', 'No more actitivties', 'No more actitivties'),
(374, 'people_you_may_know', '', 'People you may know', 'People you may know'),
(375, 'too_long', '', 'Too long', 'Too long'),
(376, 'too_short', '', 'Too short.', 'Too short.'),
(377, 'available', '', 'Available !', 'Available !'),
(378, 'in_use', '', 'In use.', 'In use.'),
(379, 'username_invalid_characters_2', '', 'Username should not contain any special characters, symbols or spaces.', 'Username should not contain any special characters, symbols or spaces.'),
(380, 'liked', '', 'Liked', 'Liked'),
(381, 'my_pages', '', 'My Pages', 'My Pages'),
(382, 'liked_page', '', 'Liked your page ({page_name})', 'Liked your page ({page_name})'),
(383, 'this_week', '', 'This week', 'This week'),
(384, 'posts', '', 'posts', 'posts'),
(385, 'located_in', '', 'Located in', 'Located in'),
(386, 'phone_number', '', 'Phone', 'Phone'),
(387, 'company', '', 'Company', 'Company'),
(388, 'category', '', 'Category', 'Category'),
(389, 'search_for_posts', '', 'Search for posts', 'Search for posts'),
(390, 'create_new_page', '', 'Create New Page', 'Create New Page'),
(391, 'page_name', '', 'Page name', 'Page name'),
(392, 'page_title', '', 'Page title', 'Page title'),
(393, 'your_page_title', '', 'Your page title', 'Your page title'),
(394, 'page_category', '', 'Page Category', 'Page Category'),
(395, 'page_description', '', 'Page description', 'Page description'),
(396, 'page_description_info', '', 'Your Page description, Between 10 and 200 characters max.', 'Your Page description, Between 10 and 200 characters max.'),
(397, 'create', '', 'Create', 'Create'),
(398, 'page_name_exists', '', 'Page name is already exists.', 'Page name is already exists.'),
(399, 'page_name_characters_length', '', 'Page name must be between 5 / 32', 'Page name must be between 5 / 32'),
(400, 'page_name_invalid_characters', '', 'Invalid page name characters', 'Invalid page name characters'),
(401, 'edit', '', 'Edit', 'Chỉnh sửa trang cá nhân'),
(402, 'page_information', '', 'Page Information', 'Page Information'),
(403, 'delete_page', '', 'Delete Page', 'Delete Page'),
(404, 'location', '', 'Location', 'Location'),
(405, 'pages_you_may_like', '', 'Pages you may like', 'Pages you may like'),
(406, 'show_more_pages', '', 'Show more pages', 'Show more pages'),
(407, 'no_more_pages', '', 'No more pages to show', 'No more pages to show'),
(408, 'page_delete_confirmation', '', 'Are you sure you want to delete this page?', 'Are you sure you want to delete this page?'),
(409, 'manage_pages', '', 'Manage Pages', 'Manage Pages'),
(410, 'owner', '', 'Owner', 'Owner'),
(411, 'no_pages_found', '', 'No pages to show', 'No pages to show'),
(412, 'welcome_wonder', '', 'Wonder', 'Wonder'),
(413, 'welcome_connect', '', 'Connect', 'Connect'),
(414, 'welcome_share', '', 'Share', 'Share'),
(415, 'welcome_discover', '', 'Discover', 'Discover'),
(416, 'welcome_find_more', '', 'Find more', 'Find more'),
(417, 'welcome_mobile', '', 'Mobile Friendly', 'Mobile Friendly'),
(418, 'welcome_wonder_text', '', 'Wonder (NEW), ability to wonder a post if you don&#039;t like it.', 'Wonder (NEW), ability to wonder a post if you dont like it.'),
(419, 'welcome_connect_text', '', 'Connect with your family and friends and share your moments.', 'Connect with your family and friends and share your moments.'),
(420, 'welcome_share_text', '', 'Share what&#039;s new and life moments with your friends.', 'Share whats new and life moments with your friends.'),
(421, 'welcome_discover_text', '', 'Discover new people, create new connections and make new friends.', 'Discover new people, create new connections and make new friends.'),
(422, 'welcome_find_more_text', '', 'Find more of what you\'re looking for with WoWonder Search.', 'Tìm thêm những gì bạn đang tìm kiếm với Bee Search.'),
(423, 'welcome_mobile_text', '', '100% screen adaptable on all tablets and smartphones.', '100% screen adaptable on all tablets and smartphones.'),
(424, 'working_at', '', 'Working at', 'Làm việc tại'),
(425, 'relationship', '', 'Relationship', 'Relationship'),
(426, 'none', '', 'None', 'None'),
(427, 'avatar', '', 'Avatar', 'Avatar'),
(428, 'cover', '', 'Cover', 'Tạo ảnh bìa'),
(429, 'background', '', 'Background', 'Background'),
(430, 'theme', '', 'Theme', 'Theme'),
(431, 'deafult', '', 'Default', 'Default'),
(432, 'my_background', '', 'My Background', 'My Background'),
(433, 'company_website', '', 'Company website', 'Company website'),
(434, 'liked_my_page', '', 'Liked My Page', 'Liked My Page'),
(435, 'dislike', '', 'Dislike', 'Dislike'),
(436, 'dislikes', '', 'Dislikes', 'Dislikes'),
(437, 'disliked_post', '', 'disliked your {postType} {post}', 'disliked your {postType} {post}'),
(438, 'disliked_comment', '', 'disliked your comment &quot;{comment}&quot;', 'disliked your comment &quot;{comment}&quot;'),
(439, 'activity_disliked_post', '', 'disliked {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'disliked {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(440, 'second_button_type', '', 'Second post button type', 'Second post button type'),
(441, 'group_name', '', 'Group name', 'Group name'),
(442, 'group_title', '', 'Group title', 'Group title'),
(443, 'my_groups', '', 'My Groups', 'My Groups'),
(444, 'school', '', 'School', 'School'),
(445, 'site_keywords_help', '', 'Example: social, wowonder, social site', 'Ví dụ: mạng xã hội, trang cá nhân'),
(446, 'message_seen', '', 'Message Seen', 'Message Seen'),
(447, 'recommended_for_powerful', '', 'Recommended for powerful servers', 'Recommended for powerful servers'),
(448, 'message_typing', '', 'Chat typing system', 'Chat typing system'),
(449, 'reCaptcha', '', 'reCaptcha', 'reCaptcha'),
(450, 'instagram', 'Instagram', 'Instagram', 'Instagram'),
(451, 'profile_visit_notification_help', '', 'if you don&#039;t share your visit event , you won&#039;t be able to see other people visiting your profile.', 'if you dont share your visit event , you wont be able to see other people visiting your profile.'),
(452, 'account_delete', '', 'Delete Account', 'Delete Account'),
(453, 'ip_address', '', 'IP Address', 'IP Address'),
(454, 'manage_groups', '', 'Manage Groups', 'Manage Groups'),
(455, 'group_delete_confirmation', '', 'Are you sure you want to delete this group?', 'Are you sure you want to delete this group?'),
(456, 'no_more_groups', '', 'No more groups to show', 'No more groups to show'),
(457, 'show_more_groups', '', 'Show more groups', 'Show more groups'),
(458, 'members', '', 'Members', 'Members'),
(459, 'verifications_requests', '', 'Verification Requests', 'Verification Requests'),
(460, 'verify', '', 'Verify', 'Verify'),
(461, 'ignore', '', 'Ignore', 'Ignore'),
(462, 'page', '', 'Page', 'Page'),
(463, 'no_new_verification_requests', '', 'No new verification requests', 'No new verification requests'),
(464, 'ban_user', '', 'Ban User', 'Ban User'),
(465, 'banned', '', 'Banned', 'Banned'),
(466, 'there_are_no_banned_ips', '', 'There are no banned ips.', 'There are no banned ips.'),
(467, 'invalid_ip', '', 'Invalid ip address.', 'Invalid ip address.'),
(468, 'ip_banned', '', 'IP address successfully banned.', 'IP address successfully banned.'),
(469, 'ip_exist', '', 'IP address already exist', 'IP address already exist'),
(470, 'please_add_ip', '', 'Please add an ip address', 'Please add an ip address'),
(471, 'ip_deleted', '', 'IP address successfully deleted', 'IP address successfully deleted'),
(472, 'email_me_when', '', 'Email me when', 'Email me when'),
(473, 'e_likes_my_posts', '', 'Someone liked my posts', 'Someone liked my posts'),
(474, 'e_wondered_my_posts', '', 'Someone wondered my posts', 'Someone wondered my posts'),
(475, 'e_commented_my_posts', '', 'Someone commented on my posts', 'Someone commented on my posts'),
(476, 'e_shared_my_posts', '', 'Someone shared on my posts', 'Someone shared on my posts'),
(477, 'e_followed_me', '', 'Someone followed me', 'Someone followed me'),
(478, 'e_liked_page', '', 'Someone liked my pages', 'Someone liked my pages'),
(479, 'e_visited_my_profile', '', 'Someone visited my profile', 'Someone visited my profile'),
(480, 'e_mentioned_me', '', 'Someone mentioned me', 'Someone mentioned me'),
(481, 'e_joined_group', '', 'Someone joined my groups', 'Someone joined my groups'),
(482, 'e_accepted', '', 'Someone accepted my friend/follow requset', 'Someone accepted my friend/follow requset'),
(483, 'e_profile_wall_post', '', 'Someone posted on my timeline', 'Someone posted on my timeline'),
(484, 'no_groups_found', '', 'No groups to show', 'No groups to show'),
(485, 'group_information', '', 'Group information', 'Group information'),
(486, 'delete_group', '', 'Delete Group', 'Delete Group'),
(487, 'group_name_exists', '', 'Group name is already exists.', 'Group name is already exists.'),
(488, 'group_name_invalid_characters', '', 'Invalid group name characters', 'Invalid group name characters'),
(489, 'group_name_characters_length', '', 'Group name must be between 5 / 32', 'Group name must be between 5 / 32'),
(490, 'no_requests_found', '', 'No requests to show', 'No requests to show'),
(491, 'remove', '', 'Remove', 'Remove'),
(492, 'no_members_found', '', 'No members to show', 'No members to show'),
(493, 'group_deleted', '', 'Group successfully deleted', 'Group successfully deleted'),
(494, 'create_new_group', '', 'Create New Group', 'Create New Group'),
(495, 'my_games', '', 'My Games', 'My Games'),
(496, 'no_games_found', '', 'No games to show', 'No games to show'),
(497, 'groups', '', 'Groups', 'Nhóm'),
(498, 'no_friends', '', 'No friends yet', 'No friends yet'),
(499, 'no_groups', '', 'Didn&#039;t join any groups yet', 'Didnt join any groups yet'),
(500, 'load_more_pages', '', 'Load more pages', 'Load more pages'),
(501, 'load_more_groups', '', 'Load more groups', 'Load more groups'),
(502, 'joined_group', '', 'Joined your group ({group_name})', 'Joined your group ({group_name})'),
(503, 'happy', '', 'Happy', 'Happy'),
(504, 'loved', '', 'Loved', 'Loved'),
(505, 'sad', '', 'Sad', 'Buồn'),
(506, 'so_sad', '', 'Very sad', 'Rất buồn'),
(507, 'angry', '', 'Angry', 'Phẫn nộ'),
(508, 'confused', '', 'Confused', 'Confused'),
(509, 'smirk', '', 'Hot', 'Hot'),
(510, 'broke', '', 'Broken', 'Broken'),
(511, 'expressionless', '', 'expressionless', 'expressionless'),
(512, 'cool', '', 'Cool', 'Cool'),
(513, 'funny', '', 'Funny', 'Funny'),
(514, 'tired', '', 'Tired', 'Tired'),
(515, 'lovely', '', 'Lovely', 'Lovely'),
(516, 'blessed', '', 'Blessed', 'Blessed'),
(517, 'shocked', '', 'Shocked', 'Shocked'),
(518, 'sleepy', '', 'Sleepy', 'Sleepy'),
(519, 'pretty', '', 'Pretty', 'Pretty'),
(520, 'bored', '', 'Bored', 'Bored'),
(521, 'total_users', '', 'Total Users', 'Total Users'),
(522, 'users', '', 'Users', 'Users'),
(523, 'pages', '', 'Pages', 'Pages'),
(524, 'games', '', 'Games', 'Games'),
(525, 'online_users', '', 'Online Users', 'Online Users'),
(526, 'recent_searches', '', 'Recent Searches', 'Recent Searches'),
(527, 'clear', '', 'Clear', 'Clear'),
(528, 'search_filter', '', 'Search filter', 'Search filter'),
(529, 'keyword', '', 'Keyword', 'Keyword'),
(530, 'what_are_looking_for', '', 'What are looking for ?', 'What are looking for ?'),
(531, 'changed_profile_cover_picture_male', '', 'changed his profile cover', 'changed his profile cover'),
(532, 'changed_profile_cover_picture_female', '', 'changed her profile cover', 'changed her profile cover'),
(533, 'latest_games', '', 'Latest games', 'Latest games'),
(534, 'no_albums_found', '', 'You haven&#39;t created any albums yet.', 'You havent created any albums yet.'),
(535, 'create_album', '', 'Create album', 'Create album'),
(536, 'my_albums', '', 'My Albums', 'My Albums'),
(537, 'album_name', '', 'Album name', 'Album name'),
(538, 'upload', '', 'Upload', 'Upload'),
(539, 'add_photos', '', 'Add photos', 'Add photos'),
(540, 'replies', '', 'Replies', 'Replies'),
(541, 'reply_to_comment', '', 'Reply to comment', 'Reply to comment'),
(542, 'replied_to_comment', '', 'replied to your comment &quot;{comment}&quot;', 'replied to your comment &quot;{comment}&quot;'),
(543, 'comment_reply_mention', '', 'mentioned you in a reply &quot;{comment}&quot;', 'mentioned you in a reply &quot;{comment}&quot;'),
(544, 'also_replied', '', 'replied to the comment &quot;{comment}&quot;', 'replied to the comment &quot;{comment}&quot;'),
(545, 'liked_reply_comment', '', 'liked your reply &quot;{comment}&quot;', 'liked your reply &quot;{comment}&quot;'),
(546, 'wondered_reply_comment', '', 'wondered your reply &quot;{comment}&quot;', 'wondered your reply &quot;{comment}&quot;'),
(547, 'disliked_reply_comment', '', 'disliked your reply &quot;{comment}&quot;', 'disliked your reply &quot;{comment}&quot;'),
(548, 'profile_visit_notification_p', '', 'Send users a notification when i visit their profile?', 'Send users a notification when i visit their profile?'),
(549, 'showlastseen_help', '', 'if you don&#039;t share your last seen , you won&#039;t be able to see other people last seen.', 'if you dont share your last seen , you wont be able to see other people last seen.'),
(550, 'timeline_birthday_label', '', 'Who can see my birthday?', 'Who can see my birthday?'),
(551, 'people_likes_this', '', 'people like this', 'people like this'),
(552, 'page_inviate_label', '', 'Invite friends to like this Page', 'Invite friends to like this Page'),
(553, 'invite_your_frineds', '', 'Invite your friends/followers', 'Invite your friends/followers'),
(554, 'not_invite', '', 'You don&#039;t have any more friends to invite', 'You dont have any more friends to invite'),
(555, 'invite', '', 'Invite', 'Invite'),
(556, 'invited_page', '', 'invited you to like ({page_name})', 'invited you to like ({page_name})'),
(557, 'accepted_invited_page', '', 'accepted your request to like ({page_name})', 'accepted your request to like ({page_name})'),
(558, 'call_to_action', '', 'Call to action', 'Call to action'),
(559, 'call_to_action_target', '', 'Call to target url', 'Call to target url'),
(560, 'call_action_type_url_invalid', '', 'Call to action website is invalid', 'Call to action website is invalid'),
(561, 'avatar_and_cover', '', 'Avatar &amp; Cover', 'Avatar &amp; Cover'),
(562, 'online_sidebar_admin_label', '', 'Enable online users to show active users in sidebar.', 'Enable online users to show active users in sidebar.'),
(563, 'not_active', '', 'Not active', 'Not active'),
(564, 'females', '', 'Females', 'Females'),
(565, 'males', '', 'Males', 'Males'),
(566, 'dashboard', '', 'Dashboard', 'Dashboard'),
(567, 'albums', '', 'Albums', 'Albums'),
(568, 'name', '', 'Name', 'Name'),
(569, 'players', '', 'Players', 'Players'),
(570, 'add_new_game', '', 'Add New Game', 'Add New Game'),
(571, 'game_added', '', 'Game added', 'Game added'),
(572, 'url_not_supported_game', '', 'This url is not supported', 'This url is not supported'),
(573, 'please_add_a_game', '', 'Please add a game url', 'Please add a game url'),
(574, 'active_announcements', '', 'Active announcements', 'Active announcements'),
(575, 'inactive_announcements', '', 'Inactive announcements', 'Inactive announcements'),
(576, 'ban', '', 'Ban', 'Ban'),
(577, 'new_email', '', 'New E-mail', 'New E-mail'),
(578, 'html_allowed', '', 'Html allowed', 'Html allowed'),
(579, 'send_me_to_my_email', '', 'Send to my email', 'Send to my email'),
(580, 'test_message', '', 'Test message', 'Test message'),
(581, 'joined_members', '', 'Joined Members', 'Joined Members'),
(582, 'join_requests', '', 'Join Requests', 'Join Requests'),
(583, 'verified_pages', '', 'Verified Pages', 'Verified Pages'),
(584, 'file_sharing_extenstions', '', 'File sharing extensions (separated with comma,)', 'File sharing extensions (separated with comma,)'),
(585, 'word_cons', '', 'Words to be censored, separated by a comma (,)', 'Words to be censored, separated by a comma (,)'),
(586, 'join', '', 'Join', 'Join'),
(587, 'joined', '', 'Joined', 'Joined'),
(588, 'request', '', 'Request', 'Request'),
(589, 'edit_comment', '', 'Edit comment', 'Edit comment'),
(590, 'last_play', '', 'Last Play:', 'Last Play:'),
(591, 'play', '', 'Play', 'Play'),
(592, 'confirm_request_group_privacy_label', '', 'Confirm request when someone joining this group ?', 'Confirm request when someone joining this group ?'),
(593, 'who_can_see_group_posts', '', 'Who can see group&#039;s posts ?', 'Who can see groups posts ?'),
(594, 'joined_users', '', 'Joined users', 'Joined users'),
(595, 'living_in', '', 'Living in', 'Sống tại'),
(596, 'design', '', 'Design', 'Design'),
(597, 'people_you_may_want_to_meet', '', 'People you may want to meet', 'People you may want to meet'),
(598, 'added_new_photos_to', '', 'added new photos to', 'added new photos to'),
(599, 'is_feeling', '', 'is feeling', 'is feeling'),
(600, 'is_traveling', '', 'is traveling to', 'is traveling to'),
(601, 'is_listening', '', 'is listening to', 'is listening to'),
(602, 'is_playing', '', 'is playing', 'is playing'),
(603, 'is_watching', '', 'is watching', 'is watching'),
(604, 'feeling', '', 'Feeling', 'Feeling'),
(605, 'traveling', '', 'Traveling to', 'Traveling to'),
(606, 'watching', '', 'Watching', 'Watching'),
(607, 'playing', '', 'Playing', 'Playing'),
(608, 'listening', '', 'Listening to', 'Listening to'),
(609, 'feeling_q', '', 'What are you feeling ?', 'What are you feeling ?'),
(610, 'traveling_q', '', 'Where are you traveling ?', 'Where are you traveling ?'),
(611, 'watching_q', '', 'What are you watching ?', 'What are you watching ?'),
(612, 'playing_q', '', 'What are you Playing ?', 'What are you Playing ?'),
(613, 'listening_q', '', 'What are you Listening to ?', 'What are you Listening to ?'),
(614, 'feel_d', '', 'What are you doing ?', 'What are you doing ?'),
(615, 'studying_at', '', 'Studying at', 'Studying at'),
(616, 'company_website_invalid', '', 'Company website is invalid', 'Company website is invalid'),
(617, 'page_deleted', '', 'Page deleted successfully', 'Page deleted successfully'),
(618, 'cover_n_label', '', 'cover image.', 'cover image.'),
(619, 'suggested_groups', '', 'Suggested groups', 'Suggested groups'),
(620, 'accepted_join_request', '', 'accepted your request to join ({group_name})', 'accepted your request to join ({group_name})'),
(621, 'requested_to_join_group', '', 'requested to join your group', 'requested to join your group'),
(622, 'no_one_posted', '', 'No posts to show', 'No posts to show'),
(623, 'add_your_frineds', '', 'Add your friends to this group', 'Add your friends to this group'),
(624, 'added_all_friends', '', 'There are no friends to add them', 'There are no friends to add them'),
(625, 'added_you_to_group', '', 'added you to the group ({group_name})', 'added you to the group ({group_name})'),
(626, 'group_type', '', 'Group type', 'Group type'),
(627, 'public', '', 'Public', 'Public'),
(628, 'private', '', 'Private', 'Private'),
(629, 'reports', '', 'Reports', 'Reports'),
(630, 'no_dislikes', '', 'No dislikes yet', 'No dislikes yet'),
(631, 'disliked', '', 'Disliked', 'Disliked'),
(632, 'wondered', '', 'Wondered', 'Wondered'),
(633, 'terms', '', 'Terms Pages', 'Terms Pages'),
(634, 'profile_privacy', '', 'User Profile Privacy', 'User Profile Privacy'),
(635, 'profile_privacy_info', '', 'Enable it to allow non logged users to view users profiles.', 'Enable it to allow non logged users to view users profiles.'),
(636, 'video_upload', '', 'Video Upload', 'Video Upload'),
(637, 'video_upload_info', '', 'Enable video upload to share &amp; upload videos to the site.', 'Enable video upload to share &amp; upload videos to the site.'),
(638, 'audio_upload', '', 'Audio Upload', 'Audio Upload'),
(639, 'audio_upload_info', '', 'Enable audio upload to share &amp; upload sounds to the site.', 'Enable audio upload to share &amp; upload sounds to the site.'),
(640, 'read_more', '', 'Read more', 'Read more'),
(641, 'read_less', '', 'Read less', 'Read less'),
(642, 'add_photo', '', 'Add a photo.', 'Add a photo.'),
(643, 'add_photo_des', '', 'Show your unique personality and style.', 'Show your unique personality and style.'),
(644, 'start_up_skip', '', 'Or Skip this step for now.', 'Or Skip this step for now.'),
(645, 'start_up_continue', '', 'Save &amp; Continue', 'Save &amp; Continue'),
(646, 'tell_us', '', 'Tell us about you.', 'Tell us about you.'),
(647, 'tell_us_des', '', 'Share your information with our community.', 'Share your information with our community.'),
(648, 'get_latest_activity', '', 'Get latest activities from our popular users.', 'Get latest activities from our popular users.'),
(649, 'follow_head', '', 'Follow our famous users.', 'Follow our famous users.'),
(650, 'follow_num', '', 'Follow {number} &amp; Finish', 'Follow {number} &amp; Finish'),
(651, 'looks_good', '', 'Looks good.', 'Looks good.'),
(652, 'looks_good_des', '', 'You&#039;ll be able to add more to your profile later.', 'Youll be able to add more to your profile later.'),
(653, 'upload_your_photo', '', 'Upload your photo', 'Upload your photo'),
(654, 'please_wait', '', 'Please wait..', 'Please wait..'),
(655, 'username_or_email', '', 'Username or E-mail', 'Username or E-mail'),
(656, 'email_setting', '', 'E-mail Setting', 'E-mail Setting'),
(657, 'years_old', '', 'years old', 'years old'),
(658, 'friends_birthdays', '', 'Friends Birthdays', 'Friends Birthdays'),
(659, 'sms_setting', '', 'SMS Setting', 'SMS Setting'),
(660, 'smooth_loading', '', 'Smooth Loading', 'Smooth Loading'),
(661, 'boosted_pages_viewable', '', 'Boosted pages are already viewable by all our community members.', 'Boosted pages are already viewable by all our community members.'),
(662, 'boost_page_in_same_time', '', 'You&#039;re a {type_name}, You&#039;re just able to boost {can_boost} pages at the same time.', 'Youre a {type_name}, Youre just able to boost {can_boost} pages at the same time.'),
(663, 'boost_posts_in_same_time', '', 'You&#039;re a {type_name}, You&#039;re just able to boost {can_boost} posts at the same time.', 'Youre a {type_name}, Youre just able to boost {can_boost} posts at the same time.'),
(664, 'there_are_no_boosted_pages', '', 'There are no boosted pages yet.', 'There are no boosted pages yet.'),
(665, 'there_are_no_boosted_posts', '', 'There are no boosted posts yet.', 'There are no boosted posts yet.'),
(666, 'discover_pro_types', '', 'Discover more features with {sitename} PRO packages !', 'Discover more features with {sitename} PRO packages !'),
(667, 'star', '', 'Star', 'Star'),
(668, 'hot', '', 'Hot', 'Hot'),
(669, 'ultima', '', 'Ultima', 'Ultima'),
(670, 'vip', '', 'Vip', 'Vip'),
(671, 'featured_member', '', 'Featured member', 'Featured member'),
(672, 'see_profile_visitors', '', 'See profile visitors', 'See profile visitors'),
(673, 'show_hide_lastseen', '', 'Show / Hide last seen', 'Show / Hide last seen'),
(674, 'verified_badge', '', 'Verified badge', 'Verified badge'),
(675, 'post_promotion_star', '', 'Posts promotion&lt;br&gt;', 'Posts promotion&lt;br&gt;'),
(676, 'page_promotion_star', '', 'Pages promotion&lt;br&gt;', 'Pages promotion&lt;br&gt;'),
(677, '0_discount', '', '0% discount', '0% discount'),
(678, '10_discount', '', '10% discount', '10% discount'),
(679, '20_discount', '', '20% discount', '20% discount'),
(680, '60_discount', '', '60% discount', '60% discount'),
(681, 'per_week', 'Per Week', 'Per Week', 'Per Week'),
(682, 'per_month', 'Per Month', 'Per Month', 'Per Month'),
(683, 'per_year', 'Per Year', 'Per Year', 'Per Year'),
(684, 'life_time', '', 'life time', 'life time'),
(685, 'upgrade_now', '', 'Upgrade Now', 'Upgrade Now'),
(686, 'boosted_posts', '', 'Boosted Posts', 'Boosted Posts'),
(687, 'boosted_pages', '', 'Boosted Pages', 'Boosted Pages'),
(688, 'put_me_here', '', 'Put Me Here', 'Put Me Here'),
(689, 'promoted', '', 'Promoted', 'Promoted'),
(690, 'oops_something_went_wrong', '', 'Oops ! Something went wrong.', 'Oops ! Something went wrong.'),
(691, 'try_again', '', 'Try again', 'Try again'),
(692, 'boost_page', '', 'Boost Page', 'Boost Page'),
(693, 'page_boosted', '', 'Page Boosted', 'Page Boosted'),
(694, 'un_boost_page', '', 'Un-Boost Page', 'Un-Boost Page'),
(695, 'edit_page_settings', '', 'Edit Page Settings', 'Edit Page Settings'),
(696, 'blocked_users', '', 'Blocked Users', 'Blocked Users'),
(697, 'un_block', '', 'Un-Block', 'Un-Block');
INSERT INTO `wo_langs` (`id`, `lang_key`, `type`, `english`, `vietnammese`) VALUES
(698, 'css_file', '', 'CSS file', 'CSS file'),
(699, 'css_status_default', '', 'Default design', 'Default design'),
(700, 'css_status_my', '', 'My CSS file', 'My CSS file'),
(701, 'css_file_info', '', 'You can fully design your profile by uploading your own CSS file', 'You can fully design your profile by uploading your own CSS file'),
(702, 'invite_your_frineds_home', '', 'Invite Your Friends', 'Invite Your Friends'),
(703, 'send_invitation', '', 'Send Invitation', 'Send Invitation'),
(704, 'boost_post', '', 'Boost Post', 'Boost Post'),
(705, 'unboost_post', '', 'UnBoost Post', 'UnBoost Post'),
(706, 'drag_to_re', '', 'Drag to reposition cover', 'Drag to reposition cover'),
(707, 'block_user', '', 'Block User', 'Block User'),
(708, 'edit_user', '', 'Edit User', 'Edit User'),
(709, 'cong', '', 'Congratulations ! You&#039;re now a &lt;span style=&quot;color:{color}&quot;&gt;&lt;i class=&quot;fa fa-{icon} fa-fw&quot;&gt;&lt;/i&gt;{type_name}', 'Congratulations ! Youre now a &lt;span style=&quot;color:{color}&quot;&gt;&lt;i class=&quot;fa fa-{icon} fa-fw&quot;&gt;&lt;/i&gt;{type_name}'),
(710, 'cong_2', '', 'Start browsing the new features', 'Start browsing the new features'),
(711, 'activation_oops', '', 'Oops, looks like your account is not activated yet.', 'Oops, looks like your account is not activated yet.'),
(712, 'activation_method', '', 'Please choose a method below to activate your account.', 'Please choose a method below to activate your account.'),
(713, 'activation_email', '', 'Via E-mail', 'Via E-mail'),
(714, 'activation_phone', '', 'Via Phone Number', 'Via Phone Number'),
(715, 'activation_or', '', 'Or', 'Or'),
(716, 'activation_send_code', '', 'Send Confirmation Code', 'Send Confirmation Code'),
(717, 'activation_get_code_again', '', 'Didn&#039;t get the code?', 'Didnt get the code?'),
(718, 'activation_resend', '', 'Resend', 'Resend'),
(719, 'activation_should_receive', '', 'You should receive the code within', 'You should receive the code within'),
(720, 'confirm', '', 'Confirm', 'Confirm'),
(721, 'phone_num_ex', '', 'Phone number (eg. +905...)', 'Phone number (eg. +905...)'),
(722, 'error_while_activating', '', 'Error while activating your account.', 'Error while activating your account.'),
(723, 'wrong_confirmation_code', '', 'Wrong confirmation code.', 'Wrong confirmation code.'),
(724, 'failed_to_send_code', '', 'Failed to send the confirmation code.', 'Failed to send the confirmation code.'),
(725, 'worng_phone_number', '', 'Wrong phone number.', 'Wrong phone number.'),
(726, 'phone_already_used', '', 'Phone number already used.', 'Phone number already used.'),
(727, 'sms_has_been_sent', '', 'SMS has been sent successfully.', 'SMS has been sent successfully.'),
(728, 'error_while_sending_sms', '', 'Error while sending the SMS, please try another number.', 'Error while sending the SMS, please try another number.'),
(729, 'failed_to_send_code_fill', '', 'Failed to send the confirmation code, please select one of the activation methods.', 'Failed to send the confirmation code, please select one of the activation methods.'),
(730, 'email_sent_successfully', '', 'E-mail has been sent successfully, please check your inbox or spam folder for the activation link.', 'E-mail has been sent successfully, please check your inbox or spam folder for the activation link.'),
(731, 'limit_exceeded', '', 'Limit exceeded, please try again later.', 'Limit exceeded, please try again later.'),
(732, 'failed_to_send_code_email', '', 'Error while sending the SMS, please try another number or activate your account via email by logging into your account.', 'Error while sending the SMS, please try another number or activate your account via email by logging into your account.'),
(733, 'free_member', '', 'Free Member', 'Free Member'),
(734, 'star_member', '', 'Star Member', 'Star Member'),
(735, 'hot_member', '', 'Hot Member', 'Hot Member'),
(736, 'ultima_member', '', 'Ultima Member', 'Ultima Member'),
(737, 'vip_member', '', 'Vip Member', 'Vip Member'),
(738, 'moderator', '', 'Moderator', 'Moderator'),
(739, 'member_type', '', 'Member Type', 'Member Type'),
(740, 'membership', '', 'Membership', 'Membership'),
(741, 'upgrade', '', 'Upgrade', 'Upgrade'),
(742, 'error_please_try_again', '', 'Error, Please try again later.', 'Error, Please try again later.'),
(743, 'upgrade_to_pro', '', 'Upgrade To Pro', 'Upgrade To Pro'),
(744, 'no_answer', '', 'No answer', 'No answer'),
(745, 'please_try_again_later', '', 'Please try again later.', 'Please try again later.'),
(746, 'answered', '', 'Answered !', 'Answered !'),
(747, 'call_declined', '', 'Call declined', 'Call declined'),
(748, 'call_declined_desc', '', 'The recipient has declined the call, please try again later.', 'The recipient has declined the call, please try again later.'),
(749, 'new_video_call', '', 'New video call', 'New video call'),
(750, 'new_video_call_desc', '', 'wants to video chat with you.', 'wants to video chat with you.'),
(751, 'decline', '', 'Decline', 'Decline'),
(752, 'accept_and_start', '', 'Accept &amp; Start', 'Accept &amp; Start'),
(753, 'calling', '', 'Calling', 'Calling'),
(754, 'calling_desc', '', 'Please wait for your friend answer.', 'Please wait for your friend answer.'),
(755, 'your_friends_chat', '', 'You&#039;re friends on {site_name}', 'Youre friends on {site_name}'),
(756, 'your_following', '', 'You&#039;re following', 'Youre following'),
(757, 'see_all', '', 'See all', 'See all'),
(758, 'me', '', 'Me', 'Me'),
(759, 'post_promotion_hot', '', 'Boost up to {monthly_boosts} posts&lt;br&gt;', 'Boost up to {monthly_boosts} posts&lt;br&gt;'),
(760, 'page_promotion_hot', '', 'Boost up to {monthly_boosts} pages&lt;br&gt;', 'Boost up to {monthly_boosts} pages&lt;br&gt;'),
(761, 'post_promotion_ultima', '', 'Boost up to {yearly_boosts} posts&lt;br&gt;', 'Boost up to {yearly_boosts} posts&lt;br&gt;'),
(762, 'page_promotion_ultima', '', 'Boost up to {yearly_boosts} pages&lt;br&gt;', 'Boost up to {yearly_boosts} pages&lt;br&gt;'),
(763, 'post_promotion_vip', '', 'Boost up to {lifetime_boosts} posts&lt;br&gt;', 'Boost up to {lifetime_boosts} posts&lt;br&gt;'),
(764, 'page_promotion_vip', '', 'Boost up to {lifetime_boosts} pages&lt;br&gt;', 'Boost up to {lifetime_boosts} pages&lt;br&gt;'),
(765, 'sign_up', '', 'Sign up', 'Sign up'),
(766, 'youtube', '', 'YouTube', 'YouTube'),
(767, 'my_products', '', 'My Products', 'My Products'),
(768, 'choose_a_payment_method', '', 'Choose a payment method', 'Choose a payment method'),
(769, 'paypal', '', 'PayPal', 'PayPal'),
(770, 'credit_card', '', 'Credit Card', 'Credit Card'),
(771, 'bitcoin', '', 'Bitcoin', 'Bitcoin'),
(772, 'categories', '', 'Categories', 'Categories'),
(773, 'latest_products', '', 'Latest Products', 'Latest Products'),
(774, 'search_for_products_main', '', 'Search for products', 'Search for products'),
(775, 'search_for_products', '', 'Search for products in {category_name}', 'Search for products in {category_name}'),
(776, 'no_available_products', '', 'No available products to show.', 'No available products to show.'),
(777, 'load_more_products', '', 'Load more products', 'Load more products'),
(778, 'sell_new_product', '', 'Sell new product', 'Sell new product'),
(779, 'description', '', 'Description', 'Description'),
(780, 'please_describe_your_product', '', 'Please describe your product.', 'Please describe your product.'),
(781, 'used', '', 'Used', 'Used'),
(782, 'new', '', 'New', 'New'),
(783, 'price', '', 'Price', 'Price'),
(784, 'your_product_price', '', 'Your product price in USD currency ($), e.g (10.99)', 'Your product price in USD currency ($), e.g (10.99)'),
(785, 'edit_product', '', 'Edit product', 'Edit product'),
(786, 'publish', '', 'Publish', 'Publish'),
(787, 'more_info', '', 'More info', 'More info'),
(788, 'contact_seller', '', 'Contact seller', 'Contact seller'),
(789, 'by_product', '', 'By &lt;a href=&quot;{product_url}&quot;&gt;{product_name}&lt;/a&gt;, posted {product_time}, in &lt;a href=&quot;{product_category}&quot;&gt;{product_category_name}&lt;/a&gt;', 'By &lt;a href=&quot;{product_url}&quot;&gt;{product_name}&lt;/a&gt;, posted {product_time}, in &lt;a href=&quot;{product_category}&quot;&gt;{product_category_name}&lt;/a&gt;'),
(790, 'payment_declined', '', 'Payment declined, please try again later.', 'Payment declined, please try again later.'),
(791, 'c_payment', '', 'Confirming payment, please wait..', 'Confirming payment, please wait..'),
(792, 'earn_users', '', 'Earn up to ${amount} for each user your refer to us !', 'Earn up to ${amount} for each user your refer to us !'),
(793, 'earn_users_pro', '', 'Earn up to ${amount} for each user your refer to us and will subscribe to any of our pro packages.', 'Earn up to ${amount} for each user your refer to us and will subscribe to any of our pro packages.'),
(794, 'my_affiliates', '', 'My Affiliates', 'My Affiliates'),
(795, 'my_balance', '', 'Current balance', 'Current balance'),
(796, 'your_ref_link', '', 'Your affiliate link is', 'Your affiliate link is'),
(797, 'your_balance', '', 'Your balance is ${balance}, minimum withdrawal request is ${m_withdrawal}', 'Your balance is ${balance}, minimum withdrawal request is ${m_withdrawal}'),
(798, 'your_balance_is', '', 'Your balance is', 'Your balance is'),
(799, 'paypal_email', '', 'PayPal email', 'PayPal email'),
(800, 'amount_usd', '', 'Amount (USD)', 'Amount (USD)'),
(801, 'request_withdrawal', '', 'Request withdrawal', 'Request withdrawal'),
(802, 'payment_history', '', 'Payment History', 'Payment History'),
(803, 'amount', '', 'Amount', 'Amount'),
(804, 'declined', '', 'Declined', 'Declined'),
(805, 'approved', '', 'Approved', 'Approved'),
(806, 'total_votes', '', 'Total votes', 'Total votes'),
(807, 'mark_as_sold', '', 'Mark Product As Sold', 'Mark Product As Sold'),
(808, 'added_new_product_for_sell', '', 'added new product for sell.', 'added new product for sell.'),
(809, 'product_name', '', 'Product Name', 'Product Name'),
(810, 'in_stock', '', 'In stock', 'In stock'),
(811, 'sold', '', 'Sold', 'Sold'),
(812, 'answer', '', 'Answer', 'Answer'),
(813, 'add_answer', '', 'Add answer', 'Add answer'),
(814, 'authenticating', '', 'Authenticating', 'Authenticating'),
(815, 'welcome_back', '', 'Welcome back!', 'Welcome back!'),
(816, 'welcome_', '', 'Welcome!', 'Welcome!'),
(817, 'connect_with_people', '', 'Connect with people.', 'Connect with people.'),
(818, 'make_new_friends', '', 'Make new friends.', 'Make new friends.'),
(819, 'share_your_memories', '', 'Share your memories.', 'Share your memories.'),
(820, 'create_new_relationships', '', 'Create new relationships.', 'Create new relationships.'),
(821, 'discover_new_places', '', 'Discover new places.', 'Discover new places.'),
(822, 'forgot_your_password', '', 'Forgot your password?', 'Forgot your password?'),
(823, 'invalid_markup', '', 'Invalid markup, please try to reset your password again', 'Invalid markup, please try to reset your password again'),
(824, 'go_back', '', 'Go back', 'Go back'),
(825, 'terms_agreement', '', 'By creating your account, you agree to our', 'By creating your account, you agree to our'),
(826, 'please_choose_price', '', 'Please choose a price for your product', 'Please choose a price for your product'),
(827, 'please_choose_c_price', '', 'Please choose a correct value for your price', 'Please choose a correct value for your price'),
(828, 'please_upload_image', '', 'Please upload at least 1 photo', 'Please upload at least 1 photo'),
(829, 'you_have_already_voted', '', 'You have already voted this poll.', 'You have already voted this poll.'),
(830, 'you_have_pending_request', '', 'You have already a pending request.', 'You have already a pending request.'),
(831, 'invalid_amount_value', '', 'Invalid amount value', 'Invalid amount value'),
(832, 'invalid_amount_value_your', '', 'Invalid amount value, your amount is:', 'Invalid amount value, your amount is:'),
(833, 'invalid_amount_value_withdrawal', '', 'Invalid amount value, minimum withdrawal request is:', 'Invalid amount value, minimum withdrawal request is:'),
(834, 'you_request_sent', '', 'Your request has been sent, you&#039;ll receive an email regarding the payment details soon.', 'Your request has been sent, youll receive an email regarding the payment details soon.'),
(835, 'turn_off_notification', '', 'Turn off notification sound', 'Turn off notification sound'),
(836, 'turn_on_notification', '', 'Turn on notification sound', 'Turn on notification sound'),
(837, 'view_more_posts', '', 'View {count} new posts', 'View {count} new posts'),
(838, 'store_posts_by', '', 'Store posts by', 'Store posts by'),
(839, 'new_audio_call', '', 'New audio call', 'New audio call'),
(840, 'new_audio_call_desc', '', 'wants to talk with you.', 'wants to talk with you.'),
(841, 'audio_call', '', 'Audio call', 'Audio call'),
(842, 'audio_call_desc', '', 'talking with', 'talking with'),
(843, 'market', '', 'Market', 'Market'),
(844, 'comment_post_label', '', 'Comment', 'Bình luận'),
(846, 'by', '', 'By', 'By'),
(847, 'load_more_blogs', '', 'Load more articles', 'Load more articles'),
(848, 'blog', '', 'Blog', 'Blog'),
(849, 'no_blogs_found', '', 'No articles found', 'No articles found'),
(850, 'most_recent_art', '', 'Most recent articles', 'Most recent articles'),
(851, 'create_new_article', '', 'Create new article', 'Create new article'),
(852, 'my_articles', '', 'My articles', 'My articles'),
(853, 'title', '', 'Title', 'Title'),
(854, 'content', '', 'Content', 'Content'),
(855, 'select', '', 'Select', 'Select'),
(856, 'tags', '', 'Tags', 'Tags'),
(857, 'thumbnail', '', 'Thumbnail', 'Thumbnail'),
(858, 'published', '', 'Published', 'Published'),
(859, 'views', '', 'Views', 'Views'),
(860, 'article_updated', '', 'Your article has been successfully updated', 'Your article has been successfully updated'),
(861, 'article_added', '', 'Your article has been successfully added', 'Your article has been successfully added'),
(862, 'title_more_than10', '', 'Title should be more than 10 characters', 'Title should be more than 10 characters'),
(863, 'desc_more_than32', '', 'Description should be more than 32 characters', 'Description should be more than 32 characters'),
(864, 'please_fill_tags', '', 'Please fill the tags field', 'Please fill the tags field'),
(865, 'error_found', '', 'Error found, please try again later', 'Error found, please try again later'),
(866, 'posted_on_blog', '', 'Posted {BLOG_TIME} in {CATEGORY_NAME}.', 'Posted {BLOG_TIME} in {CATEGORY_NAME}.'),
(867, 'created_new_blog', '', 'created a new article', 'created a new article'),
(868, 'forum', '', 'Forum', 'Forum'),
(869, 'replies', '', 'Replies', 'Replies'),
(870, 'last_post', '', 'Last Post', 'Last Post'),
(871, 'topic', '', 'topic', 'topic'),
(872, 'thread_search', '', 'Threads search', 'Threads search'),
(873, 'create_new_topic', '', 'Create new topic', 'Create new topic'),
(874, 'jump_to', '', 'Jump to', 'Jump to'),
(875, 'my_threads', '', 'My Threads', 'My Threads'),
(876, 'my_messages', '', 'My Messages', 'My Messages'),
(877, 'headline', '', 'Headline', 'Headline'),
(878, 'your_post', '', 'Your post', 'Your post'),
(879, 'reply', '', 'Reply', 'Phản hồi'),
(880, 'started_by', '', 'Started by', 'Started by'),
(881, 'site_admin', '', 'Site Admin', 'Site Admin'),
(882, 'registered', '', 'Registered', 'Registered'),
(883, 'posts', '', 'posts', 'posts'),
(884, 'reply_to_topic', '', 'Reply to this topic', 'Reply to this topic'),
(885, 'topic_review', '', 'Topic review', 'Topic review'),
(886, 'your_reply', '', 'Your Reply', 'Your Reply'),
(887, 'list_of_users', '', 'List of users', 'List of users'),
(888, 'post_count', '', 'Posts count', 'Posts count'),
(889, 'referrals', '', 'Referrals', 'Referrals'),
(890, 'last_visit', '', 'Last visit', 'Last visit'),
(891, 'general_search_terms', '', 'General search terms', 'General search terms'),
(892, 'search_for_term', '', 'Search for term', 'Search for term'),
(893, 'search_in', '', 'Search in', 'Search in'),
(894, 'search_in_forums', '', 'Search Forums', 'Search Forums'),
(895, 'search_in_threads', '', 'Search in threads', 'Search in threads'),
(896, 'search_in_messages', '', 'Search in messages', 'Search in messages'),
(897, 'search_subject_only', '', 'Search subject only', 'Search subject only'),
(898, 'threads', '', 'threads', 'threads'),
(899, 'action', '', 'Action', 'Action'),
(900, 'posted', '', 'Posted', 'Posted'),
(901, 'no_forums_found', '', 'No forums to show', 'No forums to show'),
(902, 'never', '', 'Never', 'Never'),
(903, 'no_replies_found', '', 'No replies to show', 'No replies to show'),
(904, 'no_threads_found', '', 'No threads to show', 'No threads to show'),
(905, 'no_members_found', '', 'No members to show', 'No members to show'),
(906, 'no_sections_found', '', 'No sections to show', 'No sections to show'),
(907, 'wrote', '', 'wrote', 'wrote'),
(908, 'edit', '', 'Edit', 'Chỉnh sửa trang cá nhân'),
(909, 'edit_topic', '', 'Edit topic', 'Edit topic'),
(910, 'reply_saved', '', 'Your reply was successfully saved', 'Your reply was successfully saved'),
(911, 'reply_added', '', 'Your reply was successfully added', 'Your reply was successfully added'),
(912, 'forum_post_added', '', 'Your forum has been successfully added', 'Your forum has been successfully added'),
(913, 'members', '', 'Members', 'Members'),
(914, 'help', '', 'Help', 'Help'),
(915, 'search_terms_more4', '', 'Type in one or more search terms, each must be at least 4 characters', 'Type in one or more search terms, each must be at least 4 characters'),
(916, 'events', '', 'Events', 'Events'),
(917, 'going', '', 'Going', 'Going'),
(918, 'interested', '', 'Interested', 'Interested'),
(919, 'past', '', 'Pastor', 'Pastor'),
(920, 'invited', '', 'invited', 'invited'),
(921, 'you_are_going', '', 'You are going', 'You are going'),
(922, 'you_are_interested', '', 'You are interested', 'You are interested'),
(923, 'start_date', '', 'Start date', 'Start date'),
(924, 'end_date', '', 'End date', 'End date'),
(925, 'location', '', 'Location', 'Location'),
(926, 'event', '', 'Event', 'Event'),
(927, 'no_events_found', '', 'No events to show', 'No events to show'),
(928, 'event_you_may_like', '', 'Events you may like', 'Events you may like'),
(929, 'going_people', '', 'Going people', 'Going people'),
(930, 'interested_people', '', 'Interested people', 'Interested people'),
(931, 'invited_people', '', 'Invited people', 'Invited people'),
(932, 'event_added', '', 'Your event was successfully added', 'Your event was successfully added'),
(933, 'event_saved', '', 'Your event was successfully saved.', 'Your event was successfully saved.'),
(934, 'confirm_delete_event', '', 'You are sure that you want to delete this event', 'You are sure that you want to delete this event'),
(935, 'load_more', '', 'Load more', 'Load more'),
(936, 'subject', '', 'Subject', 'Subject'),
(937, 'go', '', 'Go', 'Go'),
(938, 'created_new_event', '', 'created new event', 'created new event'),
(939, 'my_events', '', 'My events', 'My events'),
(940, 'is_interested', '', 'is interested on your event \"{event_name}\"', 'is interested on your event &quot;{event_name}&quot;'),
(941, 'is_going', '', 'is going to your event \"{event_name}\"', 'is going to your event &quot;{event_name}&quot;'),
(942, 'invited_you_event', '', 'invited you to go the event \"{event_name}\"', 'invited you to go the event &quot;{event_name}&quot;'),
(943, 'replied_to_topic', '', 'replied to your topic', 'replied to your topic'),
(944, 'movies', '', 'Movies', 'Movies'),
(945, 'translate', '', 'Translate', 'Dịch'),
(946, 'genre', '', 'Genre', 'Genre'),
(947, 'recommended', '', 'Recommended', 'Recommended'),
(948, 'most_watched', '', 'Most watched', 'Most watched'),
(949, 'stars', '', 'Stars', 'Stars'),
(950, 'more', '', 'More', 'More'),
(951, 'no_movies_found', '', 'No movies to show', 'No movies to show'),
(952, 'producer', '', 'Producer', 'Producer'),
(953, 'release', '', 'Release', 'Release'),
(954, 'quality', '', 'Quality', 'Quality'),
(955, 'more_like_this', '', 'More like this', 'More like this'),
(956, 'wallet', '', 'Wallet', 'Wallet'),
(957, 'company', '', 'Company', 'Company'),
(958, 'bidding', '', 'Bidding', 'Bidding'),
(959, 'clicks', '', 'Clicks', 'Clicks'),
(960, 'url', '', 'Url', 'Url'),
(961, 'audience', '', 'Audience', 'Audience'),
(962, 'select_image', '', 'Select an image', 'Select an image'),
(963, 'my_balance', '', 'Current balance', 'Current balance'),
(964, 'replenish_my_balance', '', 'Replenish my balance', 'Replenish my balance'),
(965, 'continue', '', 'Continue', 'Continue'),
(966, 'replenishment_notif', '', 'Your balance has been replenished by', 'Your balance has been replenished by'),
(967, 'ads', '', 'Advertising', 'Advertising'),
(968, 'confirm_delete_ad', '', 'Are you sure that you want to delete this campaign? This action can&#39;t be undo.', 'Are you sure that you want to delete this campaign? This action cant be undo.'),
(969, 'delete_ad', '', 'Delete campaign', 'Delete campaign'),
(970, 'no_ads_found', '', 'No ads found. Create new ad and start getting traffic!', 'No ads found. Create new ad and start getting traffic!'),
(971, 'not_active', '', 'Not active', 'Not active'),
(972, 'appears', '', 'Placement', 'Placement'),
(973, 'sidebar', '', 'Sidebar', 'Sidebar'),
(974, 'select_a_page_or_link', '', 'Select a page or enter a link to your site', 'Select a page or enter a link to your site'),
(975, 'story', '', 'Story', 'Story'),
(976, 'max_number_status', '', 'The maximum number can not exceed 20 files at a time!', 'The maximum number can not exceed 20 files at a time!'),
(977, 'status_added', '', 'Your status has been successfully added!', 'Your status has been successfully added!'),
(978, 'create_new_status', '', 'Create New Status', 'Create New Status'),
(979, 'sponsored', '', 'Sponsored', 'Sponsored'),
(980, 'notification_sent', '', 'Your notification has been sent successfully', 'Your notification has been sent successfully'),
(981, 'hide_post', '', 'Hide post', 'Hide post'),
(982, 'verification_sent', '', 'Your verification request  soon will be considered!', 'Your verification request  soon will be considered!'),
(983, 'profile_verification', '', 'Verification of the profile!', 'Verification of the profile!'),
(984, 'verification_complete', '', 'Congratulations your profile is verified!', 'Congratulations your profile is verified!'),
(985, 'upload_docs', '', 'Upload documents', 'Upload documents'),
(986, 'select_verif_images', '', 'Please upload a photo with your passport / ID  & your distinct photo', 'Please upload a photo with your passport / ID  &amp; your distinct photo'),
(987, 'passport_id', '', 'Copy of your passport or ID card', 'Copy of your passport or ID card'),
(988, 'your_photo', '', 'Your photo', 'Your photo'),
(989, 'please_select_passport_id', '', 'Please select your passport/id and photo!', 'Please select your passport/id and photo!'),
(990, 'passport_id_invalid', '', 'The passport/id picture must be an image', 'The passport/id picture must be an image'),
(991, 'user_picture_invalid', '', 'The user picture must be an image', 'The user picture must be an image'),
(992, 'verification_request_sent', '', 'Your request was successfully sent, in the very near future we will consider it!', 'Your request was successfully sent, in the very near future we will consider it!'),
(993, 'shared', '', 'shared', 'shared'),
(994, 'post_shared', '', 'Post was successfully added to your timeline!', 'Post was successfully added to your timeline!'),
(995, 'important', '', 'Important!', 'Important!'),
(996, 'unverify', '', 'Please note that if you change the username you will lose verification', 'Please note that if you change the username you will lose verification'),
(997, 'friend_privacy', '', 'Who can see my friends?', 'Who can see my friends?'),
(998, 'added_group_admin', '', 'added you group admin', 'added you group admin'),
(999, 'added_page_admin', '', 'added you page admin', 'added you page admin'),
(1000, 'no_messages', '', 'No messages yet here.', 'No messages yet here.'),
(1001, 'conversation_deleted', '', 'Conversation has been deleted!', 'Conversation has been deleted!'),
(1002, 'close', '', 'Close', 'Close'),
(1003, 'members', '', 'Members', 'Members'),
(1004, 'exit_group', '', 'Exit group', 'Exit group'),
(1005, 'clear_history', '', 'Clear history', 'Clear history'),
(1006, 'group_members', '', 'Group members', 'Group members'),
(1007, 'add_parts', '', 'Add participant', 'Add participant'),
(1008, 'unreport', '', 'Cancel Report', 'Cancel Report'),
(1009, 'report_user', '', 'Report this User', 'Report this User'),
(1010, 'report_page', '', 'Report this Page', 'Report this Page'),
(1011, 'report_group', '', 'Report this Group', 'Report this Group'),
(1012, 'page_rated', '', 'You have already rated this page!', 'You have already rated this page!'),
(1013, 'rating', '', 'Rating', 'Rating'),
(1014, 'reviews', '', 'Reviews', 'Reviews'),
(1015, 'rate', '', 'Rate', 'Rate'),
(1016, 'your_review', '', 'Write your review.', 'Write your review.'),
(1017, 'ad_saved', '', 'Your ad has been successfully saved!', 'Your ad has been successfully saved!'),
(1018, 'ad_added', '', 'Your ad has been successfully added!', 'Your ad has been successfully added!'),
(1019, 'invalid_ad_picture', '', 'The ads picture must be an image!', 'The ads picture must be an image!'),
(1020, 'enter_valid_desc', '', 'Please enter a valid description!', 'Please enter a valid description!'),
(1021, 'enter_valid_titile', '', 'Please enter a valid title!', 'Please enter a valid title!'),
(1022, 'enter_valid_url', '', 'Please enter a valid link!', 'Please enter a valid link!'),
(1023, 'invalid_company_name', '', 'Please enter a valid company name!', 'Please enter a valid company name!'),
(1024, 'mother', '', 'Mother', 'Mother'),
(1025, 'father', '', 'Father', 'Father'),
(1026, 'daughter', '', 'Daughter', 'Daughter'),
(1027, 'son', '', 'Son', 'Son'),
(1028, 'sister', '', 'Sister', 'Sister'),
(1029, 'brother', '', 'Brother', 'Brother'),
(1030, 'auntie', '', 'Auntie', 'Auntie'),
(1031, 'uncle', '', 'Uncle', 'Uncle'),
(1032, 'niece', '', 'Niece', 'Niece'),
(1033, 'nephew', '', 'Nephew', 'Nephew'),
(1034, 'cousin_female', '', 'Cousin (female)', 'Cousin (female)'),
(1035, 'cousin_male', '', 'Cousin (male)', 'Cousin (male)'),
(1036, 'grandmother', '', 'Grandmother', 'Grandmother'),
(1037, 'grandfather', '', 'Grandfather', 'Grandfather'),
(1038, 'granddaughter', '', 'Granddaughter', 'Granddaughter'),
(1039, 'grandson', '', 'Grandson', 'Grandson'),
(1040, 'stepsister', '', 'Stepsister', 'Stepsister'),
(1041, 'stepbrother', '', 'Stepbrother', 'Stepbrother'),
(1042, 'stepmother', '', 'Stepmother', 'Stepmother'),
(1043, 'stepfather', '', 'Stepfather', 'Stepfather'),
(1044, 'stepdaughter', '', 'Stepdaughter', 'Stepdaughter'),
(1045, 'sister_in_law', '', 'Sister-in-law', 'Sister-in-law'),
(1046, 'brother_in_law', '', 'Brother-in-law', 'Brother-in-law'),
(1047, 'mother_in_law', '', 'Mother-in-law', 'Mother-in-law'),
(1048, 'father_in_law', '', 'Father-in-law', 'Father-in-law'),
(1049, 'daughter_in_law', '', 'Daughter-in-law', 'Daughter-in-law'),
(1050, 'son_in_law', '', 'Son-in-law', 'Son-in-law'),
(1051, 'sibling_gender_neutral', '', 'Sibling (gender neutral)', 'Sibling (gender neutral)'),
(1052, 'parent_gender_neutral', '', 'Parent (gender neutral)', 'Parent (gender neutral)'),
(1053, 'child_gender_neutral', '', 'Child (gender neutral)', 'Child (gender neutral)'),
(1054, 'sibling_of_parent_gender_neutral', '', 'Sibling of Parent (gender neutral)', 'Sibling of Parent (gender neutral)'),
(1055, 'child_of_sibling_gender_neutral', '', 'Child of Sibling (gender neutral)', 'Child of Sibling (gender neutral)'),
(1056, 'cousin_gender_neutral', '', 'Cousin (gender neutral)', 'Cousin (gender neutral)'),
(1057, 'grandparent_gender_neutral', '', 'Grandparent (gender neutral)', 'Grandparent (gender neutral)'),
(1058, 'grandchild_gender_neutral', '', 'Grandchild (gender neutral)', 'Grandchild (gender neutral)'),
(1059, 'step_sibling_gender_neutral', '', 'Step-sibling (gender neutral)', 'Step-sibling (gender neutral)'),
(1060, 'step_parent_gender_neutral', '', 'Step-parent (gender neutral)', 'Step-parent (gender neutral)'),
(1061, 'stepchild_gender_neutral', '', 'Stepchild (gender neutral)', 'Stepchild (gender neutral)'),
(1062, 'sibling_in_law_gender_neutral', '', 'Sibling-in-law (gender neutral)', 'Sibling-in-law (gender neutral)'),
(1063, 'parent_in_law_gender_neutral', '', 'Parent-in-law (gender neutral)', 'Parent-in-law (gender neutral)'),
(1064, 'child_in_law_gender_neutral', '', 'Child-in-law (gender neutral)', 'Child-in-law (gender neutral)'),
(1065, 'add_to_family', '', 'Add to family', 'Add to family'),
(1066, 'accept', '', 'Accept', 'Accept'),
(1067, 'family_member', '', 'Family Member', 'Family Member'),
(1068, 'family_members', '', 'Family members', 'Family members'),
(1069, 'add_as', '', 'Add as', 'Add as'),
(1070, 'confirm_remove_family_member', '', 'Are you sure that you want to remove this member from your family?', 'Are you sure that you want to remove this member from your family?'),
(1071, 'family_member_added', '', 'New member was successfully added to your family list!', 'New member was successfully added to your family list!'),
(1072, 'request_sent', '', 'Your request was successfully sent!', 'Your request was successfully sent!'),
(1073, 'request_accepted', '', 'Accepted your request to be your @', 'Accepted your request to be your @'),
(1074, 'sent_u_request', '', 'Listed you as his @', 'Listed you as his @'),
(1075, 'requests', '', 'Requests', 'Requests'),
(1076, 'no_requests_found', '', 'No requests to show', 'No requests to show'),
(1077, 'relation_with', '', 'In relations with ', 'Đang hẹn hò với'),
(1078, 'married_to', '', 'Married to ', 'Married to'),
(1079, 'engaged_to', '', 'Engaged to ', 'Engaged to'),
(1080, 'relationship_status', '', 'Relationship Status ', 'Relationship Status'),
(1081, 'relationship_request', '', 'Relationship request ', 'Relationship request'),
(1082, 'relhip_request_accepted', '', 'Accepted your request @ ', 'Accepted your request @'),
(1083, 'relation_rejected', '', 'rejected your relation request @', 'rejected your relation request @'),
(1084, 'file_too_big', '', 'File size error: The file exceeds allowed the limit ({file_size}) and can not be uploaded.', 'File size error: The file exceeds allowed the limit ({file_size}) and can not be uploaded.'),
(1085, 'file_not_supported', '', 'Unable to upload a file: This file type is not supported.', 'Unable to upload a file: This file type is not supported.'),
(1086, 'years_old', '', 'years old', 'years old'),
(1087, 'find_friends_nearby', '', 'Find friends', 'Find friends'),
(1088, 'location_dist', '', 'Location distance', 'Location distance'),
(1089, 'close_to_u', '', 'close to you', 'close to you'),
(1090, 'find_friends', '', 'Find friends', 'Find friends'),
(1091, 'distance', '', 'distance', 'distance'),
(1092, 'distance_from_u', '', 'distance from you', 'distance from you'),
(1093, 'show_location', '', 'Show location', 'Show location'),
(1094, 'share_my_location', '', 'Share my location with public?', 'Share my location with public?'),
(1095, 'enter_valid_title', '', 'Please enter a valid title', 'Please enter a valid title'),
(1096, 'pay_per_click', '', 'Pay Per Click (${{PRICE}})', 'Pay Per Click (${{PRICE}})'),
(1097, 'pay_per_imprssion', '', 'Pay Per Impression (${{PRICE}})', 'Pay Per Impression (${{PRICE}})'),
(1098, 'top_up', '', 'Top up', 'Top up'),
(1099, 'balance_is_0', '', 'Your current wallet balance is: 0, please top up your wallet to continue.', 'Your current wallet balance is: 0, please top up your wallet to continue.'),
(1100, 'messages_delete_confirmation', '', 'Are you sure you want to delete this conversation?', 'Are you sure you want to delete this conversation?'),
(1101, 'currency', '', 'Currency', 'Currency'),
(1102, 'friends_stories', '', 'Friends Stories', 'Friends Stories'),
(1103, 'no_messages_here_yet', '', 'No messages yet here.', 'No messages yet here.'),
(1104, 'conver_deleted', '', 'Conversation has been deleted.', 'Conversation has been deleted.'),
(1105, 'group_name_limit', '', 'Group name must be 4/15 characters', 'Group name must be 4/15 characters'),
(1106, 'group_avatar_image', '', 'Group avatar must be an image', 'Group avatar must be an image'),
(1107, 'explore', '', 'Explore', 'Explore'),
(1108, 'format_image', '', 'File Format image', 'File Format image'),
(1109, 'format_video', '', 'File Format video', 'File Format video'),
(1110, 'video', '', 'Video', 'Video'),
(1111, 'video_player', '', 'VideoPlayer', 'VideoPlayer'),
(1112, 'no_file_chosen', '', 'No file chosen', 'No file chosen'),
(1113, 'choose_file', '', 'Choose File', 'Choose File'),
(1114, 'media', '', 'Media File', 'Media File'),
(1115, 'select_valid_img_vid', '', 'Media file is invalid. Please select a valid image or video', 'Media file is invalid. Please select a valid image or video'),
(1116, 'select_valid_img', '', 'Media file is invalid. Please select a valid image', 'Media file is invalid. Please select a valid image'),
(1117, 'select_valid_vid', '', 'Media file is invalid. Please select a valid video', 'Media file is invalid. Please select a valid video'),
(1118, 'drop_img_here', '', 'Drop Image Here', 'Drop Image Here'),
(1119, 'or', '', 'OR', 'OR'),
(1120, 'browse_to_upload', '', 'Browse To Upload', 'Browse To Upload'),
(1121, 'pr_completion', '', 'Profile Completion', 'Profile Completion'),
(1122, 'ad_pr_picture', '', 'Add your profile picture', 'Add your profile picture'),
(1123, 'add_ur_name', '', 'Add your name', 'Add your name'),
(1124, 'ad_ur_workplace', '', 'Add your workplace', 'Add your workplace'),
(1125, 'ad_ur_country', '', 'Add your country', 'Add your country'),
(1126, 'ad_ur_address', '', 'Add your address', 'Add your address'),
(1127, 'e_sent_msg', '', 'Someone Send me a message', 'Someone Send me a message'),
(1128, 'send_money', '', 'Send money', 'Send money'),
(1129, 'u_send_money', '', 'You can send money to your friends, acquaintances or anyone', 'You can send money to your friends, acquaintances or anyone'),
(1130, 'available_balance', '', 'Available balance', 'Available balance'),
(1131, 'send_to', '', 'To who you want to send?', 'To who you want to send?'),
(1132, 'search_name_or_email', '', 'Search by username or email', 'Search by username or email'),
(1133, 'money_sent_to', '', 'Your money was successfully sent to', 'Your money was successfully sent to'),
(1134, 'sent_you', '', 'Sent you', 'Sent you'),
(1135, 'amount_exceded', '', 'The amount exceded your current balance!', 'The amount exceded your current balance!'),
(1136, 'custom_thumbnail', '', 'Custom Thumbnail', 'Custom Thumbnail'),
(1137, 'cntc_limit_reached', '', 'You have reached your limit of {{CNTC_LIMIT}} friends!', 'You have reached your limit of {{CNTC_LIMIT}} friends!'),
(1150, 'people', '', 'People', 'People'),
(1151, 'nature', '', 'Nature', 'Nature'),
(1152, 'share_to', '', 'Share to', 'Share to'),
(1153, 'timeline', '', 'Timeline', 'Dòng thời gian'),
(1154, 'pinterest', '', 'Pinterest', 'Pinterest'),
(1155, 'group', '', 'Group', 'Group'),
(1156, 'pro_members', '', 'Pro Members', 'Pro Members'),
(1157, 'copyrights', '', '© {date} {site_name}', '© {date} {site_name}'),
(1158, 'popular_posts', '', 'Popular Posts', 'Popular Posts'),
(1159, 'duration', '', 'Duration', 'Duration'),
(1160, 'pro_feature_control_profile', '', 'Pro features give you complete control over your profile.', 'Pro features give you complete control over your profile.'),
(1161, 'why_choose_pro', '', 'Why Choose PRO?', 'Why Choose PRO?'),
(1162, 'whatsapp', '', 'WhatsApp', 'WhatsApp'),
(1163, 'whatsapp', '', 'WhatsApp', 'WhatsApp'),
(1164, 'post_login_requriement_dislike', '', 'Please log in to like, dislike, share and comment!', 'Please log in to like, dislike, share and comment!'),
(1165, 'post_login_requriement_none', '', 'Please log in to like, share and comment!', 'Please log in to like, share and comment!'),
(1166, 'e_disliked_my_posts', '', 'Someone disliked my posts', 'Someone disliked my posts'),
(1167, 'edit_ads', '', 'Edit campaign', 'Edit campaign'),
(1168, 'manage_ads', '', 'Manage ads', 'Manage ads'),
(1169, 'create_new_ads', '', 'New campaign', 'New campaign'),
(1170, 'create_events', '', 'Create new event', 'Create new event'),
(1171, 'edit_event', '', 'Edit event', 'Edit event'),
(1172, 'event_going', '', 'Events Going', 'Events Going'),
(1173, 'event_intersted', '', 'Events Interested', 'Events Interested'),
(1174, 'event_invited', '', 'Invited', 'Invited'),
(1175, 'events_past', '', 'Past Events', 'Past Events'),
(1176, 'events_upcoming', '', 'Upcoming Events', 'Upcoming Events'),
(1177, 'crop_your_avatar', '', 'Crop your avatar', 'Crop your avatar'),
(1178, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'This website uses cookies to ensure you get the best experience on our website.'),
(1179, 'cookie_dismiss', '', 'Got It!', 'Got It!'),
(1180, 'cookie_link', '', 'Learn More', 'Learn More'),
(1181, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'Please agree to the Terms of use &amp; Privacy Policy'),
(1182, 'good_morning', '', 'Good morning', 'Good morning'),
(1183, 'good_afternoon', '', 'Good afternoon', 'Good afternoon'),
(1184, 'good_evening', '', 'Good evening', 'Good evening'),
(1185, 'create_ads', '', 'Create advertisement', 'Create advertisement'),
(1186, 'find_friends_nearby', '', 'Find friends', 'Find friends'),
(1187, 'phonenumber_exists', '', 'phone number already exists.', 'phone number already exists.'),
(1188, 'recover_password_by_email', '', 'Recover by email', 'Recover by email'),
(1189, 'recover_password_by_sms', '', 'Recover by SMS', 'Recover by SMS'),
(1190, 'phonenumber_not_found', '', 'The phone number is not found', 'The phone number is not found'),
(1191, 'phone_invalid_characters', '', 'The phone number is invalid', 'The phone number is invalid'),
(1192, 'recoversms_sent', '', 'Recover SMS has been sent successfully', 'Recover SMS has been sent successfully'),
(1193, 'transaction_log', '', 'Transactions', 'Transactions'),
(1194, 'v2latest_activities', '', 'Latest activities', 'Latest activities'),
(1195, 'v2wallettopup', '', 'Wallet Topup', 'Wallet Topup'),
(1196, 'v2adsspentdaily', '', 'Ads spent daily', 'Ads spent daily'),
(1197, 'v2prosystemtransactions', '', 'Pro system transactions', 'Pro system transactions'),
(1198, 'no_transactions_found', '', 'Looks like you don&#39;t have any transaction yet!', 'Looks like you dont have any transaction yet!'),
(1199, 'estimated_reach', '', 'Estimated reach', 'Estimated reach'),
(1200, 'confirmation_code_is', '', 'Your confirmation code is', 'Your confirmation code is'),
(1201, 'website_use_cookies', '', 'This website uses cookies to ensure you get the best experience on our website.', 'This website uses cookies to ensure you get the best experience on our website.'),
(1202, 'got_it', '', 'Got it!', 'Got it!'),
(1203, 'learn_more1', '', 'Learn more', 'Learn more'),
(1204, 'poke_user', '', 'Poke', 'Poke'),
(1205, 'you_have_poked', '', 'You have poked', 'You have poked'),
(1206, 'no_pokes_found', '', 'No pokes to show', 'No pokes to show'),
(1207, 'people_who_poked_you', '', 'People who poked you', 'People who poked you'),
(1208, 'poke_back', '', 'Poke back', 'Poke back'),
(1209, 'txt_poked', '', 'Poked!', 'Poked!'),
(1210, 'pokes', '', 'Pokes', 'Pokes'),
(1211, 'popular_posts_comments', '', 'Popular posts &amp; comments', 'Popular posts &amp; comments'),
(1212, 'load_more_videos', '', 'Load more videos', 'Load more videos'),
(1213, 'load_more_photos', '', 'Load more photos', 'Load more photos'),
(1214, 'no_more_videos_to_show', '', 'No more videos to show', 'No more videos to show'),
(1215, 'no_more_photos_to_show', '', 'No more photos to show', 'No more photos to show'),
(1216, 'poked_you', '', 'Poked you', 'Poked you'),
(1217, 'gift_added', '', 'Gift added successfully', 'Gift added successfully'),
(1218, 'error_while_add_gift', '', 'Error while adding the gift', 'Error while adding the gift'),
(1219, 'send_a_gift', '', 'Send a gift', 'Send a gift'),
(1220, 'gift_sent_succesfully', '', 'Gift sent successfully', 'Gift sent successfully'),
(1221, 'send_gift_to_you', '', 'sent you a gift', 'sent you a gift'),
(1222, 'my_pokes', '', 'My Pokes', 'My Pokes'),
(1223, 'telegram', '', 'Telegram', 'Telegram'),
(1224, 'no_more_posts_to_show', '', 'No more posts to show', 'No more posts to show'),
(1225, 'keyboard_shortcut_help', '', 'Keyboard shortcut help', 'Keyboard shortcut help'),
(1226, 'keyboard_shortcut_j', '', 'Scroll to the next post', 'Scroll to the next post'),
(1227, 'keyboard_shortcut_k', '', 'Scroll to the previous post', 'Scroll to the previous post'),
(1228, 'sticker_added', '', 'Sticker added successfully', 'Sticker added successfully'),
(1229, 'error_while_add_sticker', '', 'Error while adding the sticker', 'Error while adding the sticker'),
(1230, 'reacted_to_your_post', '', 'reacted to your post', 'reacted to your post'),
(1231, 'points', '', 'Points', 'Points'),
(1232, 'my_points', '', 'My Points', 'My Points'),
(1233, 'my_earnings', '', 'My Earnings', 'My Earnings'),
(1234, 'earn_text_like', '', 'Earn %d points by liking any post', 'Earn %d points by liking any post'),
(1235, 'earn_text_dislike', '', 'Earn %d points by disliking any post', 'Earn %d points by disliking any post'),
(1236, 'earn_text_comment', '', 'Earn %d points by commenting any post', 'Earn %d points by commenting any post'),
(1237, 'earn_text_wonder', '', 'Earn %d points by wondering any post', 'Earn %d points by wondering any post'),
(1238, 'earn_text_create_post', '', 'Earn %d points by creating a new post', 'Earn %d points by creating a new post'),
(1239, 'earn_text_reaction', '', 'Earn %d points by reacting on any post', 'Earn %d points by reacting on any post'),
(1240, 'no_reactions', '', 'No reactions yet', 'No reactions yet'),
(1241, 'love', '', 'Love', 'Yêu thích'),
(1242, 'haha', '', 'HaHa', 'HaHa'),
(1243, 'wow', '', 'WoW', 'Ngạc nhiên'),
(1244, 'sad', '', 'Sad', 'Buồn'),
(1245, 'angry', '', 'Angry', 'Phẫn nộ'),
(1246, 'reacted_to_your_comment', '', 'reacted to your comment', 'reacted to your comment'),
(1247, 'reacted_to_your_replay', '', 'reacted to your reply', 'reacted to your reply'),
(1248, 'activity_reacted_post', '', 'reacted to {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.', 'reacted to {user} &lt;a class=&quot;main-color&quot; href=&quot;{post}&quot;&gt;post&lt;/a&gt;.'),
(1249, 'comment_reported', '', 'Comment reported successfully.', 'Comment reported successfully.'),
(1250, 'report_comment', '', 'Report comment', 'Report comment'),
(1251, 'comment_unreported', '', 'Report deleted successfully', 'Report deleted successfully'),
(1252, 'suggested_pages', '', 'Suggested pages', 'Suggested pages'),
(1253, 'suggested_groups', '', 'Suggested groups', 'Suggested groups'),
(1254, 'unverified', '', 'Unverified', 'Unverified'),
(1255, 'mutual_friends', '', 'Mutual Friends', 'Mutual Friends'),
(1256, 'no_mutual_friends', '', 'No mutual friends to show', 'No mutual friends to show'),
(1257, 'viewed_your_story', '', 'viewed your story', 'viewed your story'),
(1258, 'commented_on_blog', '', 'commented on your article', 'commented on your article'),
(1259, 'are_you_sure_unfriend', '', 'Are you sure you want to unfriend?', 'Are you sure you want to unfriend?'),
(1260, 'manage_sessions', '', 'Manage Sessions', 'Manage Sessions'),
(1261, 'platform', '', 'Platform', 'Platform'),
(1262, 'browser', '', 'Browser', 'Browser'),
(1263, 'last_active', '', 'Last active', 'Last active'),
(1264, 'notification_settings', '', 'Notification Settings', 'Notification Settings'),
(1265, 'notify_me_when', '', 'Notify me when', 'Notify me when'),
(1266, 'username_is_banned', '', 'The username is blacklisted and not allowed, please choose another username.', 'The username is blacklisted and not allowed, please choose another username.'),
(1267, 'email_is_banned', '', 'The email address is blacklisted and not allowed, please choose another email.', 'The email address is blacklisted and not allowed, please choose another email.'),
(1268, 'activities', '', 'Activities', 'Nhật ký hoạt động'),
(1269, 'activity_is_following', '', 'started following {user}', 'started following {user}'),
(1270, 'activity_is_friend', '', 'become friends with {user}', 'become friends with {user}'),
(1271, 'index_my_page_privacy', '', 'Allow search engines to index my profile and posts?', 'Allow search engines to index my profile and posts?'),
(1272, 'mark_all_as_read', '', 'Mark all conversations as read', 'Mark all conversations as read'),
(1273, 'havent_finished_post', '', 'You haven&#039;t finished your post yet. Do you want to leave without finishing?', 'You havent finished your post yet. Do you want to leave without finishing?'),
(1274, 'earned_points_goto', '', 'Your earned points will automatically go to', 'Your earned points will automatically go to'),
(1275, 'night_mode', '', 'Night mode', 'Night mode'),
(1276, 'light_mode', '', 'Light mode', 'Light mode'),
(1277, 'keyboard_shortcuts', '', 'Keyboard shortcuts', 'Keyboard shortcuts'),
(1278, 'comment', '', 'Comment', 'Bình luận'),
(1279, 'write_something_here', '', 'Write something here..', 'Write something here..'),
(1280, 'view_profile', '', 'View Profile', 'View Profile'),
(1281, 'block', '', 'Block', 'Block'),
(1282, 'create_page', '', 'Create Page', 'Create Page'),
(1283, 'create_group', '', 'Create Group', 'Create Group'),
(1284, 'create_event', '', 'Create Event', 'Create Event'),
(1285, 'create_ad', '', 'Create Ad', 'Create Ad'),
(1286, 'create_blog', '', 'Create Blog', 'Create Blog'),
(1287, 'good_morning_quote', '', 'Every new day is a chance to change your life.', 'Every new day is a chance to change your life.'),
(1288, 'good_afternoon_quote', '', 'May this afternoon be light, blessed, enlightened, productive and happy.', 'May this afternoon be light, blessed, enlightened, productive and happy.'),
(1289, 'good_evening_quote', '', 'Evenings are life’s way of saying that you are closer to your dreams.', 'Evenings are life’s way of saying that you are closer to your dreams.'),
(1290, 'day_mode', '', 'Day mode', 'Day mode'),
(1291, 'disable_comments', '', 'Disable comments', 'Disable comments'),
(1292, 'enable_comments', '', 'Enable comments', 'Enable comments'),
(1293, 'comments_disabled', '', 'Comments are disabled by %d', 'Comments are disabled by %d'),
(1294, 'confirm_your_account', '', 'Confirm your account', 'Confirm your account'),
(1295, 'sign_in_attempt', '', 'Your sign in attempt seems a little different than usual, This could be because you are signing in from a different device or a different location.', 'Your sign in attempt seems a little different than usual, This could be because you are signing in from a different device or a different location.'),
(1296, 'we_have_sent_you_code', '', 'We have sent you an email with the confirmation code.', 'We have sent you an email with the confirmation code.'),
(1297, 'two_factor', '', 'Two-factor authentication', 'Two-factor authentication'),
(1298, 'to_log_in_two_factor', '', 'To log in, you need to verify your identity.', 'To log in, you need to verify your identity.'),
(1299, 'sent_two_factor_both', '', 'We have sent you the confirmation code to your phone and to your email address.', 'We have sent you the confirmation code to your phone and to your email address.'),
(1300, 'sent_two_factor_email', '', 'We have sent you the confirmation code to your email address.', 'We have sent you the confirmation code to your email address.'),
(1301, 'sent_two_factor_phone', '', 'We have sent you the confirmation code to your phone number.', 'We have sent you the confirmation code to your phone number.'),
(1302, 'two_factor_description', '', 'Turn on 2-step login to level-up your account&#039;s security, Once turned on, you&#039;ll use both your password and a 6-digit security code sent to your phone or email to log in.', 'Turn on 2-step login to level-up your accounts security, Once turned on, youll use both your password and a 6-digit security code sent to your phone or email to log in.'),
(1303, 'my_campaigns', '', 'Campaigns', 'Campaigns'),
(1304, 'my_wallet', '', 'Wallet & Credits', 'Wallet &amp; Credits'),
(1305, 'stats', '', 'Analytics', 'Analytics'),
(1306, 'choose_audience', '', 'Choose Audience', 'Choose Audience'),
(1307, 'launch_ad', '', 'Launch Ad', 'Launch Ad'),
(1308, 'pay_per_clicks', '', 'Pay Per Click', 'Pay Per Click'),
(1309, 'pay_per_imprssions', '', 'Pay Per Impression', 'Pay Per Impression'),
(1310, 'explore_latest_articles', '', 'Explore the latest articles', 'Explore the latest articles'),
(1311, 'search_for_article', '', 'Search for articles', 'Search for articles'),
(1312, 'authors', '', 'Authors', 'Authors'),
(1313, 'news_feed', '', 'News Feed', 'News Feed'),
(1314, 'video_call', '', 'Video call', 'Video call'),
(1315, 'open_in_new_tab', '', 'Open in new tab', 'Open in new tab'),
(1316, 'change_color', '', 'Change color', 'Change color'),
(1317, 'image', '', 'Image', 'Image'),
(1318, 'voice', '', 'Voice', 'Voice'),
(1319, 'gif', '', 'GIF', 'GIF'),
(1320, 'stickers', '', 'Stickers', 'Stickers'),
(1321, 'stop', '', 'Stop', 'Stop'),
(1322, 'contact_help', '', 'Let us help you solve your issue.', 'Let us help you solve your issue.'),
(1323, 'info', '', 'Info', 'Info'),
(1324, 'users_found', '', 'users found', 'users found'),
(1325, 'users_playing', '', 'users playing', 'users playing'),
(1326, 'popular_games', '', 'Popular Games', 'Popular Games'),
(1327, 'whats_happening', '', 'What&#039;s happening', 'Whats happening'),
(1328, 'discount', '', 'Discount', 'Discount'),
(1329, 'pick_your_plan', '', 'Pick your Plan', 'Pick your Plan'),
(1330, 'trusted_payment_methods', '', 'Trusted payment methods', 'Trusted payment methods'),
(1331, 'secure_payments', '', 'Secure payments', 'Secure payments'),
(1332, 'group_settings', '', 'Group Settings', 'Group Settings'),
(1333, 'page_settings', '', 'Page Settings', 'Page Settings'),
(1334, 'user_setting', '', 'User Settings', 'User Settings'),
(1335, 'security', '', 'Security', 'Security'),
(1336, 'earnings', '', 'Earnings', 'Earnings'),
(1337, 'open_original', '', 'Open original', 'Open original'),
(1338, 'no_comments_found', '', 'No comments to show', 'No comments to show'),
(1339, 'delete_conversation', '', 'Delete Conversation', 'Delete Conversation'),
(1340, 'images', '', 'Images', 'Images'),
(1341, 'topics', '', 'Topics', 'Topics'),
(1342, 'search_type', '', 'Search type', 'Search type'),
(1343, 'search_section', '', 'Search section', 'Search section'),
(1344, 'watch_now', '', 'Watch Now', 'Watch Now'),
(1345, 'new_product', '', 'New Product', 'New Product'),
(1346, 'latest', '', 'Latest', 'Latest'),
(1347, 'price_low', '', 'Price Low', 'Price Low'),
(1348, 'price_high', '', 'Price High', 'Price High'),
(1349, 'view', '', 'View', 'View'),
(1350, 'buy', '', 'Buy', 'Buy'),
(1351, 'community', '', 'Community', 'Community'),
(1352, 'skip', '', 'Skip', 'Skip');
INSERT INTO `wo_langs` (`id`, `lang_key`, `type`, `english`, `vietnammese`) VALUES
(1353, 'choose_image', '', 'Choose Image', 'Choose Image'),
(1354, 'upload_images', '', 'Upload Images', 'Upload Images'),
(1355, 'create_poll', '', 'Create Poll', 'Create Poll'),
(1356, 'upload_video', '', 'Upload Video', 'Upload Video'),
(1357, 'create_post', '', 'Create post', 'Create post'),
(1358, 'record_voice', '', 'Record voice', 'Record voice'),
(1359, 'feelings', '', 'Feelings', 'Feelings'),
(1360, 'sell_product', '', 'Sell product', 'Sell product'),
(1361, 'upload_files', '', 'Upload Files', 'Upload Files'),
(1362, 'stories', '', 'Stories', 'Stories'),
(1363, 'create_story', '', 'Create new story', 'Create new story'),
(1364, 'no_more_views', '', 'No more views', 'No more views'),
(1365, 'whats_going', '', 'What is going on', 'What is going on'),
(1366, 'view_more_post', '', 'View {count} new post', 'View {count} new post'),
(1367, 'my_info', '', 'My Information', 'My Information'),
(1368, 'to_download', '', 'Please choose which information you would like to download', 'Please choose which information you would like to download'),
(1369, 'download_file', '', 'Download', 'Download'),
(1370, 'file_ready', '', 'Your file is ready to download!', 'Your file is ready to download!'),
(1371, 'my_information', '', 'My Information', 'My Information'),
(1372, 'generate_file', '', 'Generate file', 'Generate file'),
(1373, 'edit_group', 'Edit group', 'Edit group', 'Edit group'),
(1374, 'adult_image_file', 'We have detected some adult content on the image you uploaded, therefore we have declined your uploa', 'We have detected some adult content on the image you uploaded, therefore we have declined your upload process.', 'We have detected some adult content on the image you uploaded, therefore we have declined your upload process.'),
(1375, 'view_image', 'View Image', 'View Image', 'View Image'),
(1376, 'phone_number_error', 'Phone number should be as this format: +90..', 'Phone number should be as this format: +90..', 'Phone number should be as this format: +90..'),
(1377, 'something_wrong', 'Something went wrong, please try again later.', 'Something went wrong, please try again later.', 'Something went wrong, please try again later.'),
(1378, 'confirmation_code', 'Confirmation code', 'Confirmation code', 'Confirmation code'),
(1379, 'your_phone_verified', 'Your phone number has been successfully verified.', 'Your phone number has been successfully verified.', 'Your phone number has been successfully verified.'),
(1380, 'your_email_verified', 'Your E-mail has been successfully verified.', 'Your E-mail has been successfully verified.', 'Your E-mail has been successfully verified.'),
(1381, 'your_phone_email_verified', 'Your phone number and E-mail have been successfully verified.', 'Your phone number and E-mail have been successfully verified.', 'Your phone number and E-mail have been successfully verified.'),
(1382, 'confirmation_email_sent', 'A confirmation email has been sent.', 'A confirmation email has been sent.', 'A confirmation email has been sent.'),
(1383, 'confirmation_message_sent', 'A confirmation message was sent.', 'A confirmation message was sent.', 'A confirmation message was sent.'),
(1384, 'confirmation_message_email_sent', 'A confirmation message and email were sent.', 'A confirmation message and email were sent.', 'A confirmation message and email were sent.'),
(1385, 'confirmation_email', 'We have sent an email that contains the confirmation code to verify your new email.', 'We have sent an email that contains the confirmation code to verify your new email.', 'We have sent an email that contains the confirmation code to verify your new email.'),
(1386, 'confirmation_message', 'We have sent a message that contains the confirmation code to verify your new phone.', 'We have sent a message that contains the confirmation code to verify your new phone.', 'We have sent a message that contains the confirmation code to verify your new phone.'),
(1387, 'confirmation_email_message_text', 'We have sent a message and an email that contain the confirmation code to enable two-factor authenti', 'We have sent a message and an email that contain the confirmation code to enable two-factor authentication.', 'We have sent a message and an email that contain the confirmation code to enable two-factor authentication.'),
(1388, 'confirmation_email_text', 'We have sent an email that contains the confirmation code to enable Two-factor authentication.', 'We have sent an email that contains the confirmation code to enable Two-factor authentication.', 'We have sent an email that contains the confirmation code to enable Two-factor authentication.'),
(1389, 'confirmation_message_text', 'We have sent a message that contains the confirmation code to enable Two-factor authentication.', 'We have sent a message that contains the confirmation code to enable Two-factor authentication.', 'We have sent a message that contains the confirmation code to enable Two-factor authentication.'),
(1390, 'share_post_on_group', 'Share post on a group', 'Share post on a group', 'Share post on a group'),
(1391, 'please_group_name', 'Please write the group name', 'Please write the group name', 'Please write the group name'),
(1392, 'share_post_on_page', 'Share to a page', 'Share to a page', 'Share to a page'),
(1393, 'please_page_name', 'Please type the page name', 'Please type the page name', 'Please type the page name'),
(1394, 'share_post_on_user', 'Share to user', 'Share to user', 'Share to user'),
(1395, 'post_shared_successfully', 'Post has been successfully shared.', 'Post has been successfully shared.', 'Post has been successfully shared.'),
(1396, 'to', 'To', 'To', 'To'),
(1397, 'share_new_post', 'Share the post on', 'Share the post on', 'Share the post on'),
(1398, 'shared_a_post', 'shared a', 'shared a', 'shared a'),
(1399, 'shared_your_post', 'shared your post', 'shared your post', 'shared your post'),
(1400, 'shared_a_post_in_timeline', 'shared a post to your timeline', 'shared a post to your timeline', 'shared a post to your timeline'),
(1401, 'no_shared', 'No shares yet', 'No shares yet', 'No shares yet'),
(1402, 'member', 'Member', 'Member', 'Member'),
(1403, 'pro_con', 'Congratulations ! You&#039;re now a', 'Congratulations ! You&#039;re now a', 'Congratulations ! Youre now a'),
(1404, 'other', 'Other', 'Other', 'Other'),
(1405, 'all_', 'All', 'All', 'All'),
(1406, 'users_liked_post', 'People liked this post', 'People liked this post', 'People liked this post'),
(1407, 'users_wondered_post', 'People wondered this post', 'People wondered this post', 'People wondered this post'),
(1408, 'users_shared_post', 'People shared this post', 'People shared this post', 'People shared this post'),
(1409, 'users_reacted_post', 'People reacted to this post', 'People reacted to this post', 'People reacted to this post'),
(1410, 'users_wondered_comment', 'People wondered this comment', 'People wondered this comment', 'People wondered this comment'),
(1411, 'users_liked_comment', 'People liked this comment', 'People liked this comment', 'People liked this comment'),
(1412, 'reCaptcha_error', 'Please check the re-captcha.', 'Please check the re-captcha.', 'Please check the re-captcha.'),
(1413, 'my', 'My', 'My', 'My'),
(1414, 'bank_transfer', 'Bank transfer', 'Bank transfer', 'Bank transfer'),
(1415, 'bank_transfer_request', 'Your request has been successfully sent, we will notify you once it&#039;s approved', 'Your request has been successfully sent, we will notify you once it&#039;s approved', 'Your request has been successfully sent, we will notify you once its approved'),
(1416, 'bank_pro', 'Your bank receipt has been approved!', 'Your bank receipt has been approved!', 'Your bank receipt has been approved!'),
(1417, 'bank_decline', 'Your bank receipt has been declined!', 'Your bank receipt has been declined!', 'Your bank receipt has been declined!'),
(1418, 'my_timeline', 'My Timeline', 'My Timeline', 'My Timeline'),
(1419, '1419', 'category', 'Cars and Vehicles', 'Cars and Vehicles'),
(1420, '1420', 'category', 'Cars and Vehicles', 'Cars and Vehicles'),
(1421, '1421', 'category', 'Cars and Vehicles', 'Cars and Vehicles'),
(1422, '1422', 'category', 'Comedy', 'Comedy'),
(1423, '1423', 'category', 'Comedy', 'Comedy'),
(1424, '1424', 'category', 'Comedy', 'Comedy'),
(1425, '1425', 'category', 'Economics and Trade', 'Economics and Trade'),
(1426, '1426', 'category', 'Economics and Trade', 'Economics and Trade'),
(1427, '1427', 'category', 'Economics and Trade', 'Economics and Trade'),
(1428, '1428', 'category', 'Education', 'Education'),
(1429, '1429', 'category', 'Education', 'Education'),
(1430, '1430', 'category', 'Education', 'Education'),
(1431, '1431', 'category', 'Entertainment', 'Entertainment'),
(1432, '1432', 'category', 'Entertainment', 'Entertainment'),
(1433, '1433', 'category', 'Entertainment', 'Entertainment'),
(1434, '1434', 'category', 'Movies & Animation', 'Movies &amp; Animation'),
(1435, '1435', 'category', 'Movies & Animation', 'Movies &amp; Animation'),
(1436, '1436', 'category', 'Movies & Animation', 'Movies &amp; Animation'),
(1437, '1437', 'category', 'Gaming', 'Gaming'),
(1438, '1438', 'category', 'Gaming', 'Gaming'),
(1439, '1439', 'category', 'Gaming', 'Gaming'),
(1440, '1440', 'category', 'History and Facts', 'History and Facts'),
(1441, '1441', 'category', 'History and Facts', 'History and Facts'),
(1442, '1442', 'category', 'History and Facts', 'History and Facts'),
(1443, '1443', 'category', 'Live Style', 'Live Style'),
(1444, '1444', 'category', 'Live Style', 'Live Style'),
(1445, '1445', 'category', 'Live Style', 'Live Style'),
(1446, '1446', 'category', 'Natural', 'Natural'),
(1447, '1447', 'category', 'Natural', 'Natural'),
(1448, '1448', 'category', 'Natural', 'Natural'),
(1449, '1449', 'category', 'News and Politics', 'News and Politics'),
(1450, '1450', 'category', 'News and Politics', 'News and Politics'),
(1451, '1451', 'category', 'News and Politics', 'News and Politics'),
(1452, '1452', 'category', 'People and Nations', 'People and Nations'),
(1453, '1453', 'category', 'People and Nations', 'People and Nations'),
(1454, '1454', 'category', 'People and Nations', 'People and Nations'),
(1455, '1455', 'category', 'Pets and Animals', 'Pets and Animals'),
(1456, '1456', 'category', 'Pets and Animals', 'Pets and Animals'),
(1457, '1457', 'category', 'Pets and Animals', 'Pets and Animals'),
(1458, '1458', 'category', 'Places and Regions', 'Places and Regions'),
(1459, '1459', 'category', 'Places and Regions', 'Places and Regions'),
(1460, '1460', 'category', 'Places and Regions', 'Places and Regions'),
(1461, '1461', 'category', 'Science and Technology', 'Science and Technology'),
(1462, '1462', 'category', 'Science and Technology', 'Science and Technology'),
(1463, '1463', 'category', 'Science and Technology', 'Science and Technology'),
(1464, '1464', 'category', 'Sport', 'Sport'),
(1465, '1465', 'category', 'Sport', 'Sport'),
(1466, '1466', 'category', 'Sport', 'Sport'),
(1467, '1467', 'category', 'Travel and Events', 'Travel and Events'),
(1468, '1468', 'category', 'Travel and Events', 'Travel and Events'),
(1469, '1469', 'category', 'Travel and Events', 'Travel and Events'),
(1470, '1470', 'category', 'Apparel & Accessories', 'Apparel &amp; Accessories'),
(1471, '1471', 'category', 'Autos & Vehicles', 'Autos &amp; Vehicles'),
(1472, '1472', 'category', 'Baby & Children\'s Products', 'Baby &amp; Children&#039;s Products'),
(1473, '1473', 'category', 'Beauty Products & Services', 'Beauty Products &amp; Services'),
(1474, '1474', 'category', 'Computers & Peripherals', 'Computers &amp; Peripherals'),
(1475, '1475', 'category', 'Consumer Electronics', 'Consumer Electronics'),
(1476, '1476', 'category', 'Dating Services', 'Dating Services'),
(1477, '1477', 'category', 'Financial Services', 'Financial Services'),
(1478, '1478', 'category', 'Gifts & Occasions', 'Gifts &amp; Occasions'),
(1479, '1479', 'category', 'Home & Garden', 'Home &amp; Garden'),
(1480, 'sort_by', 'Sort by', 'Sort by', 'Sort by'),
(1481, 'top', 'Top', 'Top', 'Top'),
(1482, 'comment_on_post', 'Comment on post', 'Comment on post', 'Comment on post'),
(1483, 'email_provider_banned', 'The email provider is blacklisted and not allowed, please choose another email provider.', 'The email provider is blacklisted and not allowed, please choose another email provider.', 'The email provider is blacklisted and not allowed, please choose another email provider.'),
(1484, 'sent_product_to_you', 'Sent product to you', 'Sent product to you', 'Sent product to you'),
(1485, 'color', 'Color', 'Color', 'Color'),
(1486, '2checkout', '2Checkout', '2Checkout', '2Checkout'),
(1487, 'card_number', 'Card Number', 'Card Number', 'Card Number'),
(1488, 'address', 'Address', 'Address', 'Address'),
(1489, 'city', 'City', 'City', 'City'),
(1490, 'state', 'State', 'State', 'State'),
(1491, 'zip', 'Zip Code', 'Zip Code', 'Zip Code'),
(1492, 'pay', 'Pay Now', 'Pay Now', 'Pay Now'),
(1493, '2checkout_declined', 'Your payment was declined, please contact your bank or card issuer and make sure you have the requir', 'Your payment was declined, please contact your bank or card issuer and make sure you have the required funds.', 'Your payment was declined, please contact your bank or card issuer and make sure you have the required funds.'),
(1494, 'expire_date', 'Expire Date', 'Expire Date', 'Expire Date'),
(1495, 'no_interested_people', 'There are no interested users.', 'There are no interested users.', 'There are no interested users.'),
(1496, 'less', 'less', 'Less', 'Less'),
(1497, 'completed', 'Completed', 'Completed', 'Completed'),
(1498, 'studied_at', 'Studied at', 'Studied at', 'Từng học tại'),
(1499, 'cant_share_own', 'You can&#039;t share a post on a page or a group that is your not own.', 'You can&#039;t share a post on a page or a group that is your not own.', 'You cant share a post on a page or a group that is your not own.'),
(1500, 'accept_group_chat_request', 'Accepted your group chat invitation.', 'Accepted your group chat invitation.', 'Accepted your group chat invitation.'),
(1501, 'jobs', 'Jobs', 'Jobs', 'Jobs'),
(1502, 'post_job_text', 'Post a job for {{page_name}} to reach the right applicants on', 'Post a job for {{page_name}} to reach the right applicants on', 'Post a job for {{page_name}} to reach the right applicants on'),
(1503, 'create_job', 'Create Job', 'Create Job', 'Create Job'),
(1504, 'job_title', 'Job Title', 'Job Title', 'Job Title'),
(1505, 'salary_range', 'Salary Range', 'Salary Range', 'Salary Range'),
(1506, 'minimum', 'Minimum', 'Minimum', 'Minimum'),
(1507, 'maximum', 'Maximum', 'Maximum', 'Maximum'),
(1508, 'per_hour', 'Per Hour', 'Per Hour', 'Per Hour'),
(1509, 'per_day', 'Per Day', 'Per Day', 'Per Day'),
(1510, 'per_week', 'Per Week', 'Per Week', 'Per Week'),
(1511, 'per_month', 'Per Month', 'Per Month', 'Per Month'),
(1512, 'per_year', 'Per Year', 'Per Year', 'Per Year'),
(1513, 'job_type', 'Job Type', 'Job Type', 'Job Type'),
(1514, 'full_time', 'Full Time', 'Full Time', 'Full Time'),
(1515, 'part_time', 'Part Time', 'Part Time', 'Part Time'),
(1516, 'internship', 'Internship', 'Internship', 'Internship'),
(1517, 'volunteer', 'Volunteer', 'Volunteer', 'Volunteer'),
(1518, 'contract', 'Contract', 'Contract', 'Contract'),
(1519, 'job_des_text', 'Describe the responsibilities and preferred skills for this job', 'Describe the responsibilities and preferred skills for this job', 'Describe the responsibilities and preferred skills for this job'),
(1520, 'job_add_iamge', 'Add an image to help applicants see what it&#039;s like to work at this location.', 'Add an image to help applicants see what it&#039;s like to work at this location.', 'Add an image to help applicants see what its like to work at this location.'),
(1521, 'use_cover_photo', 'Use Cover Photo', 'Use Cover Photo', 'Use Cover Photo'),
(1522, 'questions', 'Questions', 'Questions', 'Questions'),
(1523, 'free_text_question', 'Free Text Question', 'Free Text Question', 'Free Text Question'),
(1524, 'yes_no_question', 'Yes/No Question', 'Yes/No Question', 'Yes/No Question'),
(1525, 'multiple_choice_question', 'Multiple Choice Question', 'Multiple Choice Question', 'Multiple Choice Question'),
(1526, 'add_question', 'Add Question', 'Add Question', 'Add Question'),
(1527, 'add_an_answers', 'Add answers', 'Add answers', 'Add answers'),
(1528, 'question_one', 'Question One', 'Question One', 'Question One'),
(1529, 'question_two', 'Question Two', 'Question Two', 'Question Two'),
(1530, 'question_three', 'Question Three', 'Question Three', 'Question Three'),
(1531, 'edit_job', 'Edit Job', 'Edit Job', 'Edit Job'),
(1532, 'delete_job', 'Delete Job', 'Delete Job', 'Delete Job'),
(1533, 'apply_now', 'Apply Now', 'Apply Now', 'Apply Now'),
(1534, 'experience', 'Experience', 'Experience', 'Experience'),
(1535, 'add_experience', 'Add Experience', 'Add Experience', 'Add Experience'),
(1536, 'position', 'Position', 'Position', 'Position'),
(1537, 'where_did_you_work', 'Where did you work?', 'Where did you work?', 'Where did you work?'),
(1538, 'i_currently_work', 'I currently work here', 'I currently work here', 'I currently work here'),
(1539, 'please_answer_questions', 'Please answer the questions', 'Please answer the questions', 'Please answer the questions'),
(1540, 'you_apply_this_job', 'You have already applied for this job.', 'You have already applied for this job.', 'You have already applied for this job.'),
(1541, 'search_for_jobs', 'Search for jobs', 'Search for jobs', 'Search for jobs'),
(1542, 'no_available_jobs', 'No available jobs to show.', 'No available jobs to show.', 'No available jobs to show.'),
(1543, 'load_more_jobs', 'Load more jobs', 'Load more jobs', 'Load more jobs'),
(1544, 'show_apply', 'Show Applies', 'Show Applies', 'Show Applies'),
(1545, 'common_things', 'Common Things', 'Common Things', 'Common Things'),
(1546, 'thing_in_common', 'Thing in common', 'Thing in common', 'Thing in common'),
(1547, 'things_in_common', 'Things in common', 'Things in common', 'Things in common'),
(1548, 'weather_unit', 'Weather Unit', 'Weather Unit', 'Weather Unit'),
(1549, 'job_applied', 'Already applied', 'Already applied', 'Already applied'),
(1550, 'apply_your_job', 'applied to your job request.', 'applied to your job request.', 'applied to your job request.'),
(1551, 'apply_job_successfully', 'You have successfully applied to this job.', 'You have successfully applied to this job.', 'You have successfully applied to this job.'),
(1552, 'job_successfully_created', 'Job request successfully created.', 'Job request successfully created.', 'Job request successfully created.'),
(1553, 'job_successfully_edited', 'Job request successfully updated.', 'Job request successfully updated.', 'Job request successfully updated.'),
(1554, 'invited_to_group', 'invited you to join the group chat.', 'invited you to join the group chat.', 'invited you to join the group chat.'),
(1555, 'declined_group_chat_request', 'declined your group chat invitation.', 'declined your group chat invitation.', 'declined your group chat invitation.'),
(1556, 'offer_job', 'Offer a job', 'Offer a job', 'Offer a job'),
(1557, 'posted_job_offer', 'posted a job offer', 'posted a job offer', 'posted a job offer'),
(1558, 'verified_page', 'Verified Page', 'Verified Page', 'Verified Page'),
(1559, 'unfriend', 'Unfriend', 'Unfriend', 'Unfriend'),
(1560, 'funding', 'Fundings', 'Fundings', 'Fundings'),
(1561, 'my_funding', 'My Funding Requests', 'My Funding Requests', 'My Funding Requests'),
(1562, 'create_new_funding', 'Create new funding request', 'Create new funding request', 'Create new funding request'),
(1563, 'funding_created', 'Funding request has been successfully created.', 'Funding request has been successfully created.', 'Funding request has been successfully created.'),
(1564, 'no_funding_found', 'No funding found', 'No funding to show', 'No funding to show'),
(1565, 'delete_fund', 'Delete', 'Delete', 'Delete'),
(1566, 'confirm_delete_fund', 'Are you sure that you want to delete this funding request?', 'Are you sure that you want to delete this funding request?', 'Are you sure that you want to delete this funding request?'),
(1567, 'funding_edited', 'Funding request has been successfully updated.', 'Funding request has been successfully updated.', 'Funding request has been successfully updated.'),
(1568, 'most_recent_funding', 'Most recent funding', 'Most recent funding', 'Most recent funding'),
(1569, 'raised_of', 'Raised of', 'Raised of', 'Raised of'),
(1570, 'donate', 'Donate', 'Donate', 'Donate'),
(1571, 'donated_to', 'donated to your funding request.', 'donated to your funding request.', 'donated to your funding request.'),
(1572, 'total_donations', 'Total donations', 'Total donations', 'Total donations'),
(1573, 'recent_donations', 'Recent donations', 'Recent donations', 'Recent donations'),
(1574, 'instagram', 'Instagram', 'Instagram', 'Instagram'),
(1575, 'created_donation_request', 'created a donation request', 'created a donation request', 'created a donation request'),
(1576, 'people_with_common', 'Meet people with things in common', 'Meet people with things in common', 'Meet people with things in common'),
(1577, 'donated_to_request', 'donated to a funding request', 'donated to a funding request', 'donated to a funding request'),
(1578, 'you_cant_pay', 'You can`t donate more than {{money}}', 'You can`t donate more than {{money}}', 'You can`t donate more than {{money}}'),
(1579, 'confirm_delete_job', 'Are you sure that you want to delete this job?', 'Are you sure that you want to delete this job?', 'Are you sure that you want to delete this job?'),
(1580, '1580', 'category', 'Accounting & Finance', 'Accounting &amp; Finance'),
(1581, '1581', 'category', 'Admin & Office', 'Admin &amp; Office'),
(1582, '1582', 'category', 'Art & Design', 'Art &amp; Design'),
(1583, '1583', 'category', 'Business Operations', 'Business Operations'),
(1584, '1584', 'category', 'Cleaning & Facilities', 'Cleaning &amp; Facilities'),
(1585, '1585', 'category', 'Community & Social Services', 'Community &amp; Social Services'),
(1586, '1586', 'category', 'Computer & Data', 'Computer &amp; Data'),
(1587, '1587', 'category', 'Construction & Mining', 'Construction &amp; Mining'),
(1588, '1588', 'category', 'Education', 'Education'),
(1589, '1589', 'category', 'Farming & Forestry', 'Farming &amp; Forestry'),
(1590, '1590', 'category', 'Healthcare', 'Healthcare'),
(1591, '1591', 'category', 'Installation, Maintenance & Repair', 'Installation, Maintenance &amp; Repair'),
(1592, '1592', 'category', 'Legal', 'Legal'),
(1593, '1593', 'category', 'Management', 'Management'),
(1594, '1594', 'category', 'Manufacturing', 'Manufacturing'),
(1595, '1595', 'category', 'Media & Communication', 'Media &amp; Communication'),
(1596, '1596', 'category', 'Personal Care', 'Personal Care'),
(1597, '1597', 'category', 'Protective Services', 'Protective Services'),
(1598, '1598', 'category', 'Restaurant & Hospitality', 'Restaurant &amp; Hospitality'),
(1599, '1599', 'category', 'Retail & Sales', 'Retail &amp; Sales'),
(1600, '1600', 'category', 'Science & Engineering', 'Science &amp; Engineering'),
(1601, '1601', 'category', 'Sports & Entertainment', 'Sports &amp; Entertainment'),
(1602, '1602', 'category', 'Transportation', 'Transportation'),
(1603, 'lost_in_space', '', 'Looks like you&#039;re lost in space!', 'Looks like youre lost in space!'),
(1604, 'add_funds', '', 'Add Funds', 'Add Funds'),
(1605, 'send_money_friends', '', 'Send money to friends', 'Send money to friends'),
(1606, 'view_analytics', '', 'View Analytics', 'View Analytics'),
(1607, 'next', '', 'Next', 'Next'),
(1608, 'ad_media', '', 'Media', 'Media'),
(1609, 'targeting', '', 'Targeting', 'Targeting'),
(1610, 'comp_name', '', 'Company name', 'Company name'),
(1611, 'camp_title', '', 'Campaign title', 'Campaign title'),
(1612, 'website_url', '', 'Website URL', 'Website URL'),
(1613, 'camp_desc', '', 'Campaign description', 'Campaign description'),
(1614, 'ad_img_help', '', 'Select a image for your campaign', 'Select a image for your campaign'),
(1615, 'ad_start_date_help', '', 'Select campaign starting date, UTC', 'Select campaign starting date, UTC'),
(1616, 'ad_end_date_help', '', 'Select campaign ending date, UTC', 'Select campaign ending date, UTC'),
(1617, 'ad_desc_help', '', 'Tell users what your campaign is about', 'Tell users what your campaign is about'),
(1618, 'camp_budget', '', 'Campaign Budget', 'Campaign Budget'),
(1619, 'camp_budget_help', '', 'Enter the amount you want to spend on this campaign', 'Enter the amount you want to spend on this campaign'),
(1620, 'ad_preview', '', 'Ad preview', 'Ad preview'),
(1621, 'album_name_help', '', 'Choose your album name', 'Choose your album name'),
(1622, 'browse_articles', '', 'Browse articles', 'Browse articles'),
(1623, 'no_blogs_created', '', 'You haven&#039;t created any articles yet.', 'You havent created any articles yet.'),
(1624, 'create_group_chat', '', 'Create a group chat', 'Create a group chat'),
(1625, 'turn_on', '', 'Turn On', 'Turn On'),
(1626, 'type_message', '', 'Type a message', 'Type a message'),
(1627, 'edit_funding', '', 'Edit funding request', 'Edit funding request'),
(1628, 'fund_amount', '', 'How much money you would like to receive?', 'How much money you would like to receive?'),
(1629, 'browse_events', '', 'Browse Events', 'Browse Events'),
(1630, 'start_time', '', 'Start time', 'Start time'),
(1631, 'end_time', '', 'End time', 'End time'),
(1632, 'no_one_created_event', '', 'It seems like no one created an event yet!', 'It seems like no one created an event yet!'),
(1633, 'event_start', '', 'When this event will start?', 'When this event will start?'),
(1634, 'event_end', '', 'When this event will end?', 'When this event will end?'),
(1635, 'browse_forum', '', 'Browse Forum', 'Browse Forum'),
(1636, 'browse_funding', '', 'Browse Funding', 'Browse Funding'),
(1637, 'filter', '', 'Filter', 'Filter'),
(1638, 'personal_pic', '', 'Your personal picture', 'Your personal picture'),
(1639, 'dont_have_account', '', 'Don&#039;t have an account?', 'Dont have an account?'),
(1640, 'already_have_account', '', 'Already have an account?', 'Already have an account?'),
(1641, 'approve_post_text', '', 'Your post was submitted, we will review your content soon.', 'Your post was submitted, we will review your content soon.'),
(1642, 'remove_all_sessions', '', 'Logout From All Sessions', 'Logout From All Sessions'),
(1643, 'approve_post', '', 'Your post was approved and published!', 'Your post was approved and published!'),
(1644, 'approve_post', '', 'Your post was approved and published!', 'Your post was approved and published!'),
(1645, 'no_going_people', '', 'There are no going users.', 'There are no going users.'),
(1646, 'liked_pages', '', 'Liked Pages', 'Liked Pages'),
(1647, 'joined_groups', '', 'Joined Groups', 'Joined Groups'),
(1648, 'earn_text_create_blog', '', 'Earn %d points by creating a new blog', 'Earn %d points by creating a new blog'),
(1649, 'view_interested_Candidates', '', 'View Interested Candidates', 'View Interested Candidates'),
(1650, 'memories', '', 'Memories', 'Memories'),
(1651, 'on_this_day', '', 'On this day', 'On this day'),
(1652, 'there_are_no_memories_this_day', '', 'You don&#039;t have any memories on this day.', 'You dont have any memories on this day.'),
(1653, 'friendversaries', '', 'Friendaversary', 'Friendaversary'),
(1654, 'memory_this_day', '', 'You have remembrance on this day', 'You have remembrance on this day'),
(1655, 'page_analytics', '', 'Page Analytics', 'Page Analytics'),
(1656, 'total_likes', '', 'Total Likes', 'Total Likes'),
(1657, 'today', '', 'Today', 'Today'),
(1658, 'this_month', '', 'This Month', 'This Month'),
(1659, 'this_year', '', 'This Year', 'This Year'),
(1660, 'group_analytics', '', 'Group Analytics', 'Group Analytics'),
(1661, 'total_member', '', 'Total Members', 'Total Members'),
(1662, 'thread_reply', '', 'replied to your thread', 'replied to your thread'),
(1663, 'share_on_timeline', '', 'Share on my timeline', 'Share on my timeline'),
(1664, 'shared_forum', '', 'shared a forum', 'shared a forum'),
(1665, 'forum_shared', '', 'Forum posts were successfully added to your timeline!', 'Forum posts were successfully added to your timeline!'),
(1666, 'thread_shared', '', 'Thread was successfully added to your timeline!', 'Thread was successfully added to your timeline!'),
(1667, 'shared_thread', '', 'shared a thread', 'shared a thread'),
(1668, 'sub_category', '', 'Sub Category', 'Sub Category'),
(1669, 'remaining_text', '', 'Remaining {{time}} for your membership', 'Remaining {{time}} for your membership'),
(1670, 'free_plan_upload', '', 'To upload images, videos, and audio files, you have to upgrade to pro member.', 'To upload images, videos, and audio files, you have to upgrade to pro member.'),
(1671, 'free_plan_upload_pro', '', 'To upload images, videos, and audio files, you have to upgrade to pro member.', 'To upload images, videos, and audio files, you have to upgrade to pro member.'),
(1672, 'approve_blog', '', 'Your blog was approved and published!', 'Your blog was approved and published!'),
(1673, 'refund', '', 'Refund', 'Refund'),
(1674, 'refund_page', '', 'Refund page', 'Refund page'),
(1675, 'reason', '', 'Reason', 'Reason'),
(1676, 'business_days', '', 'We will review your request within 2 - 3 business days.', 'We will review your request within 2 - 3 business days.'),
(1677, 'you_not_membership', '', 'Oops, You are not a subscriber, you can&#039;t request refund.', 'Oops, You are not a subscriber, you cant request refund.'),
(1678, 'select_your_membership', '', 'Please select your correct membership', 'Please select your correct membership'),
(1679, 'request_review_text', '', 'Your request is under review, we will notify you once its approved', 'Your request is under review, we will notify you once its approved'),
(1680, 'refund_decline', '', 'Your refund request has been declined!', 'Your refund request has been declined!'),
(1681, 'refund_approve', '', 'Your refund request has been approved! please check your balance.', 'Your refund request has been approved! please check your balance.'),
(1682, 'paystack', '', 'Paystack', 'Paystack'),
(1683, 'cashfree', '', 'Cashfree', 'Cashfree'),
(1684, 'offer', '', 'Offer', 'Offer'),
(1685, 'create_offer', '', 'Create New Offer', 'Create New Offer'),
(1686, 'post_offer_text', '', 'Post a offer for {{page_name}} on', 'Post a offer for {{page_name}} on'),
(1687, 'create_offer', '', 'Create New Offer', 'Create New Offer'),
(1688, 'offer_type', '', 'Offer Type', 'Offer Type'),
(1689, 'discount_percent', '', 'Discount Percent', 'Discount Percent'),
(1690, 'discount_amount', '', 'Discount Amount', 'Discount Amount'),
(1691, 'buy_get_discount', '', 'Buy X Get Y Discount', 'Buy X Get Y Discount'),
(1692, 'spend_get_off', '', 'Spend X Get Y Off', 'Spend X Get Y Off'),
(1693, 'free_shipping', '', 'Free Shipping', 'Free Shipping'),
(1694, 'get', '', 'Get', 'Get'),
(1695, 'spend', '', 'Spend', 'Spend'),
(1696, 'amount_off', '', 'Amount Off', 'Amount Off'),
(1697, 'offer_successfully_created', '', 'Offer successfully created.', 'Offer successfully created.'),
(1698, 'created_offer', '', 'Created new offer', 'Created new offer'),
(1699, 'discounted_items', '', 'Discounted Items and/or Services', 'Discounted Items and/or Services'),
(1700, 'items_services', '', 'Add items or services to this offer Max 100 character', 'Add items or services to this offer Max 100 character'),
(1701, 'discounted_items_less', '', 'Discounted items must be less than 100 character', 'Discounted items must be less than 100 character'),
(1702, 'offers', '', 'Offers', 'Offers'),
(1703, 'load_more_offers', '', 'Load more offers', 'Load more offers'),
(1704, 'no_available_offers', '', 'No available offers to show.', 'No available offers to show.'),
(1705, 'delete_offer', '', 'Delete Offer', 'Delete Offer'),
(1706, 'confirm_delete_offer', '', 'Are you sure that you want to delete this offer?', 'Are you sure that you want to delete this offer?'),
(1707, 'edit_offer', '', 'Edit Offer', 'Edit Offer'),
(1708, 'offer_successfully_edited', '', 'Offer successfully updated.', 'Offer successfully updated.'),
(1709, 'nearby_shops', '', 'Nearby Shops', 'Nearby Shops'),
(1710, 'shops_found', '', 'Shops found', 'Shops found'),
(1711, 'no_shops_found', '', 'No shops found', 'No shops found'),
(1712, 'nearby_business', '', 'Nearby Business', 'Nearby Business'),
(1713, 'business_found', '', 'Business found', 'Business found'),
(1714, 'no_business_found', '', 'No business found', 'No business found'),
(1715, 'login_attempts', '', 'Too many login attempts please try again later', 'Too many login attempts please try again later'),
(1716, 'complexity_requirements', '', 'The password supplied does not meet the minimum complexity requirements', 'The password supplied does not meet the minimum complexity requirements'),
(1717, 'least_characters', '', 'Must be at least 6 characters long.', 'Must be at least 6 characters long.'),
(1718, 'contain_lowercase', '', 'Must contain a lowercase letter.', 'Must contain a lowercase letter.'),
(1719, 'contain_uppercase', '', 'Must contain an uppercase letter.', 'Must contain an uppercase letter.'),
(1720, 'number_special', '', 'Must contain a number or special character.', 'Must contain a number or special character.'),
(1721, 'users_can_post', '', 'Users can post on my page', 'Users can post on my page'),
(1722, 'privileges', '', 'Privileges', 'Privileges'),
(1723, 'access_to_general_settings', '', 'Access to general settings', 'Access to general settings'),
(1724, 'access_to_info_settings', '', 'Access to page information settings', 'Access to page information settings'),
(1725, 'access_to_social_settings', '', 'Access to social links settings', 'Access to social links settings'),
(1726, 'access_to_avatar_settings', '', 'Access to avatar &amp; cover settings', 'Access to avatar &amp; cover settings'),
(1727, 'access_to_design_settings', '', 'Access to design settings', 'Access to design settings'),
(1728, 'access_to_admins_settings', '', 'Access to admins settings', 'Access to admins settings'),
(1729, 'access_to_analytics_settings', '', 'Access to analytics settings', 'Access to analytics settings'),
(1730, 'access_to_delete_page_settings', '', 'Access to delete page settings', 'Access to delete page settings'),
(1731, 'access_to_privacy_settings', '', 'Access to privacy settings', 'Access to privacy settings'),
(1732, 'access_to_members_settings', '', 'Access to members settings', 'Access to members settings'),
(1733, 'access_to_delete_group_settings', '', 'Access to delete group settings', 'Access to delete group settings'),
(1734, 'invitation_links', '', 'Invitation Links', 'Invitation Links'),
(1735, 'available_links', '', 'Available Links', 'Available Links'),
(1736, 'generated_links', '', 'Generated Links', 'Generated Links'),
(1737, 'used_links', '', 'Used Links', 'Used Links'),
(1738, 'generate_link', '', 'Generate links', 'Generate links'),
(1739, 'code_successfully', '', 'Code successfully generated', 'Code successfully generated'),
(1740, 'copied', '', 'Copied', 'Copied'),
(1741, 'copy', '', 'Copy', 'Copy'),
(1742, 'invited_user', '', 'Invited User', 'Invited User'),
(1743, 'unlimited', '', 'Unlimited', 'Unlimited'),
(1744, 'anonymous', '', 'Anonymous', 'Anonymous'),
(1745, 'iban', '', 'IBAN', 'IBAN'),
(1746, 'full_name', '', 'Full name', 'Full name'),
(1747, 'swift_code', '', 'Swift code', 'Swift code'),
(1748, 'withdraw_approve', '', 'Your withdraw request has been approved!', 'Your withdraw request has been approved!'),
(1749, 'withdraw_declined', '', 'Your withdraw request has been declined!', 'Your withdraw request has been declined!'),
(1750, 'register_and_pay', '', 'Register and pay using', 'Register and pay using'),
(1751, 'live', '', 'Live', 'Live'),
(1752, 'go_live', '', 'Go Live', 'Go Live'),
(1753, 'started_live_video', '', 'started a live video.', 'started a live video.'),
(1754, 'razorpay', '', 'Razorpay', 'Razorpay'),
(1755, 'paysera', '', 'Paysera', 'Paysera'),
(1756, 'unfollow', '', 'unfollow', 'unfollow'),
(1757, 'withdraw_method', '', 'Withdraw Method', 'Withdraw Method'),
(1758, 'bank', '', 'Bank', 'Bank'),
(1759, 'end_live', '', 'End live', 'End live'),
(1760, 'get_notification_posts', '', 'Get a notification when {USER} create a new post.', 'Get a notification when {USER} create a new post.'),
(1761, 'stop_notification_posts', '', 'Stop getting a notifications from {USER}', 'Stop getting a notifications from {USER}'),
(1762, 'created_new_post', '', 'created a new post.', 'created a new post.'),
(1763, 'time_friends', '', 'It&#039;s been {TIME} since you both are friends! Send them a message to celebrate.', 'Its been {TIME} since you both are friends! Send them a message to celebrate.'),
(1764, 'request_refund', '', 'Request refund', 'Request refund'),
(1765, 'is_live', '', 'is live now.', 'is live now.'),
(1766, 'was_live', '', 'was live.', 'was live.'),
(1767, 'january', '', 'January', 'January'),
(1768, 'february', '', 'February', 'February'),
(1769, 'march', '', 'March', 'March'),
(1770, 'april', '', 'April', 'April'),
(1771, 'may', '', 'May', 'May'),
(1772, 'june', '', 'June', 'June'),
(1773, 'july', '', 'July', 'July'),
(1774, 'august', '', 'August', 'August'),
(1775, 'september', '', 'September', 'September'),
(1776, 'october', '', 'October', 'October'),
(1777, 'november', '', 'November', 'November'),
(1778, 'december', '', 'December', 'December'),
(1779, 'notifications_single', '', 'Notifications', 'Notifications'),
(1780, 'get_started', '', 'Get Started', 'Get Started'),
(1781, 'enable_weather_loc', '', 'Please enable location on your browser to view current weather.', 'Please enable location on your browser to view current weather.'),
(1782, 'enable_friend_loc', '', 'Access to your location is Disabled. Enable it on your browser if you want to see people around you.', 'Access to your location is Disabled. Enable it on your browser if you want to see people around you.'),
(1783, 'sunday', '', 'Sunday', 'Sunday'),
(1784, 'monday', '', 'Monday', 'Monday'),
(1785, 'tuesday', '', 'Tuesday', 'Tuesday'),
(1786, 'wednesday', '', 'Wednesday', 'Wednesday'),
(1787, 'thursday', '', 'Thursday', 'Thursday'),
(1788, 'friday', '', 'Friday', 'Friday'),
(1789, 'saturday', '', 'Saturday', 'Saturday'),
(1790, 'stream_has_ended', '', '{{user}} stream has ended.', '{{user}} stream has ended.'),
(1791, 'mic_source', '', 'Change Mic Source', 'Change Mic Source'),
(1792, 'cam_source', '', 'Change Video Source', 'Change Video Source'),
(1793, 'event_remaining', '', 'remaining', 'remaining'),
(1794, 'home_weather', '', 'Weather', 'Weather'),
(1795, 'weather_wind', '', 'Wind', 'Wind'),
(1796, 'weather_humidity', '', 'Humidity', 'Humidity'),
(1797, 'weather_visibility', '', 'Visibility', 'Visibility'),
(1798, 'weather_sunrise', '', 'Sunrise', 'Sunrise'),
(1799, 'weather_sunset', '', 'Sunset', 'Sunset'),
(1800, 'find_nearby_business', '', 'Find businesses near to you based on your location and connect with them directly.', 'Find businesses near to you based on your location and connect with them directly.'),
(1801, 'export', '', 'Export', 'Export'),
(1802, 'add_google_calendar', '', 'Add to Google Calendar', 'Add to Google Calendar'),
(1803, 'home_refresh', '', 'Refresh', 'Refresh'),
(1804, 'chat_emoji', '', 'Emoji', 'Emoji'),
(1805, 'find_nearby_shops', '', 'Find shops near to you based on your location and connect with them directly.', 'Find shops near to you based on your location and connect with them directly.'),
(1806, 'main_products', '', 'Products', 'Products'),
(1807, 'get_credits', '', 'Get Credits.', 'Get Credits.'),
(1808, 'no_recent_donation', '', 'No recent donations found', 'No recent donations found'),
(1809, 'welcome_privacy_text', '', 'You have full control over your personal information that you share.', 'You have full control over your personal information that you share.'),
(1810, 'welcome_security_text', '', 'Your account is fully secure. We never share your data with third party.', 'Your account is fully secure. We never share your data with third party.'),
(1811, '_time_m', '', 'm', 'phút'),
(1812, '_time_h', '', 'h', 'giờ'),
(1813, 'now', '', 'now', 'vừa xong'),
(1814, '_time_hrs', '', 'hrs', 'giờ trước'),
(1815, '_time_d', '', 'd', 'ngày'),
(1816, '_time_w', '', 'w', 'tuần'),
(1817, '_time_y', '', 'y', 'năm'),
(1818, '_time_yrs', '', 'yrs', 'năm trước'),
(1819, 'terms_contact', '', 'agree with {privacy} to receive communications.', 'agree with {privacy} to receive communications.'),
(1820, 'first_name_last_name_empty', '', 'Your First Name and Last Name can not be empty.', 'Your First Name and Last Name can not be empty.'),
(1821, 'reply_message', '', 'Reply To Message', 'Reply To Message'),
(1822, 'reacted_to_your_story', '', 'reacted to your story.', 'reacted to your story.'),
(1823, 'reply_story', '', 'Reply To Story', 'Reply To Story'),
(1824, 'reacted_to_your_message', '', 'reacted to your message.', 'reacted to your message.'),
(1825, 'replying_story', '', 'Replying to story', 'Replying to story'),
(1826, 'ffmpeg_file_text', '', 'Your video is being processed, We’ll let you know when it&#039;s ready to view.', 'Your video is being processed, We’ll let you know when its ready to view.'),
(1827, 'video_ready_to_view', '', 'Your video is ready to view. You can now watch it.', 'Your video is ready to view. You can now watch it.'),
(1828, 'processing_video', '', 'The video is still being converted to other resolutions, please wait a bit more for HD content.', 'The video is still being converted to other resolutions, please wait a bit more for HD content.'),
(1829, 'view_story', '', 'View Story', 'View Story'),
(1830, 'replying_to', '', 'Replying to', 'Replying to'),
(1831, 'see_trending_people', '', 'See what people are talking about.', 'See what people are talking about.'),
(1832, 'feels_like_temp', '', 'Feels like', 'Feels like'),
(1833, 'pressure_temp', '', 'Pressure', 'Pressure'),
(1834, 'uvi_temp', '', 'UV', 'UV'),
(1835, 'qr_dash', '', 'QR', 'QR'),
(1836, 'hourly_forecast', '', 'Hourly forecast', 'Hourly forecast'),
(1837, 'daily_forecast', '', 'Daily forecast', 'Daily forecast'),
(1838, 'posts_created', '', 'Total Posts created', 'Total Posts created'),
(1839, 'posts_created_month', '', 'Total Posts Created this Month', 'Total Posts Created this Month'),
(1840, 'reaction_dash', '', 'Reaction', 'Reaction'),
(1841, 'reacted_dash', '', 'Reacted', 'Reacted'),
(1842, 'reacted_by', '', 'Reactions By', 'Reactions By'),
(1843, 'i_reacted', '', 'This shows how many times you reacted to other users posts', 'This shows how many times you reacted to other users posts'),
(1844, 'user_reacted', '', 'This shows how many times users reacted to your posts', 'This shows how many times users reacted to your posts'),
(1845, 'i_liked', '', 'This shows how many times you liked other users posts', 'This shows how many times you liked other users posts'),
(1846, 'user_liked', '', 'This shows how many times users liked your posts', 'This shows how many times users liked your posts'),
(1847, 'i_commented', '', 'How many times have you commented on other users posts', 'How many times have you commented on other users posts'),
(1848, 'user_commented', '', 'How many times have users commented on your posts', 'How many times have users commented on your posts'),
(1849, 'i_shared', '', 'Total number of posts that you shared', 'Total number of posts that you shared'),
(1850, 'user_shared', '', 'Total number of users who shared your posts', 'Total number of users who shared your posts');

-- --------------------------------------------------------

--
-- Table structure for table `wo_likes`
--

DROP TABLE IF EXISTS `wo_likes`;
CREATE TABLE IF NOT EXISTS `wo_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_live_sub_users`
--

DROP TABLE IF EXISTS `wo_live_sub_users`;
CREATE TABLE IF NOT EXISTS `wo_live_sub_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `is_watching` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `is_watching` (`is_watching`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_manage_pro`
--

DROP TABLE IF EXISTS `wo_manage_pro`;
CREATE TABLE IF NOT EXISTS `wo_manage_pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `price` varchar(11) NOT NULL DEFAULT '0',
  `featured_member` int(11) NOT NULL DEFAULT 0,
  `profile_visitors` int(11) NOT NULL DEFAULT 0,
  `last_seen` int(11) NOT NULL DEFAULT 0,
  `verified_badge` int(11) NOT NULL DEFAULT 0,
  `posts_promotion` int(11) NOT NULL DEFAULT 0,
  `pages_promotion` int(11) NOT NULL DEFAULT 0,
  `discount` text NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT '',
  `night_image` varchar(300) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_manage_pro`
--

INSERT INTO `wo_manage_pro` (`id`, `type`, `price`, `featured_member`, `profile_visitors`, `last_seen`, `verified_badge`, `posts_promotion`, `pages_promotion`, `discount`, `image`, `night_image`, `status`, `time`) VALUES
(1, 'star', '3', 1, 1, 1, 1, 0, 0, '0', '', '', 1, 7),
(2, 'hot', '8', 1, 1, 1, 1, 5, 5, '10', '', '', 1, 30),
(3, 'ultima', '89', 1, 1, 1, 1, 20, 20, '20', '', '', 1, 365),
(4, 'vip', '259', 1, 1, 1, 1, 40, 40, '60', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wo_messages`
--

DROP TABLE IF EXISTS `wo_messages`;
CREATE TABLE IF NOT EXISTS `wo_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(255) NOT NULL DEFAULT '',
  `mediaFileName` varchar(200) NOT NULL DEFAULT '',
  `mediaFileNames` varchar(200) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0,
  `deleted_one` enum('0','1') NOT NULL DEFAULT '0',
  `deleted_two` enum('0','1') NOT NULL DEFAULT '0',
  `sent_push` int(11) NOT NULL DEFAULT 0,
  `notification_id` varchar(50) NOT NULL DEFAULT '',
  `type_two` varchar(32) NOT NULL DEFAULT '',
  `stickers` text DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `lat` varchar(200) NOT NULL DEFAULT '0',
  `lng` varchar(200) NOT NULL DEFAULT '0',
  `reply_id` int(11) NOT NULL DEFAULT 0,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `broadcast_id` int(11) NOT NULL DEFAULT 0,
  `forward` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `seen` (`seen`),
  KEY `time` (`time`),
  KEY `deleted_two` (`deleted_two`),
  KEY `deleted_one` (`deleted_one`),
  KEY `sent_push` (`sent_push`),
  KEY `group_id` (`group_id`),
  KEY `order1` (`from_id`,`id`),
  KEY `order2` (`group_id`,`id`),
  KEY `order3` (`to_id`,`id`),
  KEY `order7` (`seen`,`id`),
  KEY `order8` (`time`,`id`),
  KEY `order4` (`from_id`,`id`),
  KEY `order5` (`group_id`,`id`),
  KEY `order6` (`to_id`,`id`),
  KEY `reply_id` (`reply_id`),
  KEY `broadcast_id` (`broadcast_id`),
  KEY `story_id` (`story_id`),
  KEY `product_id` (`product_id`),
  KEY `notification_id` (`notification_id`),
  KEY `page_id` (`page_id`),
  KEY `page_id_2` (`page_id`),
  KEY `notification_id_2` (`notification_id`),
  KEY `product_id_2` (`product_id`),
  KEY `story_id_2` (`story_id`),
  KEY `reply_id_2` (`reply_id`),
  KEY `broadcast_id_2` (`broadcast_id`),
  KEY `forward` (`forward`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_messages`
--

INSERT INTO `wo_messages` (`id`, `from_id`, `group_id`, `page_id`, `to_id`, `text`, `media`, `mediaFileName`, `mediaFileNames`, `time`, `seen`, `deleted_one`, `deleted_two`, `sent_push`, `notification_id`, `type_two`, `stickers`, `product_id`, `lat`, `lng`, `reply_id`, `story_id`, `broadcast_id`, `forward`) VALUES
(1, 1, 0, 0, 2, '(&lt;', '', '', '', 1631825161, 1632228681, '1', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(2, 1, 0, 0, 2, 'o(', '', '', '', 1631825165, 1632228681, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(3, 10, 0, 0, 1, 'haha', '', '', '', 1631983652, 1632151696, '0', '0', 0, '', '', '', 0, '0', '0', 0, 2, 0, 0),
(4, 10, 0, 0, 1, '', '', '', '', 1631983799, 1632151696, '0', '0', 0, '', '', 'http://localhost/beesocial/upload/photos/2021/09/ng6cUpsqxqN8WGrTmOah_18_3d4181f31b15d187ad00addfcd92494e_image.gif', 0, '0', '0', 0, 0, 0, 0),
(5, 10, 0, 0, 1, '', '', '', '', 1631983806, 1632151696, '0', '0', 0, '', '', 'http://localhost/beesocial/upload/photos/2021/09/Sd1WqmgcLquf6gf4r4rq_18_132bb6799a469b15336385ff726eb17f_image.gif', 0, '0', '0', 0, 0, 0, 0),
(6, 10, 0, 0, 1, '/_)', '', '', '', 1631983818, 1632151696, '0', '0', 0, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(7, 1, 0, 0, 10, '', '', '', '', 1632151693, 0, '0', '0', 1, '', '', 'http://localhost/beesocial/upload/photos/2021/09/ypmupuiiwRoeSgyK2XWk_18_4cc63f0eded74edfebb1d37a80810a2f_image.gif', 0, '0', '0', 0, 0, 0, 0),
(8, 2, 0, 0, 1, 'Ê m', '', '', '', 1632219797, 1634993917, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(9, 1, 0, 0, 2, 'Cái gì', '', '', '', 1632219829, 1632228681, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(10, 1, 0, 0, 2, '', '', '', '', 1632219839, 1632228681, '0', '0', 1, '', '', 'http://localhost/beesocial/upload/photos/2021/09/I9VjcBOE561f1QATZ4ZA_18_5657b83d890a93ddac8072bf15bf69ca_image.gif', 0, '0', '0', 0, 0, 0, 0),
(11, 2, 0, 0, 1, 'alo', '', '', '', 1632220532, 1634993917, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(12, 1, 0, 0, 2, 'weqweq', '', '', '', 1632222563, 1632228681, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(13, 1, 0, 0, 2, 'asdasdasdada', '', '', '', 1632222674, 1632228681, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(14, 2, 0, 0, 1, 'sadasdas', '', '', '', 1632223182, 1634993917, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(15, 1, 0, 0, 2, 'asdsadas', '', '', '', 1632223199, 1632228681, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(16, 2, 0, 0, 1, 'TEST SCCKET THÀNH CÔNG', '', '', '', 1632223314, 1634993917, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(17, 2, 0, 0, 1, 'qweqweqeqw', '', '', '', 1632228684, 1634993917, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(18, 1, 0, 0, 2, 'adsadas', '', '', '', 1632229062, 1632229068, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(19, 1, 0, 0, 2, 'a', '', '', '', 1632231179, 1632231400, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(20, 1, 0, 0, 2, 'a', '', '', '', 1632231180, 1632231400, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(21, 1, 0, 0, 2, 'aa', '', '', '', 1632231180, 1632231400, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(22, 1, 0, 0, 2, 'aa', '', '', '', 1632231181, 1632231400, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(23, 1, 0, 0, 2, 'a', '', '', '', 1632231181, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(24, 1, 0, 0, 2, 'a', '', '', '', 1632231181, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(25, 1, 0, 0, 2, 'aa', '', '', '', 1632231182, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(26, 1, 0, 0, 2, 'a', '', '', '', 1632231182, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(27, 1, 0, 0, 2, 'a', '', '', '', 1632231182, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(28, 1, 0, 0, 2, 'a', '', '', '', 1632231183, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(29, 1, 0, 0, 2, 'a', '', '', '', 1632231183, 1632231401, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(30, 1, 0, 0, 2, '', 'upload/sounds/2021/09/1vRGa9eFyLHxYZJPQMSZ_21_40c2a2a7f8c3ea2e587b00f7f261941d_soundFile.wav', 'AU-2021-09-21T14-21-45-382Z.wav', '', 1632234105, 1633594412, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(31, 1, 0, 0, 2, '', '', '', '', 1632234788, 1633594412, '0', '0', 1, '', '', 'http://localhost/beesocial/upload/photos/2021/09/eCgr9W112bSyLuOq5frv_18_01a5f249a71625fb14ca719ce7f45e6c_image.gif', 0, '0', '0', 0, 0, 0, 0),
(32, 1, 0, 0, 2, '', '', '', '', 1632238176, 1633594412, '0', '0', 1, '', '', 'http://localhost/beesocial/upload/photos/2021/09/em4CchFFznMrU68WV2TQ_18_7541c5798115616aa70f1e299b00ee84_image.gif', 0, '0', '0', 0, 0, 0, 0),
(33, 1, 0, 0, 2, '', 'upload/sounds/2021/09/HQngktCRX28JVpCmu5wO_21_6520c6812b6a9ddd1442acc9bd7335d7_soundFile.wav', 'AU-2021-09-21T15-36-37-775Z.wav', '', 1632238598, 1633594412, '1', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(34, 1, 0, 0, 2, ':clock1:', '', '', '', 1632241183, 1633594412, '1', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(35, 1, 0, 0, 2, '', '', '', '', 1632772015, 1633594412, '0', '0', 1, '', '', 'http://localhost/beesocial/upload/photos/2021/09/WFUbIKpOZ1KHyudzaELR_18_88f56a30d07dd3cdceb1491a4e2229b7_image.gif', 0, '0', '0', 0, 0, 0, 0),
(36, 1, 0, 0, 2, ':elephant:', '', '', '', 1632772253, 1633594412, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(37, 1, 0, 0, 2, '', '', '', '', 1634993896, 1636621358, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(38, 1, 0, 0, 2, '', 'upload/photos/2021/10/opFLtVIAED2hCbvYGqPj_23_24523a590025b6dd23685d9ec1e5ca32_image.jpg', '245157448_402634351329643_1381495589385725328_n.jpg', '', 1634993907, 1636621358, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(39, 2, 0, 0, 1, 'Waooooo', '', '', '', 1636621640, 0, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0),
(40, 2, 0, 0, 1, '', 'upload/photos/2021/11/36Nz1Sb7ZlSeXzcyz6NQ_sticker_491871.jpg', '', '', 1636621647, 0, '0', '0', 1, '', '', '', 0, '0', '0', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wo_moviecommentreplies`
--

DROP TABLE IF EXISTS `wo_moviecommentreplies`;
CREATE TABLE IF NOT EXISTS `wo_moviecommentreplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_id` int(11) NOT NULL DEFAULT 0,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `posted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `comm_id` (`comm_id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_moviecomments`
--

DROP TABLE IF EXISTS `wo_moviecomments`;
CREATE TABLE IF NOT EXISTS `wo_moviecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_movies`
--

DROP TABLE IF EXISTS `wo_movies`;
CREATE TABLE IF NOT EXISTS `wo_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `genre` varchar(50) NOT NULL DEFAULT '',
  `stars` varchar(300) NOT NULL DEFAULT '',
  `producer` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `release` year(4) DEFAULT NULL,
  `quality` varchar(10) DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `cover` varchar(500) NOT NULL DEFAULT 'upload/photos/d-film.jpg',
  `source` varchar(1000) NOT NULL DEFAULT '',
  `iframe` varchar(1000) NOT NULL DEFAULT '',
  `video` varchar(3000) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `genre` (`genre`),
  KEY `country` (`country`),
  KEY `release` (`release`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_mute`
--

DROP TABLE IF EXISTS `wo_mute`;
CREATE TABLE IF NOT EXISTS `wo_mute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL DEFAULT 0,
  `message_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `notify` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'yes',
  `call_chat` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'yes',
  `archive` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'yes',
  `pin` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'yes',
  `fav` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT 'no',
  `type` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `user_id_2` (`user_id`),
  KEY `chat_id_2` (`chat_id`),
  KEY `message_id_2` (`message_id`),
  KEY `notify` (`notify`),
  KEY `type` (`type`),
  KEY `fav` (`fav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wo_mute_story`
--

DROP TABLE IF EXISTS `wo_mute_story`;
CREATE TABLE IF NOT EXISTS `wo_mute_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `story_user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `story_user_id` (`story_user_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `user_id_2` (`user_id`),
  KEY `story_user_id_2` (`story_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wo_notifications`
--

DROP TABLE IF EXISTS `wo_notifications`;
CREATE TABLE IF NOT EXISTS `wo_notifications` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `reply_id` int(11) UNSIGNED DEFAULT 0,
  `comment_id` int(11) UNSIGNED DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `group_chat_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `thread_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `seen_pop` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL DEFAULT '',
  `type2` varchar(32) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `full_link` varchar(1000) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT 0,
  `sent_push` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `notifier_id` (`notifier_id`),
  KEY `user_id` (`recipient_id`),
  KEY `post_id` (`post_id`),
  KEY `seen` (`seen`),
  KEY `time` (`time`),
  KEY `page_id` (`page_id`),
  KEY `group_id` (`group_id`,`seen_pop`),
  KEY `sent_push` (`sent_push`),
  KEY `order1` (`seen`,`id`),
  KEY `order2` (`notifier_id`,`id`),
  KEY `order3` (`recipient_id`,`id`),
  KEY `order4` (`post_id`,`id`),
  KEY `order5` (`page_id`,`id`),
  KEY `order6` (`group_id`,`id`),
  KEY `order7` (`time`,`id`),
  KEY `comment_id` (`comment_id`),
  KEY `reply_id` (`reply_id`),
  KEY `blog_id` (`blog_id`),
  KEY `story_id` (`story_id`),
  KEY `admin` (`admin`),
  KEY `group_chat_id` (`group_chat_id`),
  KEY `event_id` (`event_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_offers`
--

DROP TABLE IF EXISTS `wo_offers`;
CREATE TABLE IF NOT EXISTS `wo_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `discount_type` varchar(200) NOT NULL DEFAULT '',
  `discount_percent` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `discounted_items` varchar(150) DEFAULT '',
  `buy` int(11) NOT NULL DEFAULT 0,
  `get_price` int(11) NOT NULL DEFAULT 0,
  `spend` int(11) NOT NULL DEFAULT 0,
  `amount_off` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `expire_date` date NOT NULL,
  `expire_time` time NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT '',
  `currency` varchar(50) NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `user_id` (`user_id`),
  KEY `spend` (`spend`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pageadmins`
--

DROP TABLE IF EXISTS `wo_pageadmins`;
CREATE TABLE IF NOT EXISTS `wo_pageadmins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `general` int(11) NOT NULL DEFAULT 1,
  `info` int(11) NOT NULL DEFAULT 1,
  `social` int(11) NOT NULL DEFAULT 1,
  `avatar` int(11) NOT NULL DEFAULT 1,
  `design` int(11) NOT NULL DEFAULT 1,
  `admins` int(11) NOT NULL DEFAULT 0,
  `analytics` int(11) NOT NULL DEFAULT 1,
  `delete_page` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pagerating`
--

DROP TABLE IF EXISTS `wo_pagerating`;
CREATE TABLE IF NOT EXISTS `wo_pagerating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `valuation` int(11) DEFAULT 0,
  `review` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pages`
--

DROP TABLE IF EXISTS `wo_pages`;
CREATE TABLE IF NOT EXISTS `wo_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_name` varchar(32) NOT NULL DEFAULT '',
  `page_title` varchar(32) NOT NULL DEFAULT '',
  `page_description` varchar(1000) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT 'upload/photos/d-page.jpg',
  `cover` varchar(255) NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `users_post` int(11) NOT NULL DEFAULT 0,
  `page_category` int(11) NOT NULL DEFAULT 1,
  `sub_category` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  `facebook` varchar(32) NOT NULL DEFAULT '',
  `google` varchar(32) NOT NULL DEFAULT '',
  `vk` varchar(32) NOT NULL DEFAULT '',
  `twitter` varchar(32) NOT NULL DEFAULT '',
  `linkedin` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(32) NOT NULL DEFAULT '',
  `phone` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `call_action_type` int(11) NOT NULL DEFAULT 0,
  `call_action_type_url` varchar(255) NOT NULL DEFAULT '',
  `background_image` varchar(200) NOT NULL DEFAULT '',
  `background_image_status` int(11) NOT NULL DEFAULT 0,
  `instgram` varchar(32) NOT NULL DEFAULT '',
  `youtube` varchar(100) NOT NULL DEFAULT '',
  `verified` enum('0','1') NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `registered` varchar(32) NOT NULL DEFAULT '0/0000',
  `boosted` enum('0','1') NOT NULL DEFAULT '0',
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`page_id`),
  KEY `registered` (`registered`),
  KEY `user_id` (`user_id`),
  KEY `page_category` (`page_category`),
  KEY `active` (`active`),
  KEY `verified` (`verified`),
  KEY `boosted` (`boosted`),
  KEY `time` (`time`),
  KEY `page_name` (`page_name`),
  KEY `page_title` (`page_title`),
  KEY `sub_category` (`sub_category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_pages`
--

INSERT INTO `wo_pages` (`page_id`, `user_id`, `page_name`, `page_title`, `page_description`, `avatar`, `cover`, `users_post`, `page_category`, `sub_category`, `website`, `facebook`, `google`, `vk`, `twitter`, `linkedin`, `company`, `phone`, `address`, `call_action_type`, `call_action_type_url`, `background_image`, `background_image_status`, `instgram`, `youtube`, `verified`, `active`, `registered`, `boosted`, `time`) VALUES
(1, 1, 'kmkvietnam', 'KMK COMPANY', '', 'upload/photos/d-page.jpg', 'upload/photos/d-cover.jpg', 1, 16, '', '', '', '', '', '', '', '', '', '', 1, '', '', 0, '', '', '1', '1', '9/2021', '0', 1632229432);

-- --------------------------------------------------------

--
-- Table structure for table `wo_pages_categories`
--

DROP TABLE IF EXISTS `wo_pages_categories`;
CREATE TABLE IF NOT EXISTS `wo_pages_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_pages_categories`
--

INSERT INTO `wo_pages_categories` (`id`, `lang_key`) VALUES
(2, '1419'),
(3, '1422'),
(4, '1425'),
(5, '1428'),
(6, '1431'),
(7, '1434'),
(8, '1437'),
(9, '1440'),
(10, '1443'),
(11, '1446'),
(12, '1449'),
(13, '1452'),
(14, '1455'),
(15, '1458'),
(16, '1461'),
(17, '1464'),
(18, '1467');

-- --------------------------------------------------------

--
-- Table structure for table `wo_pages_invites`
--

DROP TABLE IF EXISTS `wo_pages_invites`;
CREATE TABLE IF NOT EXISTS `wo_pages_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `inviter_id` int(11) NOT NULL DEFAULT 0,
  `invited_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`inviter_id`,`invited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pages_likes`
--

DROP TABLE IF EXISTS `wo_pages_likes`;
CREATE TABLE IF NOT EXISTS `wo_pages_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_payments`
--

DROP TABLE IF EXISTS `wo_payments`;
CREATE TABLE IF NOT EXISTS `wo_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_payment_transactions`
--

DROP TABLE IF EXISTS `wo_payment_transactions`;
CREATE TABLE IF NOT EXISTS `wo_payment_transactions` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(11) UNSIGNED NOT NULL,
  `kind` varchar(100) NOT NULL,
  `amount` decimal(11,0) UNSIGNED NOT NULL,
  `transaction_dt` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `kind` (`kind`),
  KEY `transaction_dt` (`transaction_dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pinnedposts`
--

DROP TABLE IF EXISTS `wo_pinnedposts`;
CREATE TABLE IF NOT EXISTS `wo_pinnedposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `active` (`active`),
  KEY `page_id` (`page_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_pokes`
--

DROP TABLE IF EXISTS `wo_pokes`;
CREATE TABLE IF NOT EXISTS `wo_pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `received_user_id` int(11) NOT NULL DEFAULT 0,
  `send_user_id` int(11) NOT NULL DEFAULT 0,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `received_user_id` (`received_user_id`),
  KEY `user_id` (`send_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_polls`
--

DROP TABLE IF EXISTS `wo_polls`;
CREATE TABLE IF NOT EXISTS `wo_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_posts`
--

DROP TABLE IF EXISTS `wo_posts`;
CREATE TABLE IF NOT EXISTS `wo_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `postText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `page_event_id` int(11) NOT NULL DEFAULT 0,
  `postLink` varchar(1000) NOT NULL DEFAULT '',
  `postLinkTitle` text DEFAULT NULL,
  `postLinkImage` varchar(100) NOT NULL DEFAULT '',
  `postLinkContent` text DEFAULT NULL,
  `postVimeo` varchar(100) NOT NULL DEFAULT '',
  `postDailymotion` varchar(100) NOT NULL DEFAULT '',
  `postFacebook` varchar(100) NOT NULL DEFAULT '',
  `postFile` varchar(255) NOT NULL DEFAULT '',
  `postFileName` varchar(200) NOT NULL DEFAULT '',
  `postFileThumb` varchar(3000) NOT NULL DEFAULT '',
  `postYoutube` varchar(255) NOT NULL DEFAULT '',
  `postVine` varchar(32) NOT NULL DEFAULT '',
  `postSoundCloud` varchar(255) NOT NULL DEFAULT '',
  `postPlaytube` varchar(500) NOT NULL DEFAULT '',
  `postDeepsound` varchar(500) NOT NULL DEFAULT '',
  `postMap` varchar(255) NOT NULL DEFAULT '',
  `postShare` int(11) NOT NULL DEFAULT 0,
  `postPrivacy` enum('0','1','2','3','4') NOT NULL DEFAULT '1',
  `postType` varchar(30) NOT NULL DEFAULT '',
  `postFeeling` varchar(255) NOT NULL DEFAULT '',
  `postListening` varchar(255) NOT NULL DEFAULT '',
  `postTraveling` varchar(255) NOT NULL DEFAULT '',
  `postWatching` varchar(255) NOT NULL DEFAULT '',
  `postPlaying` varchar(255) NOT NULL DEFAULT '',
  `postPhoto` varchar(3000) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(32) NOT NULL DEFAULT '0/0000',
  `album_name` varchar(52) NOT NULL DEFAULT '',
  `multi_image` enum('0','1') NOT NULL DEFAULT '0',
  `multi_image_post` int(11) NOT NULL DEFAULT 0,
  `boosted` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `poll_id` int(11) NOT NULL DEFAULT 0,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `forum_id` int(11) NOT NULL DEFAULT 0,
  `thread_id` int(11) NOT NULL DEFAULT 0,
  `videoViews` int(11) NOT NULL DEFAULT 0,
  `postRecord` varchar(3000) NOT NULL DEFAULT '',
  `postSticker` text DEFAULT NULL,
  `shared_from` int(15) NOT NULL DEFAULT 0,
  `post_url` text DEFAULT NULL,
  `parent_id` int(15) NOT NULL DEFAULT 0,
  `cache` int(11) NOT NULL DEFAULT 0,
  `comments_status` int(11) NOT NULL DEFAULT 1,
  `blur` int(11) NOT NULL DEFAULT 0,
  `color_id` int(11) NOT NULL DEFAULT 0,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `fund_raise_id` int(11) NOT NULL DEFAULT 0,
  `fund_id` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `stream_name` varchar(100) NOT NULL DEFAULT '',
  `agora_token` text DEFAULT NULL,
  `live_time` int(50) NOT NULL DEFAULT 0,
  `live_ended` int(11) NOT NULL DEFAULT 0,
  `agora_resource_id` text DEFAULT NULL,
  `agora_sid` varchar(500) NOT NULL DEFAULT '',
  `send_notify` varchar(11) NOT NULL DEFAULT '',
  `240p` int(2) NOT NULL DEFAULT 0,
  `360p` int(2) NOT NULL DEFAULT 0,
  `480p` int(2) NOT NULL DEFAULT 0,
  `720p` int(2) NOT NULL DEFAULT 0,
  `1080p` int(2) NOT NULL DEFAULT 0,
  `2048p` int(2) NOT NULL DEFAULT 0,
  `4096p` int(2) NOT NULL DEFAULT 0,
  `processing` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `postFile` (`postFile`),
  KEY `postShare` (`postShare`),
  KEY `postType` (`postType`),
  KEY `postYoutube` (`postYoutube`),
  KEY `page_id` (`page_id`),
  KEY `group_id` (`group_id`),
  KEY `registered` (`registered`),
  KEY `time` (`time`),
  KEY `boosted` (`boosted`),
  KEY `product_id` (`product_id`),
  KEY `poll_id` (`poll_id`),
  KEY `event_id` (`event_id`),
  KEY `videoViews` (`videoViews`),
  KEY `shared_from` (`shared_from`),
  KEY `order1` (`user_id`,`id`),
  KEY `order2` (`page_id`,`id`),
  KEY `order3` (`group_id`,`id`),
  KEY `order4` (`recipient_id`,`id`),
  KEY `order5` (`event_id`,`id`),
  KEY `order6` (`parent_id`,`id`),
  KEY `multi_image` (`multi_image`),
  KEY `album_name` (`album_name`),
  KEY `postFacebook` (`postFacebook`),
  KEY `postVimeo` (`postVimeo`),
  KEY `postDailymotion` (`postDailymotion`),
  KEY `postSoundCloud` (`postSoundCloud`),
  KEY `postYoutube_2` (`postYoutube`),
  KEY `fund_raise_id` (`fund_raise_id`),
  KEY `fund_id` (`fund_id`),
  KEY `offer_id` (`offer_id`),
  KEY `live_time` (`live_time`),
  KEY `live_ended` (`live_ended`),
  KEY `active` (`active`),
  KEY `job_id` (`job_id`),
  KEY `page_event_id` (`page_event_id`),
  KEY `blog_id` (`blog_id`),
  KEY `color_id` (`color_id`),
  KEY `thread_id` (`thread_id`),
  KEY `forum_id` (`forum_id`),
  KEY `processing` (`processing`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_posts`
--

INSERT INTO `wo_posts` (`id`, `post_id`, `user_id`, `recipient_id`, `postText`, `page_id`, `group_id`, `event_id`, `page_event_id`, `postLink`, `postLinkTitle`, `postLinkImage`, `postLinkContent`, `postVimeo`, `postDailymotion`, `postFacebook`, `postFile`, `postFileName`, `postFileThumb`, `postYoutube`, `postVine`, `postSoundCloud`, `postPlaytube`, `postDeepsound`, `postMap`, `postShare`, `postPrivacy`, `postType`, `postFeeling`, `postListening`, `postTraveling`, `postWatching`, `postPlaying`, `postPhoto`, `time`, `registered`, `album_name`, `multi_image`, `multi_image_post`, `boosted`, `product_id`, `poll_id`, `blog_id`, `forum_id`, `thread_id`, `videoViews`, `postRecord`, `postSticker`, `shared_from`, `post_url`, `parent_id`, `cache`, `comments_status`, `blur`, `color_id`, `job_id`, `offer_id`, `fund_raise_id`, `fund_id`, `active`, `stream_name`, `agora_token`, `live_time`, `live_ended`, `agora_resource_id`, `agora_sid`, `send_notify`, `240p`, `360p`, `480p`, `720p`, `1080p`, `2048p`, `4096p`, `processing`) VALUES
(1, 1, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/ePflyc2fzER8AoqL4j5C_16_14778d52f884ad40f2a5179703c5d515_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1631779494, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/ONK4q6n2yEP7UObBXge6_16_4b670da2fc6ee178aed08430d55edc09_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1631779854, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 1631809373, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/I6DEv4gZvbxgiFtVjLTb_16_c40f2b45db40110eacfc30fc397765d1_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1631779925, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(11, 11, 2, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/LRZxExoWIw5mqAoBqtob_16_0de0e2bcf6a84be0c387fb7b2aef909f_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1631785815, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(12, 12, 2, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/7SMwOpfQiJYfj49lYEl1_16_734f4249ff389ca4882a69ef48f6685c_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_cover_picture', '', '', '', '', '', '', 1631785850, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(35, 35, 1, 0, '#[1]', 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '0', 'post', '', '', '', '', '', '', 1631853970, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(36, 36, 5, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/AoxUUNuAgCU5zXypTljU_17_25ea3dbff6496141452bad3d97dd9b24_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631872900, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(37, 37, 6, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/cqAMG2VtieHJo93eDwWV_17_854c142025a8a466c1f9638d12170a36_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873061, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(38, 38, 7, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/XDa4lB382tHa9Ffni7cT_17_e817b884351003d5d92423d91ff02a9c_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873185, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(39, 39, 8, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/EYbVJiU8KlJhUg9fTrSp_17_0dd67963aeb40c566e4170755c453005_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873303, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(40, 40, 9, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/5zrNqRfDmUA5qkvwTbaC_17_af4b6a28f2bb4c889b71dba93042e07b_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873412, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(41, 41, 10, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/yEfKXVOwgD68FQjMQBRi_17_72429bf29d91f936ce679f22b51b030c_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873533, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(42, 42, 11, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/hb9NLgcQcgpoLntDXzuF_17_d25c97c1a10207da5ae9376a4bff4e9b_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873646, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(43, 43, 12, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/mzhBhlLDylStOjVs7zrN_17_f8409de0c83fdeb4e6d745a4f2b761ae_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873772, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(44, 44, 13, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/ByALQGLHkSY65HNdaAyh_17_80305a9dbc2e0ea5d10fb097323da288_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873856, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(45, 45, 14, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/AiaUhJpKgPGhBSheWZLy_17_63addb046cd8fa8c6c1c939562bf5e2d_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1631873986, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(46, 46, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/cqDckI8tmQD6FOng2Ljp_21_9d7ec2fae11d3033bef8e322fd166a1b_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632199357, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(47, 47, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/jrrkCvCW8Pg4j46Pu37z_21_61153931d47d48d8d8ead128c9045b77_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632215883, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(48, 48, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/TjLstJHPA72yxD8jcJXU_21_6043ce9e34b20353a6900c98cf664315_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1632215929, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(51, 51, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/6IQ98q1ZHAnNPuTIqdCb_28_92feea6e2d57b7c02313b1dc78191553_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1632813921, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(52, 52, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/YsqcOlzlHuZGQ1FWfpBy_28_865b3494a0053d3017bfdefc3c8b33d6_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829451, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(53, 53, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/E3DAWQoLusIouYhf6kwY_28_7316562177c7efe9df1aca7f4b8d1881_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1632829511, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(54, 54, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/ALuQxHb4LTKTdIDcuHd6_28_0173781d07435c43a4ab4a365f32657a_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829657, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(55, 55, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/OoDyRRxzirrN1Y5C1cWl_28_1835db913d1e49b52d0c51a66421b28c_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829702, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(56, 56, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/3kjSehSAX6KZPKcW9LZJ_28_6035a36ff066e41f8463607ef355be8b_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829761, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(57, 57, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/iCOWuVvJaM3rN8wUEG9i_28_fe4d273c97921b435160fd8b82dbd616_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_cover_picture', '', '', '', '', '', '', 1632829774, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(58, 58, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/U5zktPlsF93Gam11nCnJ_28_f2d9daecb2ecab03299478117da080d3_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829814, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(59, 59, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/7lpg2ChSuNkUT3YmAO4C_28_29ad6bfd08c31b08a7f6be784f6aebc8_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632829941, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(60, 60, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/BnkhphzDLwQlSgKerZ4O_28_bac76bc8370836bbacb220ae24a80c75_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632830050, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(61, 61, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/aM6dEZwbeIybDXbdAeRU_28_35a308bc3bbd0427bb23f61da38c5557_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632830057, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(62, 62, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/xwfqJFpb9dV2rrd1IEPn_28_c8eae136b1607846986c98217aad9b63_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632830067, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(63, 63, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/hpk2nydVa68jgIV7X2qS_28_b43c7db7ed7a61a985d55f7237a9cede_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture_deleted', '', '', '', '', '', '', 1632830179, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(64, 64, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/eJOOZ4MchJPRw5gQ1XWY_28_360b8306a7a3995982940cee26e2f44a_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1632831618, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(65, 65, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/09/a1xSVLj6Jt6sG7dykugx_28_197b12b009e3870d49950e33f99949f4_cover_full.png', '', '', '', '', '', '', '', '', 0, '0', 'profile_cover_picture', '', '', '', '', '', '', 1632831653, '9/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(66, 66, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/11/Srofs9lHxRzkGPv38QWK_09_d08d5e63aa4ff331725009314640a7d1_cover_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_cover_picture', '', '', '', '', '', '', 1636439429, '11/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(67, 67, 1, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/11/CbDGxQngo5pVFDn9CK3i_09_4162157762e2c4d7ba7e168091c066cd_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1636439527, '11/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(68, 68, 2, 0, '', 0, 0, 0, 0, '', '', '', '', '', '', '', 'upload/photos/2021/11/mGKRzaEQWK9DjNQDaZdz_11_914ffe5299069575d2340b12f0c4ce93_image.jpg', '251297703_4772888452763253_8288931028141141757_n.jpg', '', '', '', '', '', '', '', 0, '0', 'post', '', '', '', '', '', '', 1636621349, '11/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(69, 69, 2, 0, NULL, 0, 0, 0, 0, '', NULL, '', NULL, '', '', '', 'upload/photos/2021/11/7cwL38ih9LWKYOwFxOWv_11_0d61d8716e3dda35cdca6709f6fae1d1_avatar_full.jpg', '', '', '', '', '', '', '', '', 0, '0', 'profile_picture', '', '', '', '', '', '', 1636621437, '11/2021', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '', NULL, 0, 0, NULL, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wo_products`
--

DROP TABLE IF EXISTS `wo_products`;
CREATE TABLE IF NOT EXISTS `wo_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `sub_category` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `price` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.00',
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `type` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `lng` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `lat` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category` (`category`),
  KEY `price` (`price`),
  KEY `status` (`status`),
  KEY `page_id` (`page_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_products_categories`
--

DROP TABLE IF EXISTS `wo_products_categories`;
CREATE TABLE IF NOT EXISTS `wo_products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_products_categories`
--

INSERT INTO `wo_products_categories` (`id`, `lang_key`) VALUES
(1, '1470'),
(2, '1471'),
(3, '1472'),
(4, '1473'),
(5, '1474'),
(6, '1475'),
(7, '1476'),
(8, '1477'),
(9, '1478'),
(10, '1479');

-- --------------------------------------------------------

--
-- Table structure for table `wo_products_media`
--

DROP TABLE IF EXISTS `wo_products_media`;
CREATE TABLE IF NOT EXISTS `wo_products_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_profilefields`
--

DROP TABLE IF EXISTS `wo_profilefields`;
CREATE TABLE IF NOT EXISTS `wo_profilefields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT 0,
  `profile_page` int(11) NOT NULL DEFAULT 0,
  `select_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `registration_page` (`registration_page`),
  KEY `active` (`active`),
  KEY `profile_page` (`profile_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_reactions`
--

DROP TABLE IF EXISTS `wo_reactions`;
CREATE TABLE IF NOT EXISTS `wo_reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `post_id` int(11) UNSIGNED DEFAULT 0,
  `comment_id` int(11) UNSIGNED DEFAULT 0,
  `replay_id` int(11) UNSIGNED DEFAULT 0,
  `message_id` int(11) NOT NULL DEFAULT 0,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `reaction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_reaction` (`reaction`),
  KEY `message_id` (`message_id`),
  KEY `message_id_2` (`message_id`),
  KEY `replay_id` (`replay_id`),
  KEY `story_id` (`story_id`),
  KEY `comment_id` (`comment_id`),
  KEY `comment_id_2` (`comment_id`),
  KEY `replay_id_2` (`replay_id`),
  KEY `message_id_3` (`message_id`),
  KEY `story_id_2` (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_reactions`
--

INSERT INTO `wo_reactions` (`id`, `user_id`, `post_id`, `comment_id`, `replay_id`, `message_id`, `story_id`, `reaction`) VALUES
(32, 1, 3, 0, 0, 0, 0, '2'),
(93, 1, 1, 0, 0, 0, 0, '3'),
(100, 1, 0, 11, 0, 0, 0, '1'),
(105, 1, 12, 0, 0, 0, 0, '1'),
(108, 1, 0, 0, 0, 5, 0, '3'),
(117, 1, 0, 0, 0, 32, 0, '3'),
(118, 1, 0, 0, 0, 17, 0, '3'),
(119, 1, 0, 0, 0, 33, 0, '3'),
(126, 1, 11, 0, 0, 0, 0, '6'),
(128, 1, 0, 0, 0, 35, 0, '3'),
(129, 1, 48, 0, 0, 0, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `wo_reactions_types`
--

DROP TABLE IF EXISTS `wo_reactions_types`;
CREATE TABLE IF NOT EXISTS `wo_reactions_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `wowonder_icon` varchar(300) NOT NULL DEFAULT '',
  `sunshine_icon` varchar(300) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_reactions_types`
--

INSERT INTO `wo_reactions_types` (`id`, `name`, `wowonder_icon`, `sunshine_icon`, `status`) VALUES
(1, 'like', '', '', 1),
(2, 'love', '', '', 1),
(3, 'haha', '', '', 1),
(4, 'wow', '', '', 1),
(5, 'sad', '', '', 1),
(6, 'angry', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wo_recentsearches`
--

DROP TABLE IF EXISTS `wo_recentsearches`;
CREATE TABLE IF NOT EXISTS `wo_recentsearches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `search_id` int(11) NOT NULL DEFAULT 0,
  `search_type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`search_id`),
  KEY `search_type` (`search_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wo_recentsearches`
--

INSERT INTO `wo_recentsearches` (`id`, `user_id`, `search_id`, `search_type`) VALUES
(1, 1, 2, 'user'),
(2, 2, 11, 'user'),
(3, 1, 13, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wo_refund`
--

DROP TABLE IF EXISTS `wo_refund`;
CREATE TABLE IF NOT EXISTS `wo_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `pro_type` varchar(50) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pro_type` (`pro_type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_relationship`
--

DROP TABLE IF EXISTS `wo_relationship`;
CREATE TABLE IF NOT EXISTS `wo_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `relationship` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `relationship` (`relationship`),
  KEY `active` (`active`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_relationship`
--

INSERT INTO `wo_relationship` (`id`, `from_id`, `to_id`, `relationship`, `active`) VALUES
(1, 1, 2, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `wo_reports`
--

DROP TABLE IF EXISTS `wo_reports`;
CREATE TABLE IF NOT EXISTS `wo_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(15) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(15) NOT NULL DEFAULT 0,
  `group_id` int(15) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `seen` (`seen`),
  KEY `profile_id` (`profile_id`),
  KEY `page_id` (`page_id`),
  KEY `group_id` (`group_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_savedposts`
--

DROP TABLE IF EXISTS `wo_savedposts`;
CREATE TABLE IF NOT EXISTS `wo_savedposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_stickers`
--

DROP TABLE IF EXISTS `wo_stickers`;
CREATE TABLE IF NOT EXISTS `wo_stickers` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `media_file` varchar(250) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_stickers`
--

INSERT INTO `wo_stickers` (`id`, `name`, `media_file`, `time`) VALUES
(1, 'Buồn', 'upload/photos/2021/09/d43H3QsCwXYY2r2nK3zz_18_47521cc47359e46fb45c32d33f2719f2_image.gif', 1631951782),
(3, '', 'upload/photos/2021/09/WqCzmgiNE26GWcIGMDyp_18_92d437abee158f1d2e4d1ad9dec75d93_image.gif', 1631951893),
(4, '', 'upload/photos/2021/09/WFUbIKpOZ1KHyudzaELR_18_88f56a30d07dd3cdceb1491a4e2229b7_image.gif', 1631951905),
(5, '', 'upload/photos/2021/09/JHhO4tM25g1hCY5pKQtZ_18_3860fe77db3de364d446df91a7d81c06_image.gif', 1631951917),
(6, '', 'upload/photos/2021/09/jgclTaWSdOHJk6PBxUTP_18_872ab0764a9153151c0e28e8b9785d3d_image.gif', 1631951929),
(7, '', 'upload/photos/2021/09/KhAklEtv4jwq3KUwAOu9_18_66670cf8e6770fd1ae29bc935abbf4d6_image.gif', 1631951949),
(8, '', 'upload/photos/2021/09/lUwjFmNOg8m2E38RybAI_18_d280f2ce3ca54282d251b61d1fcf802e_image.gif', 1631951959),
(9, '', 'upload/photos/2021/09/zPMZVQNzfLRYmYK7rmfl_18_59fc685b704992ce6a1803e572180099_image.gif', 1631951970),
(10, '', 'upload/photos/2021/09/1TMABLfxzDNRUQ365rAU_18_8652d258de3da208f4e8bb49541ce18a_image.gif', 1631951980),
(11, '', 'upload/photos/2021/09/3kZucSULD4TPy3XsX6Ao_18_f272e9121bd78fc96e320809e5ef34ca_image.gif', 1631951989),
(12, '', 'upload/photos/2021/09/8Dgl2FFRcp6qYMzZIdns_18_6d66f181a67bed49bca289f61ef1f8c6_image.gif', 1631951998),
(13, '', 'upload/photos/2021/09/ihTO7AnXWA8L6JLcaGDG_18_afcc877dfb5f770cb434fd5b8af7d500_image.gif', 1631952008),
(14, '', 'upload/photos/2021/09/ypmupuiiwRoeSgyK2XWk_18_4cc63f0eded74edfebb1d37a80810a2f_image.gif', 1631952035),
(15, '', 'upload/photos/2021/09/em4CchFFznMrU68WV2TQ_18_7541c5798115616aa70f1e299b00ee84_image.gif', 1631952045),
(16, '', 'upload/photos/2021/09/n1ncYD74HxQbyPHVJAvt_18_a1fe6436a416c3ea25c0b705689c1cf1_image.gif', 1631952058),
(17, '', 'upload/photos/2021/09/EG3a6uVXmZKtVVAdiIEy_18_29a531b198dfddb78fc4f976fbc3d815_image.gif', 1631952069),
(18, '', 'upload/photos/2021/09/LZV1KeVgvRyAi3eLRW9D_18_54ea38d9237cfeab4048c6d16ec70723_image.gif', 1631952081),
(19, '', 'upload/photos/2021/09/3NjXB462GyJ3mniIhuse_18_0ffac34db12bc6d52723a44276a90fae_image.gif', 1631952092),
(20, '', 'upload/photos/2021/09/Sd1WqmgcLquf6gf4r4rq_18_132bb6799a469b15336385ff726eb17f_image.gif', 1631952104),
(21, '', 'upload/photos/2021/09/nWUuGYOlIl3bIGi3x9xG_18_b7449379e670d3b7a7e1ea8ae9dc4b24_image.gif', 1631952115),
(22, '', 'upload/photos/2021/09/a5vrV481zbiO8QysDrRf_18_99892434a823546415cdfeb9c9a718f4_image.gif', 1631952128),
(23, '', 'upload/photos/2021/09/I9VjcBOE561f1QATZ4ZA_18_5657b83d890a93ddac8072bf15bf69ca_image.gif', 1631952143),
(24, '', 'upload/photos/2021/09/eCgr9W112bSyLuOq5frv_18_01a5f249a71625fb14ca719ce7f45e6c_image.gif', 1631952153),
(25, '', 'upload/photos/2021/09/k36Houc1CarrQDXlDMzK_18_db790123efd9d05965ad95355e12cb28_image.gif', 1631952162),
(27, '', 'upload/photos/2021/09/ng6cUpsqxqN8WGrTmOah_18_3d4181f31b15d187ad00addfcd92494e_image.gif', 1631952191),
(28, '', 'upload/photos/2021/09/OZuoyKBABPRiIKfyzKLn_18_b974d224e939532ef18a493a491b9db0_image.gif', 1631952374),
(29, '', 'upload/photos/2021/09/SCcyxPlGlGZHvmbLtG7Y_18_e1c471119b0f358f6e96ea4fe933fb93_image.gif', 1631952379),
(30, '', 'upload/photos/2021/09/c4FnwQoekDsPIhxstWbX_18_1021cab6083fb737be1a9336f44717ca_image.gif', 1631952383);

-- --------------------------------------------------------

--
-- Table structure for table `wo_story_seen`
--

DROP TABLE IF EXISTS `wo_story_seen`;
CREATE TABLE IF NOT EXISTS `wo_story_seen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `story_id` (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_story_seen`
--

INSERT INTO `wo_story_seen` (`id`, `user_id`, `story_id`, `time`) VALUES
(7, 2, 7, '1636621380');

-- --------------------------------------------------------

--
-- Table structure for table `wo_sub_categories`
--

DROP TABLE IF EXISTS `wo_sub_categories`;
CREATE TABLE IF NOT EXISTS `wo_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `lang_key` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `lang_key` (`lang_key`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_terms`
--

DROP TABLE IF EXISTS `wo_terms`;
CREATE TABLE IF NOT EXISTS `wo_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT '',
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_terms`
--

INSERT INTO `wo_terms` (`id`, `type`, `text`) VALUES
(1, 'terms_of_use', '<h4>1- Write your Terms Of Use here.</h4>     \nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          <br><br>          <h4>2- Random title</h4>          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'privacy_policy', '<h2>Who we are?</h2>\nProvide name and contact details of the data controller. This will typically be your business or you, if you are a sole trader. Where applicable, you should include the identity and contact details of the controller’s representative and/or the data protection officer. \n\n<h2>What information do we collect?</h2>\nSpecify the types of personal information you collect, eg names, addresses, user names, etc. You should include specific details on:\nhow you collect data (eg when a user registers, purchases or uses your services, completes a contact form, signs up to a newsletter, etc) \nwhat specific data you collect through each of the data collection method\nif you collect data from third parties, you must specify categories of data and source\nif you process sensitive personal data or financial information, and how you handle this \n<br><br>\nYou may want to provide the user with relevant definitions in relation to personal data and sensitive personal data. \n<br><br>\n<h2>How do we use personal information?</h2>\nDescribe in detail all the service- and business-related purposes for which you will process data. For example, this may include things like:\npersonalisation of content, business information or user experience\naccount set up and administration\ndelivering marketing and events communication\ncarrying out polls and surveys\ninternal research and development purposes\nproviding goods and services\nlegal obligations (eg prevention of fraud)\nmeeting internal audit requirements\n<br><br>\nPlease note this list is not exhaustive. You will need to record all purposes for which you process personal data. \n<br><br>\n<h2>What legal basis do we have for processing your personal data?</h2>\nDescribe the relevant processing conditions contained within the GDPR. There are six possible legal grounds: \nconsent\ncontract\nlegitimate interests\nvital interests\npublic task \nlegal obligation\n<br><br>\nProvide detailed information on all grounds that apply to your processing, and why. If you rely on consent, explain how individuals can withdraw and manage their consent. If you rely on legitimate interests, explain clearly what these are.\n<br><br>\nIf you’re processing special category personal data, you will have to satisfy at least one of the six processing conditions, as well as additional requirements for processing under the GDPR. Provide information on all additional grounds that apply. \n<br><br>\n<h2>When do we share personal data?</h2>\nExplain that you will treat personal data confidentially and describe the circumstances when you might disclose or share it. Eg, when necessary to provide your services or conduct your business operations, as outlined in your purposes for processing. You should provide information on:\nhow you will share the data\nwhat safeguards you will have in place\nwhat parties you may share the data with and why\n\n<h2>Where do we store and process personal data?</h2>\nIf applicable, explain if you intend to store and process data outside of the data subject’s home country. Outline the steps you will take to ensure the data is processed according to your privacy policy and the applicable law of the country where data is located.\n\nIf you transfer data outside the European Economic Area, outline the measures you will put in place to provide an appropriate level of data privacy protection. Eg contractual clauses, data transfer agreements, etc.\n\n<h2>How do we secure personal data?</h2>\nDescribe your approach to data security and the technologies and procedures you use to protect personal information. For example, these may be measures:\nto protect data against accidental loss\nto prevent unauthorised access, use, destruction or disclosure\nto ensure business continuity and disaster recovery\nto restrict access to personal information\nto conduct privacy impact assessments in accordance with the law and your business policies\nto train staff and contractors on data security\nto manage third party risks, through use of contracts and security reviews\n<br><br>\nPlease note this list is not exhaustive. You should record all mechanisms you rely on to protect personal data. You should also state if your organisation adheres to certain accepted standards or regulatory requirements.\n<br><br>\n<h2>How long do we keep your personal data for?</h2>\nProvide specific information on the length of time you will keep the information for in relation to each processing purpose. The GDPR requires you to retain data for no longer than reasonably necessary. Include details of your data or records retention schedules, or link to additional resources where these are published.\n<br><br>\nIf you cannot state a specific period, you need to set out the criteria you will apply to determine how long to keep the data for (eg local laws, contractual obligations, etc)\n<br><br>\nYou should also outline how you securely dispose of data after you no longer need it.\n<br><br>\n<h2>Your rights in relation to personal data</h2>\nUnder the GDPR, you must respect the right of data subjects to access and control their personal data. In your privacy notice, you must outline their rights in respect of:\naccess to personal information \ncorrection and deletion\nwithdrawal of consent (if processing data on condition of consent)\ndata portability\nrestriction of processing and objection\nlodging a complaint with the Information Commissioner’s Office\n\nYou should explain how individuals can exercise their rights, and how you plan to respond to subject data requests. State if any relevant exemptions may apply and set out any identity verifications procedures you may rely on.\n\nInclude details of the circumstances where data subject rights may be limited, eg if fulfilling the data subject request may expose personal data about another person, or if you’re asked to delete data which you are required to keep by law. \n\n<h2>Use of automated decision-making and profiling</h2>\nWhere you use profiling or other automated decision-making, you must disclose this in your privacy policy. In such cases, you must provide details on existence of any automated decision-making, together with information about the logic involved, and the likely significance and consequences of the processing of the individual.\n\n<h2>How to contact us?</h2>\nExplain how data subject can get in touch if they have questions or concerns about your privacy practices, their personal information, or if they wish to file a complaint. Describe all ways in which they can contact you – eg online, by email or postal mail.\n<br><br>\nIf applicable, you may also include information on:\n<br><br>\n<h2>Use of cookies and other technologies</h2>\nYou may include a link to further information, or describe within the policy if you intend to set and use cookies, tracking and similar technologies to store and manage user preferences on your website, advertise, enable content or otherwise analyse user and usage data. Provide information on what types of cookies and technologies you use, why you use them and how an individual can control and manage them.\n<br><br>\nLinking to other websites / third party content\nIf you link to external sites and resources from your website, be specific on whether this constitutes endorsement, and if you take any responsibility for the content (or information contained within) any linked website.\n<br><br>\nYou may wish to consider adding other optional clauses to your privacy policy, depending on your business’ circumstances. \n'),
(3, 'about', '<h4>1- Write about your website here.</h4>          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          <br><br>          <h4>2- Random title</h4>          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dxzcolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 'refund', '<h4>1- Write your Terms Of Use here.</h4>     \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          <br><br>          <h4>2- Random title</h4>          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `wo_tokens`
--

DROP TABLE IF EXISTS `wo_tokens`;
CREATE TABLE IF NOT EXISTS `wo_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) NOT NULL DEFAULT '',
  `time` int(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `app_id` (`app_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_userads`
--

DROP TABLE IF EXISTS `wo_userads`;
CREATE TABLE IF NOT EXISTS `wo_userads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(3000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `headline` varchar(200) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `location` varchar(1000) NOT NULL DEFAULT 'us',
  `audience` longtext DEFAULT NULL,
  `ad_media` varchar(3000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `gender` varchar(15) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL DEFAULT 'all',
  `bidding` varchar(15) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `clicks` int(15) NOT NULL DEFAULT 0,
  `views` int(15) NOT NULL DEFAULT 0,
  `posted` varchar(15) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `appears` varchar(10) NOT NULL DEFAULT 'post',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` varchar(50) NOT NULL DEFAULT '',
  `start` date NOT NULL,
  `end` date NOT NULL,
  `budget` float UNSIGNED NOT NULL DEFAULT 0,
  `spent` float UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `appears` (`appears`),
  KEY `user_id` (`user_id`),
  KEY `location` (`location`(255)),
  KEY `gender` (`gender`),
  KEY `status` (`status`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_userads_data`
--

DROP TABLE IF EXISTS `wo_userads_data`;
CREATE TABLE IF NOT EXISTS `wo_userads_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ad_id` int(11) NOT NULL DEFAULT 0,
  `clicks` int(15) NOT NULL DEFAULT 0,
  `views` int(15) NOT NULL DEFAULT 0,
  `spend` float UNSIGNED NOT NULL DEFAULT 0,
  `dt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ad_id` (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_userfields`
--

DROP TABLE IF EXISTS `wo_userfields`;
CREATE TABLE IF NOT EXISTS `wo_userfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wo_userfields`
--

INSERT INTO `wo_userfields` (`id`, `user_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `wo_users`
--

DROP TABLE IF EXISTS `wo_users`;
CREATE TABLE IF NOT EXISTS `wo_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(70) NOT NULL DEFAULT '',
  `first_name` varchar(60) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `avatar` varchar(100) NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `background_image` varchar(100) NOT NULL DEFAULT '',
  `background_image_status` enum('0','1') NOT NULL DEFAULT '0',
  `relationship_id` int(11) NOT NULL DEFAULT 0,
  `address` varchar(100) NOT NULL DEFAULT '',
  `working` varchar(32) NOT NULL DEFAULT '',
  `working_link` varchar(32) NOT NULL DEFAULT '',
  `about` text DEFAULT NULL,
  `school` varchar(32) NOT NULL DEFAULT '',
  `gender` varchar(32) NOT NULL DEFAULT 'male',
  `birthday` varchar(50) NOT NULL DEFAULT '0000-00-00',
  `country_id` int(11) NOT NULL DEFAULT 0,
  `website` varchar(50) NOT NULL DEFAULT '',
  `facebook` varchar(50) NOT NULL DEFAULT '',
  `google` varchar(50) NOT NULL DEFAULT '',
  `twitter` varchar(50) NOT NULL DEFAULT '',
  `linkedin` varchar(32) NOT NULL DEFAULT '',
  `youtube` varchar(100) NOT NULL DEFAULT '',
  `vk` varchar(32) NOT NULL DEFAULT '',
  `instagram` varchar(32) NOT NULL DEFAULT '',
  `qq` text DEFAULT NULL,
  `wechat` text DEFAULT NULL,
  `discord` text DEFAULT NULL,
  `mailru` text DEFAULT NULL,
  `language` varchar(31) NOT NULL DEFAULT 'english',
  `email_code` varchar(32) NOT NULL DEFAULT '',
  `src` varchar(32) NOT NULL DEFAULT 'Undefined',
  `ip_address` varchar(32) DEFAULT '',
  `follow_privacy` enum('1','0') NOT NULL DEFAULT '0',
  `friend_privacy` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `post_privacy` varchar(255) NOT NULL DEFAULT 'ifollow',
  `message_privacy` enum('1','0','2') NOT NULL DEFAULT '0',
  `confirm_followers` enum('1','0') NOT NULL DEFAULT '0',
  `show_activities_privacy` enum('0','1') NOT NULL DEFAULT '1',
  `birth_privacy` enum('0','1','2') NOT NULL DEFAULT '0',
  `visit_privacy` enum('0','1') NOT NULL DEFAULT '0',
  `verified` enum('1','0') NOT NULL DEFAULT '0',
  `lastseen` int(32) NOT NULL DEFAULT 0,
  `showlastseen` enum('1','0') NOT NULL DEFAULT '1',
  `emailNotification` enum('1','0') NOT NULL DEFAULT '1',
  `e_liked` enum('0','1') NOT NULL DEFAULT '1',
  `e_wondered` enum('0','1') NOT NULL DEFAULT '1',
  `e_shared` enum('0','1') NOT NULL DEFAULT '1',
  `e_followed` enum('0','1') NOT NULL DEFAULT '1',
  `e_commented` enum('0','1') NOT NULL DEFAULT '1',
  `e_visited` enum('0','1') NOT NULL DEFAULT '1',
  `e_liked_page` enum('0','1') NOT NULL DEFAULT '1',
  `e_mentioned` enum('0','1') NOT NULL DEFAULT '1',
  `e_joined_group` enum('0','1') NOT NULL DEFAULT '1',
  `e_accepted` enum('0','1') NOT NULL DEFAULT '1',
  `e_profile_wall_post` enum('0','1') NOT NULL DEFAULT '1',
  `e_sentme_msg` enum('0','1') NOT NULL DEFAULT '0',
  `e_last_notif` varchar(50) NOT NULL DEFAULT '0',
  `notification_settings` varchar(400) NOT NULL DEFAULT '{"e_liked":1,"e_shared":1,"e_wondered":0,"e_commented":1,"e_followed":1,"e_accepted":1,"e_mentioned":1,"e_joined_group":1,"e_liked_page":1,"e_visited":1,"e_profile_wall_post":1,"e_memory":1}',
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `active` enum('0','1','2') NOT NULL DEFAULT '0',
  `admin` enum('0','1','2') NOT NULL DEFAULT '0',
  `type` varchar(11) NOT NULL DEFAULT 'user',
  `registered` varchar(32) NOT NULL DEFAULT '0/0000',
  `start_up` enum('0','1') NOT NULL DEFAULT '0',
  `start_up_info` enum('0','1') NOT NULL DEFAULT '0',
  `startup_follow` enum('0','1') NOT NULL DEFAULT '0',
  `startup_image` enum('0','1') NOT NULL DEFAULT '0',
  `last_email_sent` int(32) NOT NULL DEFAULT 0,
  `phone_number` varchar(32) NOT NULL DEFAULT '',
  `sms_code` int(11) NOT NULL DEFAULT 0,
  `is_pro` enum('0','1') NOT NULL DEFAULT '0',
  `pro_time` int(11) NOT NULL DEFAULT 0,
  `pro_type` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `joined` int(11) NOT NULL DEFAULT 0,
  `css_file` varchar(100) NOT NULL DEFAULT '',
  `timezone` varchar(50) NOT NULL DEFAULT '',
  `referrer` int(11) NOT NULL DEFAULT 0,
  `ref_user_id` int(11) NOT NULL DEFAULT 0,
  `balance` varchar(100) NOT NULL DEFAULT '0',
  `paypal_email` varchar(100) NOT NULL DEFAULT '',
  `notifications_sound` enum('0','1') NOT NULL DEFAULT '0',
  `order_posts_by` enum('0','1') NOT NULL DEFAULT '1',
  `social_login` enum('0','1') NOT NULL DEFAULT '0',
  `android_m_device_id` varchar(50) NOT NULL DEFAULT '',
  `ios_m_device_id` varchar(50) NOT NULL DEFAULT '',
  `android_n_device_id` varchar(50) NOT NULL DEFAULT '',
  `ios_n_device_id` varchar(50) NOT NULL DEFAULT '',
  `web_device_id` varchar(100) NOT NULL DEFAULT '',
  `wallet` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0.00',
  `lat` varchar(200) NOT NULL DEFAULT '0',
  `lng` varchar(200) NOT NULL DEFAULT '0',
  `last_location_update` varchar(30) NOT NULL DEFAULT '0',
  `share_my_location` int(11) NOT NULL DEFAULT 1,
  `last_data_update` int(11) NOT NULL DEFAULT 0,
  `details` varchar(300) NOT NULL DEFAULT '{"post_count":0,"album_count":0,"following_count":0,"followers_count":0,"groups_count":0,"likes_count":0}',
  `sidebar_data` text DEFAULT NULL,
  `last_avatar_mod` int(11) NOT NULL DEFAULT 0,
  `last_cover_mod` int(11) NOT NULL DEFAULT 0,
  `points` float UNSIGNED NOT NULL DEFAULT 0,
  `daily_points` int(11) NOT NULL DEFAULT 0,
  `point_day_expire` varchar(50) NOT NULL DEFAULT '',
  `last_follow_id` int(11) NOT NULL DEFAULT 0,
  `share_my_data` int(11) NOT NULL DEFAULT 1,
  `last_login_data` text DEFAULT NULL,
  `two_factor` int(11) NOT NULL DEFAULT 0,
  `new_email` varchar(255) NOT NULL DEFAULT '',
  `two_factor_verified` int(11) NOT NULL DEFAULT 0,
  `new_phone` varchar(32) NOT NULL DEFAULT '',
  `info_file` varchar(300) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `zip` varchar(11) NOT NULL DEFAULT '',
  `school_completed` int(11) NOT NULL DEFAULT 0,
  `weather_unit` varchar(11) NOT NULL DEFAULT 'us',
  `paystack_ref` varchar(100) NOT NULL DEFAULT '',
  `code_sent` int(11) NOT NULL DEFAULT 0,
  `StripeSessionId` text DEFAULT NULL,
  `time_code_sent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `active` (`active`),
  KEY `admin` (`admin`),
  KEY `src` (`src`),
  KEY `gender` (`gender`),
  KEY `avatar` (`avatar`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `registered` (`registered`),
  KEY `joined` (`joined`),
  KEY `phone_number` (`phone_number`) USING BTREE,
  KEY `referrer` (`referrer`),
  KEY `wallet` (`wallet`),
  KEY `friend_privacy` (`friend_privacy`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`),
  KEY `order1` (`username`,`user_id`),
  KEY `order2` (`email`,`user_id`),
  KEY `order3` (`lastseen`,`user_id`),
  KEY `order4` (`active`,`user_id`),
  KEY `last_data_update` (`last_data_update`),
  KEY `points` (`points`),
  KEY `paystack_ref` (`paystack_ref`),
  KEY `relationship_id` (`relationship_id`),
  KEY `post_privacy` (`post_privacy`),
  KEY `email_code` (`email_code`),
  KEY `password` (`password`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `is_pro` (`is_pro`),
  KEY `ref_user_id` (`ref_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_users`
--

INSERT INTO `wo_users` (`user_id`, `username`, `email`, `password`, `first_name`, `last_name`, `avatar`, `cover`, `background_image`, `background_image_status`, `relationship_id`, `address`, `working`, `working_link`, `about`, `school`, `gender`, `birthday`, `country_id`, `website`, `facebook`, `google`, `twitter`, `linkedin`, `youtube`, `vk`, `instagram`, `qq`, `wechat`, `discord`, `mailru`, `language`, `email_code`, `src`, `ip_address`, `follow_privacy`, `friend_privacy`, `post_privacy`, `message_privacy`, `confirm_followers`, `show_activities_privacy`, `birth_privacy`, `visit_privacy`, `verified`, `lastseen`, `showlastseen`, `emailNotification`, `e_liked`, `e_wondered`, `e_shared`, `e_followed`, `e_commented`, `e_visited`, `e_liked_page`, `e_mentioned`, `e_joined_group`, `e_accepted`, `e_profile_wall_post`, `e_sentme_msg`, `e_last_notif`, `notification_settings`, `status`, `active`, `admin`, `type`, `registered`, `start_up`, `start_up_info`, `startup_follow`, `startup_image`, `last_email_sent`, `phone_number`, `sms_code`, `is_pro`, `pro_time`, `pro_type`, `joined`, `css_file`, `timezone`, `referrer`, `ref_user_id`, `balance`, `paypal_email`, `notifications_sound`, `order_posts_by`, `social_login`, `android_m_device_id`, `ios_m_device_id`, `android_n_device_id`, `ios_n_device_id`, `web_device_id`, `wallet`, `lat`, `lng`, `last_location_update`, `share_my_location`, `last_data_update`, `details`, `sidebar_data`, `last_avatar_mod`, `last_cover_mod`, `points`, `daily_points`, `point_day_expire`, `last_follow_id`, `share_my_data`, `last_login_data`, `two_factor`, `new_email`, `two_factor_verified`, `new_phone`, `info_file`, `city`, `state`, `zip`, `school_completed`, `weather_unit`, `paystack_ref`, `code_sent`, `StripeSessionId`, `time_code_sent`) VALUES
(1, 'admin', 'truong.vd2000@gmail.com', '$2y$10$zEpcOxYTx2U2RyYqzJIZYuPPxFSxdrDA/k1Nw3Dl4vsMnDKaMD9BG', 'Võ', 'Trường', 'upload/photos/2021/11/CbDGxQngo5pVFDn9CK3i_09_4162157762e2c4d7ba7e168091c066cd_avatar.jpg', 'upload/photos/2021/11/Srofs9lHxRzkGPv38QWK_09_d08d5e63aa4ff331725009314640a7d1_cover.jpg', 'upload/photos/2021/09/lk3H6zomuH3oCMu6Wy4U_17_acb26a5a4b9a568eef973c361b1271d5_background_image.jpg', '0', 2, '', 'KMK GROUP', '', 'Be all you can be', 'IT College', 'male', '0000-00-00', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '', 'Undefined', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '1', 1636621713, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '1', 'user', '00/0000', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631776439, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.7765', '106.7009', '1637041361', 1, 1636621610, '{\"post_count\":\"24\",\"album_count\":\"0\",\"following_count\":\"1\",\"followers_count\":\"1\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":1}', '{\"following_data\":[\"2\"],\"followers_data\":[\"2\"],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[\"2\"]}', 1636439533, 1636439439, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 1, 'us', '', 0, NULL, 0),
(2, 'thaovy', 'lhthaovy@gmail.com', '$2y$10$VLP8JWpSMFAofBBwkStXnO1oe7uGi.q5CBdaMGscrD.cUASNpJNfm', 'Hà', 'Vy', 'upload/photos/2021/11/7cwL38ih9LWKYOwFxOWv_11_0d61d8716e3dda35cdca6709f6fae1d1_avatar.jpg', 'upload/photos/2021/09/7SMwOpfQiJYfj49lYEl1_16_734f4249ff389ca4882a69ef48f6685c_cover.jpg', '', '0', 2, '', '', '', '', 'HUFLIT', 'female', '0000-00-00', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', 'dfe17281194995562c6d0d096950ac85', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '1', 1636621846, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '1', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631785790, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.7765', '106.7009', '1637226034', 1, 1636621783, '{\"post_count\":\"4\",\"album_count\":\"0\",\"following_count\":\"1\",\"followers_count\":\"1\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":1}', '{\"following_data\":[\"1\"],\"followers_data\":[\"1\"],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[\"1\"]}', 1636621442, 1631785862, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(4, 'thanhphong', 'thanhphong_opp289@gmail.com', '$2y$10$FyRW5GWu5TAMc/QxCqSWruAkfX7AX8i95bkuVvaIt2R5CvWqUCrPW', 'Thanh', 'Phong', 'upload/photos/f-avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '3T GROUP', '', '', '', 'female', '0000-00-00', 0, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '3f87aa27b08842143dedd1bd1d76802c', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631872717, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631872668, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632477470', 1, 1631872681, '{\"post_count\":\"0\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(5, 'nganth19', 'ngan.thnguyen@gmail.com', '$2y$10$j0zB/1JTMV5iSt/N0JVHdeQcvoA/33yCsZ6vLG4HmRXi6GqaYdENO', 'Thanh', 'Ngân', 'upload/photos/2021/09/AoxUUNuAgCU5zXypTljU_17_25ea3dbff6496141452bad3d97dd9b24_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'female', '1998-04-22', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', 'd2ec42881a0d61441d75c0945c4ebbfd', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631872959, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631872788, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632477590', 1, 1631879917, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(6, 'tanhoa3t', 'suzukitanhoa.123@gmail.com', '$2y$10$PtANplAfgEXM6DUql52dGezT6aSAaJdZtCvf9mm/Fbj2K6h5xqKwG', 'Tấn', 'Hòa', 'upload/photos/2021/09/cqAMG2VtieHJo93eDwWV_17_854c142025a8a466c1f9638d12170a36_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '5fdaf891dd15fc75ec7a806fa9b3c045', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873122, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873009, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632477811', 1, 1632153682, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(7, 'bapzzzbap', 'ngothangbapzzz@gmail.com', '$2y$10$1L8opAAiacnT.PLYhZhbXevwCt4E5CTeMQbouoDIrCVSLJdlI1ry2', 'Thắng', 'Ngô', 'upload/photos/2021/09/XDa4lB382tHa9Ffni7cT_17_e817b884351003d5d92423d91ff02a9c_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '9a7596da03555b29dc4d33925c9c3fdf', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873271, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873165, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632477980', 1, 1631873203, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(8, 'ginle', 'ginleduchoa@gmail.com', '$2y$10$HGX55nuHDe.ifDgliMd5QuLQzkBoBj36iEkwOTKQcaGVZU15Qbg5q', 'Gin', 'Lê', 'upload/photos/2021/09/EYbVJiU8KlJhUg9fTrSp_17_0dd67963aeb40c566e4170755c453005_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '1c220a1be6581061d9c792533a6aac83', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873380, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873298, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478099', 1, 1632051603, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(9, 'ngocdang199', 'ngocdang199@gmail.com', '$2y$10$SuLvZC.XJfZOE8QEKnTIbuseWXgdTHvnPW9bNlaJdqkP9P.hk3uXe', 'Đăng', 'Nguyễn', 'upload/photos/2021/09/5zrNqRfDmUA5qkvwTbaC_17_af4b6a28f2bb4c889b71dba93042e07b_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', 'f0144755e2011ca178356baf7618517a', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873499, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873407, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6787669', '106.6179261', '1632478209', 1, 1631873431, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(10, 'thiensangvip', 'thiensang18299@gmail.com', '$2y$10$6KrdF3khUky7AE5vfWR2MOKaDrpsKBa6hR0Bu.vmdNE0SVNfrfrqK', 'Thiện', 'Sang', 'upload/photos/2021/09/yEfKXVOwgD68FQjMQBRi_17_72429bf29d91f936ce679f22b51b030c_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '3a43d1aaf73e5862f9126dbacb31c8ff', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631983822, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873528, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478329', 1, 1636621172, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(11, 'xuantruc', 'xuantruc@gmail.com', '$2y$10$5IfyV2cQMOrS5odn2mWUpeYHZTromGc78LgEh0n/0NrZQGZCWOpX6', 'Trúc', 'Ngô', 'upload/photos/2021/09/hb9NLgcQcgpoLntDXzuF_17_d25c97c1a10207da5ae9376a4bff4e9b_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '3T GROUP', '', '', '', 'female', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '9e6a81c812c6c79969f43b6a9753d1f1', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873738, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873640, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478442', 1, 1632231454, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(12, 'hoatrangthanh', 'tranthanhhoa99@gmail.com', '$2y$10$Dup6A7el3KV0vb4C/fUdS.enAHekUR5743dyMciKu.BWg4RHkwaN.', 'Trần Thanh', 'Hòa', 'upload/photos/2021/09/mzhBhlLDylStOjVs7zrN_17_f8409de0c83fdeb4e6d745a4f2b761ae_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', 'fce5cae7286778f3a0281e46d7b9efa0', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873818, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873766, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478568', 1, 1631873788, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(13, 'giahuyluong', 'luonggiahuy@gmail.com', '$2y$10$plq7qVnVej/Qxse4s1gI5eOhHL6Cc0klFTJ/xNE5PxhTTa3VCbSkK', 'Gia', 'Huy', 'upload/photos/2021/09/ByALQGLHkSY65HNdaAyh_17_80305a9dbc2e0ea5d10fb097323da288_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'male', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '7de46b55003ceb5aff825a42951dc24c', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631873891, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873851, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478652', 1, 1632240264, '{\"post_count\":\"1\",\"album_count\":\"0\",\"following_count\":\"0\",\"followers_count\":\"0\",\"groups_count\":\"0\",\"likes_count\":\"0\",\"mutual_friends_count\":0}', '{\"following_data\":[],\"followers_data\":[],\"likes_data\":[],\"groups_data\":[],\"mutual_friends_data\":[]}', 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0),
(14, 'thanhthuy', 'thanhthuy@gmail.com', '$2y$10$.wyOUzJgw0e9gcOcWOYeiekk0Ds.J8aeLKnc2ZShpQDzjeI3pdHEO', 'Thanh', 'Thủy', 'upload/photos/2021/09/AiaUhJpKgPGhBSheWZLy_17_63addb046cd8fa8c6c1c939562bf5e2d_avatar.jpg', 'upload/photos/d-cover.jpg', '', '0', 0, '', '', '', NULL, '', 'female', '00-00-0000', 233, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'vietnammese', '51afbaf593c481486bd3292c201a7833', 'site', '::1', '0', '0', 'ifollow', '0', '0', '1', '0', '0', '0', 1631874011, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '{\"e_liked\":1,\"e_shared\":1,\"e_wondered\":0,\"e_commented\":1,\"e_followed\":1,\"e_accepted\":1,\"e_mentioned\":1,\"e_joined_group\":1,\"e_liked_page\":1,\"e_visited\":1,\"e_profile_wall_post\":1,\"e_memory\":1}', '0', '1', '0', 'user', '9/2021', '1', '1', '1', '1', 0, '', 0, '0', 0, '0', 1631873956, '', '', 0, 0, '0', '', '0', '0', '0', '', '', '', '', '', '0.00', '10.6739388', '106.617353', '1632478782', 1, 0, '{\"post_count\":0,\"album_count\":0,\"following_count\":0,\"followers_count\":0,\"groups_count\":0,\"likes_count\":0}', NULL, 0, 0, 0, 0, '', 0, 1, NULL, 0, '', 0, '', '', '', '', '', 0, 'us', '', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wo_userschat`
--

DROP TABLE IF EXISTS `wo_userschat`;
CREATE TABLE IF NOT EXISTS `wo_userschat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `conversation_user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `color` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `conversation_user_id` (`conversation_user_id`),
  KEY `time` (`time`),
  KEY `order1` (`user_id`,`id`),
  KEY `order2` (`user_id`,`id`),
  KEY `order3` (`conversation_user_id`,`id`),
  KEY `order4` (`conversation_user_id`,`id`),
  KEY `page_id` (`page_id`),
  KEY `color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wo_userschat`
--

INSERT INTO `wo_userschat` (`id`, `user_id`, `conversation_user_id`, `page_id`, `time`, `color`) VALUES
(1, 1, 2, 0, 1636621647, '#ff72d2'),
(2, 2, 1, 0, 1636621647, '#ff72d2'),
(3, 10, 1, 0, 1632151693, ''),
(4, 1, 10, 0, 1632151693, '');

-- --------------------------------------------------------

--
-- Table structure for table `wo_userstory`
--

DROP TABLE IF EXISTS `wo_userstory`;
CREATE TABLE IF NOT EXISTS `wo_userstory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `description` varchar(300) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '',
  `expire` varchar(100) DEFAULT '',
  `thumbnail` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `expires` (`expire`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_userstory`
--

INSERT INTO `wo_userstory` (`id`, `user_id`, `title`, `description`, `posted`, `expire`, `thumbnail`) VALUES
(6, 1, '', '', '1636621198', '1636707598', 'upload/photos/2021/11/1YKMmExhRzqBo7VVhBQ9_11_ed3052359abfb61dd9d2170e6a136a72_image_small.jpg'),
(7, 2, '', '', '1636621242', '1636707642', 'upload/photos/2021/11/uwEqNrKmnlbFqwxynofX_11_152916003434d4ae276fc7d249bd259b_image_small.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wo_userstorymedia`
--

DROP TABLE IF EXISTS `wo_userstorymedia`;
CREATE TABLE IF NOT EXISTS `wo_userstorymedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(30) NOT NULL DEFAULT 0,
  `type` varchar(30) NOT NULL DEFAULT '',
  `filename` text DEFAULT NULL,
  `expire` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `expire` (`expire`),
  KEY `story_id` (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wo_userstorymedia`
--

INSERT INTO `wo_userstorymedia` (`id`, `story_id`, `type`, `filename`, `expire`) VALUES
(6, 6, 'image', 'upload/photos/2021/11/1YKMmExhRzqBo7VVhBQ9_11_ed3052359abfb61dd9d2170e6a136a72_image.jpg', '1636707598'),
(7, 7, 'image', 'upload/photos/2021/11/uwEqNrKmnlbFqwxynofX_11_152916003434d4ae276fc7d249bd259b_image.jpg', '1636707642');

-- --------------------------------------------------------

--
-- Table structure for table `wo_user_gifts`
--

DROP TABLE IF EXISTS `wo_user_gifts`;
CREATE TABLE IF NOT EXISTS `wo_user_gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL DEFAULT 0,
  `to` int(11) NOT NULL DEFAULT 0,
  `gift_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`),
  KEY `gift_id` (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wo_verification_requests`
--

DROP TABLE IF EXISTS `wo_verification_requests`;
CREATE TABLE IF NOT EXISTS `wo_verification_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page_id` int(11) NOT NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 DEFAULT NULL,
  `user_name` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `passport` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `photo` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_videocalles`
--

DROP TABLE IF EXISTS `wo_videocalles`;
CREATE TABLE IF NOT EXISTS `wo_videocalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` text DEFAULT NULL,
  `access_token_2` text DEFAULT NULL,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `room_name` varchar(50) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `called` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `declined` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`),
  KEY `called` (`called`),
  KEY `declined` (`declined`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_votes`
--

DROP TABLE IF EXISTS `wo_votes`;
CREATE TABLE IF NOT EXISTS `wo_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `option_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wo_wonders`
--

DROP TABLE IF EXISTS `wo_wonders`;
CREATE TABLE IF NOT EXISTS `wo_wonders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
