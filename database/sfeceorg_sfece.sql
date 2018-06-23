-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2018 at 10:03 AM
-- Server version: 5.6.39-83.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sfeceorg_sfece`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_levels`
--

CREATE TABLE `account_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_levels`
--

INSERT INTO `account_levels` (`id`, `name`, `role`, `created_at`, `updated_at`) VALUES
(1, 'مدير', 'admin', NULL, NULL),
(2, 'عضو موقع ', 'subscribe', NULL, NULL),
(3, 'عضوية الأسرة', 'subscribe,premium', NULL, NULL),
(4, 'عضوية الطلاب', 'subscribe,premium', NULL, NULL),
(5, 'عضوية نظامية', 'subscribe,premium', NULL, NULL),
(6, 'عضوية شاملة', 'subscribe,premium', NULL, NULL),
(7, 'عضوية شرفية', 'subscribe,premium', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_levels_sec_groups_relationship`
--

CREATE TABLE `account_levels_sec_groups_relationship` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_level_id` int(11) NOT NULL,
  `sec_group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_levels_sec_groups_relationship`
--

INSERT INTO `account_levels_sec_groups_relationship` (`id`, `account_level_id`, `sec_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2018-05-11 10:55:05', NULL),
(2, 2, 2, '2018-05-11 10:55:05', NULL),
(3, 3, 2, '2018-05-11 10:55:05', NULL),
(4, 3, 3, '2018-05-11 10:55:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_by`, `updated_by`, `parent_id`, `ordering`, `deleted_at`, `created_at`, `updated_at`, `slug`) VALUES
(2, NULL, NULL, NULL, 0, NULL, '2018-05-11 11:09:31', '2018-05-12 14:48:34', 'magazen'),
(3, NULL, NULL, 2, 0, NULL, '2018-05-11 11:10:28', '2018-05-11 11:10:28', 'magazen_1'),
(4, NULL, NULL, 2, 0, NULL, '2018-05-11 11:13:34', '2018-05-11 11:13:34', 'magazen_3'),
(5, NULL, NULL, NULL, 0, NULL, '2018-05-11 11:41:03', '2018-05-11 11:41:03', 'annual_events'),
(6, NULL, NULL, 5, 0, NULL, '2018-05-11 11:43:51', '2018-05-11 11:43:51', 'forum'),
(7, NULL, NULL, 5, 0, NULL, '2018-05-11 11:44:59', '2018-05-11 11:44:59', 'conference'),
(12, NULL, NULL, NULL, 0, NULL, '2018-05-18 21:29:58', '2018-05-18 21:29:58', 'books'),
(13, NULL, NULL, NULL, 0, NULL, '2018-05-28 07:55:49', '2018-05-28 07:55:49', 'acadmy'),
(14, NULL, NULL, 13, 0, NULL, '2018-05-28 07:56:50', '2018-05-28 07:56:50', 'trainning'),
(15, NULL, NULL, 13, 0, NULL, '2018-05-28 07:57:31', '2018-05-28 07:57:31', 'quality');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `title`, `description`) VALUES
(3, 2, 'ar', 'المجلات التعليمية', 'المجلات التعليمية'),
(4, 2, 'en', 'Magazen', 'Magazen'),
(5, 3, 'ar', 'المجلة العربية لتربية الطفولة المبكرة', '<p>المجلة العربية لتربية الطفولة المبكرة</p>'),
(6, 3, 'en', 'المجلة العربية لتربية الطفولة المبكرة', '<p>المجلة العربية لتربية الطفولة المبكرة</p>'),
(7, 4, 'ar', 'المجلة العربية لدراسات الطفولة', '<p>المجلة العربية لدراسات الطفولة</p>'),
(8, 4, 'en', 'Arab Journal for Early Childhood Education', '<p>Arab Journal for Early Childhood Education</p>'),
(9, 5, 'ar', 'الفعاليات السنوية', 'الفعاليات السنوية'),
(10, 5, 'en', 'Annual Events', 'Annual Events'),
(11, 6, 'ar', 'المنتديات السنوية', '<p>المنتديات</p>'),
(12, 6, 'en', 'Anual Forum', '<p>Forum</p>'),
(13, 7, 'ar', 'المؤتمرات السنوية', '<p>Conference</p>'),
(14, 7, 'en', 'Anual Conference', '<p>Conference</p>'),
(23, 12, 'ar', 'اصداراتنا', '<p>جميع الكتب التي يصدر المركز العلمي لتربية الطفولة المبكرة</p>'),
(24, 12, 'en', 'Books', '<p>All books witch we have publihsed it.</p>'),
(25, 13, 'ar', 'الأكاديمية', '<p>الأكاديمية</p>'),
(26, 13, 'en', 'Acadmy', '<p>Acadmy</p>'),
(27, 14, 'ar', 'التدريب', '<p>التدريب</p>'),
(28, 14, 'en', 'Trainning', '<p>Trainning</p>'),
(29, 15, 'ar', 'الجودة', '<p>الجودة</p>'),
(30, 15, 'en', 'Quality', '<p>Quality</p>');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `post_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` double NOT NULL,
  `file_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_attribute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `size`, `file_type`, `model_name`, `model_id`, `model_attribute`, `created_at`, `updated_at`) VALUES
(1, '65b80_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 56, 'main', '2018-05-16 12:24:49', '2018-05-16 12:24:49'),
(2, '74654_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 57, 'main', '2018-05-16 12:35:17', '2018-05-16 12:35:17'),
(3, '0645a_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 59, 'main', '2018-05-17 13:30:18', '2018-05-17 13:30:18'),
(4, 'c5825_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 62, 'main', '2018-05-17 14:10:56', '2018-05-17 14:10:56'),
(5, '4700d_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 63, 'main', '2018-05-17 18:43:20', '2018-05-17 18:43:20'),
(6, '5c4b5_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 64, 'main', '2018-05-17 18:48:44', '2018-05-17 18:48:44'),
(7, 'fc934_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 65, 'main', '2018-05-17 18:49:53', '2018-05-17 18:49:53'),
(8, 'ffa05_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 66, 'main', '2018-05-17 18:52:32', '2018-05-17 18:52:32'),
(9, 'fc2da_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 67, 'main', '2018-05-17 18:53:31', '2018-05-17 18:53:31'),
(10, 'b6c32_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 68, 'main', '2018-05-17 18:54:28', '2018-05-17 18:54:28'),
(11, '62ad8_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 70, 'main', '2018-05-17 19:01:36', '2018-05-17 19:01:36'),
(12, '2018-05-17--09-08-11_82ef80ca4434c4ca9aad681674681a73d801ef1a.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 71, 'main', '2018-05-17 19:08:11', '2018-05-17 19:08:11'),
(13, '8ced7_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 72, 'main', '2018-05-17 19:10:00', '2018-05-17 19:10:00'),
(14, '664cb_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 73, 'main', '2018-05-17 19:11:36', '2018-05-17 19:11:36'),
(15, '71886_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 74, 'main', '2018-05-17 19:21:13', '2018-05-17 19:21:13'),
(16, '119ef_تقرير قسم البرمجة.docx', 15018, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 75, 'main', '2018-05-17 19:33:11', '2018-05-17 19:33:11'),
(17, '8d631_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 76, 'main', '2018-05-17 19:56:53', '2018-05-17 19:56:53'),
(18, '70539_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 77, 'main', '2018-05-17 23:02:54', '2018-05-17 23:02:54'),
(19, 'f50d9_BHS.xlsx', 991821, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 78, 'main', '2018-05-17 23:22:26', '2018-05-17 23:22:26'),
(20, '69f45_سيرة ذاتية 1-2018.doc', 205824, 'application/msword', 'App\\Models\\Post', 88, 'main', '2018-05-28 07:02:45', '2018-05-28 07:02:45'),
(21, '28507_SMS Screenshots - Accounts.docx', 458533, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'App\\Models\\Post', 95, 'main', '2018-06-22 20:32:46', '2018-06-22 20:32:46'),
(22, 'd5115_Intoegy_Senders.xlsx', 34694, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'App\\Models\\Post', 96, 'main', '2018-06-22 20:39:15', '2018-06-22 20:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` double NOT NULL,
  `media_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_attribute` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `name`, `size`, `media_type`, `model_name`, `model_id`, `model_attribute`, `created_at`, `updated_at`) VALUES
(1, '44b60_screenshot.png', 707799, 'image/png', 'App\\Models\\Post', 1, 'main', '2018-05-11 12:29:29', '2018-05-11 12:29:29'),
(2, 'bdae0_screenshot_1.png', 87189, 'image/png', 'App\\Models\\Post', 5, 'main', '2018-05-13 08:00:40', '2018-05-13 08:00:40'),
(3, '6c366_screenshot_2.png', 684163, 'image/png', 'App\\Models\\Post', 9, 'main', '2018-05-13 08:16:40', '2018-05-13 08:16:40'),
(4, '97042_shutterstock_380086414-e1496415021258.jpg', 60960, 'image/jpeg', 'App\\Models\\Post', 12, 'main', '2018-05-13 08:44:21', '2018-05-13 08:44:21'),
(5, 'b5931_shutterstock_380086414-e1496415021258.jpg', 60960, 'image/jpeg', 'App\\Models\\Post', 13, 'main', '2018-05-13 08:48:39', '2018-05-13 08:48:39'),
(6, '653a4_e6d06.png', 150258, 'image/png', 'App\\Models\\Post', 18, 'main', '2018-05-13 11:08:07', '2018-05-13 11:08:07'),
(7, '9b26b_e6d06.png', 150258, 'image/png', 'App\\Models\\Post', 19, 'main', '2018-05-13 11:08:39', '2018-05-13 11:08:39'),
(8, 'e624f_e6d06.png', 150258, 'image/png', 'App\\Models\\Post', 20, 'main', '2018-05-13 11:10:24', '2018-05-13 11:10:24'),
(9, '22a41_sliser1.jpg', 1052890, 'image/jpeg', 'App\\Models\\Post', 23, 'main', '2018-05-13 11:31:24', '2018-05-13 11:31:24'),
(10, '47944_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 26, 'main', '2018-05-13 12:53:28', '2018-05-13 12:53:28'),
(11, 'c620c_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 27, 'main', '2018-05-13 13:12:15', '2018-05-13 13:12:15'),
(12, 'dc2f9_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 28, 'main', '2018-05-13 13:14:40', '2018-05-13 13:14:40'),
(13, '8a007_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 29, 'main', '2018-05-13 13:32:19', '2018-05-13 13:32:19'),
(14, 'bd807_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 30, 'main', '2018-05-13 13:36:22', '2018-05-13 13:36:22'),
(15, 'a985d_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 31, 'main', '2018-05-13 13:37:25', '2018-05-13 13:37:25'),
(16, 'ca63c_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 32, 'main', '2018-05-13 13:41:26', '2018-05-13 13:41:26'),
(17, '0d121_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 33, 'main', '2018-05-13 15:04:13', '2018-05-13 15:04:13'),
(18, '76cd7_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 36, 'main', '2018-05-13 15:40:34', '2018-05-13 15:40:34'),
(19, '6a360_big_bunny_fake.jpg', 94838, 'image/jpeg', 'App\\Models\\Post', 37, 'main', '2018-05-13 15:41:56', '2018-05-13 15:41:56'),
(20, 'ba416_big_bunny_fake.jpg', 94838, 'image/jpeg', 'App\\Models\\Post', 3, 'main', '2018-05-13 15:46:00', '2018-05-13 15:46:00'),
(21, 'cd9c1_road.jpg', 827229, 'image/jpeg', 'App\\Models\\Post', 38, 'main', '2018-05-14 05:13:27', '2018-05-14 05:13:27'),
(22, '4bfee_leaf.jpg', 164978, 'image/jpeg', 'App\\Models\\Post', 39, 'main', '2018-05-14 05:18:04', '2018-05-14 05:18:04'),
(31, 'fc134_screenshot_1.png', 87189, 'image/png', 'App\\Models\\Post', 57, 'main', '2018-05-16 12:35:17', '2018-05-16 12:35:17'),
(32, '60d24_screenshot_1.png', 87189, 'image/png', 'App\\Models\\Post', 58, 'main', '2018-05-17 07:03:04', '2018-05-17 07:03:04'),
(35, '043fb_s1.jpg', 119211, 'image/jpeg', 'App\\Models\\Post', 81, 'main', '2018-05-28 01:47:12', '2018-05-28 01:47:12'),
(36, '1ea85_s2.png', 569125, 'image/png', 'App\\Models\\Post', 82, 'main', '2018-05-28 01:48:00', '2018-05-28 01:48:00'),
(37, '9c703_s3.jpg', 155524, 'image/jpeg', 'App\\Models\\Post', 83, 'main', '2018-05-28 01:48:38', '2018-05-28 01:48:38'),
(38, 'd04ee_s5.jpg', 220828, 'image/jpeg', 'App\\Models\\Post', 84, 'main', '2018-05-28 01:49:29', '2018-05-28 01:49:29'),
(39, '3c3f6_about-us.png', 290592, 'image/png', 'App\\Models\\Post', 85, 'main', '2018-05-28 01:55:40', '2018-05-28 01:55:40'),
(40, '11f60_vision and mission.jpg', 131681, 'image/jpeg', 'App\\Models\\Post', 86, 'main', '2018-05-28 02:02:09', '2018-05-28 02:02:09'),
(41, '67ed6_board_member_table.jpg', 35404, 'image/jpeg', 'App\\Models\\Post', 87, 'main', '2018-05-28 02:33:26', '2018-05-28 02:33:26'),
(42, '55e72_03f2197d47a602c679c5f667e3482855.jpg', 99035, 'image/jpeg', 'App\\Models\\Post', 58, 'main', '2018-05-28 06:55:19', '2018-05-28 06:55:19'),
(43, 'baadc_image001.jpg', 60168, 'image/jpeg', 'App\\Models\\Post', 88, 'main', '2018-05-28 07:00:39', '2018-05-28 07:00:39'),
(44, '2b99a_WhatsApp Image 2018-05-30 at 10.08.16 AM.jpeg', 142210, 'image/jpeg', 'App\\Models\\Post', 89, 'main', '2018-05-31 17:13:40', '2018-05-31 17:13:40'),
(45, 'cdaf8_WhatsApp Image 2018-05-30 at 10.08.16 AM(1).jpeg', 112336, 'image/jpeg', 'App\\Models\\Post', 90, 'main', '2018-05-31 17:17:37', '2018-05-31 17:17:37'),
(46, '89fbe_WhatsApp Image 2018-05-30 at 10.32.00 AM.jpeg', 99033, 'image/jpeg', 'App\\Models\\Post', 91, 'main', '2018-05-31 17:20:26', '2018-05-31 17:20:26'),
(47, '51b21_parents.png', 917056, 'image/png', 'App\\Models\\Post', 92, 'main', '2018-05-31 17:27:14', '2018-05-31 17:27:14'),
(48, 'c44a4_parents.png', 917056, 'image/png', 'App\\Models\\Post', 93, 'main', '2018-05-31 17:59:26', '2018-05-31 17:59:26'),
(49, '1dd84_screenshot_13.png', 242912, 'image/png', 'App\\Models\\Post', 94, 'main', '2018-06-22 19:43:40', '2018-06-22 19:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `location`, `created_at`, `updated_at`, `name`) VALUES
(1, 'main', '2018-05-02 05:53:20', '2018-05-07 06:45:52', 'Main Menu'),
(2, 'footer', '2018-05-15 13:30:20', '2018-05-15 13:30:20', 'Footer Menu'),
(3, 'header-social', '2018-05-26 00:59:19', '2018-05-26 01:09:49', 'Social');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE `menu_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `customlink` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `hasSubs` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`id`, `menu_id`, `customlink`, `category_id`, `parent_id`, `hasSubs`, `created_at`, `updated_at`) VALUES
(1, 1, '/', 0, 0, 0, '2018-05-02 05:53:20', '2018-05-07 06:45:52'),
(2, 1, '#', 0, 0, 0, '2018-05-07 06:47:26', '2018-05-07 06:47:26'),
(3, 1, '/vision', 0, 2, 0, '2018-05-07 06:48:17', '2018-05-07 06:48:17'),
(4, 1, '/stuff', 0, 2, 0, '2018-05-07 06:49:08', '2018-05-07 06:49:08'),
(5, 1, '/consult', 0, 2, 0, '2018-05-07 06:54:14', '2018-05-07 06:54:14'),
(6, 1, NULL, 12, 2, 0, '2018-05-07 06:59:41', '2018-05-28 07:53:38'),
(7, 1, NULL, 12, NULL, 0, '2018-05-07 07:00:21', '2018-05-28 07:51:19'),
(8, 1, NULL, 2, NULL, 1, '2018-05-07 07:01:30', '2018-06-13 15:15:13'),
(9, 1, NULL, 13, NULL, 1, '2018-05-07 07:02:31', '2018-05-28 07:58:15'),
(10, 1, '/anual_events', 5, NULL, 1, '2018-05-07 07:04:20', '2018-05-11 11:47:05'),
(13, 1, '//arabece.com', NULL, NULL, 0, '2018-05-07 07:09:21', '2018-06-13 15:21:16'),
(14, 1, '/contact-us', NULL, NULL, 0, '2018-05-07 07:10:27', '2018-05-28 06:56:05'),
(16, 2, '/events', NULL, NULL, 0, '2018-05-14 06:17:50', '2018-05-14 06:17:50'),
(17, 2, '/article', NULL, NULL, 0, '2018-05-14 06:18:45', '2018-05-14 06:18:45'),
(18, 2, '/versions', NULL, NULL, 0, '2018-05-14 06:19:49', '2018-05-14 06:19:49'),
(19, 2, '/contact_us', NULL, NULL, 0, '2018-05-14 06:20:37', '2018-05-14 06:20:37'),
(20, 3, 'https://www.facebook.com/sffece/', NULL, NULL, 0, '2018-05-26 01:01:02', '2018-05-28 08:03:38'),
(21, 3, 'https://twitter.com/', NULL, NULL, 0, '2018-05-26 01:11:58', '2018-05-26 01:11:58'),
(22, 3, 'https://youtube.com', NULL, NULL, 0, '2018-05-26 01:13:25', '2018-05-26 01:13:25'),
(23, 1, '/mrkz-altrjm-oalnshr', NULL, NULL, 0, '2018-06-14 12:55:35', '2018-06-14 12:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_link_translations`
--

CREATE TABLE `menu_link_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_link_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_link_translations`
--

INSERT INTO `menu_link_translations` (`id`, `menu_link_id`, `locale`, `title`) VALUES
(1, 1, 'ar', 'الرئيسية'),
(2, 1, 'en', 'Home'),
(3, 2, 'ar', 'من نحن؟'),
(4, 2, 'en', 'About us?'),
(5, 3, 'ar', 'الرؤية والإهداف'),
(6, 3, 'en', 'Vision'),
(7, 4, 'ar', 'مجلس الامناء'),
(8, 4, 'en', 'Stuff'),
(9, 5, 'ar', 'المجلس الاستشارى'),
(10, 5, 'en', 'Consult'),
(11, 6, 'ar', 'اصداراتنا'),
(12, 6, 'en', 'Our Versions'),
(13, 7, 'ar', 'شركائنا'),
(14, 7, 'en', 'Center'),
(15, 8, 'ar', 'المجلات العلمية'),
(16, 8, 'en', 'Magazine'),
(17, 9, 'ar', 'الأكاديمية'),
(18, 9, 'en', 'Academy'),
(19, 10, 'ar', 'الفعاليات السنوية'),
(20, 10, 'en', 'Anual Events'),
(25, 13, 'ar', 'الاباء والامهات'),
(26, 13, 'en', 'Parents'),
(27, 14, 'ar', 'اتصل بنا'),
(28, 14, 'en', 'Contact us'),
(31, 16, 'ar', 'الدورات'),
(32, 16, 'en', 'Events'),
(33, 17, 'ar', 'المقالات'),
(34, 17, 'en', 'Articles'),
(35, 18, 'ar', 'اصداراتنا'),
(36, 18, 'en', 'Oure Versions'),
(37, 19, 'ar', 'اتصل بنا'),
(38, 19, 'en', 'Contact us'),
(39, 20, 'ar', '<i class=\"fa fa-facebook-square fa-lg\"></i>'),
(40, 20, 'en', '<i class=\"fa fa-facebook-square fa-lg\"></i>'),
(41, 21, 'ar', '<i class=\"fa fa-twitter-square fa-lg\"></i>'),
(42, 21, 'en', '<i class=\"fa fa-twitter-square fa-lg\"></i>'),
(43, 22, 'ar', '<i class=\"fa fa-youtube-square fa-lg\"></i>'),
(44, 22, 'en', '<i class=\"fa fa-youtube-square fa-lg\"></i>'),
(45, 23, 'ar', 'مركز الترجمة والنشر'),
(46, 23, 'en', 'Publishing Center');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_28_213752_create_posts_table', 1),
(4, '2018_03_28_221516_create_post_typs_table', 1),
(5, '2018_03_29_125412_create_comments_table', 1),
(6, '2018_03_29_142917_create_categories_table', 1),
(7, '2018_03_30_054555_insert_post_types', 1),
(8, '2018_03_30_061433_create_tags_table', 1),
(9, '2018_03_30_061712_create_posts_tags_relationship_table', 1),
(10, '2018_03_30_062152_create_files_table', 1),
(11, '2018_03_30_062213_create_media_files_table', 1),
(12, '2018_03_30_065506_create_sec_role_categories_table', 1),
(13, '2018_03_30_065549_create_sec_roles_table', 1),
(14, '2018_03_30_065722_create_sec_roles_users_relationship_table', 1),
(15, '2018_03_30_065918_create_sec_accessright_table', 1),
(16, '2018_03_30_133529_create_jobs_table', 1),
(17, '2018_03_30_133547_create_failed_jobs_table', 1),
(18, '2018_04_05_135516_create_account_levels', 1),
(19, '2018_04_05_150707_add_account_level_id_to_Users_column', 1),
(20, '2018_04_05_152246_drop_all_sec_tables', 1),
(21, '2018_04_06_060049_rename_mediafiles_table', 1),
(22, '2018_04_06_181705_create_menu_table', 1),
(23, '2018_04_06_181754_create_menu_links_table', 1),
(24, '2018_04_12_140603_insert_root_record_category', 1),
(25, '2018_04_27_065048_create_translation_category_table', 1),
(26, '2018_04_27_192959_create_translation_menu_table', 1),
(27, '2018_04_30_083349_create_translation_posts_table', 1),
(28, '2018_05_01_162555_create_translation_menu_links_table', 1),
(29, '2018_05_01_162920_drop_translation_menus', 1),
(30, '2018_05_02_031732_create_join_menu_links', 1),
(31, '2018_05_02_211508_add_slug_to_posts', 1),
(32, '2018_05_02_212002_create_sec_groups_table', 1),
(33, '2018_05_02_212655_create_account_level_sec_groups_relationship_table', 1),
(34, '2018_05_02_212805_create_sec_permissions_table', 1),
(35, '2018_05_03_151839_insert_admin_permissions', 1),
(36, '2018_05_04_093109_add_slug_to_categories_table', 1),
(37, '2018_05_07_080200_add_force_filter_to_sec_permission', 1),
(38, '2018_05_07_103403_insert_menu_links', 1),
(39, '2018_05_09_150647_insert_manu_links_trans', 1),
(40, '2018_05_11_091504_drop_columns_thums_original_from_mediafiles', 1),
(41, '2018_05_13_082256_edit_parent_id_category_allownull', 2),
(52, '2018_05_13_091130_edit_pub_date_posts_allownull', 3),
(53, '2018_05_13_092326_insert_categories', 3),
(54, '2018_05_13_093045_update_menulinks', 3),
(55, '2018_05_15_122631_insert_footer_menu', 4),
(56, '2018_05_16_140354_drop_ext_path_columns_files_table', 5),
(57, '2018_05_17_214419_insert_subscribe_account_permissions', 6),
(58, '2018_05_19_021641_create_visits_table', 7),
(59, '2018_05_25_112550_add_posttype_setting_columns_to_post_types_table', 7),
(60, '2018_05_25_195012_insert_slider_to_post_types', 7),
(61, '2018_05_26_035322_insert_social_links_menu', 7),
(62, '2018_06_02_202247_create_settings_table', 8),
(63, '2018_06_02_210318_insert_setting_default_data', 8),
(64, '2018_06_08_132929_insert_seting_translation_defaults', 8),
(65, '2018_06_14_100620_add_can_comment_column_in_post_types', 9),
(66, '2018_06_14_125413_add_can_share_column_in_post_types', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `pub_date` datetime DEFAULT NULL,
  `post_type_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_published` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `pub_date`, `post_type_id`, `category_id`, `is_published`, `created_by`, `updated_by`, `created_at`, `updated_at`, `slug`) VALUES
(58, '2018-05-17 09:03:05', 1, 0, 1, 2, NULL, '2018-05-17 07:03:04', '2018-05-18 00:06:54', 'contact-us'),
(81, NULL, 4, 0, 0, 2, NULL, '2018-05-28 01:47:11', '2018-06-13 14:02:27', 'sor-1'),
(82, NULL, 4, 0, 0, 2, NULL, '2018-05-28 01:48:00', '2018-06-13 14:02:39', 'sor-2'),
(83, '2018-05-27 20:50:05', 4, 0, 1, 2, NULL, '2018-05-28 01:48:38', '2018-05-28 01:50:02', 'sor-3'),
(84, '2018-05-27 20:50:05', 4, 0, 1, 2, NULL, '2018-05-28 01:49:29', '2018-05-28 01:50:02', 'sor-4'),
(85, '2018-05-27 20:57:05', 1, 0, 1, 2, NULL, '2018-05-28 01:55:40', '2018-05-28 01:57:54', 'about-us'),
(86, '2018-05-27 21:02:05', 1, 0, 1, 2, NULL, '2018-05-28 02:02:09', '2018-05-28 02:02:56', 'vision'),
(87, '2018-05-27 21:33:05', 1, 0, 1, 2, NULL, '2018-05-28 02:33:26', '2018-05-28 02:33:54', 'stuff'),
(88, '2018-05-28 02:00:05', 1, 0, 1, 2, NULL, '2018-05-28 07:00:39', '2018-05-28 07:01:10', 'head_institution'),
(89, '2018-05-31 12:20:05', 2, 3, 1, 2, NULL, '2018-05-31 17:13:40', '2018-05-31 17:20:40', 'almjl-alaarby-ltrby-altfol-almbkr'),
(90, '2018-05-31 12:20:05', 2, 4, 1, 2, NULL, '2018-05-31 17:17:37', '2018-05-31 17:20:38', 'almjl-alaarby-ldrsat-altfol'),
(91, '2018-05-31 12:20:05', 2, 3, 1, 2, NULL, '2018-05-31 17:20:26', '2018-05-31 17:20:37', 'arab-journal-for-early-childhood-education'),
(93, '2018-05-31 12:59:05', 1, 0, 1, 2, NULL, '2018-05-31 17:59:25', '2018-05-31 18:00:08', 'parents'),
(94, '2018-06-14 14:53:06', 1, 0, 1, 2, NULL, '2018-06-14 12:52:52', '2018-06-14 12:53:09', 'mrkz-altrjm-oalnshr'),
(95, NULL, 3, 3, 0, 7, NULL, '2018-06-22 20:32:46', '2018-06-22 20:35:50', 'albhth-alaol'),
(96, '2018-06-22 14:47:06', 3, 3, 1, 7, NULL, '2018-06-22 20:39:15', '2018-06-22 20:47:36', 'albhth-althany');

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags_relationship`
--

CREATE TABLE `posts_tags_relationship` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_tags_relationship`
--

INSERT INTO `posts_tags_relationship` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 89, 1, NULL, NULL),
(2, 89, 2, NULL, NULL),
(3, 89, 3, NULL, NULL),
(4, 90, 3, NULL, NULL),
(5, 90, 4, NULL, NULL),
(6, 91, 4, NULL, NULL),
(7, 91, 3, NULL, NULL),
(8, 91, 2, NULL, NULL),
(9, 92, 2, NULL, NULL),
(10, 92, 5, NULL, NULL),
(11, 92, 6, NULL, NULL),
(12, 92, 7, NULL, NULL),
(13, 92, 8, NULL, NULL),
(14, 92, 9, NULL, NULL),
(15, 92, 10, NULL, NULL),
(16, 92, 11, NULL, NULL),
(17, 92, 12, NULL, NULL),
(18, 92, 13, NULL, NULL),
(19, 92, 14, NULL, NULL),
(20, 92, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_translations`
--

CREATE TABLE `post_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_translations`
--

INSERT INTO `post_translations` (`id`, `post_id`, `locale`, `title`, `body`) VALUES
(93, 58, 'ar', 'إتصل بنا', '<p><span dir=\"RTL\">المؤسسة العلمية لتربية الطفولة المبكرة </span></p>\r\n\r\n<p>يمكنك التواصل معنا مباشرة عبر ارسال رسالة على صفحات التواصل الإجتماعي على فيسبوك أو تويتر، يسعدنا تواصلكم دائما.</p>\r\n\r\n<p>جروب المؤسسة <a href=\"https://www.facebook.com/groups/aaece/\" target=\"_blank\">https://www.facebook.com/groups/aaece/</a></p>\r\n\r\n<p>صفحة المؤسسة <a href=\"https://www.facebook.com/sffece/\" target=\"_blank\">https://www.facebook.com/sffece/</a></p>\r\n\r\n<p>&nbsp;</p>'),
(94, 58, 'en', 'Contact us', '<p><span dir=\"RTL\">المؤسسة العلمية لتربية الطفولة المبكرة </span></p>\r\n\r\n<p>يمكنك التواصل معنا مباشرة عبر ارسال رسالة على صفحات التواصل الإجتماعي على فيسبوك أو تويتر، يسعدنا تواصلكم دائما.</p>\r\n\r\n<p>جروب المؤسسة <a href=\"https://www.facebook.com/groups/aaece/\" target=\"_blank\">https://www.facebook.com/groups/aaece/</a></p>\r\n\r\n<p>صفحة المؤسسة <a href=\"https://www.facebook.com/sffece/\" target=\"_blank\">https://www.facebook.com/sffece/</a></p>'),
(139, 81, 'ar', 'صورة 1', '<p>صورة 1</p>'),
(140, 81, 'en', 'Slide 1', '<p><br />\r\nSlide 1</p>'),
(141, 82, 'ar', 'صورة 2', '<p>صورة 2</p>'),
(142, 82, 'en', 'Slide 2', '<p><br />\r\nSlide 2</p>'),
(143, 83, 'ar', 'صورة 3', '<p>صورة 3</p>'),
(144, 83, 'en', 'Slide 3', '<p><br />\r\nSlide 3</p>'),
(145, 84, 'ar', 'صورة 4', '<p>صورة 4</p>'),
(146, 84, 'en', 'Slide 4', '<p><br />\r\nSlide 4</p>'),
(147, 85, 'ar', 'من نحن', '<p>المؤسسة العلمية لتربية الطفولة المبكرة هي مؤسسة مهنية غير هادفة للربح تضم مجموعة من المهنيين المختصين من أساتذة الجامعات والخبراء في مجال تربية الطفولة المبكرة، وتعمل على تعزيز التعلم المبكر عالي الجودة لجميع الأطفال من الولادة حتى سن الثامنة، وذلك من خلال الربط بين الممارسات الفعلية والبحوث والسياسات. والعمل على رفع مستوى النمو المهني للمهنيين في مرحلة الطفولة المبكرة ودعم جميع من يهتم بالأطفال في هذه المرحلة من حيث التعليم أو الرعاية.</p>\r\n\r\n<p>وتهدف المؤسسة إلى استقطاب كل المهنيين والخبراء المتميزين في العالم العربي المهتمين بدعم نمو الطفل وتعلمه، لتكون جهة مرجعية أساسية لها مواقف ورؤى علمية واضحة تجاه مجالات نمو الطفل وتعلمه، والعوامل التي تؤثر في ذلك، و ضمان جودة برامج إعداد المعلمات والحاضنات، وبرامج الطفولة المبكرة . والعمل جميعا على تحقيق رؤية جماعية: &quot;أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم.</p>'),
(148, 85, 'en', 'من نحن', '<p>المؤسسة العلمية لتربية الطفولة المبكرة هي مؤسسة مهنية غير هادفة للربح تضم مجموعة من المهنيين المختصين من أساتذة الجامعات والخبراء في مجال تربية الطفولة المبكرة، وتعمل على تعزيز التعلم المبكر عالي الجودة لجميع الأطفال من الولادة حتى سن الثامنة، وذلك من خلال الربط بين الممارسات الفعلية والبحوث والسياسات. والعمل على رفع مستوى النمو المهني للمهنيين في مرحلة الطفولة المبكرة ودعم جميع من يهتم بالأطفال في هذه المرحلة من حيث التعليم أو الرعاية.</p>\r\n\r\n<p>وتهدف المؤسسة إلى استقطاب كل المهنيين والخبراء المتميزين في العالم العربي المهتمين بدعم نمو الطفل وتعلمه، لتكون جهة مرجعية أساسية لها مواقف ورؤى علمية واضحة تجاه مجالات نمو الطفل وتعلمه، والعوامل التي تؤثر في ذلك، و ضمان جودة برامج إعداد المعلمات والحاضنات، وبرامج الطفولة المبكرة . والعمل جميعا على تحقيق رؤية جماعية: &quot;أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم.</p>'),
(149, 86, 'ar', 'الرؤية والأهداف', '<p>وتهدف المؤسسة إلى استقطاب كل المهنيين والخبراء المتميزين في العالم العربي المهتمين بدعم نمو الطفل وتعلمه، لتكون جهة مرجعية أساسية لها مواقف ورؤى علمية واضحة تجاه مجالات نمو الطفل وتعلمه، والعوامل التي تؤثر في ذلك، و ضمان جودة برامج إعداد المعلمات والحاضنات، وبرامج الطفولة المبكرة . والعمل جميعا على تحقيق رؤية جماعية: &quot;أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>الرؤية</h2>\r\n\r\n<p>أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم</p>\r\n\r\n<p>الرسالة</p>\r\n\r\n<p>العمل على الوصول إلى تعلم عالي الجودة لكل الأطفال في العالم العربي من الميلاد وحتى سن الثامنة عن طريق الممارسات والسياسات والبحوث والدعم المهني لكل من يهتم بتربية وتعليم الطفل والعمل على ضمان حقوقه.</p>\r\n\r\n<h2>قيمنا</h2>\r\n\r\n<p>نقدر الطفولة كمرحلة فريدة و لها تأثير قوي في حياة الإنسان.</p>\r\n\r\n<p>نستند في انشطتنا على خصائص نمو الطفل وتعلمه.</p>\r\n\r\n<p>نثمن وندعم العلاقة بين الطفل و الأسرة.</p>\r\n\r\n<p>نؤمن بأن الأطفال يفهمون ويٌدعمون بشكل أفضل في سياق الأسرة والثقافة والمجتمع.</p>\r\n\r\n<p>نحترم هوية الطفل وتفرده .</p>\r\n\r\n<p>نحترم التنوع الثقافي بين الأطفال و الأسر و زميلات العمل.</p>\r\n\r\n<p>ندرك بأن الأطفال و الأسرة والمعلمات يحققون كامل إمكاناتهم في سياق العلاقات القائمة على الثقة والاحترام.</p>\r\n\r\n<h2>معتقداتنا</h2>\r\n\r\n<p>التميز والابداع.</p>\r\n\r\n<p>الشفافية</p>\r\n\r\n<p>التأمل والمراجعة</p>\r\n\r\n<p>المساواة و اتاحة الفرص</p>\r\n\r\n<p>علاقات التعاون مع الآخرين.</p>\r\n\r\n<p>نشارك في المسؤولية في عملنا مع الآخرين.</p>\r\n\r\n<p>نحن نكرس الوقت والجهد لضمان المشاركة المتنوعة والنتائج الأكثر فعالية.</p>\r\n\r\n<h2>أهدافنا الاستراتيجية</h2>\r\n\r\n<p>اتاحة تعلم ملائم نمائياً ذات جودة عالية للطفلفي مرحلة الطفولة المبكرة.</p>\r\n\r\n<p>تميز مهنة تربية الطفولة المبكرة وأن تلعب دور هام في المجتمع.</p>\r\n\r\n<p>وصول المؤسسة العلمية لتربية الطفولة المبكرة إلى مكانة هامة، ومصداقية، ومحط أنظار المهنيين في تربية الطفولة المبكرة.</p>\r\n\r\n<p>أن تغرس المؤسسة القيادة وتحتضن الاستراتيجيات الإبداعية التي تدفع المجال، والمهنة ، وأنظمة التعلم المبكر إلى الأمام.</p>\r\n\r\n<h2>أنشطتنا:</h2>\r\n\r\n<p>البرامج التدريبية الموجه للمهنيين في تربية الطفولة المبكرة لدعم النمو المهني المستدام.</p>\r\n\r\n<p>تطوير أبحاث علمية جديدة في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>تقديم استشارات، و دورات للوالدين بالتعاون مع الجهات الخاصة والعامة ذات الصلة.</p>\r\n\r\n<p>تقديم خدمات استشارية للباحثين في مجال تربية الطفولة المبكرة .</p>\r\n\r\n<p>عقد ملتقى تدريبي سنوي لأعضاء هيئة التدريس والمعلمات، والمهتمين بمرحلة الطفولة المبكرة.</p>\r\n\r\n<p>عقد مؤتمر سنوي دولي يصاحبه معرض للكتاب في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>عقد ندوات علمية متخصصة في مجالات الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية ربع سنوية محكمة لمجال البحث في تربية الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية باللغة الإنجليزية ربع سنوية محكمة لمجال البحث في تربية الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية محكمة ربع سنوية لدراسات الطفولة المرتبطة بنمو وتعلم الطفل( طب الأطفال وأبحاث الدماغ- أدب و فنون الطفل- إعلام وتقنية الطفل)</p>\r\n\r\n<p>اصدار مجلة شهرية تتناول مجالات تربية وتعلم الطفل وأحدث المستجدات في المجال.</p>\r\n\r\n<p>ترجمة المؤلفات العالمية عالية الجودة في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>تقديم الاستشارات والحلول للمؤسسات والهيئات و الشركات التعليمية، والجامعات.</p>\r\n\r\n<p>وضع ميثاق الأخلاق المهني للمهنيين في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>وضع معايير عربية لاعتماد وضمان جودة برامج اعداد معلمات الطفولة المبكرة.</p>\r\n\r\n<p>اعتماد برامج اعداد معلمات الطفولة المبكرة.</p>\r\n\r\n<p>وضع معايير عربية لاعتماد وضمان جودة برامج الأطفال من الميلاد وحتى سن الثامنة.</p>\r\n\r\n<p>اعتماد برامج الطفولة المبكرة.</p>\r\n\r\n<p>انشاء اكاديمية للتدريب و لاعتماد وضمان جودة برامج الطفولة المبكرة.</p>\r\n\r\n<p>نشر المؤلفات المتميزة الموجهة للأطفال، الباحثين، والمعلمات، و الوالدين.</p>\r\n\r\n<p>اقامة شراكة وبرتوكولات تعاون مع المنظمات الدولية المماثلة والحصول على عضويتها لأعضاء المؤسسة.</p>\r\n\r\n<p>التحالف والتوأمة مع الجمعية الوطنية الأمريكية لتربية الأطفال الصغار NAEYC</p>\r\n\r\n<p>تشجيع التواصل بين الباحثين العرب لتكوين مجموعات بحثية.</p>'),
(150, 86, 'en', 'الرؤية والأهداف', '<p>وتهدف المؤسسة إلى استقطاب كل المهنيين والخبراء المتميزين في العالم العربي المهتمين بدعم نمو الطفل وتعلمه، لتكون جهة مرجعية أساسية لها مواقف ورؤى علمية واضحة تجاه مجالات نمو الطفل وتعلمه، والعوامل التي تؤثر في ذلك، و ضمان جودة برامج إعداد المعلمات والحاضنات، وبرامج الطفولة المبكرة . والعمل جميعا على تحقيق رؤية جماعية: &quot;أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>الرؤية</h2>\r\n\r\n<p>أن ينمو ويتعلم الطفل في مجتمعات تكرس كل جهودها لضمان وصول الطفل إلى المستوى الأمثل في النمو والتعلم</p>\r\n\r\n<p>الرسالة</p>\r\n\r\n<p>العمل على الوصول إلى تعلم عالي الجودة لكل الأطفال في العالم العربي من الميلاد وحتى سن الثامنة عن طريق الممارسات والسياسات والبحوث والدعم المهني لكل من يهتم بتربية وتعليم الطفل والعمل على ضمان حقوقه.</p>\r\n\r\n<h2>قيمنا</h2>\r\n\r\n<p>نقدر الطفولة كمرحلة فريدة و لها تأثير قوي في حياة الإنسان.</p>\r\n\r\n<p>نستند في انشطتنا على خصائص نمو الطفل وتعلمه.</p>\r\n\r\n<p>نثمن وندعم العلاقة بين الطفل و الأسرة.</p>\r\n\r\n<p>نؤمن بأن الأطفال يفهمون ويٌدعمون بشكل أفضل في سياق الأسرة والثقافة والمجتمع.</p>\r\n\r\n<p>نحترم هوية الطفل وتفرده .</p>\r\n\r\n<p>نحترم التنوع الثقافي بين الأطفال و الأسر و زميلات العمل.</p>\r\n\r\n<p>ندرك بأن الأطفال و الأسرة والمعلمات يحققون كامل إمكاناتهم في سياق العلاقات القائمة على الثقة والاحترام.</p>\r\n\r\n<h2>معتقداتنا</h2>\r\n\r\n<p>التميز والابداع.</p>\r\n\r\n<p>الشفافية</p>\r\n\r\n<p>التأمل والمراجعة</p>\r\n\r\n<p>المساواة و اتاحة الفرص</p>\r\n\r\n<p>علاقات التعاون مع الآخرين.</p>\r\n\r\n<p>نشارك في المسؤولية في عملنا مع الآخرين.</p>\r\n\r\n<p>نحن نكرس الوقت والجهد لضمان المشاركة المتنوعة والنتائج الأكثر فعالية.</p>\r\n\r\n<h2>أهدافنا الاستراتيجية</h2>\r\n\r\n<p>اتاحة تعلم ملائم نمائياً ذات جودة عالية للطفلفي مرحلة الطفولة المبكرة.</p>\r\n\r\n<p>تميز مهنة تربية الطفولة المبكرة وأن تلعب دور هام في المجتمع.</p>\r\n\r\n<p>وصول المؤسسة العلمية لتربية الطفولة المبكرة إلى مكانة هامة، ومصداقية، ومحط أنظار المهنيين في تربية الطفولة المبكرة.</p>\r\n\r\n<p>أن تغرس المؤسسة القيادة وتحتضن الاستراتيجيات الإبداعية التي تدفع المجال، والمهنة ، وأنظمة التعلم المبكر إلى الأمام.</p>\r\n\r\n<h2>أنشطتنا:</h2>\r\n\r\n<p>البرامج التدريبية الموجه للمهنيين في تربية الطفولة المبكرة لدعم النمو المهني المستدام.</p>\r\n\r\n<p>تطوير أبحاث علمية جديدة في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>تقديم استشارات، و دورات للوالدين بالتعاون مع الجهات الخاصة والعامة ذات الصلة.</p>\r\n\r\n<p>تقديم خدمات استشارية للباحثين في مجال تربية الطفولة المبكرة .</p>\r\n\r\n<p>عقد ملتقى تدريبي سنوي لأعضاء هيئة التدريس والمعلمات، والمهتمين بمرحلة الطفولة المبكرة.</p>\r\n\r\n<p>عقد مؤتمر سنوي دولي يصاحبه معرض للكتاب في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>عقد ندوات علمية متخصصة في مجالات الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية ربع سنوية محكمة لمجال البحث في تربية الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية باللغة الإنجليزية ربع سنوية محكمة لمجال البحث في تربية الطفولة المبكرة.</p>\r\n\r\n<p>اصدار دورية علمية محكمة ربع سنوية لدراسات الطفولة المرتبطة بنمو وتعلم الطفل( طب الأطفال وأبحاث الدماغ- أدب و فنون الطفل- إعلام وتقنية الطفل)</p>\r\n\r\n<p>اصدار مجلة شهرية تتناول مجالات تربية وتعلم الطفل وأحدث المستجدات في المجال.</p>\r\n\r\n<p>ترجمة المؤلفات العالمية عالية الجودة في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>تقديم الاستشارات والحلول للمؤسسات والهيئات و الشركات التعليمية، والجامعات.</p>\r\n\r\n<p>وضع ميثاق الأخلاق المهني للمهنيين في مجال تربية الطفولة المبكرة.</p>\r\n\r\n<p>وضع معايير عربية لاعتماد وضمان جودة برامج اعداد معلمات الطفولة المبكرة.</p>\r\n\r\n<p>اعتماد برامج اعداد معلمات الطفولة المبكرة.</p>\r\n\r\n<p>وضع معايير عربية لاعتماد وضمان جودة برامج الأطفال من الميلاد وحتى سن الثامنة.</p>\r\n\r\n<p>اعتماد برامج الطفولة المبكرة.</p>\r\n\r\n<p>انشاء اكاديمية للتدريب و لاعتماد وضمان جودة برامج الطفولة المبكرة.</p>\r\n\r\n<p>نشر المؤلفات المتميزة الموجهة للأطفال، الباحثين، والمعلمات، و الوالدين.</p>\r\n\r\n<p>اقامة شراكة وبرتوكولات تعاون مع المنظمات الدولية المماثلة والحصول على عضويتها لأعضاء المؤسسة.</p>\r\n\r\n<p>التحالف والتوأمة مع الجمعية الوطنية الأمريكية لتربية الأطفال الصغار NAEYC</p>\r\n\r\n<p>تشجيع التواصل بين الباحثين العرب لتكوين مجموعات بحثية.</p>'),
(151, 87, 'ar', 'مجلس الأمناء', '<p>مجلس أمناء المؤسسة العربية لتربية الطفولة المبكرة</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" style=\"height:2331px; width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. محمد خليفة إسماعيل</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مشارك وخبير تربية الطفولة المبكرة</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p><span dir=\"LTR\">Khalifa_ece @arabece.com</span></p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>رئيس مجلس الأمناء</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. محمد خليفة\" src=\"/uploads/images/image001.jpg\" style=\"height:147px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>أ.د./ فاتن زكريا النمر</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ برامج الطفل- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Fzelnemer@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>النائب و الأمين العام</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"أ.د./ فاتن زكريا النمر\" src=\"/uploads/images/image002.jpg\" style=\"height:139px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.منى سامح أبوهشيمة</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مشارك رياض الأطفال- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>mona@ arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>مدير المؤسسة</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.منى سامح أبوهشيمة\" src=\"/uploads/images/image003.jpg\" style=\"height:118px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. بثينة محمد حسين علي</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال -جامعة المجمعة</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Bm.ali@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. بثينة محمد حسين علي\" src=\"/uploads/images/image004.jpg\" style=\"height:200px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>5</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. ايمان محمد عبد القادر عطوي</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد الصحة النفسية &ndash;جامعة الإمام عبدالرحمن بن فيصل</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>emyatwy@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. ايمان محمد عبد القادر عطوي\" src=\"/uploads/images/image005.jpg\" style=\"height:199px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>6</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. صابرين عبد العاطي لبيب بدر الدين</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال- جامعة الإسكندرية</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Sabrin@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. صابرين عبد العاطي لبيب بدر الدين\" src=\"/uploads/images/image006.jpg\" style=\"height:267px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>7</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.عزة محمد رزق شرف الدين</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال &ndash; جامعة القصيم</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>azzash@ arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.عزة محمد رزق شرف الدين\" src=\"/uploads/images/image007.jpg\" style=\"height:169px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.رفقه مكرم برسوم</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد علم نفس تربوي &ndash;جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>rmbarsom@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.رفقه مكرم برسوم\" src=\"/uploads/images/image008.jpg\" style=\"height:150px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>9</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. صفاء سيد عبدالعزيز بسيوني</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>محاضر الصحة النفسية-جامعة بنها</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Safa@rabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. صفاء سيد عبدالعزيز بسيوني\" src=\"/uploads/images/image009.jpg\" style=\"height:196px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>10</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.رشا محمد عبدالدايم</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>rosha@ rabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.رشا محمد عبدالدايم\" src=\"/uploads/images/image010(2).jpg\" style=\"height:197px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>11</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>أ.شيماء رمضان رزق</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أخصائية تقنية المعلومات</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>shimaa@arbece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>أمين الصندوق</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"أ.شيماء رمضان رزق\" src=\"/uploads/images/image011.jpg\" style=\"height:152px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>المجلس الاستشاري العلمي للمؤسسة العربية لتربية الطفولة المبكرة</p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" style=\"width:697.4pt\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/ منى محمد علي جاد</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p><span dir=\"RTL\">أستاذ تربية الطفل العميد الأسبق لكلية التربية للطفولة المبكرة جامعة القاهرة</span></p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:143.0pt\">\r\n			<p>mona@arabece.com</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/.ثناءعبدالودودالشمري</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:143.0pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ. د/ لمياء ياسين زغير</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>أستاذ علم النفس التربويطفولة</p>\r\n\r\n			<p>الجامعةالمستنصرية</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:143.0pt\">\r\n			<p><a href=\"mailto:Dr.lamya.yassin@hotmail.com\" target=\"_blank\">Dr.lamya.yassin@hotmail.com</a></p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ. د/ غادة علي هادي</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>علم نفس النمو</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:143.0pt\">\r\n			<p>ghada_alhashim@yahoo.com</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>5</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/ انتصار هاشم الزيدي</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>استاذ مساعدعلم نفس النمو - كلية التربية ابن رشد &ndash;جامعة بغداد</p>\r\n			</td>\r\n			<td style=\"width:143.0pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>'),
(152, 87, 'en', 'مجلس الأمناء', '<p>مجلس أمناء المؤسسة العربية لتربية الطفولة المبكرة</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" style=\"height:2335px; width:905px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. محمد خليفة إسماعيل</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مشارك وخبير تربية الطفولة المبكرة</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p><span dir=\"LTR\">Khalifa_ece @arabece.com</span></p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>رئيس مجلس الأمناء</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. محمد خليفة\" src=\"/uploads/images/image001.jpg\" style=\"height:147px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>أ.د./ فاتن زكريا النمر</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ برامج الطفل- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Fzelnemer@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>النائب و الأمين العام</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"أ.د./ فاتن زكريا النمر\" src=\"/uploads/images/image002.jpg\" style=\"height:139px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.منى سامح أبوهشيمة</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مشارك رياض الأطفال- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>mona@ arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>مدير المؤسسة</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.منى سامح أبوهشيمة\" src=\"/uploads/images/image003.jpg\" style=\"height:118px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. بثينة محمد حسين علي</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال -جامعة المجمعة</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Bm.ali@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. بثينة محمد حسين علي\" src=\"/uploads/images/image004.jpg\" style=\"height:200px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>5</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. ايمان محمد عبد القادر عطوي</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد الصحة النفسية &ndash;جامعة الإمام عبدالرحمن بن فيصل</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>emyatwy@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. ايمان محمد عبد القادر عطوي\" src=\"/uploads/images/image005.jpg\" style=\"height:199px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>6</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. صابرين عبد العاطي لبيب بدر الدين</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال- جامعة الإسكندرية</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Sabrin@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. صابرين عبد العاطي لبيب بدر الدين\" src=\"/uploads/images/image006.jpg\" style=\"height:267px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>7</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.عزة محمد رزق شرف الدين</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال &ndash; جامعة القصيم</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>azzash@ arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.عزة محمد رزق شرف الدين\" src=\"/uploads/images/image007.jpg\" style=\"height:169px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>8</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.رفقه مكرم برسوم</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد علم نفس تربوي &ndash;جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>rmbarsom@arabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.رفقه مكرم برسوم\" src=\"/uploads/images/image008.jpg\" style=\"height:150px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>9</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د. صفاء سيد عبدالعزيز بسيوني</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>محاضر الصحة النفسية-جامعة بنها</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>Safa@rabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د. صفاء سيد عبدالعزيز بسيوني\" src=\"/uploads/images/image009.jpg\" style=\"height:196px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>10</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>د.رشا محمد عبدالدايم</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أستاذ مساعد رياض الأطفال- جامعة حلوان</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>rosha@ rabece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>عضو</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"د.رشا محمد عبدالدايم\" src=\"/uploads/images/image010(2).jpg\" style=\"height:197px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:31.45pt\">\r\n			<p>11</p>\r\n			</td>\r\n			<td style=\"width:163.0pt\">\r\n			<p>أ.شيماء رمضان رزق</p>\r\n			</td>\r\n			<td style=\"width:155.95pt\">\r\n			<p>أخصائية تقنية المعلومات</p>\r\n			</td>\r\n			<td style=\"width:127.55pt\">\r\n			<p>shimaa@arbece.com</p>\r\n			</td>\r\n			<td style=\"width:94.05pt\">\r\n			<p>أمين الصندوق</p>\r\n			</td>\r\n			<td style=\"width:125.4pt\">\r\n			<p><span dir=\"LTR\"><img alt=\"أ.شيماء رمضان رزق\" src=\"/uploads/images/image011.jpg\" style=\"height:152px; width:150px\" /> </span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>المجلس الاستشاري العلمي للمؤسسة العربية لتربية الطفولة المبكرة</p>\r\n\r\n<table border=\"1\" cellspacing=\"0\" style=\"height:480px; width:930px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>1</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/ منى محمد علي جاد</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p><span dir=\"RTL\">أستاذ تربية الطفل العميد الأسبق لكلية التربية للطفولة المبكرة جامعة القاهرة</span></p>\r\n\r\n			<p>&nbsp;</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>2</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/.ثناءعبدالودودالشمري</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>3</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ. د/ لمياء ياسين زغير</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>أستاذ علم النفس التربويطفولة</p>\r\n\r\n			<p>الجامعةالمستنصرية</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>4</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ. د/ غادة علي هادي</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>علم نفس النمو</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:30.9pt\">\r\n			<p>5</p>\r\n			</td>\r\n			<td style=\"width:128.15pt\">\r\n			<p>أ.د/ انتصار هاشم الزيدي</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:182.95pt\">\r\n			<p>استاذ مساعدعلم نفس النمو - كلية التربية ابن رشد &ndash;جامعة بغداد</p>\r\n			</td>\r\n			<td style=\"width:91.1pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td style=\"width:121.3pt\">\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>'),
(153, 88, 'ar', 'رئيس المؤسسة', '<p>د.محمد خليفة إسماعيل متولي، خبير تربية الطفولة المبكرة، مراجع اعتماد وجودة برامج الطفولة المبكرة، وسفير اللغة لدى الجمعية الوطنية الأمريكية لتربية الأطفال الصغار NAEYC وعضو الجمعية البريطانية لتربية الطفولة المبكرة</p>\r\n\r\n<p><a href=\"http://sfece.isdegypt.com/uploads/files/69f45_%D8%B3%D9%8A%D8%B1%D8%A9%20%D8%B0%D8%A7%D8%AA%D9%8A%D8%A9%201-2018.doc\">حمل السيرة الذاتية للدكتور محمد خليفة</a></p>'),
(154, 88, 'en', 'رئيس المؤسسة', '<p>د.محمد خليفة إسماعيل متولي، خبير تربية الطفولة المبكرة، مراجع اعتماد وجودة برامج الطفولة المبكرة، وسفير اللغة لدى الجمعية الوطنية الأمريكية لتربية الأطفال الصغار NAEYC وعضو الجمعية</p>\r\n\r\n<p>البريطانية لتربية الطفولة المبكرة</p>\r\n\r\n<p><a href=\"http://sfece.isdegypt.com/uploads/files/69f45_%D8%B3%D9%8A%D8%B1%D8%A9%20%D8%B0%D8%A7%D8%AA%D9%8A%D8%A9%201-2018.doc\">حمل السيرة الذاتية للدكتور محمد خليفة</a></p>'),
(155, 89, 'ar', 'المجلة العربية لتربية الطفولة المبكرة', '<p>دورية علمية متخصصة محكمة تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة. تهتم بنشر البحوث والدراسات في تربية الطفولة المبكرة للأطفال من الميلاد وحتى سن الثامنة.</p>'),
(156, 89, 'en', 'المجلة العربية لتربية الطفولة المبكرة', '<p>دورية علمية متخصصة محكمة تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة. تهتم بنشر البحوث والدراسات في تربية الطفولة المبكرة للأطفال من الميلاد وحتى سن الثامنة.</p>'),
(157, 90, 'ar', 'المجلة العربية لدرسات الطفولة', '<p>مجلة علمية متخصصة محكمة تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة. تهتم بنشر البحوث والدراسات المرتبطة بالطفل في شتى المجالات.</p>'),
(158, 90, 'en', 'المجلة العربية لدرسات الطفولة', '<p>مجلة علمية متخصصة محكمة تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة. تهتم بنشر البحوث والدراسات المرتبطة بالطفل في شتى المجالات.</p>'),
(159, 91, 'ar', 'Arab Journal for Early Childhood Education', '<p>دورية علمية متخصصة محكمة دوليا تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة . تهتم بنشر البحوث والدراسات&nbsp; باللغة الإنجليزية المرتبطة بالطفل</p>'),
(160, 91, 'en', 'Arab Journal for Early Childhood Education', '<p>دورية علمية متخصصة محكمة دوليا تصدر عن المؤسسة العلمية لتربية الطفولة المبكرة . تهتم بنشر البحوث والدراسات&nbsp; باللغة الإنجليزية المرتبطة بالطفل</p>'),
(163, 93, 'ar', 'الأباء والأمهات', '<p>متخصصون في تقديم تقديم الحلول، الاستشارات، الخدمات، والتدريب للمؤسسات، والهيئات، الحضانات، الروضات، والوالدين لدعم تربية الطفل وتعلمه من الميلاد وحتى ثماني سنوات.</p>\r\n\r\n<p><a href=\"http://www.arabece.com/ar/\" target=\"_blank\">اضغط هنا لزيارة الموقع</a></p>'),
(164, 93, 'en', 'Parents', '<p>متخصصون في تقديم تقديم الحلول، الاستشارات، الخدمات، والتدريب للمؤسسات، والهيئات، الحضانات، الروضات، والوالدين لدعم تربية الطفل وتعلمه من الميلاد وحتى ثماني سنوات.</p>\r\n\r\n<p><a href=\"http://www.arabece.com/ar/\" target=\"_blank\">اضغط هنا لزيارة الموقع</a></p>'),
(165, 94, 'ar', 'مركز الترجمة والنشر', '<p>هو مركز تابع للمؤسسة العلمية لتربية الطفولة يهدف إلى نشر وترجمة المؤلفات المتنوعه المرتبطة بمجال تربية الطفولة المبكرة، ويسعى المركز إلى النشر لكافة أعضاء المؤسسة والمختصين بعد تحكيم المؤلفات من قبل لجان التحكيم المختصة</p>'),
(166, 94, 'en', 'مركز الترجمة والنشر', '<p>هو مركز تابع للمؤسسة العلمية لتربية الطفولة يهدف إلى نشر وترجمة المؤلفات المتنوعه المرتبطة بمجال تربية الطفولة المبكرة، ويسعى المركز إلى النشر لكافة أعضاء المؤسسة والمختصين بعد تحكيم المؤلفات من قبل لجان التحكيم المختصة</p>'),
(167, 95, 'ar', 'البحث الأول', 'اي محتوى'),
(168, 95, 'en', 'First Research', 'Any Contents'),
(169, 96, 'ar', 'البحث الثاني', 'أي كلام'),
(170, 96, 'en', 'Second Research', 'Any Words');

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_category` tinyint(1) DEFAULT '0',
  `has_main_file` tinyint(1) DEFAULT '0',
  `has_main_image` tinyint(1) DEFAULT '0',
  `has_files` tinyint(1) DEFAULT '0',
  `has_images` tinyint(1) DEFAULT '0',
  `has_tags` tinyint(1) DEFAULT '0',
  `can_comment` tinyint(1) DEFAULT '0',
  `can_share` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `name`, `created_at`, `updated_at`, `has_category`, `has_main_file`, `has_main_image`, `has_files`, `has_images`, `has_tags`, `can_comment`, `can_share`) VALUES
(1, 'Pages', '2018-05-11 10:54:05', NULL, 0, 0, 1, 0, 0, 0, 0, 1),
(2, 'Posts', '2018-05-11 10:54:05', NULL, 1, 0, 1, 0, 0, 1, 1, 1),
(3, 'Research', '2018-05-11 10:54:05', NULL, 1, 1, 0, 0, 0, 0, 0, 0),
(4, 'Slider', '2018-05-18 08:15:05', NULL, 0, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sec_groups`
--

CREATE TABLE `sec_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupkey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_groups`
--

INSERT INTO `sec_groups` (`id`, `name`, `groupkey`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2018-05-11 10:55:05', NULL),
(2, 'subscribe', 'subscribe', '2018-05-11 10:55:05', NULL),
(3, 'premium', 'premium', '2018-05-11 10:55:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_permissions`
--

CREATE TABLE `sec_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `sec_group_id` int(11) NOT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `force_filter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_permissions`
--

INSERT INTO `sec_permissions` (`id`, `sec_group_id`, `controller`, `action`, `created_by`, `created_at`, `updated_at`, `force_filter`) VALUES
(6, 1, 'App\\Http\\Controllers\\Dashboard\\CategoryController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(7, 1, 'App\\Http\\Controllers\\Dashboard\\CategoryController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(8, 1, 'App\\Http\\Controllers\\Dashboard\\CategoryController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(9, 1, 'App\\Http\\Controllers\\Dashboard\\CategoryController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(10, 1, 'App\\Http\\Controllers\\Dashboard\\CategoryController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(11, 1, 'App\\Http\\Controllers\\Dashboard\\CommentController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(12, 1, 'App\\Http\\Controllers\\Dashboard\\CommentController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(13, 1, 'App\\Http\\Controllers\\Dashboard\\CommentController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(14, 1, 'App\\Http\\Controllers\\Dashboard\\CommentController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(15, 1, 'App\\Http\\Controllers\\Dashboard\\CommentController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(21, 1, 'App\\Http\\Controllers\\Dashboard\\FileController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(22, 1, 'App\\Http\\Controllers\\Dashboard\\FileController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(23, 1, 'App\\Http\\Controllers\\Dashboard\\FileController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(24, 1, 'App\\Http\\Controllers\\Dashboard\\FileController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(25, 1, 'App\\Http\\Controllers\\Dashboard\\FileController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(26, 1, 'App\\Http\\Controllers\\Dashboard\\MediaFileController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(27, 1, 'App\\Http\\Controllers\\Dashboard\\MediaFileController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(28, 1, 'App\\Http\\Controllers\\Dashboard\\MediaFileController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(29, 1, 'App\\Http\\Controllers\\Dashboard\\MediaFileController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(30, 1, 'App\\Http\\Controllers\\Dashboard\\MediaFileController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(36, 1, 'App\\Http\\Controllers\\Dashboard\\MenuLinkController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(37, 1, 'App\\Http\\Controllers\\Dashboard\\MenuLinkController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(38, 1, 'App\\Http\\Controllers\\Dashboard\\MenuLinkController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(39, 1, 'App\\Http\\Controllers\\Dashboard\\MenuLinkController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(40, 1, 'App\\Http\\Controllers\\Dashboard\\MenuLinkController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(46, 1, 'App\\Http\\Controllers\\Dashboard\\PostTypeController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(47, 1, 'App\\Http\\Controllers\\Dashboard\\PostTypeController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(48, 1, 'App\\Http\\Controllers\\Dashboard\\PostTypeController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(49, 1, 'App\\Http\\Controllers\\Dashboard\\PostTypeController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(50, 1, 'App\\Http\\Controllers\\Dashboard\\PostTypeController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(66, 1, 'App\\Http\\Controllers\\IController', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(67, 1, 'App\\Http\\Controllers\\IController', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(68, 1, 'App\\Http\\Controllers\\IController', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(69, 1, 'App\\Http\\Controllers\\IController', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(70, 1, 'App\\Http\\Controllers\\IController', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(71, 1, 'App\\Http\\Controllers\\Dashboard\\SecGroup', 'index', 1, '2018-05-11 10:55:05', NULL, NULL),
(72, 1, 'App\\Http\\Controllers\\Dashboard\\SecGroup', 'show', 1, '2018-05-11 10:55:05', NULL, NULL),
(73, 1, 'App\\Http\\Controllers\\Dashboard\\SecGroup', 'edit', 1, '2018-05-11 10:55:05', NULL, NULL),
(74, 1, 'App\\Http\\Controllers\\Dashboard\\SecGroup', 'create', 1, '2018-05-11 10:55:05', NULL, NULL),
(75, 1, 'App\\Http\\Controllers\\Dashboard\\SecGroup', 'destroy', 1, '2018-05-11 10:55:05', NULL, NULL),
(91, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'index', 1, '2018-05-13 05:05:39', NULL, NULL),
(92, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'show', 1, '2018-05-13 05:05:39', NULL, NULL),
(93, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'edit', 1, '2018-05-13 05:05:39', NULL, NULL),
(94, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'create', 1, '2018-05-13 05:05:39', NULL, NULL),
(95, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'destroy', 1, '2018-05-13 05:05:39', NULL, NULL),
(96, 1, 'App\\Http\\Controllers\\Dashboard\\SecPermission', 'getActionsList', 1, '2018-05-13 05:05:39', NULL, NULL),
(106, 1, 'App\\Http\\Controllers\\Dashboard\\AccountLevelController', 'index', 1, '2018-05-13 05:05:14', NULL, NULL),
(107, 1, 'App\\Http\\Controllers\\Dashboard\\AccountLevelController', 'show', 1, '2018-05-13 05:05:14', NULL, NULL),
(108, 1, 'App\\Http\\Controllers\\Dashboard\\AccountLevelController', 'edit', 1, '2018-05-13 05:05:14', NULL, NULL),
(109, 1, 'App\\Http\\Controllers\\Dashboard\\AccountLevelController', 'create', 1, '2018-05-13 05:05:14', NULL, NULL),
(110, 1, 'App\\Http\\Controllers\\Dashboard\\AccountLevelController', 'destroy', 1, '2018-05-13 05:05:14', NULL, NULL),
(111, 1, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'index', 1, '2018-05-13 05:05:29', NULL, NULL),
(112, 1, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'show', 1, '2018-05-13 05:05:29', NULL, NULL),
(113, 1, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'edit', 1, '2018-05-13 05:05:29', NULL, NULL),
(114, 1, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'create', 1, '2018-05-13 05:05:29', NULL, NULL),
(115, 1, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'destroy', 1, '2018-05-13 05:05:29', NULL, NULL),
(142, 1, 'App\\Http\\Controllers\\Dashboard\\MenuController', 'index', 1, '2018-05-14 04:34:05', NULL, NULL),
(143, 1, 'App\\Http\\Controllers\\Dashboard\\MenuController', 'show', 1, '2018-05-14 04:34:05', NULL, NULL),
(144, 1, 'App\\Http\\Controllers\\Dashboard\\MenuController', 'edit', 1, '2018-05-14 04:34:05', NULL, NULL),
(145, 1, 'App\\Http\\Controllers\\Dashboard\\MenuController', 'create', 1, '2018-05-14 04:34:05', NULL, NULL),
(146, 1, 'App\\Http\\Controllers\\Dashboard\\MenuController', 'destroy', 1, '2018-05-14 04:34:05', NULL, NULL),
(175, 2, 'App\\Http\\Controllers\\Dashboard\\DashboardController', 'index', 2, '2018-05-16 10:58:05', NULL, NULL),
(176, 2, 'App\\Http\\Controllers\\Dashboard\\FileController', 'getFile', 2, '2018-05-17 13:37:05', NULL, NULL),
(177, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'index', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(178, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'show', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(179, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'edit', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(180, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'create', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(181, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'destroy', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(182, 2, 'App\\Http\\Controllers\\Dashboard\\PostController', 'getFreeSlug', 2, '2018-05-17 19:21:05', NULL, '[[\"post_type_id\",\"=\",\"3\"]]'),
(183, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'index', 2, '2018-05-28 01:24:05', NULL, NULL),
(184, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'show', 2, '2018-05-28 01:24:05', NULL, NULL),
(185, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'edit', 2, '2018-05-28 01:24:05', NULL, NULL),
(186, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'create', 2, '2018-05-28 01:24:05', NULL, NULL),
(187, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'destroy', 2, '2018-05-28 01:24:05', NULL, NULL),
(188, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'getFreeSlug', 2, '2018-05-28 01:24:05', NULL, NULL),
(189, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'publish', 2, '2018-05-28 01:24:05', NULL, NULL),
(190, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'unpublish', 2, '2018-05-28 01:24:05', NULL, NULL),
(191, 1, 'App\\Http\\Controllers\\Dashboard\\PostController', 'dataTable', 2, '2018-05-28 01:24:05', NULL, NULL),
(192, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'index', 2, '2018-05-28 01:24:05', NULL, '[[\"account_level_id\",\">\",\"1\"]]'),
(193, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'show', 2, '2018-05-28 01:24:05', NULL, NULL),
(194, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'edit', 2, '2018-05-28 01:24:05', NULL, NULL),
(195, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'create', 2, '2018-05-28 01:24:05', NULL, NULL),
(196, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'destroy', 2, '2018-05-28 01:24:05', NULL, NULL),
(197, 1, 'App\\Http\\Controllers\\Dashboard\\UserController', 'dataTable', 2, '2018-05-28 01:24:05', NULL, NULL),
(198, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'index', 2, '2018-05-31 17:16:05', NULL, NULL),
(199, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'show', 2, '2018-05-31 17:16:05', NULL, NULL),
(200, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'edit', 2, '2018-05-31 17:16:05', NULL, NULL),
(201, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'create', 2, '2018-05-31 17:16:05', NULL, NULL),
(202, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'destroy', 2, '2018-05-31 17:16:05', NULL, NULL),
(203, 1, 'App\\Http\\Controllers\\Dashboard\\TagController', 'getTags', 2, '2018-05-31 17:16:05', NULL, NULL),
(209, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'index', 2, '2018-06-13 11:16:06', NULL, NULL),
(210, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'show', 2, '2018-06-13 11:16:06', NULL, NULL),
(211, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'edit', 2, '2018-06-13 11:16:06', NULL, NULL),
(212, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'create', 2, '2018-06-13 11:16:06', NULL, NULL),
(213, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'destroy', 2, '2018-06-13 11:16:06', NULL, NULL),
(214, 1, 'App\\Http\\Controllers\\Dashboard\\SettingController', 'editGroup', 2, '2018-06-13 11:16:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `availables` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `hint`, `key`, `type`, `availables`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Site name', 'Title of your website', 'site_name', 1, '', 'General', NULL, NULL),
(2, 'Default email البريد الإلفتراضي ', 'Website email you can use any place', 'emails_default', 1, '', 'General', NULL, NULL),
(3, 'No-replay email بريد الإشعارات', 'This email for message you not follow up it\'s response ', 'emails_noreplay', 1, '', 'General', NULL, NULL),
(4, 'Max image size (KB)', '', 'max_image_size', 1, '', 'Posts', NULL, NULL),
(6, 'Default language لغة الموقع', '', 'site_lang', 1, '', 'General', NULL, NULL),
(7, 'Site Description', 'Description of your website', 'site_desc', 7, '', 'General', NULL, NULL),
(8, 'Site Keaywords', 'Keaywords of your website', 'site_key', 1, '', 'General', NULL, NULL),
(9, 'Site Image لوجو الموقع', 'Image of your website', 'site_image', 1, '', 'General', NULL, NULL),
(10, 'Facebook فيسبوك', 'facebook', 'facebook', 1, '', 'General', NULL, NULL),
(11, 'Twitter تويتر', 'twitter', 'twitter', 1, '', 'General', NULL, NULL),
(12, 'Youtube يوتيوب', 'youtube', 'youtube', 1, '', 'General', NULL, NULL),
(13, 'Instagram انستجرام', 'Instagram', 'instagram', 1, '', 'General', NULL, NULL),
(14, 'Address', 'Address', 'site_address', 1, '', 'General', NULL, NULL),
(15, 'phone', 'phone', 'site_phone', 1, '', 'General', NULL, NULL),
(16, 'Fax', 'Fax', 'site_fax', 1, '', 'General', NULL, NULL),
(17, 'Facebook APP_ID', NULL, 'fb_app_id', 1, NULL, 'Third Party', NULL, NULL),
(18, 'Allow register new users', NULL, 'allow_register', 3, NULL, 'Users', NULL, NULL),
(19, 'Allow user send research', NULL, 'allow_add_research', 3, NULL, 'Users', NULL, NULL),
(20, 'Site Slogan', NULL, 'site_slogan', 1, NULL, 'General', NULL, NULL),
(21, 'Show facebook recent posts in footer', NULL, 'show_fb_posts_footer', 3, NULL, 'General', NULL, NULL),
(22, 'Show facebook recent posts in sitebar', NULL, 'show_fb_posts_sitebar', 3, NULL, 'General', NULL, NULL),
(23, 'Facebook admins users id (,)', NULL, 'fb_admins', 1, NULL, 'Third Party', NULL, NULL),
(24, 'Allow Website Comments', NULL, 'allow_website_comment', 3, NULL, 'Comment and Share', NULL, NULL),
(25, 'Allow Facebook Comments', NULL, 'allow_facebook_comment', 3, NULL, 'Comment and Share', NULL, NULL),
(26, 'Show share buttons', NULL, 'allow_share', 3, NULL, 'Comment and Share', NULL, NULL),
(27, 'Linked In لينكد ان', 'Linked In لينكد ان', 'linkedin', 1, '', 'General', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
(1, 1, 'ar', 'المؤسسة العلمية لتربية الطفولة'),
(2, 1, 'en', 'Seientific Foundation For Childhood Education'),
(7, 16, 'ar', '123456789'),
(8, 16, 'en', '987654321'),
(9, 15, 'ar', '123456'),
(10, 15, 'en', '654321'),
(11, 14, 'ar', NULL),
(12, 14, 'en', NULL),
(13, 13, 'ar', NULL),
(14, 13, 'en', NULL),
(15, 12, 'ar', NULL),
(16, 12, 'en', NULL),
(17, 11, 'ar', 'https://twitter.com/SFECE'),
(18, 11, 'en', 'https://twitter.com/SFECE'),
(19, 10, 'ar', 'https://web.facebook.com/sffece'),
(20, 10, 'en', 'https://web.facebook.com/sffece'),
(21, 9, 'ar', NULL),
(22, 9, 'en', NULL),
(23, 8, 'ar', 'SFECE,الطفولة المبكرة,استشارات,مؤسسة،تربية،اولياء الامور'),
(24, 8, 'en', 'SFECE, seientific foundation, Childhood Education'),
(25, 7, 'ar', 'هدف الموقع إلى تثقيف وتقديم الاستشارات إلى أولياء الأمور والمعلمات والمختصين في مجال تربية الطفولة المبكرة،لتربية شخصية الطفل وبناء مهارات الدماغ ودعم نمو الطفل وتعلمه وفق معاييرالتعلم التربية العالمية'),
(26, 7, 'en', 'هدف الموقع إلى تثقيف وتقديم الاستشارات إلى أولياء الأمور والمعلمات والمختصين في مجال تربية الطفولة المبكرة،لتربية شخصية الطفل وبناء مهارات الدماغ ودعم نمو الطفل وتعلمه وفق معاييرالتعلم التربية العالمية'),
(27, 6, 'ar', 'ar'),
(28, 6, 'en', 'ar'),
(31, 4, 'ar', NULL),
(32, 4, 'en', NULL),
(33, 3, 'ar', 'no-replay@sfece.org'),
(34, 3, 'en', 'no-replay@sfece.org'),
(35, 2, 'ar', 'info@sfece.org'),
(36, 2, 'en', 'info@sfece.org'),
(37, 20, 'ar', 'مؤسسة غير ربحية للطفولة المبكرة'),
(38, 20, 'en', 'Non-profit Early Childhood Foundation'),
(39, 21, 'ar', '1'),
(40, 21, 'en', '1'),
(41, 17, 'ar', '214362155985885'),
(42, 17, 'en', '214362155985885'),
(43, 18, 'ar', '0'),
(44, 18, 'en', '1'),
(45, 19, 'ar', '1'),
(46, 19, 'en', '1'),
(47, 22, 'ar', '1'),
(48, 22, 'en', '1'),
(49, 23, 'ar', NULL),
(50, 23, 'en', NULL),
(51, 24, 'ar', '0'),
(52, 24, 'en', '0'),
(53, 25, 'ar', '1'),
(54, 25, 'en', '1'),
(55, 26, 'ar', '1'),
(56, 26, 'en', '1'),
(57, 27, 'ar', 'https://www.linkedin.com/in/%D8%A7%D9%84%D9%85%D8%A4%D8%B3%D8%B3%D8%A9-%D8%A7%D9%84%D8%B9%D9%84%D9%85%D9%8A%D8%A9-%D9%84%D8%AA%D8%B1%D8%A8%D9%8A%D8%A9-%D8%A7%D9%84%D8%B7%D9%81%D9%88%D9%84%D8%A9-9545b5166/'),
(58, 27, 'en', 'https://www.linkedin.com/in/%D8%A7%D9%84%D9%85%D8%A4%D8%B3%D8%B3%D8%A9-%D8%A7%D9%84%D8%B9%D9%84%D9%85%D9%8A%D8%A9-%D9%84%D8%AA%D8%B1%D8%A8%D9%8A%D8%A9-%D8%A7%D9%84%D8%B7%D9%81%D9%88%D9%84%D8%A9-9545b5166/');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'مجلات علمية', '2018-05-31 17:13:40', '2018-05-31 17:13:40'),
(3, 'البحوث والدراسات', '2018-05-31 17:13:40', '2018-05-31 17:13:40'),
(4, 'المجلات التعليمية', '2018-05-31 17:17:37', '2018-05-31 17:17:37'),
(12, 'تربية الطفولة المبكرة', '2018-05-31 17:29:25', '2018-05-31 17:29:25'),
(13, 'الحلول المقترحة للوالدين', '2018-05-31 17:29:25', '2018-05-31 17:29:25'),
(14, 'تربية الأطفال', '2018-05-31 17:29:25', '2018-05-31 17:29:25'),
(15, 'دليل الوالدين لتربة الأطفال', '2018-05-31 17:29:25', '2018-05-31 17:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `email_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_level_id` int(11) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `country`, `city`, `phone`, `active`, `created_by`, `updated_by`, `verified`, `email_token`, `remember_token`, `created_at`, `updated_at`, `account_level_id`) VALUES
(2, 'mahmoud gomaa', 'mahmoud_g1977@yahoo.com', '$2y$10$B1NF7Eudg2wxMSYAS.0cGuFNlY8zz/Nsq/eH4kYZ2fwNkr4F5HAq6', 'United States', 'New Haven', NULL, 1, NULL, NULL, 0, 'bWFobW91ZF9nMTk3N0B5YWhvby5jb20=', 'gMVBjYE6uF2FY3JaIGrE2hq72xNNuK9ALnB0Tb8iVobKj23ftRk8z4OMhunC', '2018-05-16 08:10:16', '2018-05-16 08:30:06', 1),
(4, 'mahmoud', 'mahmoudg77@gmail.com', '$2y$10$jdpH0WxUPwrxrc52Ciwa.uC9tAY2fucunKNtKK1BKU3Jvb7/1AocW', 'United States', 'New Haven', '201143184244', 1, NULL, 2, 1, 'bWFobW91ZGc3N0BnbWFpbC5jb20=', '6aACrhFBQlLpcOqEZPy0DinAixW2LA1lQ3Px9gVDp2FMGkxRlf8dCiIcZFRX', '2018-05-16 11:02:20', '2018-06-22 18:54:47', 1),
(5, 'AlyHamdy', 'aliit_spider@yahoo.com', '$2y$10$4tq21kzo0HuiFUMyWivHP.WppyKlyjXg1k5hyStf99sERxBR2GKoG', 'Egypt', 'Cairo', '', 1, NULL, NULL, 0, 'YWxpaXRfc3BpZGVyQHlhaG9vLmNvbQ==', 'Z3v2iNrsJZc9RhIbTYRpwqKW9ISMDyFocOed0Khm2SfGHFQxwoHAqFgzj6St', '2018-06-12 20:44:14', '2018-06-12 20:44:14', 2),
(7, 'Gomaa', 'support@smseg.com', '$2y$10$DE7VtqHKtvd.GIlZ.8TwlO0XK8uS.r0cgfnL35PMkEtzAG9k31I6a', 'Egypt', 'Cairo', '01143184244', 1, NULL, NULL, 1, 'c3VwcG9ydEBzbXNlZy5jb20=', 'RyFawkM8TxBuyaeDKcs9D8yJTUTBiuYCfqk9AbXx25mYmap9rbnR5Uz762IH', '2018-06-22 20:27:02', '2018-06-22 20:28:32', 2);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `client_ip`, `client_country`, `client_city`, `model_name`, `model_id`, `created_at`, `updated_at`) VALUES
(1, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:06:09', '2018-05-28 01:06:09'),
(2, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:06:14', '2018-05-28 01:06:14'),
(3, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:10:53', '2018-05-28 01:10:53'),
(4, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:10:56', '2018-05-28 01:10:56'),
(5, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:17:50', '2018-05-28 01:17:50'),
(6, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:17:51', '2018-05-28 01:17:51'),
(7, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:22:17', '2018-05-28 01:22:17'),
(8, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:22:20', '2018-05-28 01:22:20'),
(9, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:23:27', '2018-05-28 01:23:27'),
(10, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:23:57', '2018-05-28 01:23:57'),
(11, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:23:59', '2018-05-28 01:23:59'),
(12, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:35:18', '2018-05-28 01:35:18'),
(13, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:35:20', '2018-05-28 01:35:20'),
(14, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:36:10', '2018-05-28 01:36:10'),
(15, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:36:12', '2018-05-28 01:36:12'),
(16, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:49:25', '2018-05-28 01:49:25'),
(17, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:49:30', '2018-05-28 01:49:30'),
(18, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:49:36', '2018-05-28 01:49:36'),
(19, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:49:42', '2018-05-28 01:49:42'),
(20, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:50:05', '2018-05-28 01:50:05'),
(21, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:55:45', '2018-05-28 01:55:45'),
(22, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:57:33', '2018-05-28 01:57:33'),
(23, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 01:58:00', '2018-05-28 01:58:00'),
(24, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 02:02:24', '2018-05-28 02:02:24'),
(25, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 02:03:01', '2018-05-28 02:03:01'),
(26, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 02:04:11', '2018-05-28 02:04:11'),
(27, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 02:05:29', '2018-05-28 02:05:29'),
(28, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 87, '2018-05-28 02:33:59', '2018-05-28 02:33:59'),
(29, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 87, '2018-05-28 02:37:37', '2018-05-28 02:37:37'),
(30, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 87, '2018-05-28 02:39:53', '2018-05-28 02:39:53'),
(31, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 02:40:11', '2018-05-28 02:40:11'),
(32, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 87, '2018-05-28 02:40:15', '2018-05-28 02:40:15'),
(33, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 02:41:23', '2018-05-28 02:41:23'),
(34, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 06:53:10', '2018-05-28 06:53:10'),
(35, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 06:55:32', '2018-05-28 06:55:32'),
(36, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 06:56:16', '2018-05-28 06:56:16'),
(37, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 07:01:16', '2018-05-28 07:01:16'),
(38, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 07:05:09', '2018-05-28 07:05:09'),
(39, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 07:10:58', '2018-05-28 07:10:58'),
(40, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 07:12:00', '2018-05-28 07:12:00'),
(41, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 07:14:33', '2018-05-28 07:14:33'),
(42, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 6, '2018-05-28 07:15:17', '2018-05-28 07:15:17'),
(43, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 07:15:24', '2018-05-28 07:15:24'),
(44, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 07:15:28', '2018-05-28 07:15:28'),
(45, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 07:22:58', '2018-05-28 07:22:58'),
(46, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 07:24:02', '2018-05-28 07:24:02'),
(47, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 07:31:22', '2018-05-28 07:31:22'),
(48, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 07:32:14', '2018-05-28 07:32:14'),
(49, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 07:33:03', '2018-05-28 07:33:03'),
(50, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 07:36:53', '2018-05-28 07:36:53'),
(51, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 07:37:08', '2018-05-28 07:37:08'),
(52, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 07:46:27', '2018-05-28 07:46:27'),
(53, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:51:31', '2018-05-28 07:51:31'),
(54, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:52:04', '2018-05-28 07:52:04'),
(55, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:53:00', '2018-05-28 07:53:00'),
(56, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:53:44', '2018-05-28 07:53:44'),
(57, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:53:52', '2018-05-28 07:53:52'),
(58, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 07:53:55', '2018-05-28 07:53:55'),
(59, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-05-28 07:59:08', '2018-05-28 07:59:08'),
(60, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 07:59:11', '2018-05-28 07:59:11'),
(61, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 08:00:10', '2018-05-28 08:00:10'),
(62, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 08:00:18', '2018-05-28 08:00:18'),
(63, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 08:00:24', '2018-05-28 08:00:24'),
(64, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 08:00:30', '2018-05-28 08:00:30'),
(65, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 08:01:01', '2018-05-28 08:01:01'),
(66, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 08:07:14', '2018-05-28 08:07:14'),
(67, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-05-28 08:07:39', '2018-05-28 08:07:39'),
(68, '105.32.245.184', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 08:08:03', '2018-05-28 08:08:03'),
(69, '105.32.245.184', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 08:08:11', '2018-05-28 08:08:11'),
(70, '37.76.246.31', 'Saudi Arabia', 'Riyadh (Al Fūţah)', 'HomePage', 0, '2018-05-28 11:01:21', '2018-05-28 11:01:21'),
(71, '66.249.93.51', 'United States', 'Ashburn', 'HomePage', 0, '2018-05-28 12:11:01', '2018-05-28 12:11:01'),
(72, '156.204.133.61', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 12:26:19', '2018-05-28 12:26:19'),
(73, '156.204.133.61', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 12:26:31', '2018-05-28 12:26:31'),
(74, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 12:27:14', '2018-05-28 12:27:14'),
(75, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 12:29:08', '2018-05-28 12:29:08'),
(76, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 12:29:30', '2018-05-28 12:29:30'),
(77, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 12:31:06', '2018-05-28 12:31:06'),
(78, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 12:31:11', '2018-05-28 12:31:11'),
(79, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 12:31:14', '2018-05-28 12:31:14'),
(80, '156.204.133.61', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 12:31:29', '2018-05-28 12:31:29'),
(81, '156.204.133.61', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 12:33:28', '2018-05-28 12:33:28'),
(82, '156.204.133.61', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 12:36:00', '2018-05-28 12:36:00'),
(83, '156.204.133.61', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 12:42:06', '2018-05-28 12:42:06'),
(84, '105.32.123.51', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 18:45:38', '2018-05-28 18:45:38'),
(85, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 18:47:07', '2018-05-28 18:47:07'),
(86, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 18:47:18', '2018-05-28 18:47:18'),
(87, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 18:47:41', '2018-05-28 18:47:41'),
(88, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 18:47:56', '2018-05-28 18:47:56'),
(89, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 18:48:09', '2018-05-28 18:48:09'),
(90, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 19:11:49', '2018-05-28 19:11:49'),
(91, '105.32.123.51', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 20:05:01', '2018-05-28 20:05:01'),
(92, '105.32.123.51', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 20:08:49', '2018-05-28 20:08:49'),
(93, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-05-28 20:08:57', '2018-05-28 20:08:57'),
(94, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:09:08', '2018-05-28 20:09:08'),
(95, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:13:18', '2018-05-28 20:13:18'),
(96, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:13:53', '2018-05-28 20:13:53'),
(97, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:16:06', '2018-05-28 20:16:06'),
(98, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:16:35', '2018-05-28 20:16:35'),
(99, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:17:42', '2018-05-28 20:17:42'),
(100, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:18:32', '2018-05-28 20:18:32'),
(101, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:19:20', '2018-05-28 20:19:20'),
(102, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:19:28', '2018-05-28 20:19:28'),
(103, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:20:26', '2018-05-28 20:20:26'),
(104, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:21:25', '2018-05-28 20:21:25'),
(105, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:21:44', '2018-05-28 20:21:44'),
(106, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:23:24', '2018-05-28 20:23:24'),
(107, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 20:23:30', '2018-05-28 20:23:30'),
(108, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 20:23:34', '2018-05-28 20:23:34'),
(109, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-05-28 20:23:41', '2018-05-28 20:23:41'),
(110, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 20:23:59', '2018-05-28 20:23:59'),
(111, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 20:25:03', '2018-05-28 20:25:03'),
(112, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-28 20:27:41', '2018-05-28 20:27:41'),
(113, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-28 20:27:58', '2018-05-28 20:27:58'),
(114, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-05-28 20:28:07', '2018-05-28 20:28:07'),
(115, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:28:13', '2018-05-28 20:28:13'),
(116, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 6, '2018-05-28 20:28:22', '2018-05-28 20:28:22'),
(117, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 7, '2018-05-28 20:28:27', '2018-05-28 20:28:27'),
(118, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:28:37', '2018-05-28 20:28:37'),
(119, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:32:27', '2018-05-28 20:32:27'),
(120, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:33:28', '2018-05-28 20:33:28'),
(121, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:34:41', '2018-05-28 20:34:41'),
(122, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-28 20:36:23', '2018-05-28 20:36:23'),
(123, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:38:22', '2018-05-28 20:38:22'),
(124, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:46:11', '2018-05-28 20:46:11'),
(125, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:46:18', '2018-05-28 20:46:18'),
(126, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:47:08', '2018-05-28 20:47:08'),
(127, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:47:14', '2018-05-28 20:47:14'),
(128, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:49:21', '2018-05-28 20:49:21'),
(129, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:49:57', '2018-05-28 20:49:57'),
(130, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:51:10', '2018-05-28 20:51:10'),
(131, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:51:17', '2018-05-28 20:51:17'),
(132, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:52:32', '2018-05-28 20:52:32'),
(133, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-28 20:53:03', '2018-05-28 20:53:03'),
(134, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 20:53:09', '2018-05-28 20:53:09'),
(135, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 20:54:03', '2018-05-28 20:54:03'),
(136, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:54:22', '2018-05-28 20:54:22'),
(137, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:55:17', '2018-05-28 20:55:17'),
(138, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:55:27', '2018-05-28 20:55:27'),
(139, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-28 20:55:34', '2018-05-28 20:55:34'),
(140, '105.32.123.51', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-28 20:55:46', '2018-05-28 20:55:46'),
(141, '105.32.123.51', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-28 20:55:50', '2018-05-28 20:55:50'),
(142, '156.204.150.5', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 11:24:02', '2018-05-29 11:24:02'),
(143, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-29 12:50:30', '2018-05-29 12:50:30'),
(144, '156.204.150.5', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 12:50:45', '2018-05-29 12:50:45'),
(145, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-05-29 12:50:47', '2018-05-29 12:50:47'),
(146, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-05-29 12:50:58', '2018-05-29 12:50:58'),
(147, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-05-29 12:51:01', '2018-05-29 12:51:01'),
(148, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 6, '2018-05-29 12:51:04', '2018-05-29 12:51:04'),
(149, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 7, '2018-05-29 12:51:07', '2018-05-29 12:51:07'),
(150, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-05-29 12:51:09', '2018-05-29 12:51:09'),
(151, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-05-29 12:51:12', '2018-05-29 12:51:12'),
(152, '156.204.150.5', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 12:51:49', '2018-05-29 12:51:49'),
(153, '156.204.150.5', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-05-29 12:52:14', '2018-05-29 12:52:14'),
(154, '105.34.188.54', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 12:52:34', '2018-05-29 12:52:34'),
(155, '105.34.188.54', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 12:52:38', '2018-05-29 12:52:38'),
(156, '156.204.150.5', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-29 15:42:22', '2018-05-29 15:42:22'),
(157, '197.121.254.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-31 16:48:25', '2018-05-31 16:48:25'),
(158, '197.121.254.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-31 17:20:48', '2018-05-31 17:20:48'),
(159, '197.121.254.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-31 17:29:01', '2018-05-31 17:29:01'),
(160, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 92, '2018-05-31 17:29:32', '2018-05-31 17:29:32'),
(161, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-05-31 17:29:47', '2018-05-31 17:29:47'),
(162, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 90, '2018-05-31 17:29:54', '2018-05-31 17:29:54'),
(163, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 89, '2018-05-31 17:30:12', '2018-05-31 17:30:12'),
(164, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 92, '2018-05-31 17:56:32', '2018-05-31 17:56:32'),
(165, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 93, '2018-05-31 18:00:12', '2018-05-31 18:00:12'),
(166, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-05-31 18:00:49', '2018-05-31 18:00:49'),
(167, '197.121.254.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-05-31 18:03:46', '2018-05-31 18:03:46'),
(168, '197.121.254.179', 'Egypt', 'Cairo', 'App\\Models\\Category', 6, '2018-05-31 18:03:55', '2018-05-31 18:03:55'),
(169, '156.169.218.225', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-02 20:08:19', '2018-06-02 20:08:19'),
(170, '156.169.218.225', 'Egypt', 'Cairo', 'App\\Models\\Post', 90, '2018-06-02 20:09:08', '2018-06-02 20:09:08'),
(171, '156.168.200.181', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-06-02 21:24:27', '2018-06-02 21:24:27'),
(172, '156.204.236.108', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-05 12:44:28', '2018-06-05 12:44:28'),
(173, '156.204.236.108', 'Egypt', 'Cairo', 'App\\Models\\Post', 93, '2018-06-05 12:47:20', '2018-06-05 12:47:20'),
(174, '156.204.236.108', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-05 12:51:38', '2018-06-05 12:51:38'),
(175, '156.204.236.108', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-05 12:56:09', '2018-06-05 12:56:09'),
(176, '156.204.236.108', 'Egypt', 'Cairo', 'App\\Models\\Post', 88, '2018-06-05 12:56:14', '2018-06-05 12:56:14'),
(177, '156.204.236.108', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-05 12:56:34', '2018-06-05 12:56:34'),
(178, '156.204.236.108', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-05 12:56:45', '2018-06-05 12:56:45'),
(179, '156.204.236.108', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-05 13:00:54', '2018-06-05 13:00:54'),
(180, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'HomePage', 0, '2018-06-06 21:53:04', '2018-06-06 21:53:04'),
(181, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Post', 88, '2018-06-06 21:53:28', '2018-06-06 21:53:28'),
(182, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 3, '2018-06-06 21:54:22', '2018-06-06 21:54:22'),
(183, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 12, '2018-06-06 21:54:39', '2018-06-06 21:54:39'),
(184, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 6, '2018-06-06 21:55:09', '2018-06-06 21:55:09'),
(185, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'HomePage', 0, '2018-06-06 22:38:04', '2018-06-06 22:38:04'),
(186, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Post', 86, '2018-06-06 23:00:16', '2018-06-06 23:00:16'),
(187, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Post', 87, '2018-06-06 23:01:09', '2018-06-06 23:01:09'),
(188, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 12, '2018-06-06 23:04:54', '2018-06-06 23:04:54'),
(189, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 12, '2018-06-06 23:11:28', '2018-06-06 23:11:28'),
(190, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Category', 6, '2018-06-06 23:13:50', '2018-06-06 23:13:50'),
(191, '156.211.103.218', 'Egypt', 'Al-Sheikh Zayed', 'App\\Models\\Post', 58, '2018-06-06 23:16:27', '2018-06-06 23:16:27'),
(192, '105.85.182.250', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-07 14:18:51', '2018-06-07 14:18:51'),
(193, '41.44.131.1', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-11 21:07:10', '2018-06-11 21:07:10'),
(194, '41.44.131.1', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-11 21:08:31', '2018-06-11 21:08:31'),
(195, '41.44.131.1', 'Egypt', 'Cairo', 'App\\Models\\Post', 93, '2018-06-11 21:13:16', '2018-06-11 21:13:16'),
(196, '156.204.94.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 18:08:27', '2018-06-12 18:08:27'),
(197, '156.204.94.179', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 18:10:11', '2018-06-12 18:10:11'),
(198, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 20:40:44', '2018-06-12 20:40:44'),
(199, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-12 20:43:44', '2018-06-12 20:43:44'),
(200, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 93, '2018-06-12 20:58:14', '2018-06-12 20:58:14'),
(201, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 6, '2018-06-12 20:58:35', '2018-06-12 20:58:35'),
(202, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 7, '2018-06-12 20:58:40', '2018-06-12 20:58:40'),
(203, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-06-12 20:58:45', '2018-06-12 20:58:45'),
(204, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 15, '2018-06-12 20:58:48', '2018-06-12 20:58:48'),
(205, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-06-12 20:58:50', '2018-06-12 20:58:50'),
(206, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-06-12 20:59:24', '2018-06-12 20:59:24'),
(207, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 90, '2018-06-12 20:59:28', '2018-06-12 20:59:28'),
(208, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-12 20:59:33', '2018-06-12 20:59:33'),
(209, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-06-12 20:59:42', '2018-06-12 20:59:42'),
(210, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 87, '2018-06-12 21:01:35', '2018-06-12 21:01:35'),
(211, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 21:01:47', '2018-06-12 21:01:47'),
(212, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-12 21:18:47', '2018-06-12 21:18:47'),
(213, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 21:18:57', '2018-06-12 21:18:57'),
(214, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-12 21:19:34', '2018-06-12 21:19:34'),
(215, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 21:19:47', '2018-06-12 21:19:47'),
(216, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-06-12 21:21:07', '2018-06-12 21:21:07'),
(217, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-06-12 21:21:13', '2018-06-12 21:21:13'),
(218, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-06-12 21:21:20', '2018-06-12 21:21:20'),
(219, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 21:27:53', '2018-06-12 21:27:53'),
(220, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-06-12 21:29:23', '2018-06-12 21:29:23'),
(221, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Category', 4, '2018-06-12 21:29:56', '2018-06-12 21:29:56'),
(222, '217.55.253.169', 'Egypt', 'Cairo', 'App\\Models\\Post', 93, '2018-06-12 21:30:08', '2018-06-12 21:30:08'),
(223, '217.55.253.169', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-12 21:30:26', '2018-06-12 21:30:26'),
(224, '41.199.152.62', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-13 02:06:44', '2018-06-13 02:06:44'),
(225, '41.199.152.62', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-13 05:07:33', '2018-06-13 05:07:33'),
(226, '156.169.133.187', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-13 13:50:27', '2018-06-13 13:50:27'),
(227, '156.169.133.187', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-13 13:53:34', '2018-06-13 13:53:34'),
(228, '156.169.133.187', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-13 14:05:45', '2018-06-13 14:05:45'),
(229, '156.168.177.92', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-13 15:13:00', '2018-06-13 15:13:00'),
(230, '156.168.177.92', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-13 15:15:24', '2018-06-13 15:15:24'),
(231, '156.168.177.92', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-13 15:21:55', '2018-06-13 15:21:55'),
(232, '156.168.177.92', 'Egypt', 'Cairo', 'App\\Models\\Category', 12, '2018-06-13 15:22:41', '2018-06-13 15:22:41'),
(233, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 09:01:37', '2018-06-13 09:01:37'),
(234, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 09:03:58', '2018-06-13 09:03:58'),
(235, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 09:08:29', '2018-06-13 09:08:29'),
(236, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 09:09:22', '2018-06-13 09:09:22'),
(237, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 09:10:34', '2018-06-13 09:10:34'),
(238, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 12, '2018-06-13 09:10:39', '2018-06-13 09:10:39'),
(239, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 6, '2018-06-13 09:10:43', '2018-06-13 09:10:43'),
(240, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 7, '2018-06-13 09:10:45', '2018-06-13 09:10:45'),
(241, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 14, '2018-06-13 09:10:47', '2018-06-13 09:10:47'),
(242, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 15, '2018-06-13 09:10:49', '2018-06-13 09:10:49'),
(243, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 3, '2018-06-13 09:10:52', '2018-06-13 09:10:52'),
(244, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 4, '2018-06-13 09:10:57', '2018-06-13 09:10:57'),
(245, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 4, '2018-06-13 10:19:40', '2018-06-13 10:19:40'),
(246, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 3, '2018-06-13 10:21:33', '2018-06-13 10:21:33'),
(247, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 10:54:14', '2018-06-13 10:54:14'),
(248, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:18:43', '2018-06-13 11:18:43'),
(249, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:19:01', '2018-06-13 11:19:01'),
(250, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:19:52', '2018-06-13 11:19:52'),
(251, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:20:11', '2018-06-13 11:20:11'),
(252, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:20:20', '2018-06-13 11:20:20'),
(253, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:20:33', '2018-06-13 11:20:33'),
(254, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:22:23', '2018-06-13 11:22:23'),
(255, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:23:31', '2018-06-13 11:23:31'),
(256, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:24:13', '2018-06-13 11:24:13'),
(257, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-13 11:24:26', '2018-06-13 11:24:26'),
(258, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 11:28:03', '2018-06-13 11:28:03'),
(259, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-13 11:28:10', '2018-06-13 11:28:10'),
(260, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-13 11:30:07', '2018-06-13 11:30:07'),
(261, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:30:59', '2018-06-13 11:30:59'),
(262, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:31:33', '2018-06-13 11:31:33'),
(263, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:32:55', '2018-06-13 11:32:55'),
(264, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:37:25', '2018-06-13 11:37:25'),
(265, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:37:52', '2018-06-13 11:37:52'),
(266, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:38:04', '2018-06-13 11:38:04'),
(267, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:38:06', '2018-06-13 11:38:06'),
(268, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:38:15', '2018-06-13 11:38:15'),
(269, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:44:46', '2018-06-13 11:44:46'),
(270, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:46:07', '2018-06-13 11:46:07'),
(271, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:46:37', '2018-06-13 11:46:37'),
(272, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 11:47:05', '2018-06-13 11:47:05'),
(273, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 12:13:10', '2018-06-13 12:13:10'),
(274, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 4, '2018-06-13 12:15:02', '2018-06-13 12:15:02'),
(275, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Tag', 3, '2018-06-13 12:15:13', '2018-06-13 12:15:13'),
(276, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:15:18', '2018-06-13 12:15:18'),
(277, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:15:22', '2018-06-13 12:15:22'),
(278, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:15:42', '2018-06-13 12:15:42'),
(279, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:15:50', '2018-06-13 12:15:50'),
(280, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:15:56', '2018-06-13 12:15:56'),
(281, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:16:14', '2018-06-13 12:16:14'),
(282, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:16:20', '2018-06-13 12:16:20'),
(283, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:18:16', '2018-06-13 12:18:16'),
(284, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:19:12', '2018-06-13 12:19:12'),
(285, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:19:16', '2018-06-13 12:19:16'),
(286, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:19:36', '2018-06-13 12:19:36'),
(287, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:19:48', '2018-06-13 12:19:48'),
(288, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:19:52', '2018-06-13 12:19:52'),
(289, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-13 12:20:46', '2018-06-13 12:20:46'),
(290, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-13 12:38:21', '2018-06-13 12:38:21'),
(291, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-13 12:39:23', '2018-06-13 12:39:23'),
(292, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 07:55:09', '2018-06-14 07:55:09'),
(293, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 08:01:34', '2018-06-14 08:01:34'),
(294, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 08:01:34', '2018-06-14 08:01:34'),
(295, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 08:01:54', '2018-06-14 08:01:54'),
(296, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:05:15', '2018-06-14 09:05:15'),
(297, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:11:53', '2018-06-14 09:11:53'),
(298, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:11:57', '2018-06-14 09:11:57'),
(299, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:11:59', '2018-06-14 09:11:59'),
(300, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:12:01', '2018-06-14 09:12:01'),
(301, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:19:11', '2018-06-14 09:19:11'),
(302, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:19:36', '2018-06-14 09:19:36'),
(303, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:20:40', '2018-06-14 09:20:40'),
(304, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:21:41', '2018-06-14 09:21:41'),
(305, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:23:04', '2018-06-14 09:23:04'),
(306, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:35:18', '2018-06-14 09:35:18'),
(307, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:36:10', '2018-06-14 09:36:10'),
(308, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:37:54', '2018-06-14 09:37:54'),
(309, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:39:59', '2018-06-14 09:39:59'),
(310, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 09:43:57', '2018-06-14 09:43:57'),
(311, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:02:30', '2018-06-14 10:02:30'),
(312, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:02:35', '2018-06-14 10:02:35'),
(313, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:03:31', '2018-06-14 10:03:31'),
(314, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:03:37', '2018-06-14 10:03:37'),
(315, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:04:00', '2018-06-14 10:04:00'),
(316, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:04:13', '2018-06-14 10:04:13'),
(317, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:06:00', '2018-06-14 10:06:00'),
(318, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:06:06', '2018-06-14 10:06:06'),
(319, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:07:15', '2018-06-14 10:07:15'),
(320, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:07:43', '2018-06-14 10:07:43'),
(321, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:08:19', '2018-06-14 10:08:19'),
(322, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:09:05', '2018-06-14 10:09:05'),
(323, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:09:09', '2018-06-14 10:09:09'),
(324, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:10:22', '2018-06-14 10:10:22'),
(325, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:10:44', '2018-06-14 10:10:44'),
(326, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:11:03', '2018-06-14 10:11:03'),
(327, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:11:20', '2018-06-14 10:11:20'),
(328, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 88, '2018-06-14 10:12:18', '2018-06-14 10:12:18'),
(329, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 88, '2018-06-14 10:14:05', '2018-06-14 10:14:05'),
(330, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 88, '2018-06-14 10:15:22', '2018-06-14 10:15:22'),
(331, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 88, '2018-06-14 10:15:26', '2018-06-14 10:15:26'),
(332, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 10:20:19', '2018-06-14 10:20:19'),
(333, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 10:22:34', '2018-06-14 10:22:34'),
(334, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:23:23', '2018-06-14 10:23:23'),
(335, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:47:20', '2018-06-14 10:47:20'),
(336, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:47:29', '2018-06-14 10:47:29'),
(337, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:48:21', '2018-06-14 10:48:21'),
(338, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 6, '2018-06-14 10:49:03', '2018-06-14 10:49:03'),
(339, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 4, '2018-06-14 10:49:05', '2018-06-14 10:49:05'),
(340, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:49:09', '2018-06-14 10:49:09'),
(341, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:50:44', '2018-06-14 10:50:44'),
(342, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 90, '2018-06-14 10:51:42', '2018-06-14 10:51:42'),
(343, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Category', 3, '2018-06-14 10:53:05', '2018-06-14 10:53:05'),
(344, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 10:53:14', '2018-06-14 10:53:14'),
(345, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:12:43', '2018-06-14 12:12:43'),
(346, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:12:59', '2018-06-14 12:12:59'),
(347, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:15:19', '2018-06-14 12:15:19'),
(348, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:21:36', '2018-06-14 12:21:36'),
(349, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:22:47', '2018-06-14 12:22:47'),
(350, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:22:56', '2018-06-14 12:22:56'),
(351, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:23:24', '2018-06-14 12:23:24'),
(352, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:24:07', '2018-06-14 12:24:07'),
(353, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:24:23', '2018-06-14 12:24:23'),
(354, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:24:33', '2018-06-14 12:24:33'),
(355, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:28:47', '2018-06-14 12:28:47'),
(356, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:29:09', '2018-06-14 12:29:09'),
(357, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 91, '2018-06-14 12:29:34', '2018-06-14 12:29:34'),
(358, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 12:29:38', '2018-06-14 12:29:38'),
(359, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 12:30:24', '2018-06-14 12:30:24'),
(360, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 12:30:38', '2018-06-14 12:30:38'),
(361, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 12:30:43', '2018-06-14 12:30:43'),
(362, '127.0.0.1', 'United States', 'New Haven', 'HomePage', 0, '2018-06-14 12:31:22', '2018-06-14 12:31:22'),
(363, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:38:14', '2018-06-14 12:38:14'),
(364, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:41:10', '2018-06-14 12:41:10'),
(365, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:41:39', '2018-06-14 12:41:39'),
(366, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:41:45', '2018-06-14 12:41:45'),
(367, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:42:10', '2018-06-14 12:42:10'),
(368, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:42:30', '2018-06-14 12:42:30'),
(369, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:43:36', '2018-06-14 12:43:36'),
(370, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:43:43', '2018-06-14 12:43:43'),
(371, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:45:28', '2018-06-14 12:45:28'),
(372, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:45:33', '2018-06-14 12:45:33'),
(373, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:46:39', '2018-06-14 12:46:39'),
(374, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:46:47', '2018-06-14 12:46:47'),
(375, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 94, '2018-06-14 12:55:40', '2018-06-14 12:55:40'),
(376, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:55:46', '2018-06-14 12:55:46'),
(377, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:56:01', '2018-06-14 12:56:01'),
(378, '127.0.0.1', 'United States', 'New Haven', 'App\\Models\\Post', 58, '2018-06-14 12:56:07', '2018-06-14 12:56:07'),
(379, '156.179.43.134', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 06:11:50', '2018-06-22 06:11:50'),
(380, '35.229.102.227', 'United States', 'Newark', 'HomePage', 0, '2018-06-22 06:12:53', '2018-06-22 06:12:53'),
(381, '35.229.102.227', 'United States', 'Newark', 'HomePage', 0, '2018-06-22 06:12:54', '2018-06-22 06:12:54'),
(382, '197.125.77.27', 'Egypt', 'New Cairo', 'HomePage', 0, '2018-06-22 06:14:02', '2018-06-22 06:14:02'),
(383, '197.125.77.27', 'Egypt', 'New Cairo', 'HomePage', 0, '2018-06-22 06:14:17', '2018-06-22 06:14:17'),
(384, '197.125.77.27', 'Egypt', 'New Cairo', 'HomePage', 0, '2018-06-22 06:14:34', '2018-06-22 06:14:34'),
(385, '197.125.77.27', 'Egypt', 'New Cairo', 'App\\Models\\Post', 90, '2018-06-22 06:15:11', '2018-06-22 06:15:11'),
(386, '197.125.77.27', 'Egypt', 'New Cairo', 'App\\Models\\Post', 90, '2018-06-22 06:15:12', '2018-06-22 06:15:12'),
(387, '31.13.124.120', 'Brazil', 'Carolina', 'App\\Models\\Post', 90, '2018-06-22 06:15:17', '2018-06-22 06:15:17'),
(388, '38.130.185.204', 'United States', 'Dallas', 'HomePage', 0, '2018-06-22 06:15:28', '2018-06-22 06:15:28'),
(389, '23.239.143.252', 'United States', 'Cypress', 'HomePage', 0, '2018-06-22 06:15:41', '2018-06-22 06:15:41'),
(390, '197.125.77.27', 'Egypt', 'New Cairo', 'HomePage', 0, '2018-06-22 06:17:00', '2018-06-22 06:17:00'),
(391, '23.27.154.31', 'United States', 'San Jose', 'HomePage', 0, '2018-06-22 06:18:03', '2018-06-22 06:18:03'),
(392, '38.130.176.92', 'United States', 'Memphis', 'HomePage', 0, '2018-06-22 06:21:43', '2018-06-22 06:21:43'),
(393, '104.222.39.47', 'United States', 'Wilmington', 'HomePage', 0, '2018-06-22 06:23:33', '2018-06-22 06:23:33'),
(394, '156.171.159.12', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 06:51:31', '2018-06-22 06:51:31'),
(395, '156.171.159.12', 'Egypt', 'Cairo', 'App\\Models\\Post', 85, '2018-06-22 06:51:41', '2018-06-22 06:51:41'),
(396, '156.171.159.12', 'Egypt', 'Cairo', 'App\\Models\\Category', 7, '2018-06-22 06:51:47', '2018-06-22 06:51:47'),
(397, '156.171.159.12', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-06-22 06:51:53', '2018-06-22 06:51:53'),
(398, '156.171.159.12', 'Egypt', 'Cairo', 'App\\Models\\Post', 86, '2018-06-22 06:52:03', '2018-06-22 06:52:03'),
(399, '156.171.159.12', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 06:52:08', '2018-06-22 06:52:08'),
(400, '157.55.39.248', 'United States', 'Redmond', 'HomePage', 0, '2018-06-22 08:01:12', '2018-06-22 08:01:12'),
(401, '158.69.64.72', 'Canada', 'Montreal', 'HomePage', 0, '2018-06-22 08:11:47', '2018-06-22 08:11:47'),
(402, '89.31.57.5', 'Netherlands', 'The Hague (Escamp)', 'HomePage', 0, '2018-06-22 13:55:25', '2018-06-22 13:55:25'),
(403, '199.30.228.148', 'United States', 'Seattle', 'HomePage', 0, '2018-06-22 15:25:39', '2018-06-22 15:25:39'),
(404, '78.186.171.150', 'Turkey', 'Duzce', 'HomePage', 0, '2018-06-22 16:10:16', '2018-06-22 16:10:16'),
(405, '66.249.65.108', 'United States', 'Ashburn', 'HomePage', 0, '2018-06-22 17:14:26', '2018-06-22 17:14:26'),
(406, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:43:51', '2018-06-22 17:43:51'),
(407, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:46:45', '2018-06-22 17:46:45'),
(408, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:47:18', '2018-06-22 17:47:18'),
(409, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Post', 85, '2018-06-22 17:47:26', '2018-06-22 17:47:26'),
(410, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:50:15', '2018-06-22 17:50:15'),
(411, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:50:27', '2018-06-22 17:50:27'),
(412, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 90, '2018-06-22 17:52:47', '2018-06-22 17:52:47'),
(413, '31.13.125.204', 'United States', 'Newark', 'App\\Models\\Post', 90, '2018-06-22 17:52:50', '2018-06-22 17:52:50'),
(414, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Post', 87, '2018-06-22 17:54:46', '2018-06-22 17:54:46'),
(415, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Post', 58, '2018-06-22 17:58:26', '2018-06-22 17:58:26'),
(416, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 90, '2018-06-22 17:59:29', '2018-06-22 17:59:29'),
(417, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 17:59:49', '2018-06-22 17:59:49'),
(418, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-06-22 17:59:56', '2018-06-22 17:59:56'),
(419, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Category', 14, '2018-06-22 18:00:15', '2018-06-22 18:00:15'),
(420, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:00:20', '2018-06-22 18:00:20'),
(421, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:00:30', '2018-06-22 18:00:30'),
(422, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:00:42', '2018-06-22 18:00:42'),
(423, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Post', 86, '2018-06-22 18:05:46', '2018-06-22 18:05:46'),
(424, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Post', 94, '2018-06-22 18:13:06', '2018-06-22 18:13:06'),
(425, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:27:18', '2018-06-22 18:27:18'),
(426, '66.249.65.108', 'United States', 'Ashburn', 'App\\Models\\Post', 88, '2018-06-22 18:35:06', '2018-06-22 18:35:06'),
(427, '66.249.65.108', 'United States', 'Ashburn', 'HomePage', 0, '2018-06-22 18:38:46', '2018-06-22 18:38:46'),
(428, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Post', 90, '2018-06-22 18:46:06', '2018-06-22 18:46:06'),
(429, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:52:14', '2018-06-22 18:52:14'),
(430, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Category', 12, '2018-06-22 18:53:26', '2018-06-22 18:53:26'),
(431, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 18:54:54', '2018-06-22 18:54:54'),
(432, '35.231.40.54', 'United States', 'Newark', 'HomePage', 0, '2018-06-22 18:57:43', '2018-06-22 18:57:43'),
(433, '35.231.40.54', 'United States', 'Newark', 'HomePage', 0, '2018-06-22 18:57:44', '2018-06-22 18:57:44'),
(434, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Post', 89, '2018-06-22 19:00:46', '2018-06-22 19:00:46'),
(435, '173.252.100.214', 'United States', 'Newark', 'App\\Models\\Post', 89, '2018-06-22 19:01:03', '2018-06-22 19:01:03'),
(436, '66.249.65.108', 'United States', 'Ashburn', 'App\\Models\\Category', 6, '2018-06-22 19:04:26', '2018-06-22 19:04:26'),
(437, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 19:05:34', '2018-06-22 19:05:34'),
(438, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 94, '2018-06-22 19:05:49', '2018-06-22 19:05:49'),
(439, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Category', 15, '2018-06-22 19:11:46', '2018-06-22 19:11:46'),
(440, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 94, '2018-06-22 19:16:01', '2018-06-22 19:16:01'),
(441, '66.249.65.108', 'United States', 'Ashburn', 'App\\Models\\Category', 14, '2018-06-22 19:19:06', '2018-06-22 19:19:06'),
(442, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 94, '2018-06-22 19:21:07', '2018-06-22 19:21:07'),
(443, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 94, '2018-06-22 19:21:56', '2018-06-22 19:21:56');
INSERT INTO `visits` (`id`, `client_ip`, `client_country`, `client_city`, `model_name`, `model_id`, `created_at`, `updated_at`) VALUES
(444, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Category', 7, '2018-06-22 19:30:06', '2018-06-22 19:30:06'),
(445, '66.249.65.110', 'United States', 'Ashburn', 'App\\Models\\Post', 91, '2018-06-22 19:37:26', '2018-06-22 19:37:26'),
(446, '66.220.156.55', 'United States', 'Ashburn', 'App\\Models\\Post', 91, '2018-06-22 19:38:08', '2018-06-22 19:38:08'),
(447, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 94, '2018-06-22 19:44:01', '2018-06-22 19:44:01'),
(448, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Category', 3, '2018-06-22 19:44:23', '2018-06-22 19:44:23'),
(449, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Tag', 3, '2018-06-22 19:44:29', '2018-06-22 19:44:29'),
(450, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 19:45:01', '2018-06-22 19:45:01'),
(451, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Category', 3, '2018-06-22 19:48:26', '2018-06-22 19:48:26'),
(452, '66.249.65.108', 'United States', 'Ashburn', 'App\\Models\\Category', 4, '2018-06-22 19:52:06', '2018-06-22 19:52:06'),
(453, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:05:15', '2018-06-22 20:05:15'),
(454, '66.249.65.108', 'United States', 'Ashburn', 'App\\Models\\Post', 87, '2018-06-22 20:06:46', '2018-06-22 20:06:46'),
(455, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:07:17', '2018-06-22 20:07:17'),
(456, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:10:08', '2018-06-22 20:10:08'),
(457, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-06-22 20:10:20', '2018-06-22 20:10:20'),
(458, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-06-22 20:11:49', '2018-06-22 20:11:49'),
(459, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-06-22 20:19:02', '2018-06-22 20:19:02'),
(460, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 91, '2018-06-22 20:19:12', '2018-06-22 20:19:12'),
(461, '31.13.125.87', 'United States', 'Newark', 'App\\Models\\Post', 91, '2018-06-22 20:19:16', '2018-06-22 20:19:16'),
(462, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:20:27', '2018-06-22 20:20:27'),
(463, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:22:50', '2018-06-22 20:22:50'),
(464, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:22:55', '2018-06-22 20:22:55'),
(465, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:28:46', '2018-06-22 20:28:46'),
(466, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:31:12', '2018-06-22 20:31:12'),
(467, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:31:24', '2018-06-22 20:31:24'),
(468, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:32:46', '2018-06-22 20:32:46'),
(469, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:32:55', '2018-06-22 20:32:55'),
(470, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:33:40', '2018-06-22 20:33:40'),
(471, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:34:16', '2018-06-22 20:34:16'),
(472, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:34:24', '2018-06-22 20:34:24'),
(473, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:34:47', '2018-06-22 20:34:47'),
(474, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:35:57', '2018-06-22 20:35:57'),
(475, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:36:07', '2018-06-22 20:36:07'),
(476, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:38:15', '2018-06-22 20:38:15'),
(477, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:39:16', '2018-06-22 20:39:16'),
(478, '66.249.65.106', 'United States', 'Ashburn', 'App\\Models\\Post', 58, '2018-06-22 20:47:06', '2018-06-22 20:47:06'),
(479, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:47:06', '2018-06-22 20:47:06'),
(480, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:47:41', '2018-06-22 20:47:41'),
(481, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:47:56', '2018-06-22 20:47:56'),
(482, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:48:38', '2018-06-22 20:48:38'),
(483, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:49:59', '2018-06-22 20:49:59'),
(484, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:50:31', '2018-06-22 20:50:31'),
(485, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:50:45', '2018-06-22 20:50:45'),
(486, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:51:07', '2018-06-22 20:51:07'),
(487, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:51:43', '2018-06-22 20:51:43'),
(488, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:52:30', '2018-06-22 20:52:30'),
(489, '197.126.144.55', 'Egypt', 'Cairo', 'HomePage', 0, '2018-06-22 20:56:04', '2018-06-22 20:56:04'),
(490, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:58:04', '2018-06-22 20:58:04'),
(491, '197.126.144.55', 'Egypt', 'Cairo', 'App\\Models\\Post', 58, '2018-06-22 20:59:02', '2018-06-22 20:59:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_levels`
--
ALTER TABLE `account_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_levels_sec_groups_relationship`
--
ALTER TABLE `account_levels_sec_groups_relationship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_links`
--
ALTER TABLE `menu_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_links_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `menu_link_translations`
--
ALTER TABLE `menu_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_link_translations_menu_link_id_locale_unique` (`menu_link_id`,`locale`),
  ADD KEY `menu_link_translations_locale_index` (`locale`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_tags_relationship`
--
ALTER TABLE `posts_tags_relationship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_translations_post_id_locale_unique` (`post_id`,`locale`),
  ADD KEY `post_translations_locale_index` (`locale`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_groups`
--
ALTER TABLE `sec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_permissions`
--
ALTER TABLE `sec_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  ADD KEY `setting_translations_locale_index` (`locale`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_client_ip_index` (`client_ip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_levels`
--
ALTER TABLE `account_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `account_levels_sec_groups_relationship`
--
ALTER TABLE `account_levels_sec_groups_relationship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `menu_link_translations`
--
ALTER TABLE `menu_link_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `posts_tags_relationship`
--
ALTER TABLE `posts_tags_relationship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `post_translations`
--
ALTER TABLE `post_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sec_groups`
--
ALTER TABLE `sec_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sec_permissions`
--
ALTER TABLE `sec_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_links`
--
ALTER TABLE `menu_links`
  ADD CONSTRAINT `menu_links_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_link_translations`
--
ALTER TABLE `menu_link_translations`
  ADD CONSTRAINT `menu_link_translations_menu_link_id_foreign` FOREIGN KEY (`menu_link_id`) REFERENCES `menu_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
