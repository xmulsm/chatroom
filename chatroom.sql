-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-01-09 04:27:42
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatroom`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add auth group', 7, 'add_authgroup'),
(20, 'Can change auth group', 7, 'change_authgroup'),
(21, 'Can delete auth group', 7, 'delete_authgroup'),
(22, 'Can add auth group permissions', 8, 'add_authgrouppermissions'),
(23, 'Can change auth group permissions', 8, 'change_authgrouppermissions'),
(24, 'Can delete auth group permissions', 8, 'delete_authgrouppermissions'),
(25, 'Can add auth permission', 9, 'add_authpermission'),
(26, 'Can change auth permission', 9, 'change_authpermission'),
(27, 'Can delete auth permission', 9, 'delete_authpermission'),
(28, 'Can add auth user', 10, 'add_authuser'),
(29, 'Can change auth user', 10, 'change_authuser'),
(30, 'Can delete auth user', 10, 'delete_authuser'),
(31, 'Can add auth user groups', 11, 'add_authusergroups'),
(32, 'Can change auth user groups', 11, 'change_authusergroups'),
(33, 'Can delete auth user groups', 11, 'delete_authusergroups'),
(34, 'Can add auth user user permissions', 12, 'add_authuseruserpermissions'),
(35, 'Can change auth user user permissions', 12, 'change_authuseruserpermissions'),
(36, 'Can delete auth user user permissions', 12, 'delete_authuseruserpermissions'),
(37, 'Can add chat log', 13, 'add_chatlog'),
(38, 'Can change chat log', 13, 'change_chatlog'),
(39, 'Can delete chat log', 13, 'delete_chatlog'),
(40, 'Can add chat room', 14, 'add_chatroom'),
(41, 'Can change chat room', 14, 'change_chatroom'),
(42, 'Can delete chat room', 14, 'delete_chatroom'),
(43, 'Can add django admin log', 15, 'add_djangoadminlog'),
(44, 'Can change django admin log', 15, 'change_djangoadminlog'),
(45, 'Can delete django admin log', 15, 'delete_djangoadminlog'),
(46, 'Can add django content type', 16, 'add_djangocontenttype'),
(47, 'Can change django content type', 16, 'change_djangocontenttype'),
(48, 'Can delete django content type', 16, 'delete_djangocontenttype'),
(49, 'Can add django migrations', 17, 'add_djangomigrations'),
(50, 'Can change django migrations', 17, 'change_djangomigrations'),
(51, 'Can delete django migrations', 17, 'delete_djangomigrations'),
(52, 'Can add django session', 18, 'add_djangosession'),
(53, 'Can change django session', 18, 'change_djangosession'),
(54, 'Can delete django session', 18, 'delete_djangosession'),
(55, 'Can add msg type', 19, 'add_msgtype'),
(56, 'Can change msg type', 19, 'change_msgtype'),
(57, 'Can delete msg type', 19, 'delete_msgtype'),
(58, 'Can add user profile', 20, 'add_userprofile'),
(59, 'Can change user profile', 20, 'change_userprofile'),
(60, 'Can delete user profile', 20, 'delete_userprofile'),
(61, 'Can add message', 21, 'add_message'),
(62, 'Can change message', 21, 'change_message'),
(63, 'Can delete message', 21, 'delete_message'),
(64, 'Can add room', 22, 'add_room'),
(65, 'Can change room', 22, 'change_room'),
(66, 'Can delete room', 22, 'delete_room');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` timestamp NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(12, 'e10adc3949ba59abbe56e057f20f883e', '2017-01-09 11:53:40.418092', 0, 'test22', '', '', '', 0, 1, '2017-01-08 01:45:29.596903'),
(11, '9eab700ced8bf1bfd2207287b6042593', NULL, 0, '使得发达省份', '', '', '', 0, 1, '2017-01-06 12:28:30.735477'),
(10, '2811c7ce7cf07343ce2c433808c65905', NULL, 0, 'dfadsf', '', '', '', 0, 1, '2017-01-05 02:54:35.296344'),
(9, 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, 'test2', '', '', '', 0, 1, '2017-01-05 02:54:08.011316'),
(7, 'e10adc3949ba59abbe56e057f20f883e', '2017-01-09 11:16:18.346192', 0, 'test', '', '', '', 0, 1, '2017-01-05 02:51:55.944423');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `chatol_message`
--

CREATE TABLE `chatol_message` (
  `id` int(11) NOT NULL,
  `handle` longtext NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `chatol_room`
--

CREATE TABLE `chatol_room` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chatol_room`
--

INSERT INTO `chatol_room` (`id`, `name`, `label`) VALUES
(1, '', 'default');

-- --------------------------------------------------------

--
-- 表的结构 `chat_log`
--

CREATE TABLE `chat_log` (
  `msg_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_content` varchar(512) DEFAULT NULL,
  `msg_type_id` int(11) NOT NULL,
  `state_time` datetime DEFAULT NULL,
  `chat_room_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `chat_message`
--

CREATE TABLE `chat_message` (
  `id` int(11) NOT NULL,
  `handle` longtext NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chat_message`
--

INSERT INTO `chat_message` (`id`, `handle`, `message`, `timestamp`) VALUES
(1, '算法', '斯蒂芬', '2017-01-06 15:39:00.000000'),
(2, '算法', '斯蒂芬', '2017-01-06 15:39:00.000000');

-- --------------------------------------------------------

--
-- 表的结构 `chat_room`
--

CREATE TABLE `chat_room` (
  `chat_room_id` int(11) NOT NULL,
  `chat_room_name` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chat_room`
--

INSERT INTO `chat_room` (`chat_room_id`, `chat_room_name`, `create_time`) VALUES
(1, 'default', '2017-01-06 20:15:00');

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'chatOL', 'authgroup'),
(8, 'chatOL', 'authgrouppermissions'),
(9, 'chatOL', 'authpermission'),
(10, 'chatOL', 'authuser'),
(11, 'chatOL', 'authusergroups'),
(12, 'chatOL', 'authuseruserpermissions'),
(13, 'chatOL', 'chatlog'),
(14, 'chatOL', 'chatroom'),
(15, 'chatOL', 'djangoadminlog'),
(16, 'chatOL', 'djangocontenttype'),
(17, 'chatOL', 'djangomigrations'),
(18, 'chatOL', 'djangosession'),
(19, 'chatOL', 'msgtype'),
(20, 'chatOL', 'userprofile'),
(21, 'chatOL', 'message'),
(22, 'chatOL', 'room');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-01-05 01:18:01.170632'),
(2, 'auth', '0001_initial', '2017-01-05 01:18:01.613539'),
(3, 'admin', '0001_initial', '2017-01-05 01:18:01.723056'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-01-05 01:18:01.759079'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-01-05 01:18:01.831158'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-01-05 01:18:01.868465'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-01-05 01:18:01.918518'),
(8, 'auth', '0004_alter_user_username_opts', '2017-01-05 01:18:01.930510'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-01-05 01:18:01.961604'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-01-05 01:18:01.966609'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-01-05 01:18:01.979618'),
(12, 'chatOL', '0001_initial', '2017-01-05 01:18:02.011063'),
(13, 'sessions', '0001_initial', '2017-01-05 01:18:02.057182'),
(14, 'chatOL', '0002_message', '2017-01-06 13:27:46.455326'),
(15, 'chatOL', '0003_auto_20170106_2137', '2017-01-06 13:37:22.110857'),
(16, 'chatOL', '0004_auto_20170108_1739', '2017-01-08 09:40:10.188556'),
(17, 'chatOL', '0005_auto_20170108_1750', '2017-01-08 09:50:31.832249'),
(18, 'chatOL', '0006_auto_20170108_1845', '2017-01-08 18:45:48.551614'),
(19, 'chatOL', '0007_auto_20170108_1857', '2017-01-08 10:57:56.401286'),
(20, 'chatOL', '0008_auto_20170108_1901', '2017-01-08 11:01:27.383654');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('chnf9afcd20fb6e2019320b2b0a1b84f', 'NzE5YjJiYTY3Y2NiMjA2ZGE0MWM2ZWFiYzNiYmQyMDgwYTRmMDMwNjp7fQ==', '2017-01-20 12:57:11.306419'),
('chnb9bea5ff78fd71d4e4c4576c8c86f', 'MWFkNDhkZDVlZjI5YzNlYjNiNWM1MDA4OTI2OWQ1M2Q1ODM3NGI0Zjp7fQ==', '2017-01-20 12:59:11.415797'),
('chnd88b455fb01edf12324a420164a11', 'MWFkNDhkZDVlZjI5YzNlYjNiNWM1MDA4OTI2OWQ1M2Q1ODM3NGI0Zjp7fQ==', '2017-01-20 12:59:51.689139'),
('chn3760e42209a6d31d3c9c789faf666', 'ZjliYmJhYzBhOTMyNzAyMDkwNjc4ODAwNzFjNDBmMDUxZmNjZTE0MDp7fQ==', '2017-01-20 13:00:28.740574'),
('chnd64a3479a2d1e453fd45c49915467', 'YmJmNDc3ODIyNzk2OWQyN2RhOGI5NjZkNTJmZWY5NDAyNWFkYjE2NDp7fQ==', '2017-01-20 13:07:13.864122'),
('chn52e2232c5cb490855ea0193be413f', 'M2JmNTdhYzdhNDE0YzYyY2E0ODUxY2U1N2ZmZjk2NmU3NDQ0ZjkzMTp7fQ==', '2017-01-20 12:30:44.220213'),
('chnb8105338cacf1ca6beab3aa8e5ede', 'ZjliYmJhYzBhOTMyNzAyMDkwNjc4ODAwNzFjNDBmMDUxZmNjZTE0MDp7fQ==', '2017-01-20 13:01:03.703477'),
('chnd7d66cc248333801aeb3e759c030c', 'NGMxNDQ0MWY3Mjc2MjY2YTYyNDY1YTA5NGYyZGRlNDhhNjYzMGQ5YTp7fQ==', '2017-01-20 13:04:35.835067'),
('chn5370a6bd294b26be42ea6dfb998bf', 'NGMxNDQ0MWY3Mjc2MjY2YTYyNDY1YTA5NGYyZGRlNDhhNjYzMGQ5YTp7fQ==', '2017-01-20 13:04:38.045913'),
('chnd4787f8f369d7cf95813cbcef1dc8', 'YmJmNDc3ODIyNzk2OWQyN2RhOGI5NjZkNTJmZWY5NDAyNWFkYjE2NDp7fQ==', '2017-01-20 13:06:03.522676'),
('chnbbf4856fa11b23d6bc6d99109227f', 'YmJmNDc3ODIyNzk2OWQyN2RhOGI5NjZkNTJmZWY5NDAyNWFkYjE2NDp7fQ==', '2017-01-20 13:07:07.644516'),
('chn339bfdea36eed4f418e62b9b25d32', 'YmJmNDc3ODIyNzk2OWQyN2RhOGI5NjZkNTJmZWY5NDAyNWFkYjE2NDp7fQ==', '2017-01-20 13:05:04.836838'),
('chn1abea826daa6746b619f12646e9c6', 'YmJmNDc3ODIyNzk2OWQyN2RhOGI5NjZkNTJmZWY5NDAyNWFkYjE2NDp7fQ==', '2017-01-20 13:05:07.052671'),
('chn982cbabd25b8466bd2685c51edc15', 'NjczMmI0ZTQ2YmI4NzI1MDk3NTM0OTUwZmZhYTdmOTQ0NDNhM2UwNTp7fQ==', '2017-01-20 13:15:18.514787'),
('chn48108f2a8679f6cdebb14d200a262', 'NjczMmI0ZTQ2YmI4NzI1MDk3NTM0OTUwZmZhYTdmOTQ0NDNhM2UwNTp7fQ==', '2017-01-20 13:18:16.036956'),
('chna18e5441d3da5bc1be384113dce60', 'Yzg5MTM0YzcxZDlkNDYyOGEyNzJlOGQ3MDU5OGMyYWJiNDY3YjQ3Zjp7fQ==', '2017-01-20 13:19:52.901613'),
('chnc7cc8b035bba5677989855f8845a3', 'MGQyZGE4MWE3NDMyZGE1NjhlOGM2ZTgxYjA2YWI3N2Q5NmYyN2Q4Njp7fQ==', '2017-01-20 13:10:12.675503'),
('chn95e28ce006546ff315b4f2684f738', 'NjczMmI0ZTQ2YmI4NzI1MDk3NTM0OTUwZmZhYTdmOTQ0NDNhM2UwNTp7fQ==', '2017-01-20 13:15:12.607689'),
('chn25927a1fd175601dc0471cdff4995', 'ZTc2ZjMyYzJkMjNhYzM3NWMzOTFjZjU4MTg4ZWUzZWU5YzhiZTkxNDp7fQ==', '2017-01-20 13:20:44.109061'),
('chn181c82b142c50d282b1c613a608d7', 'MDJkZDEzZjhmYWU0NjNmNjhkY2IyNWRiNTQxNzMyNGQ4Y2Q3NDIwZjp7fQ==', '2017-01-20 13:23:36.294060'),
('chn97b9174a6b275f733efd3d890fa7e', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:28:48.128537'),
('chn7bfd8e2f1d700f8f556a65d33d55d', 'ZTc2ZjMyYzJkMjNhYzM3NWMzOTFjZjU4MTg4ZWUzZWU5YzhiZTkxNDp7fQ==', '2017-01-20 13:20:30.352867'),
('chnc86a15ed96f8db4a50c11958c9f93', 'ZTBiNDBjZTk1NDAxM2I4NTcyOTY0MTljMTM5NjQ1YjE4MzZkZTk5ODp7fQ==', '2017-01-20 13:34:07.503948'),
('chn6feba79d2c56c776f980d32ca37d9', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:28:00.520559'),
('chnc058cf5a0b7e9cefac2f86a44e57c', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:28:46.968705'),
('chn6b42eae5f898c0b24c091dcf9b9b9', 'ZTBiNDBjZTk1NDAxM2I4NTcyOTY0MTljMTM5NjQ1YjE4MzZkZTk5ODp7fQ==', '2017-01-20 13:34:26.849137'),
('chna73a8fcc9eeff01dc803e954d59be', 'ZTg2YzNlMzk2ZjhjNzVkZGY0ZjhlNDlhNzMwNmQzZDI4OWY2OGEwZjp7fQ==', '2017-01-20 13:35:58.065865'),
('chn5abf4b3032afcc644cea9acbb5197', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:28:49.000000'),
('chn9cc66a2094bd227a78f1a9a134a56', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:29:21.342027'),
('chn10a5d60cfe3a4f0106d147040c71f', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:29:22.568823'),
('chnf10f7a39d06db5957d7e46abd6ac1', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:29:23.999834'),
('chne96dfa104b17a2825ef886b9404ee', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:30:07.985229'),
('chn830189fcbc928daa24d6b49e13d45', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:30:32.184961'),
('chn397826f567bc876e0e9a17c386d62', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:30:33.380441'),
('chnac31f617d220bf957c8c6e7149c91', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:31:00.474392'),
('chn90f09d7344b474bf29f55fc478ed2', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:31:01.594713'),
('chn82906ac28b908278c700cffc6f3cf', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:32:09.344459'),
('chn3baeaa6d8b41a5bb33d9bd631b750', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:32:10.283613'),
('chn404d996049254aebb38d1575f5f70', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:32:11.937210'),
('chne3abf2f03dcf291b81f1d5efeb54f', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:32:58.225136'),
('chn7d28715128cfa7f91fb1ef7ad4527', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:32:59.366986'),
('chn0729b2b2ecca43468c00decded3b1', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:33:05.980514'),
('chn31d9f17c78bb368350e7925aaa8a3', 'NWFmZjZlNjVjNTk0NDcyNzEzNmE3NmFjNTUwNjg1NDRhM2M5ZjM2Yzp7fQ==', '2017-01-20 13:33:39.311685'),
('chn8a3f5c01a6f9648dde4df5af541ba', 'ZTBiNDBjZTk1NDAxM2I4NTcyOTY0MTljMTM5NjQ1YjE4MzZkZTk5ODp7fQ==', '2017-01-20 13:34:02.587673'),
('chn744fb6c1f2379ab5edfa280b5e749', 'MzkyOGNjMTI1MzM3YzlmNjZkMzNlM2M2ZjExMDRlM2VkOWRhNWRjZTp7fQ==', '2017-01-20 13:38:28.419418'),
('chnc733d013adf6fd8200c054f49a4ae', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 13:38:50.410422'),
('1spm0th3mz7sivf8lm0cbn5pb46a2d31', 'MjhlZTY0ZTRjNzM1MTQ4YThmYjZiMmE5NzM3YTZkNmI2YjMyYWVlYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjciLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaGFzaCI6ImJlM2NlNDk2Y2U2OTgyM2UzZDg0ODM3ZjllODA0M2NlYTIyYTgyOTQiLCJ1c2VybmFtZSI6InRlc3QifQ==', '2017-01-06 14:08:52.749193'),
('chn7e33984d16da9ec9337245ef91fc6', 'ZjBhYjdiMTg1YmI0ZTQxMDM3ZThlYjgwZTdiMzg5MGM0MDE1M2JiNjp7fQ==', '2017-01-20 13:37:00.765660'),
('chn12e9ec289dc48a5014794bfd57a44', 'ZjBhYjdiMTg1YmI0ZTQxMDM3ZThlYjgwZTdiMzg5MGM0MDE1M2JiNjp7fQ==', '2017-01-20 13:37:03.035621'),
('chnd5e36dbd0ae0b4fd63f96a9e3f734', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 13:38:53.474043'),
('chn0340f987caac1183f0445a67259e1', 'NDJkYjc0OWI1MDA1MDMwZTNiOThhYWYyNGMxNGUxMjY4MGI5MWMxNzp7fQ==', '2017-01-20 14:17:37.572840'),
('chn1d4f1c06f8701744da4cd08759ef2', 'MWUwM2I4NzVmNjA5ZDEzMTQzZmE0NWFhZjY0NWQ5N2JjMmIwZDQ5YTp7fQ==', '2017-01-20 14:34:21.079945'),
('chn29a0f7ecbacf87f480f08b4315ccb', 'NWFiNzdmMmYxNmJlY2QzYjNjNTdhMWQ3MDczZGQyYTkyNDI4M2JiMzp7fQ==', '2017-01-20 14:14:30.987129'),
('chn60f26071de7811f763200786a327e', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:10:30.501331'),
('chna9a99d054f2119b65a61b4ff42b2d', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:11:06.889646'),
('chn22347466cf0cecc17882fffac2dc9', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:11:23.139019'),
('chn1260005dee4448f0f4875d40a0a7b', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:11:38.549836'),
('chn8ee3c5d08a052035597b244c627ba', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:11:59.175195'),
('chnb0f1d3b4a59f9abae811b61be8f8d', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:12:17.794639'),
('chnd6f70d4dc0e048e784540c330e878', 'MWExNmMxZmU4NmRiYmQ2Mzk4NDU3OTQ4ZWM1MDJjYjYyZDVhNGEyMDp7fQ==', '2017-01-20 14:13:53.177460'),
('chnd2abc8925fa771c9634757799c1fd', 'NWFiNzdmMmYxNmJlY2QzYjNjNTdhMWQ3MDczZGQyYTkyNDI4M2JiMzp7fQ==', '2017-01-20 14:14:25.432328'),
('chnfa6d63f2fa943b5807f67c0bc7348', 'NDJkYjc0OWI1MDA1MDMwZTNiOThhYWYyNGMxNGUxMjY4MGI5MWMxNzp7fQ==', '2017-01-20 14:17:54.615472'),
('chn9563fe374377c64547b6644993bae', 'NDJkYjc0OWI1MDA1MDMwZTNiOThhYWYyNGMxNGUxMjY4MGI5MWMxNzp7fQ==', '2017-01-20 14:19:13.959964'),
('chn5e8f07edd665f752a8a4ea95ac2fe', 'NDJkYjc0OWI1MDA1MDMwZTNiOThhYWYyNGMxNGUxMjY4MGI5MWMxNzp7fQ==', '2017-01-20 14:19:45.598852'),
('chna99c140d231f0451919fee466a673', 'MGYyYjM2NDA0M2YxOTJmMDkzY2Q3MjU0N2FkN2IzZmU0MDNmMWQ5Mjp7fQ==', '2017-01-20 14:25:48.211301'),
('chnac16d4d13f7f3bbc468df729ec1c6', 'MGYyYjM2NDA0M2YxOTJmMDkzY2Q3MjU0N2FkN2IzZmU0MDNmMWQ5Mjp7fQ==', '2017-01-20 14:26:50.681501'),
('chna626f488aec34f3568499b2d6f393', 'NDJkYjc0OWI1MDA1MDMwZTNiOThhYWYyNGMxNGUxMjY4MGI5MWMxNzp7fQ==', '2017-01-20 14:22:48.740145'),
('chn885e0ed2f70f78e34bc7e91b0b7da', 'Y2YzN2UwY2FjMmRlNWVlNmYwY2YyMGM0OTI4NTA3Y2ZmNTk4Mjk3Njp7fQ==', '2017-01-20 14:24:55.408389'),
('chnc95f2e8c3454dac25c1723a16d24a', 'MGYyYjM2NDA0M2YxOTJmMDkzY2Q3MjU0N2FkN2IzZmU0MDNmMWQ5Mjp7fQ==', '2017-01-20 14:25:42.113176'),
('chn4b60b1f0ed6f55a96e43521f64c6e', 'MWUwM2I4NzVmNjA5ZDEzMTQzZmE0NWFhZjY0NWQ5N2JjMmIwZDQ5YTp7fQ==', '2017-01-20 14:34:31.153038'),
('chnea0654aca9e5be09fb5ef04ef7cc2', 'MzA1OTU5NDVmYWMxNWI2YmFjOWIxYTA0ZDY5YjkzMmNjNGUxNGY2MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:34:58.363698'),
('chn77ba8505478a395ebb952858fe708', 'N2U5ODcwZDU2ZmI5ZDA2MDc0MWNlNTc3YTQzZjI1MDYyNTMzM2MwZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:36:02.616290'),
('chnd33818da52443fac448336e0a1548', 'ZWI2NGY0YWUyYmMzODM2NGFkYTIwZWU1ODk0Mzg2MzAzOTAyNmFmMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:37:02.490740'),
('chn67ad3978150876ebe988cfef31671', 'NGRmYzExMzc5ZWRlNTAxMDY4ZmNlOGMxYTBmYWM1MGViNWU3NmYwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:38:12.566864'),
('chn663009c0a52d1cee8a01e9d3bfe66', 'N2U5ODcwZDU2ZmI5ZDA2MDc0MWNlNTc3YTQzZjI1MDYyNTMzM2MwZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:35:56.666195'),
('chn535c2ca01809f4eb606a042e9de5b', 'MzA1OTU5NDVmYWMxNWI2YmFjOWIxYTA0ZDY5YjkzMmNjNGUxNGY2MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:35:03.331972'),
('chn0eebc46ae8d4393cb0881446a0c19', 'ZWI2NGY0YWUyYmMzODM2NGFkYTIwZWU1ODk0Mzg2MzAzOTAyNmFmMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:37:07.772400'),
('chn4ad626e06e400c3f6a9d1b491287a', 'NGRmYzExMzc5ZWRlNTAxMDY4ZmNlOGMxYTBmYWM1MGViNWU3NmYwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:37:56.678140'),
('chn66e48533b3b4918a8fbc22b5ed15a', 'YzY5OWJjZTEyZjYzMWY2NDA4YjA2Zjk0MzE3NDVkNzg3ZWU1NTUzYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:39:48.822845'),
('chn4de9487e714bac53e7003e4aff94a', 'YzY5OWJjZTEyZjYzMWY2NDA4YjA2Zjk0MzE3NDVkNzg3ZWU1NTUzYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:39:51.143014'),
('chnd0555391708be647d39319cce8a70', 'YzY5OWJjZTEyZjYzMWY2NDA4YjA2Zjk0MzE3NDVkNzg3ZWU1NTUzYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:39:53.796111'),
('chna9ecbb31ee6bbe5775b95d12364ba', 'NGRmYzExMzc5ZWRlNTAxMDY4ZmNlOGMxYTBmYWM1MGViNWU3NmYwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:38:02.533467'),
('chn9fee3ca74cbdc29b64d077f11b53b', 'YzY5OWJjZTEyZjYzMWY2NDA4YjA2Zjk0MzE3NDVkNzg3ZWU1NTUzYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:39:33.419787'),
('chne8484b4bd8f4850289fc071c238d0', 'NTA1YzRmYzgyZDIyZjExYWRhNmQzMTBiZWRiYjU2MmQ0NjQ3N2U0ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:02:01.413498'),
('chnf76ae7b4b099b53571408034dd159', 'Nzc1OTE2NzhhN2E4Mjg0YzA0YzU1Mjc2OTNlZWM0YTU0MTkzZDFlNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:02:40.805604'),
('chn2a1aaaf30220f1570e8f42b113d34', 'MzM5MTA3M2U2NDcxMTIzYjA2YzMzNTEyYjI3YmM4NjE3NWU3MDZmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:03:14.716385'),
('chn0ddce28aefab4e30a4ed16eb1d37d', 'YzY5OWJjZTEyZjYzMWY2NDA4YjA2Zjk0MzE3NDVkNzg3ZWU1NTUzYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 14:42:10.305815'),
('chn8f14060d331168c24dcf502b6d392', 'NTA1YzRmYzgyZDIyZjExYWRhNmQzMTBiZWRiYjU2MmQ0NjQ3N2U0ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:01:16.387587'),
('chn3707b6fdce7f2fa39fe0e8d6d0fb4', 'YWJkMWQzMjI1OTEyMjkzMDJlOTc1YzkyMDRlMzVhOGNjYzg4ZTlmZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:04:05.545215'),
('chn116709b1bd747265937270fd9cd76', 'YWJkMWQzMjI1OTEyMjkzMDJlOTc1YzkyMDRlMzVhOGNjYzg4ZTlmZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:04:08.906142'),
('chn7bd56eeba0731b3b47a3f7b2269bf', 'Njc0ZTIyZjA4MDA5YWU0NWFhYWY3MTIxMTM3N2VkMTFhYWQ4MTRlZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:06:32.959881'),
('chn696f1cc7e1bc2b829529ad8a25760', 'YWJkMWQzMjI1OTEyMjkzMDJlOTc1YzkyMDRlMzVhOGNjYzg4ZTlmZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:03:52.267196'),
('chn6166e8b7ff12ce7f4dbd60526ad35', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:09:21.274847'),
('chn59bd8bbacec1331843130f642fc6b', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:10:01.126116'),
('chnc426c409e13cafb988254984629d3', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:13:43.313088'),
('chn152ef456a20d5d7ac7373f802458c', 'YjY1ZWQxZmIxNGEzMWEyMDZjNTIzMjliOWI1NTk2MWEwMmI3YjIwYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:07:35.147361'),
('chnc0f3c34c2e5cb0175d107520e6e30', 'NWM1NGFhYWY0M2M1OWIzZmQyNzllMTM3OTUyZDQ2NTUwM2M1MTE0NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:08:42.228707'),
('chn4e0aa643bde117cf44a3c14cc0f8f', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:09:15.063644'),
('chnc5b4761adb9f6fc334846f146279a', 'YzQ5YjU4ZTM1YzFhZmRlMWRlMmU2M2QxMzRhZjZkODgzMDhmNWJjYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:28:30.946951'),
('chn7a9f153267658c725116e09315784', 'NWQ4YmUwNWFkODRmOThkYWEzMDU0YzI4ZmUxN2M4OTJkNWU5MThlNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:28:44.074228'),
('chn5753ba881bed450a0bd5b7eaa059b', 'MDc3NDJiOTQ5ZjQzYjBjMGU1NjgxMWMxZmIyNmM5MDVlN2UxMmUwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:41:35.554251'),
('chn64de6b870da5d56326af6ac42cdf7', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:13:47.801778'),
('chn2e62a06fd2fd1d9c1be6e3fd87b73', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:14:54.781304'),
('chnac5e20fc09065d6065cb4c646d80f', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:16:11.877984'),
('chn44d181955052df371bd61afbfff1b', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:18:35.649331'),
('chn61ed7004bbeb46e6da5f4596562f1', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:19:44.191804'),
('chnd7d68c522858a64b01295a5456b78', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:19:58.125188'),
('chnb94e37b239b3fbfbb7f1e978c607d', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:22:54.633498'),
('chn7c738a86ee922e7eb3b136d3ccaae', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:23:13.041473'),
('chnd70732e993e0272701a39d9da4dec', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:25:28.974744'),
('chn9adc399568f7b984c913573d7dc38', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:25:43.809721'),
('chnc3aee5c563ea35208264e0c1fab21', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:26:20.135378'),
('chn780217f3c0a1908d76629babd1b0c', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:26:28.584715'),
('chnbb1455b290c06fc9ac20d3554c3e4', 'Mjc2YzY1NjJjZjM2OWUzZThiZGQyOGU0YTQ3YWEyYjQ1OWE0M2NiNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:27:59.876240'),
('chn47ae0d0c4243f9afe04969b5e9f1a', 'YzQ5YjU4ZTM1YzFhZmRlMWRlMmU2M2QxMzRhZjZkODgzMDhmNWJjYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:28:25.447578'),
('chnd0c0bb705665c1e055d05b2d4df6f', 'NWQ4YmUwNWFkODRmOThkYWEzMDU0YzI4ZmUxN2M4OTJkNWU5MThlNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:28:49.222777'),
('chn37df5b21469c7866e46578a701228', 'NWQ4YmUwNWFkODRmOThkYWEzMDU0YzI4ZmUxN2M4OTJkNWU5MThlNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:29:04.481818'),
('chnc13c821c54a149a406cdc70c23d38', 'MjZjZWYwYWM1ODc3ZWYyZWUyZDc4MDkxMDVkM2VhZDViNWUzNjhmODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:33:19.577692'),
('chna9a8c835acb04bb8ea2989f844060', 'ZDZiZmI5OGU1N2E5MTE4Yzg2MDU0Y2I3N2Y3NTVmZjM5NWI2MTA0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:45:43.249463'),
('chn2fe6baadd7ff6049b41ce458ff9cf', 'ZDZiZmI5OGU1N2E5MTE4Yzg2MDU0Y2I3N2Y3NTVmZjM5NWI2MTA0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:48:59.767128'),
('chn539ba05b9a31b3320bfd440412900', 'ZDZiZmI5OGU1N2E5MTE4Yzg2MDU0Y2I3N2Y3NTVmZjM5NWI2MTA0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:45:33.768646'),
('chn6f088af29b99d414d5a16efa88600', 'MDc3NDJiOTQ5ZjQzYjBjMGU1NjgxMWMxZmIyNmM5MDVlN2UxMmUwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:38:51.926958'),
('chn0b7212d10fa26357e2dc75148c2e4', 'MDc3NDJiOTQ5ZjQzYjBjMGU1NjgxMWMxZmIyNmM5MDVlN2UxMmUwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:41:30.093745'),
('chn9d26422ab896be5a674dfc698e1cc', 'MDc3NDJiOTQ5ZjQzYjBjMGU1NjgxMWMxZmIyNmM5MDVlN2UxMmUwMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:41:45.036685'),
('chne32a1c1e139f4abea9ed5618a88ec', 'ZDZiZmI5OGU1N2E5MTE4Yzg2MDU0Y2I3N2Y3NTVmZjM5NWI2MTA0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:45:30.182449'),
('chnfb9317ea9d48a60c87085b2b18ed7', 'Y2M2YzA2MDU5M2VhYzEzM2FjZGUxNzI5OGYyZTk5N2QyNzAxZjNhYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:50:58.663537'),
('chn54d1f9a258c40f44c0d9384b2834a', 'Mjk4ZDJkY2U1ZDFkNDYyOWMzMzM3NDU1NjVmOTZiYjE5NzA5N2NjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:54:52.736712'),
('chnd60544d3f652434e4579961797c9b', 'ZDJkNDEwZjE3NTY3MTg0ZjhlMjM4MWZkZWUwMDRjNjQwZTQxZjgzNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:58:17.655106'),
('chn60cfdadbdfdb0b4d3245091f673f1', 'ZDZiZmI5OGU1N2E5MTE4Yzg2MDU0Y2I3N2Y3NTVmZjM5NWI2MTA0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:50:42.495154'),
('chnb831b43465844376f71dfa0f59818', 'Y2M2YzA2MDU5M2VhYzEzM2FjZGUxNzI5OGYyZTk5N2QyNzAxZjNhYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:50:54.368927'),
('chne028fd8e95933b5736b545ea3e28a', 'Mjk4ZDJkY2U1ZDFkNDYyOWMzMzM3NDU1NjVmOTZiYjE5NzA5N2NjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:54:57.069391'),
('chn896b4a35634d8bff36c7e66d0fe0a', 'Mjk4ZDJkY2U1ZDFkNDYyOWMzMzM3NDU1NjVmOTZiYjE5NzA5N2NjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:55:01.278829'),
('chn6d853a37e521c941c011892cc3ea4', 'Mjk4ZDJkY2U1ZDFkNDYyOWMzMzM3NDU1NjVmOTZiYjE5NzA5N2NjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:55:04.251426'),
('chn2bca17af9c478ea4438dfad70ea03', 'ZDJkNDEwZjE3NTY3MTg0ZjhlMjM4MWZkZWUwMDRjNjQwZTQxZjgzNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:56:27.588188'),
('chn10405ccd4accc3318840fbd9050b7', 'ZDJkNDEwZjE3NTY3MTg0ZjhlMjM4MWZkZWUwMDRjNjQwZTQxZjgzNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:58:08.008459'),
('chn3fcd0591e43fff484d891a14189ef', 'ZDJkNDEwZjE3NTY3MTg0ZjhlMjM4MWZkZWUwMDRjNjQwZTQxZjgzNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 15:56:23.272189'),
('chnf64a59ca336c090889c08a5a13693', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:11.996278'),
('chne66c99c77508a3f996e5390b8411e', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:23.432271'),
('chnc41ba75c0ff74a2a3fa8dbcc61c20', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:28.644316'),
('chn4e5d60d1f03a708e64f527bcf44a8', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:07.577687'),
('chn0249f14dc4eccced4211d4ee3c831', 'Y2Q3YmFiNTcxNzk2NmEwMmFmOWQ3YmUxMDU1MWUyZWQyMzU1MjM1OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:05:14.255421'),
('chn73114c6a12bf9602e852a477b568c', 'Y2Q3YmFiNTcxNzk2NmEwMmFmOWQ3YmUxMDU1MWUyZWQyMzU1MjM1OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:06:31.391448'),
('chn6278b00f66c8e10bf166dea6db91d', 'NGMxMGZiMDY5MWE5NjFmNDFhMWYyYmQwMDhjZmU2MDExODk3MTEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:08:02.866773'),
('chn92ee07424b6fae066ee9e77ffa71a', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:32.684994'),
('chn30df52a718416d6d399657850eb2b', 'YTRlMTQ2YThiNmNmOTg5N2VhMThlYTcyNTYyZTY0MTU3NWY0MGZkNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:03:49.045357'),
('chn4319c257f81ece0d5ad6b001e98e3', 'Y2Q3YmFiNTcxNzk2NmEwMmFmOWQ3YmUxMDU1MWUyZWQyMzU1MjM1OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:05:09.896239'),
('chn9f58fb2553be6a34aaac1979c8953', 'NGMxMGZiMDY5MWE5NjFmNDFhMWYyYmQwMDhjZmU2MDExODk3MTEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:08:07.039802'),
('chnbd1e7fa27e40cb5b685f170ca6cbd', 'NDNmZDNjNmYyNzljODAxMTQxZmQzODc1MWMzOTkxNzFhMTlhYWQ3Mzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:09:09.778894'),
('chn728d296130c603fad5ec56865e492', 'MjU0YTM0Y2IwOGVkZWI2NTg3MmQwNjRkOGY3MzYyMDVkNzFlMjZjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-20 16:09:25.548383'),
('rfm1x7xy8xht4mr57cp0qz1hg12iuxsz', 'ZTIzMjk2OGQyNjAyYWQzZTJlODNmNDI0YTRhOWI2YzRkMTgwYmEwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmYzg4MGYxZTNjNmVmZjJhY2Q1Njk4ZDI3ZDFlYTA0ZjkxMTZjZWEiLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcm5hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-06 16:38:06.225201'),
('chnfdbf6470225017913f84cad4de8e4', 'ODg1OWEwMTE0MGIyYjkzMTA1ZDk5MjIwYmVjNDhjZDRmZDNkOTZlZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:50:44.557062'),
('chn3249e9956ac87b2802c39e1944855', 'MzVjZjg5M2Y1NTliNTRkNTBkYTA2ODNiN2NkMTg3YjQ4ZDY1M2VlZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:49:57.277215'),
('chn66b535247eff47ad2d2c093f5c953', 'ZDNkNDg2YWNlMmQwNDc4OTk3YjM0ZjNjYTMxMWViNjljMDE0MDlkNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:50:31.299314'),
('chnec0bf40d44518f9dca5fb0f50c053', 'Y2UyMjRhOTI1MmUyODEyMzk4NDlmZTRhNjBiMmQ4YTQ4YzVkYjYwMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:41:18.688669'),
('chnde4bbbbaf14fb465d5d5a7c7801e0', 'Y2UyMjRhOTI1MmUyODEyMzk4NDlmZTRhNjBiMmQ4YTQ4YzVkYjYwMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:42:17.060136'),
('chn28e684aa7563754d0105349508f81', 'Y2UyMjRhOTI1MmUyODEyMzk4NDlmZTRhNjBiMmQ4YTQ4YzVkYjYwMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:43:52.082608'),
('chnc05a05208b63f7345bd81218c3ca7', 'MzVjZjg5M2Y1NTliNTRkNTBkYTA2ODNiN2NkMTg3YjQ4ZDY1M2VlZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:47:58.093983'),
('chn6e71ba5202f8f08be8ffc5b02b1c4', 'MGYzN2ZjNjY5NjkyY2MwYTlkYzA3ZDZlM2RiMTVjNWI5MDAwZDVkZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:51:44.451753'),
('chn02abd7c25007ef491e0713e214936', 'NmUyYWU0YWI1MjM3YzY1MTc3OGU3M2ZiODliN2U2NTRiMmFlMzJlMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:52:06.363132'),
('chnb40f630de152d04c1f02b7defdf34', 'OGIxMDdkNjgyZTIxY2MyNzhhMzVhM2IyNmIzMzQ2MzI2YWYxZGYzYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:56:35.625266'),
('chncc00cf2380bc79ba18415c45d222f', 'MGYzN2ZjNjY5NjkyY2MwYTlkYzA3ZDZlM2RiMTVjNWI5MDAwZDVkZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:51:31.520308'),
('chne6a01321aa0552cf13b1c51195d48', 'MGYzN2ZjNjY5NjkyY2MwYTlkYzA3ZDZlM2RiMTVjNWI5MDAwZDVkZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:51:33.616434'),
('chne8b121b46f1b1ad08328d5c2d8680', 'OGIxMDdkNjgyZTIxY2MyNzhhMzVhM2IyNmIzMzQ2MzI2YWYxZGYzYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:56:41.073640'),
('chn6f41961067384c62746ff8fe7304c', 'OWQwY2YyZGViNDcwYjY5NWFiYTlkNDdlNGNkNGE4ZDY5YWViZmIxNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:57:52.825746'),
('chnb4ff3350a62b0ab542292544c84b1', 'MWEwYzdlY2ViYzcxMjllYTk5OTM0M2U5NjE2NzMyZWY0MTgzMmI3MDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:58:55.689711'),
('chn5ce0e78f63b5331b2c0a7bba8298f', 'MWEwYzdlY2ViYzcxMjllYTk5OTM0M2U5NjE2NzMyZWY0MTgzMmI3MDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 10:59:02.858394'),
('chne26f7ae3be3155bc4756e3f1aa4ab', 'MDllNmVkODY5Nzk2YmFkOGY0ZGUzOTA2ZTUzYmYwMzg5MDU3ZjE4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:04:58.466851'),
('1vorpahb5ox01h20jsjdudvu93eqjzzo', 'MTIzY2RjYWIzMWQ1NjRlNWJlYjcwYmM3NjI1MDQ2MGMyODNlMmY4MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlmMzlmOTRkMmU4NjExMTg4Y2ZhMDMzNTE5NmFjY2VhNGRjNzNhYjEiLCJ1c2VybmFtZSI6InRlc3QiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-07 11:44:08.878523'),
('chn4ce0ad6e0397948c54e3054caf238', 'MDllNmVkODY5Nzk2YmFkOGY0ZGUzOTA2ZTUzYmYwMzg5MDU3ZjE4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:05:03.612823'),
('chn3c8ff852800f27a3215c7e0bc513b', 'ODk3MWU2OTMzOWNkNDVhOGVjMjU4YTZiOTZkOGQ2OGY2Y2M1MTQyYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:06:39.555581'),
('chnd9a1f91d2bbea804dd5b1235bcb47', 'ODk3MWU2OTMzOWNkNDVhOGVjMjU4YTZiOTZkOGQ2OGY2Y2M1MTQyYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:06:41.615450'),
('chn6287db7f4e12baf54affb753c0a07', 'ODk3MWU2OTMzOWNkNDVhOGVjMjU4YTZiOTZkOGQ2OGY2Y2M1MTQyYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:07:43.896517'),
('chn2c05a005a46fcc54b0aea62e58467', 'NDQ5NjY4Yjc0ZDViM2UzMmZkMDI1ODA3ZGNkMmRkZDZmYTYxYmM3MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:08:03.337050'),
('chnf69bbb6410e4933c4e1a67752ca4c', 'NDQ5NjY4Yjc0ZDViM2UzMmZkMDI1ODA3ZGNkMmRkZDZmYTYxYmM3MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:08:07.051419'),
('chnbc318018b5078fa505a10f6444a37', 'MGU2ODEyYTc4ZDBjYzcyZGI3ODIwOTNhMTkwOWI4Y2U2MmE5NTA5Mjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:08:32.018897'),
('chn1da1291ed0deadf27adc8b7f2c7f7', 'NTFhZTcyZGMxMjgxMDk5OTViMjdhZjdjNjZjNjg1OGNhMjJmMTY2Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:10:28.439180'),
('chn5f65ac9d609c7440a39582f453ce5', 'ZWIyZTI2Mjk3OTJlOTEzMTE5ZjQzMGE4OWI0NzRjMDYyOTg2MzQwMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:12:18.394342'),
('chnb557ecaa2be37f76284cfffe776da', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:13:20.724710'),
('chnb34fdf785f5dadf267377b9b21c65', 'NTFhZTcyZGMxMjgxMDk5OTViMjdhZjdjNjZjNjg1OGNhMjJmMTY2Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:10:30.596548'),
('chn68b6ca7353e3b9ada214e6135e20a', 'ZjQ2YTliMWYyMTVmYjkyNjBkOGU4OTNlNmM2ZTJmNzAyZjg2MmZhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:10:52.602285'),
('chn9143036c73921f5170bbeb2b03b80', 'ZGFhNzYxZjdkYTAwYzY1NjhiZDQ5NzhmOWMzNzhiMjdjNGZhZWE3Njp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:11:36.631228'),
('chn2c04225da4417a759b62f28d82758', 'ZWIyZTI2Mjk3OTJlOTEzMTE5ZjQzMGE4OWI0NzRjMDYyOTg2MzQwMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:12:15.158252'),
('chn8d3ca3675c7728f7d96d90f24b1ee', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:14:09.678896'),
('chn3e8b3f749dd7771cc87283339ad8b', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:14:34.250266'),
('chn235be92c7409a0fa781702d9005cd', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:15:28.268836'),
('chn8bb93dfd079a909c136fe7c784464', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:18:08.293947'),
('chn3c84ebc1a7e40eb6c53551b0a9498', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:18:13.513562'),
('chn50bdeb24a470c90d83058e03c5c4d', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:20:14.406662'),
('chn10764525f11ec9e90c047118f1896', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:22:08.541296'),
('chn2784d7792e4b885ee84f7c2a76702', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:23:13.203281'),
('chnb7f26e70351a157489e479f29fae4', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:24:53.055126'),
('chn03be9317f3dd78c6463b96bcaac2c', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:25:34.127558'),
('chna8160371b9fb9d233c0bfab6c4f32', 'MTdiMTgxMjFhMTc5ZTdkOTViOWI5OWU0N2MxMjIwMzcwMzBmMzI2OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 11:26:43.254226'),
('obeoy0g79sds9s9jlf8sx6ibaf4j3pw7', 'ZTE5OTg5NWFmY2ZmYTE2ODdlNzE4NDBhNzcxMWEwMTYxZGU5MTgyNTp7InVzZXJuYW1lIjoidGVzdCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2hhc2giOiI3MDcxMGM3MGUwYzcyZmYyZjE4ZmZkYjEzM2JiY2M4ODMzYTVjODI3IiwiX2F1dGhfdXNlcl9pZCI6IjcifQ==', '2017-01-07 15:14:05.539902'),
('atogs1n9tiuu54t9xs028qgps7irrs2h', 'ZTE5OTg5NWFmY2ZmYTE2ODdlNzE4NDBhNzcxMWEwMTYxZGU5MTgyNTp7InVzZXJuYW1lIjoidGVzdCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2hhc2giOiI3MDcxMGM3MGUwYzcyZmYyZjE4ZmZkYjEzM2JiY2M4ODMzYTVjODI3IiwiX2F1dGhfdXNlcl9pZCI6IjcifQ==', '2017-01-07 15:14:05.530895'),
('chnf9227c0c63fa25ea6dfeaac9be030', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:44:07.109018'),
('chn6a3db3167e182c47a104c90a20e93', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:45:27.033321'),
('chnb161ab5f85eed8e4f05f555fce46f', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:46:49.428664'),
('chn6b881bb74b9109792f301cc6c68b7', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:47:28.682148'),
('chn9e911717cc758675e053e50d9edd8', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:48:10.339614'),
('chn96de87e69d6860b4b3f649bb20a45', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:48:27.548077'),
('chna58aca202f52f308111d36c384d80', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:49:29.625399'),
('chnd7f62a71b7d3d190d179f96344a70', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:51:47.175069'),
('chnf48db54d37e3b72770519ef152584', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:52:59.716291'),
('chnc640289a1f4b78a5acb60e9429f40', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:53:37.362552'),
('chn5c43db2e957101266a4bdd51a5daf', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:53:44.680693'),
('chn6cba3f92f01538f460e86bd5375d0', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:56:27.083028'),
('chnf2c2b814c7801b43e694ffe2904a3', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:56:58.780080'),
('chn43424d9970fda9758e6d7126cd78a', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 14:59:08.846027'),
('chncab41a2a4557072e1c7685fced34b', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:00:11.810763'),
('chnba5a5434b8a92b2e30a71960aa7d2', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:03:51.508951'),
('chn199efe073f7a37618a33aae7914dc', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:05:06.601687'),
('chnccb0f62c0bb295f8a84e622d170ef', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:05:57.020878'),
('chn0b353b138b49f8a839d74548fae1b', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:08:12.142274'),
('chn4e05f022f5704acb4ba703a165736', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:08:46.602738'),
('chncdb021dbbbed9a768a2b431aa2150', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:09:14.866460'),
('chn3c9aed71f9a456fc314e3b974afe9', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:09:43.278413'),
('chnbc811e11b6ac1e7f598b3b8f289c0', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:10:44.122343'),
('chna46858b8ea2c91ca9095a8af51e3d', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:11:44.835562'),
('chnd7c2adbf5ad942de1089d794fb32b', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:11:54.929088'),
('chn7ac474a4941ff0f31d72a5f6ff2cb', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:12:55.089435'),
('chnfce1a3fc20c829902f6899fb84d85', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:19:51.140140'),
('chnd6681d1a00b6d219f40ddac7a1e86', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:19:30.647000'),
('chn644ffa6bd928a8a416ed3008025e3', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:19:43.805801'),
('chncb61967e13843063e35ac70b1abb8', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:17:38.888810'),
('chnade917029a89fd3ce374fcd93da9b', 'OWYzZjcwNTllZWZmYjg4OTY5MmJhYTgwYWFjOWRmZDcwY2M3NmYzMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:18:06.331889'),
('chn3495f0b2a38e3b105966c02e6156d', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:19:16.522669'),
('chnca3f0d21d7959860bf6f6134245c5', 'NGQ4MzEyM2I0YzVlMWEzNmYxNzljMGJhNGMwZTMyMTc4ZmRlMGZhODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:38:25.019181'),
('chn783b0075225385532633f9cd13b8d', 'YzI0ZTVjMTg2OWExYmExMTIxZWQ5NDZlMTY5N2U5MWZmMmM3NGNlMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:42:34.674640'),
('chnbe60c345a0faaa44aa77bc9db0c1a', 'MjEzYjg2YzI5YmVhOThjZDk5ZTEzYTYxMDU2MjhkYTdiZDk1MzVmMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:51:08.264180'),
('chncad664b9f1d4f936255acf28ecdd7', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:21:17.835881'),
('chn282955ec2997817bb902dcfd259ca', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:21:39.067553'),
('chn072cf9c0e61f1f3b96ebbea014cdb', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:22:04.664287'),
('chn57e5f87698363d214c6d0858cc903', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:22:44.144162'),
('chn65ef20eb49848112af3e4113c639a', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:23:23.153562'),
('chn89b477c5f94d419721d1771118ff9', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:25:52.299639'),
('chna8ce12b331323be42ab3a8da3410c', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:26:14.539328'),
('chne34f61c7b225fad04c3d3945011c2', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:27:04.485312'),
('chn27bf5003d29028fd8c4fb22bb7711', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:27:19.985456'),
('chn0c2e0ad7f724ea496dc4d53254cc1', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:28:33.132670'),
('chnece1931b37b01e3f25dc349dbcd81', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:28:44.018862'),
('chna1afda70e42ba038b31e3c5accfdc', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:29:43.062586'),
('chn1c5037ec7a28e7da75c9fdfaa4049', 'MTlkODU3ODRmOTEzMmI4N2VjMjQ0ZjBiZjc4NjIwYjZkMDY5ZjEzZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:32:06.847475'),
('chn99d67f74fe6a206577e9eb734e04f', 'YzI0ZTVjMTg2OWExYmExMTIxZWQ5NDZlMTY5N2U5MWZmMmM3NGNlMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:42:53.882774'),
('chn60cafdddd9bb48b405a97763d2ef5', 'MjEzYjg2YzI5YmVhOThjZDk5ZTEzYTYxMDU2MjhkYTdiZDk1MzVmMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:46:40.363007'),
('lix35m5qmtfrkyd2b5wlag2yb13vew8x', 'NmQ5NTQ1ZTcyYTljODBmYTZiOWQzNTZkNmQ3NmYxMmJmNjU4MTVhOTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2hhc2giOiI2NDgzOTcwYTBmMmY4YzFiZWI5NGIwODdhYzQ2ODdkNDE0MDU0NmJhIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ1c2VybmFtZSI6InRlc3QifQ==', '2017-01-07 16:16:44.711815'),
('chn2ebceb251d3c92c235f684e6fc3dc', 'MjEzYjg2YzI5YmVhOThjZDk5ZTEzYTYxMDU2MjhkYTdiZDk1MzVmMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-21 15:46:45.667663'),
('chnf636ccd9a65bd38d6bb52d104591e', 'M2QzOTkxNDE2NjZiNjkxODVhMTA0YTNjNTQ5Yzg1MzIzOTgxMDczMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:39:06.135765'),
('chnbea973a46d9c0690c901c72d6d5d9', 'M2QzOTkxNDE2NjZiNjkxODVhMTA0YTNjNTQ5Yzg1MzIzOTgxMDczMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:38:11.763954'),
('chn3279adbb8bc6795f20443445428ae', 'M2QzOTkxNDE2NjZiNjkxODVhMTA0YTNjNTQ5Yzg1MzIzOTgxMDczMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:38:46.726508'),
('chn30482a90ce8bbeda734fd1db1612c', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:12:21.466503'),
('chn4db0a48c367862471879505067e82', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:13:07.433566'),
('chn129968bf23f21a311a308d6aad86d', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:14:28.076588'),
('chne985acd7ffb13f119cf9b64a93a4b', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:15:04.074159'),
('chn8fedf490af1176324215af5dcd986', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:15:53.364399'),
('chne602d342b5f7628ddfb1f139716c3', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:21:51.340128'),
('chnffee91ae3ba63083e739d1e9b2425', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:22:08.070572'),
('chn12e935194eccab047af59093e2b7b', 'NWM2ZDIxYTQ5OGU3ODZjODc0YzA2ZDU4YWQ0MDNjMGM5ODk3MzA3Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:24:17.482601'),
('chna52ad11b87518b2ece9e92dad658e', 'MWNkOWM0YTRkZTk0N2IxNmRhZWE4YmE5NWVkZDc2OTZjMGU0Njc0YTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:27:51.406402'),
('chn1c1cf6165a6c37578d49260297380', 'ZGNjMDIzODdjMWYwYmYzZjNkODlhMzc5MjhhY2U0NWNkYjI0MTlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:40:08.730309'),
('chna8237246a0e18ce54099939a61b9e', 'ZGNjMDIzODdjMWYwYmYzZjNkODlhMzc5MjhhY2U0NWNkYjI0MTlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:40:53.615176'),
('chn2e57579874a462b97f135d9a0ee59', 'ZGNjMDIzODdjMWYwYmYzZjNkODlhMzc5MjhhY2U0NWNkYjI0MTlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:43:42.665564'),
('chn690a6ad8c863dea0e15eb0b4e77f4', 'M2QzOTkxNDE2NjZiNjkxODVhMTA0YTNjNTQ5Yzg1MzIzOTgxMDczMDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:37:42.923730'),
('chn33dfe7a848e107d6e1c02fc58199d', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:55:34.242217'),
('chn0ea792a14f5f3c4cfcbd1fd637017', 'MWRiNTEyOGRiMzgwNTBmYTBlNDQ2ZTVmOTUzMTg0YjVkMjUyZTU5NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:49:27.767935'),
('chnf9a3b138624f464f45f2aad0fb4fa', 'MWRiNTEyOGRiMzgwNTBmYTBlNDQ2ZTVmOTUzMTg0YjVkMjUyZTU5NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:55:01.737076'),
('chne641fa7d932a865e4ae4dda992db7', 'ZGNjMDIzODdjMWYwYmYzZjNkODlhMzc5MjhhY2U0NWNkYjI0MTlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:44:01.005327'),
('chnfc27429f996e04e2edcf88b2e8c85', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:56:57.988614'),
('chn66ba8f4e59cda5a6c091cde92e26c', 'MWRiNTEyOGRiMzgwNTBmYTBlNDQ2ZTVmOTUzMTg0YjVkMjUyZTU5NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:48:28.037103'),
('otqcde75xrsrolsgkpqrdlv9bfp2xak7', 'ZjY5NDE1OTVmMjQ0NWY0YzkxYmU5MWM4OWM4NzczNjFjOGZkMjQ0MTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsInVzZXJuYW1lIjoidGVzdDIyIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZjMzllMjRlODY1NDcxNGRkZDkwMGFlYjEwMTI5MjM2YWJhMDdhNDMifQ==', '2017-01-08 02:38:35.259942'),
('chne92fe05ac4e336ca61079cad10587', 'ZGNjMDIzODdjMWYwYmYzZjNkODlhMzc5MjhhY2U0NWNkYjI0MTlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:45:39.524865'),
('chn7f899614771aa40c06670224b8d14', 'MWRiNTEyOGRiMzgwNTBmYTBlNDQ2ZTVmOTUzMTg0YjVkMjUyZTU5NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:48:23.382944'),
('chnc5d57237ed505d832eb49b43f0172', 'MWRiNTEyOGRiMzgwNTBmYTBlNDQ2ZTVmOTUzMTg0YjVkMjUyZTU5NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:48:23.458999'),
('chn773dee76d4899ac278c1ef109677f', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:08:36.059032'),
('chn2ff56cc225550541453c7cff25ed6', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:09:09.454315'),
('chna3680007cc8577e4e05214cb5b1be', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:14:08.443276'),
('chn8d43b08de4643d9db51029e391e41', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:55:31.440596'),
('chnd4013e940aa0d376db305d1cd089b', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 01:55:31.445601'),
('0ym1bp4479dym3dkb6ha6wup6rn7sep1', 'YjBmNmRlZWMzZmZlNWVjOTU0YzIxYmNjNjM2ODE2MDhiMjExN2U3YTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwidXNlcm5hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZjMzllMjRlODY1NDcxNGRkZDkwMGFlYjEwMTI5MjM2YWJhMDdhNDMifQ==', '2017-01-08 02:25:33.393998'),
('chn4e9a18777a7ed26b1c177b759bce2', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:14:19.904800'),
('chna5b084d2574b276b0f0c28df8484e', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:15:32.372241'),
('chn7db08c7aac673b0d8c71d7c4f3826', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:16:09.886646'),
('chndebb6991ac5d867a4dcecd43d73a7', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:16:16.253854'),
('chn4a5a68cc1b67d22e5982be10a3aa1', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:17:10.637290'),
('chnd873203ef78841041d4394a042914', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:17:15.730619'),
('chn6b875293870d69a2775792f3a5d93', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:18:51.033457'),
('chn4f03a39f84b06ca49f8b0dab54752', 'OGVlNjYzNjU2MDllNzQ1M2ZiZDEwOTRhYmE0Njg2NTAzZTkxMmJkYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:20:52.886581'),
('chnd5baba9f112f4c35dc0795ed76538', 'OWRjOWRmNGViNGM4MTg5YzRlZjk2Y2NjZTVkMjg5NDI5N2U5OTYwYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:37:09.904377'),
('chn2421034e37a0d97af0c7bf190e8be', 'OWRjOWRmNGViNGM4MTg5YzRlZjk2Y2NjZTVkMjg5NDI5N2U5OTYwYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:34:18.261591'),
('chn1a37fc7b847a6e8fc5c6636b85361', 'OWRjOWRmNGViNGM4MTg5YzRlZjk2Y2NjZTVkMjg5NDI5N2U5OTYwYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:36:06.016474'),
('chn23f96a205d1e4b292c808991e5070', 'Yzk2YjhkNjIwM2FkYTA2NjI2YWZhODgwZGU3ODkxYWY1NjM0Y2EyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:28:25.650429'),
('chn19606e02e1a9fb69ed0cd656dbd49', 'Yzk2YjhkNjIwM2FkYTA2NjI2YWZhODgwZGU3ODkxYWY1NjM0Y2EyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:29:54.286765'),
('chn2008f13e7d8675ca500f4ef752d1a', 'Yzk2YjhkNjIwM2FkYTA2NjI2YWZhODgwZGU3ODkxYWY1NjM0Y2EyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:30:24.329088'),
('chn4c5b0f0a7e2b03e8023d4e8e5dbc2', 'Yzk2YjhkNjIwM2FkYTA2NjI2YWZhODgwZGU3ODkxYWY1NjM0Y2EyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:30:55.544939'),
('chnb0dbaf0fb6b6d7c669fc6e8ec1ac7', 'Yzk2YjhkNjIwM2FkYTA2NjI2YWZhODgwZGU3ODkxYWY1NjM0Y2EyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:32:32.968957'),
('chn589451b59893e0252c9528653bfde', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:46:24.674067'),
('chn4f580a73e9eb5f7b811d9065d6570', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:46:49.207187'),
('chn77f4f7d637776bae9b08a248f9c09', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:47:02.641230'),
('chn17846ae13638078ab1437da1e9e1c', 'OWRjOWRmNGViNGM4MTg5YzRlZjk2Y2NjZTVkMjg5NDI5N2U5OTYwYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:39:02.199528'),
('chn0ab5acccec1d3e917eb327c07487a', 'ZWJmNDQxMTVkZmQ1ZTBlM2RiN2Q1Y2EwMDQ4YTYyMWY2ZjU0Mjc1ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:42:19.020603'),
('chnbeefb58e76838f8e1dbc2a467c663', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:43:21.118470'),
('chn955fce1a1716c329a66586d792d6d', 'NGY2NGZiZThjNDdiOTUxNmRkZWU2ZWQ3OWY5MTE0N2RjMzc3NzZmYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:48:27.587807'),
('chn0da31c60bec6ee893ce6b625821f8', 'NmViZjdmZjYzZTdiMTU1MzVlM2ViNmFlOTNhNDkxYWQ0ODBjY2NmODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:48:48.824929'),
('chn7e4fcb499ead8b6e7e7ce880f8f97', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:50:58.097897'),
('chnedad223e438dc4aa5831fb108f0f7', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:47:17.781624'),
('chn95d4371f38405c28fa7d65669b46f', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:47:35.038680'),
('chn425896a200329d89784141e9c8b80', 'NDY5NGZjZDkyM2FiYTUzYWRlNzNhZDBmZjM2MzNmNjBlYTRkN2I4NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:47:57.846215'),
('chn6f2d5770c645a11a0154bc4777aa2', 'NGY2NGZiZThjNDdiOTUxNmRkZWU2ZWQ3OWY5MTE0N2RjMzc3NzZmYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:48:23.868023'),
('chne75e552f1c793e96d5405cd46b854', 'NmViZjdmZjYzZTdiMTU1MzVlM2ViNmFlOTNhNDkxYWQ0ODBjY2NmODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:48:51.642887'),
('chn5386ce69ef55e3ac9bd5bed187ad9', 'OTZlYmYxY2RmYjE5MjE1NDNjZTkyN2ZlNjMyZTc0MWFkYTE2ZWUwNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:49:03.380450'),
('chna8426c022e185524788e5676e4025', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:49:43.800928'),
('chn6c4168da035e70416b32d9ba177b5', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:49:46.601982'),
('chn3aabe9da5cc236699a861b68f5035', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:50:36.431100'),
('chne02f1ac0762f6c0131a287cb7cd68', 'M2QyZGQ4MzQzOTYwNzNkZGIyOTg0ZWYyMzYwOTQxNjUzODI4YTk1MDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:55:50.093762'),
('chna5995c7ebba85b261585443045857', 'MGZiZWIyMmUzOWUzNjE0OTEyNGE5NGU3ZmQ3NzUyMjE5OTI0NWY3ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:56:08.455736'),
('chn864fa9bdb056ad3676f8210e13607', 'MGZiZWIyMmUzOWUzNjE0OTEyNGE5NGU3ZmQ3NzUyMjE5OTI0NWY3ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:56:08.461741'),
('chn669eac09a3e935fbc5796ac9e2164', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:51:53.648294'),
('chn1cf22b3cb916c75716e7202fcb30e', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:52:06.462335'),
('chn0d19d317bd7b0612b860872a1e8f8', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:52:43.558425'),
('chneaaef728a7514ed56ac3c270c2555', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:53:00.296227'),
('chn28dac90239a8055ce09f661686ff7', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:06.518374'),
('chn69927401f4678db4aeee4983ff198', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:05:55.809049'),
('chn85ff45a10ec6fffb2416d60ede8f1', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:05.518357'),
('chndaef13729f02ec7c308a446845d68', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:53:41.899833'),
('chn8dcf94234fd2a22399d6f20b819de', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:54:13.593361'),
('chn6195be30f25f88eb48fd71821322d', 'Yjc4YzhhMjgyOTFmYTk2M2E5YTdlMTJiYjk0ZmFhMDVlODZhYjJkODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:54:26.531046'),
('chn5897ab5051b98dde7f66dedc14387', 'M2QyZGQ4MzQzOTYwNzNkZGIyOTg0ZWYyMzYwOTQxNjUzODI4YTk1MDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:55:43.357326'),
('chnb41c4e48bb62077141855d2652de4', 'M2QyZGQ4MzQzOTYwNzNkZGIyOTg0ZWYyMzYwOTQxNjUzODI4YTk1MDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:55:43.471406'),
('chn1b1272cda744e9e20c43803af787d', 'MGZiZWIyMmUzOWUzNjE0OTEyNGE5NGU3ZmQ3NzUyMjE5OTI0NWY3ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:57:52.152963');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('chn174a99c653d409e049d60046e7074', 'NDQ1YTFiMjE3OGEwMmZhYmVlYjEyMTk2MzFhZDM0MWUyYjYyMWU0ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:59:22.446258'),
('chnff805907bfa7978f3354cdfcc2ca9', 'NDQ1YTFiMjE3OGEwMmZhYmVlYjEyMTk2MzFhZDM0MWUyYjYyMWU0ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 02:59:22.453262'),
('chn8fd800906b7a73b1aea42d0ac7664', 'NTU0YWY5MDJlZjllZjJmMWJiYmNlYzVmN2Q0NmVlOGE5MzU2YWI3Mzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:00:10.634029'),
('chn320db0892a892e2c2cd5c26a52a57', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:03:05.136732'),
('chn4344396c1eef1a14d8951e5952293', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:03:47.970337'),
('chne0bb225ef06eb2b8a0b7fcdbc65b3', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:02:55.143984'),
('chn05fa28398eab9f63b6a59b6636e64', 'NzMwNjA0NjFhMzY5YWI2NTFlNjZkYjM0M2EwY2YxNmI4NjE3ZWE0Mjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:00:33.030325'),
('chn0df5d2df911cf345c745f2038152e', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:02:35.227915'),
('chn54c5947ecab5e34d4df5ac4697d53', 'ZjBiNDAxMDY0NDE1MjYzNTZjN2I2YzI3MmNlMjQzNjlkYTJjMDgyMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:09:03.771453'),
('fmb2yi3fvsptc4jxkdttjqu4tai1f0le', 'YTNhNWU0ZTVlMDFlZTJkZmJiNzBmMmQ1OGIzYmE4NGJlY2U1MDJjMjp7InVzZXJuYW1lIjoidGVzdDIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjM2QyYzVhYzdmOTYzNzVlYmFmMjFjMDIxYjMxYzk3MjIzOGYzZTFmIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwLCJfYXV0aF91c2VyX2lkIjoiMTIifQ==', '2017-01-08 03:39:21.356993'),
('chn35591ad7a725b25939044aef3142a', 'ZjBiNDAxMDY0NDE1MjYzNTZjN2I2YzI3MmNlMjQzNjlkYTJjMDgyMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:09:21.917345'),
('chnaac90831f66972f7da86d64bbdf4b', 'ZjBiNDAxMDY0NDE1MjYzNTZjN2I2YzI3MmNlMjQzNjlkYTJjMDgyMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:12:51.416428'),
('chn8e7322528f9e2a7f8e686c69291ab', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:11.978931'),
('chna2e0111a99cb1655a94dd825f71a5', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:13.201485'),
('chnbe309d05db973fd8f0cfdac84875a', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:16.588537'),
('chnf3685f64ee552967ca283289e0a31', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:26.385465'),
('chn021e59fd154ba9cb44c2d81c995d8', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:29.125303'),
('chnb82e7e47556819b8fef29c25fb159', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:30.227455'),
('chn6ed4e842c68919b55f5173bf8b627', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:34.196260'),
('chne635306b7def67678ae4dbdef1b7c', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:49.172268'),
('chn82a10bebb3ff1ac548a92d063f0da', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:06:53.961421'),
('chn192cb4219c048777b96a50a909df3', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:07:09.349427'),
('chn7a9a06090dd9905edf772fd665b83', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:07:10.338890'),
('chnac3b4679c2f50323ec5c08a66a407', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:07:12.227112'),
('chn669c7443ee01058c129159ef2291c', 'MjQ2ODc2Yzk1OWMwNmViYzMzNDZiZDA3ZDkzMDlmNTM1ZmNjNzc5NTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:07:42.596273'),
('chn47f274a8f628d0343979a39944cfb', 'ZjBiNDAxMDY0NDE1MjYzNTZjN2I2YzI3MmNlMjQzNjlkYTJjMDgyMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:08:54.551681'),
('chnd0481d2a1879b93ca22f8f263e286', 'ZjBiNDAxMDY0NDE1MjYzNTZjN2I2YzI3MmNlMjQzNjlkYTJjMDgyMzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:08:54.552681'),
('chn7ea0319c9df02777a124c5b2ad924', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:55.852513'),
('chn7fac020c2a5f9c30c5867b3e6e27d', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:14:18.139208'),
('chn9353dc0e44e9ebe8984d122828790', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:14:19.186538'),
('chn807cf2a3900c7f409d51e8f70725e', 'YWUxMjVkOTYyNzk0MzM4NDYxODA0ODliMjRlNDUxMmQwNWRmYzhkNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:07.863379'),
('chn7635d8bb6588bca4f94560b022445', 'YWUxMjVkOTYyNzk0MzM4NDYxODA0ODliMjRlNDUxMmQwNWRmYzhkNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:07.874387'),
('chn1719a54ae3ba15685bea52b29f569', 'YWUxMjVkOTYyNzk0MzM4NDYxODA0ODliMjRlNDUxMmQwNWRmYzhkNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:10.038441'),
('chne7239a5da817170ff31a07743292c', 'YWUxMjVkOTYyNzk0MzM4NDYxODA0ODliMjRlNDUxMmQwNWRmYzhkNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:10.042444'),
('chna282362ee267a65a194b75c060cbe', 'NWVkYzQ4Y2I1MTY1NGQwOWIzN2Q3MDZjNzU3NDFjNGI5NDUxNThhNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:37.473470'),
('chn2c8126ecde784fa9a06a15ad9f6d6', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:13:50.679563'),
('ahbjs5zkfq4qdmmaasqhzm08eq017mmv', 'MWFmYjdmOWRkYTk2ZmY5NmFlYzliOTkyODQ3YzdhZTAzNGIzMjVhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhlOTE2YmYzZmJlOGRlYTE4OGEzOWY2ZDgwN2ViMWYyMDdhZTRiMGQiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ1c2VybmFtZSI6InRlc3QifQ==', '2017-01-08 03:43:55.156991'),
('chn910e58d90b8b276d6aa876808993b', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:14:20.131520'),
('chn723d50512b6b7cdb5ec3ccf8927af', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:15:43.680430'),
('chn0c53a4ca149bc3bf24ea805a9fccb', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:17:06.753285'),
('chn0c3e64b3d590f427b10b81da2c98d', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:19:30.812500'),
('chn1936c7c9f9fb568a6812ce794ea81', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:21:33.716123'),
('chn7781e0d3c172e9685152cafe8e75c', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:21:37.830609'),
('chn9757896bfa345de93c28025689325', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:21:47.535946'),
('chn1de56bb59785d9ce550dc944878fc', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:21:50.045034'),
('chncc293e3353bd55b8aa8749a12a480', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:24:16.040985'),
('chn0a294e3316271528d46171fa3807b', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:24:45.973721'),
('chn807d6ceb01cbae862004601b4b76a', 'ZmVjNmY2NzlhZjNkOGY2NTRjMzIzN2UwODlmY2RiMDQxMmEyZDEzODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 03:25:56.077631'),
('chn21b1410146a8ed1015d1a5f8c656d', 'ODFmMjgzOWE1YTgzYmZjYjcyYjA1NmUzZWM2NTQ3NDdiMDA4OTY4Yjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:27:16.380867'),
('chn8d5d81cd7adbf5fcdfca43e409e79', 'NTNjM2I3M2M4MGQ3MTVhYmNiMWU3NzhiNDQxNjQ5MTVhMDNjMmRiYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:32:59.470824'),
('chn02317254de7ae5116f8cad16c24e8', 'YmY1NGMwOWNkY2VmNjEwZDU3MTc4NjBkMWJmYWRlOTNlYTg1YzhmYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:33:50.956213'),
('chn6321f7b5e277c5419e489e9b810cf', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:12:57.390642'),
('chn479c699fe7f97624a4c128861c823', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:16:51.778442'),
('chn8cf8bac012524ec2264657f5445b2', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:17:57.540431'),
('chnc041f242a3eddf7703349da4df4ac', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:19:51.960036'),
('chn1471bf14979396f8636a298bf0b3d', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:20:27.660951'),
('chn4d80a7746f3a4b8b384d58b67a47b', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:21:55.104653'),
('chnc001c25c0478d47461f35e75f3e4e', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:22:12.332915'),
('chn6ffa7b80b6db6c4da3db65d270196', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:23:50.010335'),
('chn714e4e425564719e39a26bc54e527', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:24:13.231764'),
('chnd4b7be71a1dd0a90a94f4a09a44c6', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:24:22.698303'),
('chn22cff23db5187797ec720e59686cf', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:24:39.483913'),
('chn716e5c6cf62edca52f3c4d2fb4077', 'ZmU1ODQ0ZDk5YmY1NjlmN2E4MmNkYzM0YmFmOGMzMTdmMzYxZmM4ZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:24:42.080817'),
('chnfe66b92734bfc1e45dfc425f84938', 'ODFmMjgzOWE1YTgzYmZjYjcyYjA1NmUzZWM2NTQ3NDdiMDA4OTY4Yjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:27:13.121672'),
('chn18456b05640b5af670d0dad6e185f', 'ZmU5ZjMwYWUxOTk2MWJhYWJhNzQyM2UwY2NhNzRmYjIxMzk1OGVmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:40:45.996263'),
('chnfb0528a3c28a5fe2abfeb54001506', 'MTBlNWFhMjA0MzcyNzBiMmVmZTc5YjFkNTg5ZTllNjYwMWMwN2RmZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:45:26.457138'),
('chn9fbace1046bca6b0b559a49cf44dd', 'NzcxOTQ2MjY3NTRkZTkwM2MxMjdiOTIwZmE1NjQ1MzdhY2E5NGRhZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:46:45.956942'),
('chnd26b789173051bd1e79d0399487c1', 'MWE4ODBiM2M5YjRkNDRmZGNhZGFjNzE1Y2Q5NTgyYmM2MzRiMmExOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:34:00.993605'),
('chn3eba096dad685881bdcc1b676f1d5', 'NTlkNTM5NTRmOWZkN2YxOTI5YmQ5MDVhNTIzMTk4OTczNDllZDQxMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:37:56.423698'),
('chncebb6082c7b7002047dab23ed3c87', 'MDdlM2JhNjk5YjQ4ZTYyZjg4OTNlODZmY2FmOTc0MWViYzFlYTVmNTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:38:01.924692'),
('5cgs19w8o5xq15e5qtch2hw1it5vwahv', 'MDM5ZGEyNWMzNzZiOTQ4NjY3NzVkZGM1ODJiMDJjYjQ4MmZjY2RhMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2hhc2giOiJjYTFkNzZjNTM5NTgyM2FjZjIwY2ZlZDFjNTg3YWFkZjUyMjlhMTgwIiwidXNlcm5hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-08 05:30:04.417712'),
('chneaa820d803efb604dfb17204730e6', 'ZmU5ZjMwYWUxOTk2MWJhYWJhNzQyM2UwY2NhNzRmYjIxMzk1OGVmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:40:26.361934'),
('chncd20738012619ff3dc17d0d3cca68', 'ZmU5ZjMwYWUxOTk2MWJhYWJhNzQyM2UwY2NhNzRmYjIxMzk1OGVmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:40:28.311919'),
('chne0335ff3c278b5966196a1f8b41a3', 'MDdlM2JhNjk5YjQ4ZTYyZjg4OTNlODZmY2FmOTc0MWViYzFlYTVmNTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:38:54.417324'),
('chnd1dfcdab28144bbc1207b1ee5ee11', 'ZmU5ZjMwYWUxOTk2MWJhYWJhNzQyM2UwY2NhNzRmYjIxMzk1OGVmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:39:45.964437'),
('chna64c8626bac6b232336ea68be4c5f', 'ZmU5ZjMwYWUxOTk2MWJhYWJhNzQyM2UwY2NhNzRmYjIxMzk1OGVmNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:39:46.290147'),
('ovl6xu85xat4mrjjwwg9ebk9i3q6goy2', 'ZTJhYjFlM2M4NDdlMmE1OTFmMTQ4MjMwNzAyNDVmYjg0Y2U0NTBkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXNlcm5hbWUiOiJ0ZXN0MjIiLCJfYXV0aF91c2VyX2hhc2giOiI4MmUwMjg3MTY4YTRhOWFkM2E5ZDNlNmIxYjFjZWZiMWQzYTcwMDg2IiwiX2F1dGhfdXNlcl9pZCI6IjEyIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-08 05:10:25.658166'),
('chn46e166ed8d16bf0af5b3ab624e841', 'ZTgzNmIwNWVlYzRlZjNjYzNlNDExYzcyNjA4N2UxYTA3NTViZDYzYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:56:56.584716'),
('chne44cdce88f1cac2a6c28c4c866cbc', 'NzQ5OTRkZTc0OWIzYTg2NjBlZjRlYjI1MmNiZjBjMTZjNjQ2M2E5Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:59:59.367780'),
('chn375c088ad290bc0fb3598aab1b05f', 'ZjEzZGE1NjdhMmY4YzJlZTYxMWUxOGVmYjJhMTNmNmYxNjRlMWM3Zjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:47:10.982991'),
('chna9259d52f78ec89b3f02c21a0cb54', 'ZmUzMGQ2NzAwNTk0NDBiNTMxNmUzZDMwMjQxNjk0NzdmZGQ5NDIyNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:50:39.106840'),
('chn00964415b181baa5f20fbaf33716c', 'ZTgzNmIwNWVlYzRlZjNjYzNlNDExYzcyNjA4N2UxYTA3NTViZDYzYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 04:56:50.981696'),
('chn516314d31144eb0be34fb785095fb', 'NzQ5OTRkZTc0OWIzYTg2NjBlZjRlYjI1MmNiZjBjMTZjNjQ2M2E5Yzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 05:00:05.270466'),
('chn21409962cfd831b6b3d1b14a71fab', 'MzAwNDYwOTEyNzcyOTIwZWVlZWJlMDI1YTcxNjM2NjZlMjExNDk0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:42:11.061299'),
('chnae6c30ba7651e6478759cdc221f1f', 'MzAwNDYwOTEyNzcyOTIwZWVlZWJlMDI1YTcxNjM2NjZlMjExNDk0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:42:13.470877'),
('chnb6096d15de3b3c6bdccbcc0798bbc', 'MzAwNDYwOTEyNzcyOTIwZWVlZWJlMDI1YTcxNjM2NjZlMjExNDk0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:42:00.414540'),
('chn9fbb5474be137fc39ff0f4ad5b827', 'NGQwMGVjZWI4ZWViOGY5ZTBiMjE0MzgzNzZiNWQ2MTU3NjVkNmYxNTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:40:48.876943'),
('chn7b1c27ce8d0eccad07e63c4325513', 'NGQwMGVjZWI4ZWViOGY5ZTBiMjE0MzgzNzZiNWQ2MTU3NjVkNmYxNTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:41:20.035834'),
('chnb3631c5ecb6fc20f2429d5efd9628', 'MDI5NjJjMTczMjE4MGQ1Mjc4OGFlMGMxY2ZlZTBhMWNmZWY5ODZiNTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:41:41.727005'),
('wnp8l1obnssdn1dyw8016128c6cioiu9', 'MDRiZmY5OTgxZDI3Mzc1MGJmODU5NTRiMDIyNDYxZTkxN2JmYmM0MTp7InVzZXJuYW1lIjoidGVzdCIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNzMyMTFhYzYzNGY5NzJlNzJlMzBiN2JlMTc1OTUzYTkxZGY0ZWUyIiwiX2F1dGhfdXNlcl9pZCI6IjcifQ==', '2017-01-08 10:11:59.496041'),
('chne569023e971d2192dbb9794e19b5b', 'MzAwNDYwOTEyNzcyOTIwZWVlZWJlMDI1YTcxNjM2NjZlMjExNDk0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:42:38.630554'),
('chn685917e905431e5671e118435a4b3', 'MzAwNDYwOTEyNzcyOTIwZWVlZWJlMDI1YTcxNjM2NjZlMjExNDk0OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:43:17.784827'),
('chn3ae136f86e528a2abcca9eed85823', 'OTYyYTc2N2M1NWY4NjZkODg3Y2M4NzhkNTA1M2JkYjBjMTNhNzlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 17:45:16.119151'),
('chn020f9df8af918a87ee4945d805284', 'YTNiN2Q1ZjNkZTc3ZGE2ODZhNjk5MmQ4YTMwNDk1YzU2NTRhNDI1NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:50:42.308635'),
('chn4deaef63ce89d6bf6ad8aaad79dab', 'OThjMGVmNzllZWZmMzgwZDgxMGQ2YzFkNWUwZTE4MDM5Mjk2N2M1OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:49:07.319382'),
('chnc63e2a718f2438da484227cdd0b77', 'OThjMGVmNzllZWZmMzgwZDgxMGQ2YzFkNWUwZTE4MDM5Mjk2N2M1OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:50:05.249263'),
('chnf6392ae3dedf4906f2dca22065542', 'OTYyYTc2N2M1NWY4NjZkODg3Y2M4NzhkNTA1M2JkYjBjMTNhNzlmNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 17:45:21.445413'),
('chn16d86b9445bdcf32455590600501b', 'YTNiN2Q1ZjNkZTc3ZGE2ODZhNjk5MmQ4YTMwNDk1YzU2NTRhNDI1NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:50:46.367904'),
('chnf8f33d057959a0540b8ab7beed75e', 'YTNiN2Q1ZjNkZTc3ZGE2ODZhNjk5MmQ4YTMwNDk1YzU2NTRhNDI1NDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 09:51:01.821749'),
('chn964caf344b6a66b0032d4f581359b', 'YmE3NWUyNzBkMzk1ODdlNWIxZTk4MWE5MDA4OTQ0YmZmYTM0NmFlOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 17:51:48.752115'),
('sqh9k4sd3kffempoia2a34mya44jpq78', 'YjFiMjFiYmU5YmI2YzdhYmM5ODYwMTE5OTBjZjJkYmNhZjI5MWMyNTp7InVzZXJuYW1lIjoidGVzdCIsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNmZDYxZGNmNDg4NmMxYzQ5OWQ5ZmFiYzExNjk1YWViNmUyZmEzZSIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-08 10:20:45.531801'),
('01o1hq9m7ayqi2jc6vba0j0j7upu8u9u', 'OWFlODY5NTBmMGUxODVkYmUyOWU5ZGI2NDMyYzk1NzNlZWMyN2JlNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTk1YWQzOWYxODM0OGY3ZWE2Mjk3ZDRjODJkMWFiMTM0YzY2MjcxZSIsIl9hdXRoX3VzZXJfaWQiOiI3IiwidXNlcm5hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-08 18:21:53.032030'),
('chn3cd00f3b285eb9f19cf430c14d465', 'YmE3NWUyNzBkMzk1ODdlNWIxZTk4MWE5MDA4OTQ0YmZmYTM0NmFlOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 17:51:53.921912'),
('chn3ade9f2152fc85d8aed1b471bcda2', 'NDc4Y2JhNWNkZjJmMThlMDFmNzUwZmEyYmFhZmVhNzcwNDdmNDQwNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:29:15.146046'),
('chn9d8830e4ed87715b86b2134674cb8', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:32:36.291811'),
('chna207f989666e47d6e13dc5c1dacf0', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:31:39.046655'),
('chnde83692d8edda2e7fc033a0f6a20c', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:31:55.375218'),
('chn608229822c5dbbb8f8037868e9ed2', 'NDc4Y2JhNWNkZjJmMThlMDFmNzUwZmEyYmFhZmVhNzcwNDdmNDQwNDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:30:17.799345'),
('chnb584c8cdaab07d1ad86e7f63f1f8e', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:31:29.429703'),
('chna6d8f743b14c05d5de33d201e62ff', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:31:30.890979'),
('chn342424742b13f18606ccbe1d74245', 'NGYxZGYyYjlmYjg1YjY4ZjRmOTI1ZjAwNWU4MGZhMDM3M2Y1ZWUyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:37:14.934191'),
('chnc2e0695ecaea95dd4bdb9d710c494', 'NGYxZGYyYjlmYjg1YjY4ZjRmOTI1ZjAwNWU4MGZhMDM3M2Y1ZWUyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:39:46.276740'),
('chn47ce48833898152acf958f799f98b', 'YzFiNWY5MGI1YjQ0NGJhNzYyMTE5M2FiMjU3ODJmMDk5YmRjNDliNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:40:50.357465'),
('chn8ef42e7cdb7e7cee3061240b94f0b', 'NmI0ZTZkMGZmMjQ1ZjliZmY3ZTU5NjA5Y2RhYWIzM2E2NDBkZDJiMjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:35:09.559328'),
('chn47a5307ae6d7fd82a9f92b25eb45e', 'NGYxZGYyYjlmYjg1YjY4ZjRmOTI1ZjAwNWU4MGZhMDM3M2Y1ZWUyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:35:42.383692'),
('chn8ca7316d7321b8f4b78ac4b922c53', 'NGYxZGYyYjlmYjg1YjY4ZjRmOTI1ZjAwNWU4MGZhMDM3M2Y1ZWUyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:35:43.855133'),
('chnabcd55516b5e28d663b509406bd29', 'MmFkYTY1MjMzNWMwNTc2ZDljNTBiOGE2ZGE1NmRmY2RmMmQ4MmIyMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:41:19.416928'),
('chn7d7256c978e202f6fd61bfe07a154', 'MmFkYTY1MjMzNWMwNTc2ZDljNTBiOGE2ZGE1NmRmY2RmMmQ4MmIyMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:42:24.723184'),
('chnda2b06e427c87d110e519f083c079', 'MmFkYTY1MjMzNWMwNTc2ZDljNTBiOGE2ZGE1NmRmY2RmMmQ4MmIyMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:42:30.806500'),
('chn16b8befc4440a0a6bd7f727687193', 'YzFiNWY5MGI1YjQ0NGJhNzYyMTE5M2FiMjU3ODJmMDk5YmRjNDliNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:40:51.871648'),
('chn315a98583570290e7c75ede42a2a5', 'MmFkYTY1MjMzNWMwNTc2ZDljNTBiOGE2ZGE1NmRmY2RmMmQ4MmIyMTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:41:15.275952'),
('chnacec004aff39343add3a61cb5eda2', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:46:08.374659'),
('chn2447f541220be56b066ed558ce91f', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:46:49.885691'),
('chn71054b0894866fe5e36dd2dbf231a', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:49:00.317603'),
('chnebb7f2bc8f38cc6fbc2a705d7db9b', 'ZTlkMjFhOTA3ZTM4ZTk3Yjc4YmExMThjN2UzYmQxODhhOTkzMjUxYTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:45:21.153026'),
('chn8f9ea2bcab86c3ee4bf71ce2e87dd', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:45:57.144093'),
('chn55eb7fbba0422c0d276c83d69ced5', 'ZDcwODJhZWRmODRlM2ZmOTQ0MzFkMTRjMDJlNDJlMGVhODQxYWIxYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:50:28.375795'),
('chn7d72fc2be16124ce1e9685a46aeca', 'M2RkNjVhYjM3YzgzZjE2ZjdhZDdkNmU0OGI4MDU1MDYyOWYzMDE3OTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:51:46.489008'),
('chnf3ef77cd51486b77e94aa5a222198', 'MDQxOGU4ZWJiMzllYjRjMjIzMzkwYjljMjA5OWI2NWU3MTE5NzI2ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 10:54:46.162807'),
('chn54f7c3ea6f7d3a97a76c364e5014a', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:49:21.613755'),
('chne175a48ae764b0ebc3263d738206c', 'NzE4Njc0OTE4YTJlYjExOGU1OWE3ZGMzODU1MjllYjMxYjM4MjRhOTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:49:22.576172'),
('chn438f37053efea7605505e4e41221b', 'ZDcwODJhZWRmODRlM2ZmOTQ0MzFkMTRjMDJlNDJlMGVhODQxYWIxYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 18:50:24.732857'),
('chnfefc45cc13c405bf7b947341dcf15', 'MDQxOGU4ZWJiMzllYjRjMjIzMzkwYjljMjA5OWI2NWU3MTE5NzI2ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 10:54:50.080149'),
('mwr96rmvl1c6poi26uayk3oa25pqp63q', 'YjIyMDg5ZjkxMWFmYzM0MzY2ZTc0MTBmZDE0OTBkYjNlNTVlMDM5YTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiODliZmM0MDU0MWJjZGI2MWI5MWIwYThlMWE3ZjUwMmU5ZDU0NzRkZiIsInVzZXJuYW1lIjoidGVzdCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-08 14:38:14.099833'),
('chn0b9ebd3e6166300626c52259abc6b', 'ZTRhZWFlM2Y2ZTQxZDQ3NTVkOGJiZDA4NTM1MTM2YjczNjg5MjU4ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 11:01:40.717971'),
('chnad5f18e1fb8d36eee774e97c1af4a', 'OGQ1NjRjZmY1OWMzNzc5MTQ3N2U1NmI0MDM3ZWY4NjdhODE2NTUyYjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 10:58:10.554317'),
('g5xgga43bui41rfyhft029m9eh21df78', 'YjIyMDg5ZjkxMWFmYzM0MzY2ZTc0MTBmZDE0OTBkYjNlNTVlMDM5YTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiODliZmM0MDU0MWJjZGI2MWI5MWIwYThlMWE3ZjUwMmU5ZDU0NzRkZiIsInVzZXJuYW1lIjoidGVzdCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-08 11:31:39.952986'),
('chnb12ed54e279cfc9a0685f0a1d23c0', 'ZTRhZWFlM2Y2ZTQxZDQ3NTVkOGJiZDA4NTM1MTM2YjczNjg5MjU4ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:08:14.982458'),
('chn222f73d94835e76e3b512ee9882db', 'ZmY5MTE0ZGIyYTkzNThkZDg0ZTIxNDk1YWZmYjIxODEzMjEzMTMwNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:52:47.404247'),
('chn6dbbeb0786f4a3cc9b4a1acf4db2c', 'ZmY5MTE0ZGIyYTkzNThkZDg0ZTIxNDk1YWZmYjIxODEzMjEzMTMwNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:52:28.061759'),
('chn7e01b917b14f15a42d8e1e0bbf1be', 'ZmY5MTE0ZGIyYTkzNThkZDg0ZTIxNDk1YWZmYjIxODEzMjEzMTMwNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:52:34.744210'),
('chnff751d984dab9d08855cfbaae493f', 'ZTRhZWFlM2Y2ZTQxZDQ3NTVkOGJiZDA4NTM1MTM2YjczNjg5MjU4ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:51:06.701523'),
('chn68bd0c5d1fc6ea86a195be45bcc4f', 'ZTRhZWFlM2Y2ZTQxZDQ3NTVkOGJiZDA4NTM1MTM2YjczNjg5MjU4ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:51:27.110441'),
('chn027a9489955cee7ba63458b1a5d16', 'ZmY5MTE0ZGIyYTkzNThkZDg0ZTIxNDk1YWZmYjIxODEzMjEzMTMwNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:52:23.629089'),
('chn4c3534007eba9147f5a4284a443c3', 'OTRjODEyZDMyZjY4NWY3NzliYTE1Y2E5YjJjMGQyM2JhNTgwOWNlZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:55:18.158507'),
('chn0ee7d1521c618d1bf167dec303c2e', 'NDRhM2Q1MDlkMTU0MTlhM2YxNmFmZTg5MDlmM2QxNDIwMTNjOGNlYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 22:56:28.315968'),
('chn065bd1c870ee8f060fb5f343555ba', 'ZmY5MTE0ZGIyYTkzNThkZDg0ZTIxNDk1YWZmYjIxODEzMjEzMTMwNzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:53:40.544731'),
('chn7cbd7e9618c2351dc4f4650cf1512', 'OTRjODEyZDMyZjY4NWY3NzliYTE1Y2E5YjJjMGQyM2JhNTgwOWNlZTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 14:55:12.917476'),
('f8oa8wxb7j1ex37hk1zbksn9bug0dogs', 'MjA4YTI1NTM3NTljZjA1Y2UwNTk3ZTU0N2I4MDYwNzBiZGVkZmIzYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjciLCJ1c2VybmFtZSI6InRlc3QiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaGFzaCI6IjljZDliNDdlZTNjMzNhYjFlN2NkMWFiZmRjNmVlN2Q3YTc1OWY2MzQifQ==', '2017-01-08 15:25:17.493024'),
('chnf2d94a5fbd848ecd348f25374de4c', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:18:02.959939'),
('chnda807bd0765d041e8490f576dc4dd', 'OWRlYjg0Mzc2ZDI3ZWIzYjQyY2JhOTM5YjRhNTU4NWNmOTZjYWY4MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 22:58:24.051549'),
('chn53dc419d2c69f72b9a094fe7085c7', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:01:27.915861'),
('chnd963c76fb5a6af4130aeb81ca5385', 'NDRhM2Q1MDlkMTU0MTlhM2YxNmFmZTg5MDlmM2QxNDIwMTNjOGNlYzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 22:56:32.359017'),
('chnc86a33cb9c5b6654cd49d8c0a2a5d', 'OWRlYjg0Mzc2ZDI3ZWIzYjQyY2JhOTM5YjRhNTU4NWNmOTZjYWY4MTp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 22:58:21.288206'),
('chnac361ad7b0920516867e4c4f1f36a', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:01:41.259744'),
('chn59434ebe82866f6c19aa92e3a8768', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:01:52.780701'),
('chn8ddd96c5e6f645c0f4ddb0922c6fe', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:02:34.008168'),
('spk7x9eluybj9i1acfb5vb6zm3o9qu77', 'MjAwYThhZWUwYTMyYmQ4MTgwYmNmYWFlZmQwYWFiZjBjYTE4YTg4ZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwidXNlcm5hbWUiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaGFzaCI6ImE0ZDJjZmVmNjQ1MDA2YWY3ZWI5YzA1YzM4NjQ1MThiNTVlNmFiZWEifQ==', '2017-01-08 23:50:13.445390'),
('6pblo7ur9ym5thl4383lqhb9vxyw5f1o', 'MzBiMmIyYjRlMGZmOTNjZDk0NTc0ZDY5MTJhOTQ3ZDNhM2FhZWI0NDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsInVzZXJuYW1lIjoidGVzdDIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDAsIl9hdXRoX3VzZXJfaGFzaCI6ImE0ZDJjZmVmNjQ1MDA2YWY3ZWI5YzA1YzM4NjQ1MThiNTVlNmFiZWEifQ==', '2017-01-08 23:35:41.238599'),
('chnb652bfc54a8054d82bb1947f00732', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:05:42.116224'),
('chned5964e15f4879112f12bd4cec6bc', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:06:02.557138'),
('chnbd39f83c03b88e8be48a5279632cd', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:06:16.025739'),
('chnbe858872750e605ceb01c395ed965', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:06:22.863513'),
('chn853cca2a5b06570b3f801efb997a4', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:11:29.171310'),
('chnadc9543e4c5964348565b47177cfa', 'MGY4OWQ4YWRhMGQ2Mjk5Yzg0ODIyZDMwODNmN2U3NjViZjY2ZTkxODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-22 23:20:14.211233'),
('chn88457849125f36833286f7c3dec45', 'YjZmNzk2ZDY4MTU3MmFiMDZlYWUwZTBiNzY4YmZmODBjNjdiMmI5NTp7fQ==', '2017-01-23 09:36:06.242456'),
('chnb514a64aefbea6c5192051345ec97', 'ZmEwM2UxYzhhMGI3NjNhNWY0OTA4ZjRhNTkxNTc1YmU0NTU4NDAyZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:33:22.863183'),
('chn5bfd6c1c190c8ab8b8d6a0fc1f244', 'MGNkYzQ2NTcwZTY3MzBkZTBiNTljYzY3N2Q2NjFmMjBiYjNjYjJjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:29:16.562420'),
('chn5fae1cdd1a8dc02e8048968f5ba6e', 'MGNkYzQ2NTcwZTY3MzBkZTBiNTljYzY3N2Q2NjFmMjBiYjNjYjJjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:29:36.440927'),
('chn4ddb835763dace4f61d20dc954672', 'MGNkYzQ2NTcwZTY3MzBkZTBiNTljYzY3N2Q2NjFmMjBiYjNjYjJjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:29:40.943281'),
('chn7c9bf6966f08de46ca6c5769b6a91', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:09:19.284800'),
('chn48f218bc933436dada23195a9fc83', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:48:55.541374'),
('chn8c02f093ecd96f74c0777a56d1e48', 'MGNkYzQ2NTcwZTY3MzBkZTBiNTljYzY3N2Q2NjFmMjBiYjNjYjJjZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:30:20.118460'),
('chn58e15934de2a5d4de54a7b73cc7a6', 'MWRjYWQ4OGJlMjkwOTAwODczNzQ1MTRjYTkzNWIyYWVlZDU4YzNlODp7fQ==', '2017-01-23 09:35:26.486956'),
('chne4480ae9c29a0d3763fdb24165370', 'YjZmNzk2ZDY4MTU3MmFiMDZlYWUwZTBiNzY4YmZmODBjNjdiMmI5NTp7fQ==', '2017-01-23 09:36:06.220440'),
('chnbc07075cb44e69552e06ea24fb712', 'ZmEwM2UxYzhhMGI3NjNhNWY0OTA4ZjRhNTkxNTc1YmU0NTU4NDAyZjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:33:30.879229'),
('chneaac797898d4598f89ebc7bb11939', 'MWRjYWQ4OGJlMjkwOTAwODczNzQ1MTRjYTkzNWIyYWVlZDU4YzNlODp7fQ==', '2017-01-23 09:35:22.475284'),
('chn0058eb7703b4aa403c105052f812f', 'MWRjYWQ4OGJlMjkwOTAwODczNzQ1MTRjYTkzNWIyYWVlZDU4YzNlODp7fQ==', '2017-01-23 09:35:22.482284'),
('chn9ee171bf6b1c30734bc6403fa9d80', 'YjZmNzk2ZDY4MTU3MmFiMDZlYWUwZTBiNzY4YmZmODBjNjdiMmI5NTp7fQ==', '2017-01-23 09:36:10.308152'),
('chnb0df01c12c74e579b3d6c1083d1d3', 'YmM5NTM1YmMxZDM1NzlhZGIwMjVlMTI2YTFiMGRkOWU2MjFmNmZjNjp7fQ==', '2017-01-23 09:37:14.822047'),
('chn9422cfcb7d01e8a98492862baf127', 'YmM5NTM1YmMxZDM1NzlhZGIwMjVlMTI2YTFiMGRkOWU2MjFmNmZjNjp7fQ==', '2017-01-23 09:37:14.825049'),
('chndaf2652da4f8420f34a46c1d99038', 'YjZmNzk2ZDY4MTU3MmFiMDZlYWUwZTBiNzY4YmZmODBjNjdiMmI5NTp7fQ==', '2017-01-23 09:36:07.708920'),
('chn33bfd379e83ffe3218cc0d115b91d', 'YmM5NTM1YmMxZDM1NzlhZGIwMjVlMTI2YTFiMGRkOWU2MjFmNmZjNjp7fQ==', '2017-01-23 09:37:19.239794'),
('chn492be0cfc37ae4889f3397003cf92', 'OTZjMmU3MjU0NjdlNDY1MmYyYWZjZTY3ZWFhZGZjMGExZWViMTY1NDp7fQ==', '2017-01-23 09:37:56.347796'),
('chne314c23568841a62adae66a178efd', 'OTZjMmU3MjU0NjdlNDY1MmYyYWZjZTY3ZWFhZGZjMGExZWViMTY1NDp7fQ==', '2017-01-23 09:37:56.353801'),
('chn2ee7f33337b56da663410264d909a', 'OTZjMmU3MjU0NjdlNDY1MmYyYWZjZTY3ZWFhZGZjMGExZWViMTY1NDp7fQ==', '2017-01-23 09:37:59.427314'),
('chndec0025e467ed09a9af837e3fb5f1', 'ZjUyMWVkNDJmNzQ3ZWZhNDY4Yzg1ZTdlZDdmYjk5ZjVjNmE3NTMxNDp7fQ==', '2017-01-23 09:39:25.813906'),
('chne345cb715d7e6fc88c349e820fa75', 'ZjUyMWVkNDJmNzQ3ZWZhNDY4Yzg1ZTdlZDdmYjk5ZjVjNmE3NTMxNDp7fQ==', '2017-01-23 09:39:26.248458'),
('chn78f582e131b1f214ac5c79410907c', 'OTZjMmU3MjU0NjdlNDY1MmYyYWZjZTY3ZWFhZGZjMGExZWViMTY1NDp7fQ==', '2017-01-23 09:37:58.032597'),
('chn7b177572726afe934d809b882ddca', 'ZjUyMWVkNDJmNzQ3ZWZhNDY4Yzg1ZTdlZDdmYjk5ZjVjNmE3NTMxNDp7fQ==', '2017-01-23 09:39:31.853416'),
('chn4aaadca312d434cded4489cc39094', 'MWE3OGY1Y2Q2OWI0MTMyYTRjNDRhNTEwYzU1MzdjNjBkMzYyYjk3Njp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:39:46.560930'),
('chn2ab6ac282f6387fcaa5d8cdf7a956', 'MWE3OGY1Y2Q2OWI0MTMyYTRjNDRhNTEwYzU1MzdjNjBkMzYyYjk3Njp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:39:46.565933'),
('chn2123baffb8c97603ebea07a6b47e7', 'MWE3OGY1Y2Q2OWI0MTMyYTRjNDRhNTEwYzU1MzdjNjBkMzYyYjk3Njp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:39:49.575636'),
('chna8fed135ea214de97f48673fc05d9', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:42:42.952823'),
('chna932aa80df13fc5c3f1d55319153d', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:42:42.959828'),
('chnfe0744b36ecf0733ea177c3edaf61', 'MWE3OGY1Y2Q2OWI0MTMyYTRjNDRhNTEwYzU1MzdjNjBkMzYyYjk3Njp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:39:47.967929'),
('chn5f4494f3f67bae65e9617e94cd28c', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:42:47.027265'),
('chnc08ab52833de72a5e6eb5bfdb9ed1', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:43:31.813215'),
('chn5d885ba36cbb2ddb257cae65d2252', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:43:40.893261'),
('chn952af8da753ebefadac1851d2b70b', 'MjY4ZjYxM2UyMzk4Y2EyZjY5M2UxZDRiYTEyNjVjMzY4MDc5ODllODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:44:59.972322'),
('chn05776c782ef6764a00fd64754ac46', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:12.515874'),
('chnabf4c2010e84886bb42775691a2b6', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:12.520877'),
('chnb5681f753610a236eb5f54c389978', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:44:10.073168'),
('chn159c1b3e4e4bd42556c31d2fb40cf', 'MWI0ZTQzYzFlNTE2Y2RlOWM1MzY5NjFkMWU2ZmU1ZDI2Yzc4ZmM1ZDp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:44:27.231489'),
('chnd9d754f98fa93c5f7f2c6dc4d0707', 'ZmJmNzY1NjAxNmUzYmRjNDU3Mjg0MWVlN2U4YTc0Yzg4NzIxOTFlNDp7fQ==', '2017-01-23 09:44:36.526557'),
('chnb4e3da672f4dadbf00fc076c5ac45', 'ZmJmNzY1NjAxNmUzYmRjNDU3Mjg0MWVlN2U4YTc0Yzg4NzIxOTFlNDp7fQ==', '2017-01-23 09:44:36.530560'),
('chn256e2df593373afa3ff1d7be24802', 'ZmJmNzY1NjAxNmUzYmRjNDU3Mjg0MWVlN2U4YTc0Yzg4NzIxOTFlNDp7fQ==', '2017-01-23 09:44:40.445895'),
('chnd283eedaa3f42049f10debbe011b0', 'MjY4ZjYxM2UyMzk4Y2EyZjY5M2UxZDRiYTEyNjVjMzY4MDc5ODllODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:44:55.771558'),
('chnd8ed32928347b35efa3bb933837d7', 'MjY4ZjYxM2UyMzk4Y2EyZjY5M2UxZDRiYTEyNjVjMzY4MDc5ODllODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:44:55.768556'),
('chnf77e1dd6550974e7dbccc72347c98', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:48:31.250652'),
('t6ks2h5z7ddgi0fbj7qz6ftfstphaivn', 'OGZiMDEzNDMxNTViMTc3Yzc5NjUzNmJkNDJlZjI2YjI2ODFjNGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsInVzZXJuYW1lIjoidGVzdDIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzFjM2IwZWNiZWRiNzc3ZjhmZmE3Mzg3OTk3Njc1MjkzZTI0YTIxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-09 10:42:54.550589'),
('chn05ae136ebc9fddc490f0823f562ff', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:24.749401'),
('chnd8cd8b571e2ae6cd6dd5c7c631152', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:32.732266'),
('chn5e2ad46b5de2f7183f1c327bd0610', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:43.429032'),
('chn761ce31602109fcf4d5e564941725', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:53.213211'),
('chn2b8e4abfb3d16b763f12fee407054', 'YTRkNjhjNjU3ZWU3MWQyMGU1NDlkY2FkNzFlYjdiYmEwMTI0ZTA5Nzp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:47:55.598609'),
('chn40c46e7217ed86d01b05e140a061e', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:48:27.238224'),
('chn6b0c17a948bb946c2f5baa1eed390', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:48:27.250232'),
('17vdm5c2tylil1lzqf35gdc95llzlrg3', 'ZGQxYzVhMjZkYjU5OGVjMzE3YjEyMjEzMDFjYjMxMWUxMTE5YWEzOTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwidXNlcm5hbWUiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NzFjM2IwZWNiZWRiNzc3ZjhmZmE3Mzg3OTk3Njc1MjkzZTI0YTIxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxODAwfQ==', '2017-01-09 10:40:44.783322'),
('chnb2dcedae7aab977a435749f696780', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 09:49:05.245518'),
('chne725046da72ab96c926b9785ed83c', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:10:11.321394'),
('chn08515269f7ef1e956b8c8cd2c1bb2', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:10:45.829363'),
('chn455cd041d9502e8a461e15452a292', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:12:13.726773'),
('chn36e547fe6ad6a62eb1bbb004027d5', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:12:19.266487'),
('chn22d2b3deda3f57f06fbc753551c46', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:12:26.798830'),
('chnf207fd7dba09f6badfa176523afff', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:12:55.275104'),
('chn39a5d604fae8375e15f3416d6440a', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:13:03.279008'),
('chnab5327a3ad7333e6d4eab369b06f9', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:14:26.224295'),
('chn567d4d2d26cb052f8b8c234ae3e10', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:15:35.012434'),
('chn300f27e3afde1806cb25c8afca421', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:30:27.514118'),
('chn9997e0164a3e4741fbfaa5e5352c3', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:30:36.807909'),
('chn47c7137f071111f3143a9c0207fd6', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:30:45.158832'),
('chn782ce6d6cd9b8c4f09e668cbe2479', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:31:23.924046'),
('chn08f8a01e6c6da1ac3500b899e9a8c', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:31:33.806084'),
('chnaf7c8b177e017247887aa8bea4b2a', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:33:19.255952'),
('chn248388d5438c447aeb1cca2db3945', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:33:30.077760'),
('chn45fbdc9f3dbef48b6b7d4a8671d7e', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:34:22.041434'),
('chn85501324147308fd913a27c29ee4c', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:34:26.653652'),
('chn1ff3a006511ecd7706b69e2832c37', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:47:57.690799'),
('chn114c5958e26e657b6161c36023d77', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:45:53.294626'),
('chn0d8ae017d088ec322d1715946055a', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:46:53.160194'),
('chn798e84863eeae6a43884b58e068fc', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:44:12.879825'),
('chnc7b659e0a0a85003613071cac6783', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:44:50.269129'),
('chnf14fe73c5e17e90f9a784d223b4f3', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:44:51.985345'),
('chnaba4205f27804b39d6a94b9691d28', 'MWJjNTRkOTFhZmQ1MDJiYmYwNWJmZjEzOTgxNGNhYWRhZWNjMDcxNjp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:44:53.193429'),
('chne7f922602b97f5fbf8d138c8f4ee1', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:45:50.336791'),
('chn2f845bc084f06f4f7416798f77bfb', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:45:50.393833'),
('x8ojp3x2c54lsf52e0dwc4e4tl8a29br', 'MWM0MjQwOGJlODVhMzE2OTQ4MmQ0YzBkYjZkNDM3MTFmNzYzZDFhMzp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2hhc2giOiI2ZDZkODc1ODJiNGM4OTcxZjJmYjRhYzE4NmE5MTRlNjdkNmI4N2EzIiwidXNlcm5hbWUiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-09 11:15:52.460766'),
('chn416f08584e675de7518cc59ddd99b', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:48:10.598887'),
('chn62b375694cb88c77c2521d642339e', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:48:15.974428'),
('chnae879ffb152d813d947c3e0d3d9aa', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:48:44.565295'),
('chndcae94ace41803e57ae480738662d', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:48:50.342384'),
('rgp8wbk9g5l0p4zsyukfbgfuilcfnism', 'MTQ3YWIyZWUxYmViNjMzNTkyOGRlMzdmNDNhNGJhMDkwNTcxMTQ3NTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9pZCI6IjEyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmQ2ZDg3NTgyYjRjODk3MWYyZmI0YWMxODZhOTE0ZTY3ZDZiODdhMyIsInVzZXJuYW1lIjoidGVzdDIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-09 11:19:00.608856'),
('chnb188c1b7107f3d820763615b6bcb2', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:49:01.403421'),
('chnac3243a9b729599cf83b55c299432', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:49:06.404696'),
('chn27c53a5267dab267cb959119a8d66', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:50:12.997180'),
('chne460420c8ed96eb219993bc11f33a', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:51:03.811357'),
('chndd408f0e047d90e4bb9aecd156567', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:53:10.995613'),
('chna69d89d597fffc92352d15dd03499', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:55:14.903807'),
('chne80ec4bad4eefede72f80ca242b40', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:55:39.679959'),
('chn23d8609af9ca6f7ce1bda6713b5c9', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:56:17.925945'),
('chnf384ca832390d2179eeaed814df83', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:57:41.110005'),
('chn73474557c6de4ef0897e9d4d5d267', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 10:58:50.203427'),
('chne145dc209af0f18a7f56a771b8e1d', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:00:52.537769'),
('chn74ba12d9b630972c12d67e411f386', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:03:17.581249'),
('chn71fc7fb460ed8cacd5b4715370e3d', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:04:31.882132'),
('chnf785e92185b0d223da2ca785c91c5', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:08:11.638410'),
('chn25df8e4f6f099ca9b5a5c18a779a6', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:09:05.082167'),
('chnd37b3b7d50557c902c118652378c5', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:09:32.103580'),
('chn0ea7002f8a2dfba83843c7214eac7', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:11:37.501535'),
('chn340056ad606e798a47c8477921ad5', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:12:36.638729'),
('chn2fe88596a680856299c441a8e4e6a', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:12:52.387173'),
('chn49be40ae75f49d9813d63dd8a7005', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:13:51.832921'),
('chn7009471d0a76417420f1050cbf23d', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:14:58.909648'),
('chna7f63e0f492f977ec728da18d7def', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:15:04.987044'),
('fecm9f00julmy68q0mm15h1cynxm45gb', 'MWM0MjQwOGJlODVhMzE2OTQ4MmQ0YzBkYjZkNDM3MTFmNzYzZDFhMzp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2hhc2giOiI2ZDZkODc1ODJiNGM4OTcxZjJmYjRhYzE4NmE5MTRlNjdkNmI4N2EzIiwidXNlcm5hbWUiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-09 11:46:18.348176'),
('chn7ad74905b4254c9c7d6275bec1ac4', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:16:19.219794'),
('chnc7aa6f57abe63adbb4263c4194d1d', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:16:30.480891'),
('chn134c48a36f2ac7d916694e69b11ee', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:16:49.000510'),
('chn07fdb0e6361bf22501bb6451634f7', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:17:02.679874'),
('chnc3debf1ad00986cfe771268c518d7', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:17:15.933096'),
('chna4a9dbd7ba50df3e2f64b37b4f4de', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:17:17.608837'),
('chn4d8044fb6f1b72fe48d4b6690eb9e', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:17:36.271069'),
('chn2f23d5028741d024846582388110c', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:18:36.866237'),
('h1g7784gawx5kq2ree6vg4udr2wgv1ho', 'MTQ3YWIyZWUxYmViNjMzNTkyOGRlMzdmNDNhNGJhMDkwNTcxMTQ3NTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMCwiX2F1dGhfdXNlcl9pZCI6IjEyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmQ2ZDg3NTgyYjRjODk3MWYyZmI0YWMxODZhOTE0ZTY3ZDZiODdhMyIsInVzZXJuYW1lIjoidGVzdDIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==', '2017-01-09 12:23:40.422096'),
('chn0b36253cb35b77d5cdcf9de5403d1', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:53:41.256693'),
('chnc5096bae59a646ea18f124dfcb2f3', 'YWEzOWEwMTcxYjUwZTdiZDk4NDEyZTE1ZDE4MDBhZjFmYjNmNTczODp7InJvb20iOiJkZWZhdWx0In0=', '2017-01-23 11:54:36.555648');

-- --------------------------------------------------------

--
-- 表的结构 `msg_type`
--

CREATE TABLE `msg_type` (
  `msg_type_id` int(11) NOT NULL,
  `msg_type` varchar(45) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `msg_type`
--

INSERT INTO `msg_type` (`msg_type_id`, `msg_type`, `create_time`) VALUES
(1, '1', '2017-01-09 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `user_nickname` varchar(45) NOT NULL,
  `user_username` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_avatar` varchar(45) DEFAULT NULL,
  `user_invitecode` varchar(45) DEFAULT NULL,
  `user_createtime` datetime DEFAULT NULL,
  `user_pwd_try_times` int(11) DEFAULT '0',
  `user_islocked` tinyint(1) DEFAULT '0',
  `user_login_ip` varchar(45) DEFAULT NULL,
  `user_login_times` int(10) DEFAULT '0',
  `user_last_logintime` datetime DEFAULT NULL,
  `user_my_invite_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `user_nickname`, `user_username`, `user_password`, `user_avatar`, `user_invitecode`, `user_createtime`, `user_pwd_try_times`, `user_islocked`, `user_login_ip`, `user_login_times`, `user_last_logintime`, `user_my_invite_code`) VALUES
(17, 7, 'test', 'test', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'dafsd', '2017-01-05 02:51:55', 0, 0, '127.0.0.1', 134, '2017-01-09 11:16:18', 'fAzY6C'),
(19, 9, 'test2', 'test2', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'dafsd', '2017-01-05 02:54:08', 0, 0, NULL, 0, NULL, 'z0cNbY'),
(20, 10, 'testdaf', 'dfadsf', '2811c7ce7cf07343ce2c433808c65905', NULL, 'dafsd', '2017-01-05 02:54:35', 0, 0, NULL, 0, NULL, 'E1fhPF'),
(21, 11, '所得发得手', '使得发达省份', '9eab700ced8bf1bfd2207287b6042593', NULL, '', '2017-01-06 12:28:30', 0, 0, NULL, 0, NULL, '6dDfvX'),
(22, 12, '太岁府', 'test22', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', '2017-01-08 01:45:29', 0, 0, '127.0.0.1', 16, '2017-01-09 11:53:40', 'kPH5Vk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_0e939a4f` (`group_id`),
  ADD KEY `auth_group_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_417f1b1c` (`content_type_id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_e8701ad4` (`user_id`),
  ADD KEY `auth_user_groups_0e939a4f` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  ADD KEY `auth_user_user_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `chatol_message`
--
ALTER TABLE `chatol_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatOL_message_d7e6d55b` (`timestamp`),
  ADD KEY `chatOL_message_8273f993` (`room_id`);

--
-- Indexes for table `chatol_room`
--
ALTER TABLE `chatol_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- Indexes for table `chat_log`
--
ALTER TABLE `chat_log`
  ADD PRIMARY KEY (`msg_id`,`from_user_id`,`msg_type_id`,`chat_room_id`),
  ADD UNIQUE KEY `msg_id_UNIQUE` (`msg_id`),
  ADD KEY `fk_chat_record_user_idx` (`from_user_id`),
  ADD KEY `fk_chat_log_msg_type1_idx` (`msg_type_id`),
  ADD KEY `fk_chat_log_chat_room1_idx` (`chat_room_id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`chat_room_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_417f1b1c` (`content_type_id`),
  ADD KEY `django_admin_log_e8701ad4` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `msg_type`
--
ALTER TABLE `msg_type`
  ADD PRIMARY KEY (`msg_type_id`),
  ADD UNIQUE KEY `msg_type_id_UNIQUE` (`msg_type_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `user_nickname_UNIQUE` (`user_nickname`),
  ADD UNIQUE KEY `user_username_UNIQUE` (`user_username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `chatol_message`
--
ALTER TABLE `chatol_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `chatol_room`
--
ALTER TABLE `chatol_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `msg_type`
--
ALTER TABLE `msg_type`
  MODIFY `msg_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 限制导出的表
--

--
-- 限制表 `chat_log`
--
ALTER TABLE `chat_log`
  ADD CONSTRAINT `fk_chat_log_chat_room1` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`chat_room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chat_log_msg_type1` FOREIGN KEY (`msg_type_id`) REFERENCES `msg_type` (`msg_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chat_record_user` FOREIGN KEY (`from_user_id`) REFERENCES `user_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
