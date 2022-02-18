-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2022 at 04:39 AM
-- Server version: 5.7.37
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solutio9_newadminfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `name`, `price`, `created_at`, `updated_at`, `restaurant_id`, `status`) VALUES
(1, 'Loli pop', 12.00, '2021-11-18 17:11:38', '2021-11-18 17:11:38', 1, 1),
(2, '10ml', 0.00, '2021-11-26 19:15:01', '2021-11-26 19:15:01', 1, 1),
(3, 'Cheese', 0.00, '2021-11-27 14:39:50', '2021-11-27 19:16:46', 1, 1),
(4, 'Cheese', 0.00, '2021-11-27 14:39:50', '2021-11-27 19:16:48', 2, 1),
(5, 'Cheese', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 9, 1),
(6, 'Coke', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 9, 1),
(7, 'Extra Spice', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 9, 1),
(8, 'Cheese', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(9, 'Extra Spice', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(10, 'Extra Chicken', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(11, 'Extra Beef', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(12, 'SALAD', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(13, 'Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(14, 'salad', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 1, 1),
(15, 'extra beef', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 1, 1),
(16, 'extra chicken', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 1, 1),
(17, 'sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 1, 1),
(18, 'Coke', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 13, 1),
(19, 'Pepsi', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 13, 1),
(20, 'Extra Cheese', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 13, 1),
(21, 'Extra Chicken', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 13, 1),
(22, 'Extra Meat', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 13, 1),
(23, 'Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 8, 1),
(24, 'Extra Chicken', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 8, 1),
(25, 'Extra Beef', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 8, 1),
(26, 'salad', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 8, 1),
(27, 'Coke', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(28, 'Pepsi', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 14, 1),
(29, 'Tomato Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 10, 1),
(30, 'Hot Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 10, 1),
(31, 'Taco Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 10, 1),
(32, 'Coke', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(33, 'Pepsi', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(34, 'Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(35, 'Extra Spice', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(36, 'Extra Meat', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(37, 'Extra Chicken', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 2, 1),
(38, 'Tomato Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 6, 1),
(39, 'Hot Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 6, 1),
(40, 'Soft Drinks', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 6, 1),
(41, 'Tomato Sauce', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 3, 1),
(42, 'Soft Drinks', 0.00, '2021-11-27 14:39:50', '2021-11-27 14:39:50', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Super admin', 'test', '123456789', 'admin@admin.com', '2021-11-30-61a608cae8cb2.png', '$2y$10$qZuUggs6nytPBFXsneLg/ex7t34aMOKiSGjBZ0RBZ0FdeZqoKLib6', 'Y7YVNm8WklAMAdPaZ6jx4Q0f1RVb3TwsQ6xL25cf8YLuTZe5CFbhT1g3wnwh', '2021-11-09 21:41:42', '2021-11-30 21:49:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(8,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(8,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ageverification`
--

CREATE TABLE `ageverification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cid` int(11) NOT NULL,
  `fontimg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backimg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `db` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ageverification`
--

INSERT INTO `ageverification` (`id`, `cid`, `fontimg`, `backimg`, `db`, `created_at`, `updated_at`) VALUES
(9, 1, '904616407672142021-11-15-619236e112a09.png', '908016407672142021-11-15-619236e112a09.png', '12-09-2021', '2021-12-29 19:10:14', '2021-12-29 19:10:14'),
(11, 66, '44771640841957image_picker8869772001227904252.jpg', '38161640841957image_picker4260544874841718586.jpg', '5/5/1223', '2021-12-30 15:55:57', '2021-12-30 15:55:57'),
(12, 57, '11261640844418image_picker4388576506636011543.png', '32981640844418image_picker7774749745389873014.png', '02021968', '2021-12-30 16:36:58', '2021-12-30 16:36:58'),
(13, 67, '88551640858019image_picker6863912348258442785.jpg', '96741640858019image_picker6896249298470572144.jpg', '31 Oct 1982', '2021-12-30 20:23:39', '2021-12-30 20:23:39'),
(14, 44, '91501640861342googlelogo_color_272x92dp.png', '9511640861342googlelogo_color_272x92dp.png', '12-08-2000', '2021-12-30 21:19:03', '2021-12-30 21:19:03'),
(15, 59, '29321640861558adobe-a.svg', '48791640861558adobe-a.svg', '12-08-2000', '2021-12-30 21:22:39', '2021-12-30 21:22:39'),
(16, 46, '39291640861984logo.png', '42181640861984logo.png', '12-08-2000', '2021-12-30 21:29:45', '2021-12-30 21:29:45'),
(17, 3, 'website.jpg', 'website.jpg', '12-09-1980', '2021-12-31 21:32:08', '2021-12-31 21:32:08'),
(18, 4, '42621640948794website.jpg', '21471640948794website.jpg', '12-09-1980', '2021-12-31 21:36:34', '2021-12-31 21:36:34'),
(19, 5, '1381640949012eagle-hunter-in-traditional-costume-riding-horse-with-golden-eagle-in-picture-id1343808526', '84081640949012website.jpg', '12-09-1980', '2021-12-31 21:40:12', '2021-12-31 21:40:12'),
(20, 6, '84891640949120eagle-hunter-in-traditional-costume-riding-horse-with-golden-eagle-in-picture-id1343808526', '26841640949120png-transparent-multicolored-balloons-illustration-balloon-balloon-free-balloons-easter-egg-desktop-wallpaper-party-thumbnail.png', '12-09-1980', '2021-12-31 21:42:00', '2021-12-31 21:42:00'),
(21, 63, '84081640949012website.jpg', '90991640952290image_picker1366725185951477853.jpg', '6/7/1998', '2021-12-31 22:34:50', '2021-12-31 22:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2021-11-26 19:14:08', '2021-11-26 19:14:08'),
(2, 'ml', '2021-11-26 19:14:19', '2021-11-26 19:14:19'),
(3, 'Full', '2021-12-23 17:29:19', '2021-12-23 17:29:19'),
(4, 'Half', '2021-12-23 17:29:25', '2021-12-23 17:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`) VALUES
(1, 'Festival', 'restaurant_wise', '2021-11-13-618f9576ba7ad.png', 1, '1', '2021-11-13 07:37:42', '2021-11-13 07:37:42', 2);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-05-11 03:56:38', '2021-11-29 17:42:06'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2021-09-09 22:28:18'),
(4, 'mail_config', NULL, NULL, '2021-05-11 04:14:06'),
(5, 'fcm_project_id', NULL, NULL, NULL),
(6, 'push_notification_key', 'AAAAjSBBngI:APA91bEzIY_As3TuRm4pFRo1PB3fk8iqS57WeWgljBCE66YgoPXzBHJ0tzCR5KxAOLNlsFCwSxXANDzUpqGqp5KGsp5LU_y9U8XlgogSy14cUQyfPVwQp43ySYAGE728G1ISCJEshzsH', NULL, NULL),
(7, 'order_pending_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":0,\"message\":null}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(15, 'terms_and_conditions', '<p style=\"margin-bottom:0cm; text-align:justify; margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><b><span style=\"font-size:12.0pt\"><span style=\"color:#282c3f\">Bazimat - Terms of Use - August 2021</span></span></b></span></span></span></p>\r\n\r\n            <p style=\"margin-bottom:0cm; text-align:justify; margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"color:#282c3f\">This document is an electronic record in terms of Information Technology Act, 2000 and rules there under as applicable and the amended provisions pertaining to electronic records in various statutes as amended by the Information Technology Act, 2000. This document is published in accordance with the provisions of Rule 3 (1) of the Information Technology (Intermediaries guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and Terms of Use for access or usage of www.bazimat.in website and Bazimat application for mobile and handheld devices.</span></span></span></span></span></p>', NULL, '2022-01-03 20:42:36'),
(16, 'business_name', 'Bazimat Drinks Pvt. Ltd', NULL, NULL),
(17, 'currency', 'INR', NULL, NULL),
(18, 'logo', '2021-11-15-619236e112a09.png', NULL, NULL),
(19, 'phone', '0123456789', NULL, NULL),
(20, 'email_address', 'admin@admin.com', NULL, NULL),
(21, 'address', 'demo', NULL, NULL),
(22, 'footer_text', 'All Copy Right Reserved .', NULL, NULL),
(23, 'customer_verification', '1', NULL, NULL),
(24, 'map_api_key', 'AIzaSyBLJD32GhI_5Ttca-wvGEIcD9NFuzeBxCA', NULL, NULL),
(25, 'privacy_policy', '<p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#282c3f\">Last updated on 19th October, 2021</span></span></span></span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#282c3f\">This Privacy Policy (“<b>Policy</b>”) describes the policies and procedures on the collection, use, disclosure and protection of your information when you use our website located at&nbsp;Bazimat.in, or the Bazimat mobile application (collectively, “<b>Bazimat Platform</b>”) made available by Bazimat Drinks Pvt. Ltd. (“<b>Bazimat</b>”, “<b>Company</b>”, “<b>we</b>”, “<b>us</b>” and “<b>our</b>”), &nbsp;a private company established under the laws of India having its registered office at 23/1A, Ganesh Ghosh Lane, Kolkata – 700039, India.</span></span></span></span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#282c3f\">The terms “you” and “your” refer to the user of the Bazimat Platform. The term “<b>Services</b>” refers to any services offered by Bazimat whether on the Bazimat Platform or otherwise.</span></span></span></span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:normal\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"color:#282c3f\">Please read this Policy before using the Bazimat Platform or submitting any personal information to Bazimat. This Policy is a part of and incorporated within, and is to be read along with, the Terms of Use.</span></span></span></span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">PRIVACY POLICY</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">1. Introduction</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Welcome to BAZIMAT DRINKS PVT.LTD.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">BAZIMAT DRINKS PVT.LTD. (“us”, “we”, or “our”) operates https://www.bazimat.in/ (hereinafter referred to as “Service”).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Our Privacy Policy governs your visit to https://www.bazimat.in/, and explains how we collect, safeguard and disclose information that results from your use of our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Our Terms and Conditions (“Terms”) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (“agreement”).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">2. Definitions</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">SERVICE means the https://www.bazimat.in/ website operated by BAZIMAT DRINKS PVT.LTD.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">PERSONAL DATA means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">USAGE DATA is data collected automatically either generated by the use of Service or from Service infrastructure itself (for example, the duration of a page visit).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">COOKIES are small files stored on your device (computer or mobile device).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">DATA CONTROLLER means a natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal data are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">DATA PROCESSORS (OR SERVICE PROVIDERS) means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">DATA SUBJECT is any living individual who is the subject of Personal Data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">THE USER is the individual using our Service. The User corresponds to the Data Subject, who is the subject of Personal Data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">3. Information Collection and Use</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We collect several different types of information for various purposes to provide and improve our Service to you.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">4. Types of Data Collected</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Personal Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”). Personally identifiable information may include, but is not limited to:</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.1. Email address</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.2. First name and last name</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3. Phone number</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.4. Address, State, Province, ZIP/Postal code, City</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.5. Cookies and Usage Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Usage Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may also collect information that your browser sends whenever you visit our Service or when you access Service by or through a mobile device (“Usage Data”).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">This Usage Data may include information such as your computer\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">When you access Service with a mobile device, this Usage Data may include information such as the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Location Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use and store information about your location if you give us permission to do so (“Location Data”). We use this data to provide features of our Service, to improve and customize our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">You can enable or disable location services when you use our Service at any time by way of your device settings.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Location Data - ZEE HUZUR</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">To participate as a ZEE HUZUR driver, you must permit the ZEE HUZUR Services to access location services through the permission system used by your mobile operating system (“Platform”) or browser. We may collect the precise location of your device when the ZEE HUZUR app is running in the foreground or background of your device. We may also derive your approximate location from your IP address. We use your location information to verify that you are present in your preferred region or city when you begin or engage in a delivery through the BAZIMAT DRINKS PVT.LTD. (a “Delivery”), connect you with delivery opportunities in your zone, and track the progress and completion of your Deliveries. You can enable the location tracking feature through the settings on your device or Platform or when prompted by the ZEE HUZUR mobile app. If you choose to disable the location feature through the settings on your device or Platform, BAZIMAT DRINKS PVT.LTD. will not receive precise location information from your device, which will prevent you from being able to Trip and receiving delivery opportunities in your area.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Tracking Cookies Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Examples of Cookies we use:</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">4.1. Session Cookies: We use Session Cookies to operate our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">4.2. Preference Cookies: We use Preference Cookies to remember your preferences and various settings.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">4.3. Security Cookies: We use Security Cookies for security purposes.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">4.4. Advertising Cookies: Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Other Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">While using our Service, we may also collect the following information: sex, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and actual address, telephone number (work, mobile), details of documents on education, qualification, professional training, employment agreements, non-disclosure agreements, information on bonuses and compensation, information on marital status, family members, social security (or other taxpayer identification) number, office location and other data.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">5. Use of Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">BAZIMAT DRINKS PVT.LTD. uses the collected data for various purposes:</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.1. to provide and maintain our Service;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.2. to notify you about changes to our Service;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3. to allow you to participate in interactive features of our Service when you choose to do so;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.4. to provide customer support;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.5. to gather analysis or valuable information so that we can improve our Service;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.6. to monitor the usage of our Service;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.7. to detect, prevent and address technical issues;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.8. to fulfill any other purpose for which you provide it;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.9. to carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.10. to provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.12. in any other way we may describe when you provide the information;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.13. for any other purpose with your consent.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">6. Retention of Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">7. Transfer of Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Your information, including Personal Data, may be transferred to – and maintained on – computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">If you are located outside United States, Puerto Rico and choose to provide information to us, please note that we transfer the data, including Personal Data, to United States, Puerto Rico and process it there.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">BAZIMAT DRINKS PVT.LTD. will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">8. Disclosure of Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may disclose personal information that we collect, or you provide:</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.1. Disclosure for Law Enforcement.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Under certain circumstances, we may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.2. Business Transaction.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">If we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3. Other cases. We may disclose your information also:</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.1. to our subsidiaries and affiliates;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.2. to contractors, service providers, and other third parties we use to support our business;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.3. to fulfill the purpose for which you provide it;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.4. for the purpose of including your company’s logo on our website;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.5. for any other purpose disclosed by us when you provide the information;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.6. with your consent in any other cases;</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">0.3.7. if we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">9. Security of Data</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">10. Service Providers</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may employ third-party companies and individuals to facilitate our Service (“Service Providers”), provide Service on our behalf, perform Service-related services or assist us in analyzing how our Service is used.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">11. Analytics</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use third-party Service Providers to monitor and analyze the use of our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">12. CI/CD tools</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use third-party Service Providers to automate the development process of our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">13. Advertising</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use third-party Service Providers to show advertisements to you to help support and maintain our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">14. Behavioral Remarketing</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">15. Payments</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may provide paid products and/or services within Service. In that case, we use third-party services for payment processing (e.g. payment processors).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">16. Links to Other Sites</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Our Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">For example, the outlined Privacy Policy has been created using PolicyMaker.io, a free web application for generating high-quality legal documents. PolicyMaker\'s online privacy policy generator is an easy-to-use free tool for creating an excellent privacy policy template for a website, blog, online store or app.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">17. Children\'s Privacy</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">Our Services are not intended for use by children under the age of 18 (“Child” or “Children”).</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">18. Changes to This Privacy Policy</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update “effective date” at the top of this Privacy Policy.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\">&nbsp;</p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">19. Contact Us</span></span></span></p>\r\n\r\n            <p style=\"margin:0cm 0cm 8pt\"><span style=\"font-size:11pt\"><span style=\"line-height:107%\"><span style=\"font-family:Calibri,sans-serif\">If you have any questions about this Privacy Policy, please contact us by email: support@bazimat.in</span></span></span></p>', NULL, '2022-01-07 22:59:57'),
(26, 'about_us', '<p><strong>Bazimat,</strong>&nbsp;a brand owned by <strong>Bazimat Drinks Private Limited</strong>,&nbsp;is Kolkata&#39;s&rsquo;s leading online alcohol market place and is the best place to shop for beer, wine and spirits. Trusted by our customers, we are there when it matters - committed to life&#39;s moments and the people who create them. Our motto is to&nbsp;ensure seamless buying experience for the customers when shopping for liquor &amp; food online. We have a huge &amp; exquisite collection of liquor&nbsp;and delivery charges are amongst the most competetative.</p>\r\n\r\n<p><strong>Who we are?</strong></p>\r\n\r\n<p>Bazimat is a brand under &ldquo;<strong>Bazimat Drinks Private Limited, 23/1A Ganesh Ghosh Lane, Kolkata - 700039</strong>&rdquo;. We specialise in online delivery of beer, wines&nbsp;and other spirits.&nbsp;To ensure a better consumer experience, Bazimat has launched a liquor delivery&nbsp;<strong>website</strong>&nbsp;&amp;&nbsp;<strong>mobile</strong>&nbsp;<strong>application&nbsp;</strong>by providing fast delivery within 60 minutes, hus ensuring an awesome experience for the consumers. Bazimat has also empanelled with a well known group of retail chain and have professional in house logistic support to provide the best ever experience for the consumers. We also look forward to expand our operation throughout West Bengal by 2022. We aspire to compete or grow bigger and better and to be #1 in the business and provide more services than any other e-commerce platform delivering food &amp; liquor.</p>\r\n\r\n<p><strong>What we do</strong>?</p>\r\n\r\n<p>Bazimat &nbsp;utilised a technology platform that allows customers to order liquor from nearby Off Shops including restaurants and get it delivered to their doorstep within a span of just 60 minutes.&nbsp;Bazimat is &nbsp;here to create a Wow! Factor for the consumers by providing safe and fast delivery at their desired time line as we understand the mindset of our consumer and know the importance of delivering on time.We also have a very nominal delivery fee and often provide special discount on delivery to our regular consumers.</p>', NULL, '2022-02-09 00:28:12'),
(27, 'minimum_shipping_charge', '100', NULL, NULL),
(28, 'per_km_shipping_charge', '10', NULL, NULL),
(29, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 08:52:20', '2021-09-09 22:28:30'),
(30, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 08:53:04', '2021-09-09 22:28:25'),
(31, 'digital_payment', '{\"status\":\"1\"}', '2021-07-04 08:53:10', '2021-10-16 03:11:55'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 08:53:18', '2021-09-09 22:28:36'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 09:14:07', '2021-10-16 03:12:17'),
(34, 'senang_pay', '{\"status\":null,\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 09:14:13', '2021-09-09 22:28:04'),
(35, 'order_handover_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":0,\"message\":null}', NULL, NULL),
(37, 'timezone', 'Asia/Calcutta', NULL, NULL),
(38, 'order_delivery_verification', '1', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '0', NULL, NULL),
(44, 'country', 'IN', NULL, NULL),
(45, 'app_url', 'up_comming', NULL, NULL),
(46, 'default_location', '{\"lat\":\"22.591388531766466\",\"lng\":\"88.42527730055\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:30', '2021-10-16 03:10:30'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:22', '2021-10-16 03:10:22'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":\"Your otp is #OTP#.\"}', '2021-10-16 03:10:36', '2021-10-16 03:10:36'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2021-10-16 03:09:59', '2021-10-16 03:09:59'),
(51, 'admin_order_notification', '1', NULL, NULL),
(52, 'free_delivery_over', '500', NULL, NULL),
(53, 'maintenance_mode', '0', '2021-09-09 21:33:55', '2021-09-09 21:33:58'),
(54, 'app_minimum_version_android', NULL, NULL, NULL),
(55, 'app_minimum_version_ios', NULL, NULL, NULL),
(56, 'app_url_android', NULL, NULL, NULL),
(57, 'app_url_ios', NULL, NULL, NULL),
(58, 'dm_maximum_orders', '5', NULL, NULL),
(59, 'flutterwave', '{\"status\":\"1\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', '2021-09-23 06:51:28', '2021-10-16 03:12:01'),
(60, 'order_confirmation_model', 'deliveryman', NULL, NULL),
(61, 'mercadopago', '{\"status\":null,\"public_key\":null,\"access_token\":null}', NULL, '2021-10-16 03:12:09'),
(62, 'popular_food', '1', NULL, NULL),
(63, 'popular_restaurant', '1', NULL, NULL),
(64, 'new_restaurant', '1', NULL, NULL),
(65, 'map_api_key_server', 'AIzaSyBLJD32GhI_5Ttca-wvGEIcD9NFuzeBxCA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `image`, `description`, `status`, `admin_id`, `created_at`, `updated_at`, `start_date`, `end_date`, `start_time`, `end_time`) VALUES
(1, 'woo woo', '2021-12-27-61c98ed7d828e.png', 'sdfdsf', 1, NULL, '2021-12-27 19:35:39', '2021-12-27 20:30:55', '2021-12-25', '2022-01-08', '08:35:00', '23:49:00'),
(2, 'New Year', '2021-12-27-61c98f3f10d6a.png', 'New Year', 1, NULL, '2021-12-27 19:55:39', '2021-12-27 20:32:39', '2021-12-27', '2022-01-31', '08:54:00', '23:59:00'),
(3, 'christmas offers', '2021-12-27-61c98f9ee4c89.png', NULL, 1, NULL, '2021-12-27 20:34:14', '2021-12-27 20:34:14', '2021-12-27', '2022-04-28', '15:33:00', '23:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_restaurant`
--

CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_restaurant`
--

INSERT INTO `campaign_restaurant` (`campaign_id`, `restaurant_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(55) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `restaurant_id` int(11) NOT NULL DEFAULT '0',
  `food_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `food_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `order_id` varchar(255) DEFAULT NULL,
  `is_odered` int(11) NOT NULL DEFAULT '0',
  `added_dtime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `restaurant_id`, `food_id`, `quantity`, `tax`, `food_amount`, `order_id`, `is_odered`, `added_dtime`, `status`) VALUES
(1, 29, 7, 193, 1, 0.00, 700.00, '100001', 1, '2022-02-14 12:06:05', 1),
(2, 29, 7, 192, 1, 0.00, 525.00, '100009', 1, '2022-02-14 12:29:33', 1),
(3, 29, 7, 191, 1, 0.00, 525.00, '100009', 1, '2022-02-14 12:29:37', 1),
(4, 29, 7, 189, 1, 0.00, 550.00, '100003', 1, '2022-02-14 14:12:56', 1),
(5, 29, 7, 188, 1, 0.00, 700.00, '100003', 1, '2022-02-14 14:12:58', 1),
(6, 29, 7, 190, 1, 0.00, 550.00, '100003', 1, '2022-02-14 14:13:01', 1),
(7, 29, 7, 186, 1, 0.00, 600.00, '100003', 1, '2022-02-14 14:13:03', 1),
(8, 29, 6, 197, 1, 0.00, 945.00, '100013', 1, '2022-02-14 14:20:09', 1),
(10, 29, 6, 204, 1, 0.00, 495.00, '100014', 1, '2022-02-14 15:09:39', 1),
(40, 57, 15, 215, 1, 0.00, 220.00, NULL, 0, '2022-02-15 19:59:17', 1),
(25, 29, 7, 188, 4, 0.00, 700.00, NULL, 0, '2022-02-15 17:08:59', 1),
(38, 29, 7, 187, 1, 0.00, 650.00, NULL, 0, '2022-02-15 19:02:13', 1),
(41, 57, 15, 214, 1, 0.00, 190.00, NULL, 0, '2022-02-15 20:01:36', 1),
(42, 57, 15, 213, 1, 0.00, 130.00, NULL, 0, '2022-02-15 20:01:41', 1),
(43, 57, 12, 132, 1, 0.00, 185.00, NULL, 0, '2022-02-15 20:11:56', 1),
(45, 29, 6, 204, 1, 0.00, 495.00, '100015', 1, '2022-02-18 11:59:56', 1),
(46, 29, 7, 186, 1, 0.00, 600.00, NULL, 0, '2022-02-18 14:33:04', 1),
(47, 29, 7, 188, 1, 0.00, 700.00, NULL, 0, '2022-02-18 14:33:04', 1),
(48, 29, 7, 189, 1, 0.00, 550.00, NULL, 0, '2022-02-18 14:33:04', 1),
(49, 29, 7, 190, 1, 0.00, 550.00, NULL, 0, '2022-02-18 14:33:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`) VALUES
(1, 'Break Fast', '2021-11-13-618f924253ebd.png', 0, 0, 1, '2021-11-13 07:24:02', '2021-11-13 07:24:02', 0),
(2, 'Toast', 'def.png', 1, 1, 1, '2021-11-13 08:01:08', '2021-11-22 22:31:34', 2),
(3, 'lunch', '2021-11-18-6195d45275255.png', 0, 0, 1, '2021-11-18 14:49:30', '2021-11-18 22:48:32', 1),
(4, 'liquor', '2021-12-17-61bc33bd049c2.png', 0, 0, 1, '2021-11-26 18:03:55', '2021-12-17 17:22:45', 0),
(5, 'RUM', 'def.png', 4, 1, 1, '2021-11-26 18:05:08', '2021-12-30 21:57:06', 0),
(6, 'Wine', 'def.png', 4, 1, 1, '2021-11-26 18:05:24', '2021-11-26 18:05:24', 0),
(7, 'vodka', 'def.png', 4, 1, 1, '2021-11-26 18:05:48', '2021-11-26 18:05:48', 0),
(8, 'Burger', '2021-12-11-61b4448b73d9e.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-11 16:56:19', 0),
(9, 'Biriyani', '2021-12-17-61bc30899c82b.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:09:05', 0),
(10, 'Asian', '2021-12-17-61bc30c52ac87.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:10:05', 0),
(11, 'Cake', '2021-12-17-61bc313f374c0.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:12:07', 0),
(12, 'Coffee & Drinks', '2021-12-17-61bc31e61f708.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:14:54', 0),
(13, 'Chinese', '2021-12-17-61bc324d11035.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:16:37', 0),
(14, 'Fast Food', '2021-12-17-61bc32bd6457c.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:18:29', 0),
(15, 'Kabab & More', '2021-12-17-61bc330d361ae.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:19:49', 0),
(16, 'Indian', '2021-12-17-61bc34caea8cb.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:27:14', 0),
(17, 'Noodles', '2021-12-17-61bc3509a5e35.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:28:17', 0),
(18, 'Mexican Food', '2021-12-17-61bc35d5d74ef.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:31:41', 0),
(19, 'Pasta', '2021-12-17-61bc345e8b243.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:25:26', 0),
(20, 'Pizza', '2021-12-17-61bc33e81fcf6.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:23:28', 0),
(21, 'Snacks', '2021-12-17-61bc35657184f.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:29:49', 0),
(22, 'Thai', '2021-12-17-61bc358ec9142.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-12-17 17:30:30', 0),
(23, 'Varieties', '2021-08-20-611fbfd13f7db.png', 0, 0, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(24, 'Kubie Burger', '2021-12-22-61c2e30e9f657.png', 5, 1, 1, '2021-11-27 14:36:50', '2021-12-22 19:04:22', 0),
(25, 'Steamed Cheese', 'def.png', 5, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(26, 'Theta Burger', 'def.png', 5, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(27, 'Nutburger', 'def.png', 5, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(28, 'Pimento Cheese', 'def.png', 5, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(29, 'Pound Cake', 'def.png', 8, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(30, 'Yellow Butter', 'def.png', 8, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(31, 'Red Velvet', 'def.png', 8, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(32, 'Black Coffee', 'def.png', 9, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(33, 'Robusta', 'def.png', 9, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(34, 'Cappuccino', 'def.png', 9, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(35, 'Macchiato', 'def.png', 9, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0),
(36, 'Soft Drinks', 'def.png', 9, 1, 1, '2021-11-27 14:36:50', '2021-11-27 14:36:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `message`, `reply`, `checked`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'I wnat the order ASAP', 'Lorem ipsum dolor sit amet', 0, NULL, '2021-11-29 17:26:04', '2021-11-29 17:26:04'),
(2, 29, 'hgh', 'erat imperdiet. Massa ultricies mi quis hendrerit dolor magna eget est lorem', 0, NULL, '2022-01-07 22:39:16', '2022-01-07 22:39:16'),
(3, 29, 'hgh', 'tis urna cursus eget. Lorem donec massa sapien faucibus et molestie ac. Diam quis enim lobortis scelerisque fermentum dui faucibus. Gravida neque convallis a cras semper auctor neque vitae. S', 0, NULL, '2022-01-07 22:49:59', '2022-01-07 22:49:59'),
(4, 29, 'hgh', NULL, 0, NULL, '2022-01-07 23:01:26', '2022-01-07 23:01:26'),
(5, 29, 'good afternoon', NULL, 0, NULL, '2022-01-08 21:34:17', '2022-01-08 21:34:17'),
(6, 29, 'good afternoon', NULL, 0, NULL, '2022-01-08 21:36:12', '2022-01-08 21:36:12'),
(7, 29, 'good afternoon', NULL, 0, NULL, '2022-01-08 21:36:32', '2022-01-08 21:36:32'),
(8, 29, 'today is too cold', NULL, 0, NULL, '2022-01-08 21:37:32', '2022-01-08 21:37:32'),
(9, 29, 'good evening', NULL, 0, NULL, '2022-01-08 21:38:12', '2022-01-08 21:38:12'),
(10, 29, 'today is Saturday. the last day of this week. tomorrow is holiday', 'Netus et malesuada fames ac. Malesuada nunc vel risus commodo. Enim facilisis gravida neque convallis. Cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl. Diam in arcu cursus eu', 0, NULL, '2022-01-08 21:39:30', '2022-01-08 21:39:30'),
(11, 29, 'uuijhhb gyhhvcgh koplhgvb service hjknbbn lpohgbb jhv no hgfvbn jkknbb ffgbbn', ' diam vel quam elementum pulvinar. Quis viverra nibh cras pulvinar mattis. Morbi blandit cursus risus at ultrices mi tempus imperdiet. Sagittis eu volutpat odio facilisis mauris sit. Vestibul', 0, NULL, '2022-01-08 22:07:11', '2022-01-08 22:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `coupon_type`, `limit`, `status`, `created_at`, `updated_at`, `data`, `img`) VALUES
(1, 'First Order', 'FESTIVE100', '2021-12-21', '2022-01-08', 300.00, 0.00, 60.00, 'percent', 'restaurant_wise', 1, 1, '2021-12-21 16:39:41', '2021-12-21 16:52:55', '[\"1\"]', 'coupon.jpg'),
(3, 'New year', 'newyear', '2021-12-30', '2021-12-31', 200.00, 0.00, 10.00, 'amount', 'restaurant_wise', 20, 1, '2021-12-30 15:50:58', '2021-12-30 15:50:58', '[\"1\"]', 'coupon1.png'),
(7, 'test testst77 55', 'test123123', '2021-12-30', '2022-02-28', 200.00, 50.00, 10.00, 'percent', 'zone_wise', 50, 1, '2021-12-30 19:48:24', '2021-12-30 20:27:16', '[\"2\"]', '2021-12-30-61cd827c49ed3.png');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL),
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `address_type`, `contact_person_number`, `address`, `latitude`, `longitude`, `user_id`, `contact_person_name`, `created_at`, `updated_at`, `zone_id`) VALUES
(6, 'Delivery', '12345678901', 'Sectore 5 SDF Building', '22.589563248326545', '88.41085220007848', 4, 'ddddddddd', '2021-11-30 21:03:05', '2021-11-30 21:03:05', 2),
(7, 'home', '1212121212', 'jk jkjk jkj,hj', '22.584990444621944', '88.4202935801241', 8, 'aa', '2022-01-06 21:40:28', '2022-01-06 21:40:28', 2),
(8, 'home', '1212121212', 'jk jkjk jkj,hj', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-06 21:49:30', '2022-01-06 21:49:30', 2),
(9, 'home', '1212121212', 'kolkata, newtown', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-07 23:17:19', '2022-01-07 23:17:19', 2),
(10, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-07 23:17:34', '2022-01-07 23:17:34', 2),
(11, 'office', '9474029024', '87WG+97M, Sushmapally, Kharagpur, West Medinipur, 721301, West Bengal', '22.584990444621944', '88.4202935801241', 29, 'Rai Sen', '2022-01-11 19:30:29', '2022-01-11 19:30:29', 2),
(12, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-11 19:30:54', '2022-01-11 19:30:54', 2),
(13, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:10:05', '2022-01-13 16:10:05', 2),
(14, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:12:48', '2022-01-13 16:12:48', 2),
(15, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:14:46', '2022-01-13 16:14:46', 2),
(16, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:14:59', '2022-01-13 16:14:59', 2),
(17, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:15:14', '2022-01-13 16:15:14', 2),
(18, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:15:43', '2022-01-13 16:15:43', 2),
(19, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:16:07', '2022-01-13 16:16:07', 2),
(20, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:21:26', '2022-01-13 16:21:26', 2),
(21, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:21:29', '2022-01-13 16:21:29', 2),
(22, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:21:48', '2022-01-13 16:21:48', 2),
(23, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-13 16:21:48', '2022-01-13 16:21:48', 2),
(24, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-14 23:46:33', '2022-01-14 23:46:33', 2),
(25, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 29, 'aa', '2022-01-27 17:09:43', '2022-01-27 17:09:43', 2),
(26, 'office', '1212121212', 'kolkata, sdf', '22.584990444621944', '88.4202935801241', 74, 'aa', '2022-01-27 22:31:23', '2022-01-27 22:31:23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(8,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int(11) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `restaurant_id`) VALUES
(1, 'Joy', 'das', '919874892613', 'joy.das@gmail.com', 'DH-123456', 'driving_license', '[\"2021-11-29-61a45e339a367.png\"]', '2021-11-29-61a45e3396f9c.png', '$2y$10$2Tg33LBKOj6as429ZvA26uKdvhpFKQTY7aflNqcGI6yotXpkY9Oq6', NULL, NULL, 2, '2021-11-29 15:29:31', '2021-12-02 19:23:58', 1, 1, 1, 0, 'zone_wise', NULL),
(2, 'testDM', 'testDM', '+911712345678', 'testDM@gmail.com', 'DH-123456', 'driving_license', '[\"2021-11-30-61a5ee4b4d4d1.png\"]', '2021-11-30-61a5ee4b4a0f6.png', '$2y$10$7H8jyTGMOSKBqaG20kEYceFY3aO1R.dOyJ2F0unNKmIjfmg03uuW.', NULL, NULL, 2, '2021-11-30 19:56:35', '2021-12-01 20:22:26', 1, 0, 1, 0, 'zone_wise', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_verifications`
--

INSERT INTO `email_verifications` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'rai2@gmail.com', '7674', '2022-01-24 22:38:54', '2022-01-24 22:38:54'),
(2, 'rai2@gmail.com', '8389', '2022-01-24 22:39:13', '2022-01-24 22:39:13'),
(3, 'rai2@gmail.com', '2363', '2022-01-24 22:41:25', '2022-01-24 22:41:25'),
(4, 'rai2@gmail.com', '7545', '2022-01-24 22:41:41', '2022-01-24 22:41:41'),
(5, 'rai2@gmail.com', '4245', '2022-01-24 22:44:26', '2022-01-24 22:44:26'),
(6, 'null', '9773', '2022-01-24 22:45:07', '2022-01-24 22:45:07'),
(7, 'rai2@gmail.com', '2343', '2022-01-24 22:46:33', '2022-01-24 22:46:33'),
(8, 'null', '9752', '2022-01-24 22:46:42', '2022-01-24 22:46:42'),
(9, 'rai1@gmail.com', '5371', '2022-01-24 22:46:59', '2022-01-24 22:46:59'),
(10, 'rai2@gmail.com', '1808', '2022-01-24 22:46:59', '2022-01-24 22:46:59'),
(11, 'rai1@gmail.com', '3839', '2022-01-24 22:47:26', '2022-01-24 22:47:26'),
(12, 'rai1@gmail.com', '1180', '2022-01-24 22:50:28', '2022-01-24 22:50:28'),
(13, 'rai2@gmail.com', '4437', '2022-01-24 22:51:41', '2022-01-24 22:51:41'),
(14, 'rai1@gmail.com', '9134', '2022-01-24 22:51:52', '2022-01-24 22:51:52'),
(15, 'applnsel@gmail.com', '8970', '2022-01-24 22:52:49', '2022-01-24 22:52:49'),
(16, 'applnsel@gmail.com', '5305', '2022-01-24 22:57:18', '2022-01-24 22:57:18'),
(17, 'null', '2439', '2022-01-24 23:02:21', '2022-01-24 23:02:21'),
(18, 'null', '6815', '2022-01-24 23:03:15', '2022-01-24 23:03:15'),
(19, 'null', '3689', '2022-01-24 23:05:16', '2022-01-24 23:05:16'),
(20, 'null', '2157', '2022-01-24 23:12:11', '2022-01-24 23:12:11'),
(21, 'null', '5919', '2022-01-24 23:14:24', '2022-01-24 23:14:24'),
(22, 'null', '9199', '2022-01-24 23:14:28', '2022-01-24 23:14:28'),
(23, 'chandranighorai@gmail.com', '7521', '2022-01-24 23:14:51', '2022-01-24 23:14:51'),
(24, 'chandranighorai@gmail.com', '9609', '2022-01-24 23:14:54', '2022-01-24 23:14:54'),
(25, 'rai1@gmail.com', '8234', '2022-01-24 23:15:24', '2022-01-24 23:15:24'),
(26, 'null', '5395', '2022-01-24 23:15:35', '2022-01-24 23:15:35'),
(27, 'applnsel@gmail.com', '6158', '2022-01-24 23:22:11', '2022-01-24 23:22:11'),
(28, 'applnsel@gmail.com', '9512', '2022-01-24 23:36:15', '2022-01-24 23:36:15'),
(29, 'applnsel@gmail.com', '4586', '2022-01-24 23:41:56', '2022-01-24 23:41:56'),
(30, 'applnsel@gmail.com', '5127', '2022-01-25 00:25:32', '2022-01-25 00:25:32'),
(31, 'applnsel@gmail.com', '3202', '2022-01-25 00:30:27', '2022-01-25 00:30:27'),
(32, 'applnsel@gmail.com', '5582', '2022-01-25 00:35:51', '2022-01-25 00:35:51'),
(33, 'applnsel@gmail.com', '4887', '2022-01-25 00:49:45', '2022-01-25 00:49:45'),
(34, 'applnsel@gmail.com', '9758', '2022-01-25 01:17:07', '2022-01-25 01:17:07'),
(35, 'applnsel@gmail.com', '7999', '2022-01-25 01:44:22', '2022-01-25 01:44:22'),
(36, 'applnsel@gmail.com', '7488', '2022-01-25 02:03:19', '2022-01-25 02:03:19'),
(37, 'applnsel@gmail.com', '8727', '2022-01-25 13:11:51', '2022-01-25 13:11:51'),
(38, 'applnsel@gmail.com', '6140', '2022-01-25 13:13:04', '2022-01-25 13:13:04'),
(39, 'applnsel@gmail.com', '8038', '2022-01-25 13:28:20', '2022-01-25 13:28:20'),
(40, 'applnsel@gmail.com', '6290', '2022-01-25 13:30:21', '2022-01-25 13:30:21'),
(41, 'applnsel@gmail.com', '5420', '2022-01-25 13:30:48', '2022-01-25 13:30:48'),
(42, 'applnsel@gmail.com', '1240', '2022-01-25 13:32:20', '2022-01-25 13:32:20'),
(43, 'applnsel@gmail.com', '1668', '2022-01-25 13:34:31', '2022-01-25 13:34:31'),
(44, 'applnsel@gmail.com', '5949', '2022-01-25 13:39:33', '2022-01-25 13:39:33'),
(45, 'applnsel@gmail.com', '6159', '2022-01-27 15:49:18', '2022-01-27 15:49:18'),
(46, 'applnsel@gmail.com', '9521', '2022-01-27 17:43:54', '2022-01-27 17:43:54'),
(47, 'applnsel@gmail.com', '8439', '2022-01-27 20:00:07', '2022-01-27 20:00:07'),
(48, 'applnsel@gmail.com', '7030', '2022-01-27 20:14:33', '2022-01-27 20:14:33'),
(49, 'applnsel@gmail.com', '1821', '2022-01-27 20:31:14', '2022-01-27 20:31:14'),
(50, 'applnsel@gmail.com', '1007', '2022-01-27 21:03:42', '2022-01-27 21:03:42'),
(51, 'applnsel@gmail.com', '9730', '2022-01-27 22:04:38', '2022-01-27 22:04:38'),
(52, 'applnsel@gmail.com', '8056', '2022-01-27 22:19:18', '2022-01-27 22:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `set_menu` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `set_menu`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`) VALUES
(3, 'Butter  Toast', NULL, '2021-11-13-618f9b885fedd.png', 2, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', '[]', '[]', '[]', '[]', 5.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '23:00:00', 0, 1, 1, '2021-11-13 08:03:36', '2021-11-13 08:03:36', 0),
(4, 'RUM', '1 pack', '2021-11-26-61a09f52c85c6.png', 5, '[{\"id\":\"4\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[\"2\"]', '[]', '[]', 50.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '23:00:00', 0, 1, 1, '2021-11-26 19:18:18', '2021-12-23 23:18:59', 0),
(5, 'Mutton Biriyani', 'This mutton biryani recipe has layers of mutton and saffron-milk-infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon, cloves, jaiphal, and javitri along with chilies, rose water, kewda, and saffron cooked with succulent mutton pieces.', '2021-12-11-61b443c4c33a5.png', 2, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', '[{\"type\":\"250\",\"price\":250}]', '[\"35\",\"36\"]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"250\"]}]', 250.00, 0.00, 'percent', 10.00, 'percent', '00:03:00', '23:56:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-23 17:51:32', 0),
(6, 'Hyderabadi Mutton Biriyani', 'Hyderabadi Biryani is characteristically distinct. The aroma, taste, tender meat, the Zaffran, everything gives it a distinguished appearance. ... Yoghurt makes the meat tender, lemon tangy, fried onions add a crispy sweet taste, and Hyderabadi spices make it hot.', '2021-12-23-61c468dd157fa.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 20.00, 'amount', '00:01:00', '23:59:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:47:33', 0),
(7, 'Burger Combo', 'A combo Burger.', '2021-12-27-61c96c73647b6.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', 80.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:59:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-12-27 18:04:11', 0),
(8, 'Crispy Burger', 'A Crispy chicken burger with delicious cheese.', '2021-12-27-61c96ca1f160f.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', 180.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '23:59:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-12-27 18:04:57', 0),
(9, 'Toll House Meal', 'Made better with some cookie baking tips and tricks I’ve learned over the years! What does that mean, exactly? Sure, you can go ahead and make the original Toll House chocolate chip cookie recipe and make some *pretty good* cookies.', '2021-08-21-6120b1f136c8d.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 40.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:56:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(10, 'Chicago Pizza', 'Chicago pizza, also commonly referred to as deep-dish pizza, gets its name from the city it was invented in. During early 1900.', '2021-12-27-61c969ca69285.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 10.00, 'amount', '11:00:00', '20:15:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-12-27 17:52:50', 0),
(11, 'Baked Breaded Chicken', 'Baked Breaded Chicken is a mid-week dinner dream. Juicy, tender chicken, covered with a golden crunchy, delicious outer coating of bread crumbs.', '2021-08-21-6120c504a9cab.png', 18, '[{\"id\":\"18\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 10.00, 'percent', '11:17:00', '18:18:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(12, 'Chicken Tikka Masala', 'THIS FULL-FLAVORED DISH IS CREAMY AND SAVORY AT THE SAME TIME. THE RICHNESS OF THE CURRY PASTE IS BALANCED OUT PERFECTLY BY THE ZESTY GARLIC AND CREAMY YOGURT AND CREAM.', '2021-12-27-61c968b8a6fd8.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 7.00, 0.00, 'percent', 0.00, 'percent', '02:00:00', '12:20:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-12-27 17:48:16', 0),
(13, 'Lemon Pastry', 'The pastry is a dough of flour, water, and shortening (solid fats, including butter or lard) that may be savory.', '2021-12-24-61c5a2176c1db.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 110.00, 0.00, 'percent', 0.00, 'percent', '02:37:00', '18:37:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-24 21:03:59', 0),
(14, 'Log Ice Cream', 'This ice cream Yule log recipe is a must for simple and tasty Christmas celebrations!', '2021-12-24-61c5a1e272240.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 275.00, 0.00, 'percent', 5.00, 'percent', '05:42:00', '19:42:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-24 21:03:06', 0),
(15, 'Masala poori', 'GARLIC CHICKEN TIKKA PURI Chicken tikka and garlic mixed in a special paste with a puri.', '2021-12-24-61c5a2ad25559.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', 2.00, 0.00, 'percent', 5.00, 'percent', '00:10:00', '23:30:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:06:29', 0),
(16, 'Sliced Bread', 'Sliced bread is a loaf of bread that has been pre-sliced with a machine and packaged for convenience, as opposed to the consumer cutting it', '2021-12-23-61c46b54503f1.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '03:49:00', '16:49:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:58:04', 0),
(17, 'CROISSANTS', 'Croissants are perfect just as they are, but if you’d like to dress them up a little bit, they can be spread with all sorts of yummy toppings.', '2021-12-23-61c46b87e77d8.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 50.00, 0.00, 'percent', 5.00, 'percent', '00:02:00', '23:57:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:58:55', 0),
(18, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-12-27-61c9699648118.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[]', '[]', '[]', '[]', 399.00, 0.00, 'percent', 49.00, 'amount', '01:30:00', '09:30:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-12-27 17:51:58', 0),
(19, 'Doughnut', 'A doughnut or donut is a type of leavened fried dough.It is popular in many countries and is prepared in various forms.', '2021-12-23-61c46bd74996c.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, 'percent', '00:02:00', '23:57:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:00:15', 0),
(20, 'Chocolate Sprinkle Donuts', 'Chocolate sprinkle donuts make the most fun breakfast treat and they’re easy to whip up since they’re baked instead of fried!', '2021-12-24-61c5a246f1042.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 0.00, 'percent', '02:58:00', '14:58:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-24 21:04:46', 0),
(21, 'Chicken Coconut Soup', 'Known as Tom Kha Ghai, this coconut soup is one we are always craving. The creamy coconut paired with ginger and lime gives this soup it\'s unique and delicious flavor.', '2021-12-23-61c46c08b40be.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:57:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:01:04', 0),
(22, 'Samosa', 'Fried or baked pastry with a savory filling like spiced potatoes, onions, peas, chicken and other meats, or lentils.', '2021-12-23-61c46a3523c13.png', 18, '[{\"id\":\"18\",\"position\":1}]', '[]', '[]', '[]', '[]', 2.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '20:30:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:53:17', 0),
(23, 'COCONUT CURRY NOODLE SOUP', 'This Thai inspired Coconut Curry Noodle Soup is loaded with vegetables and made with a creamy coconut red curry broth and pad Thai rice noodles', '2021-12-23-61c46d24e0041.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 170.00, 0.00, 'percent', 0.00, 'percent', '06:04:00', '18:04:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:05:48', 0),
(24, 'Cheese Pizza', 'It should be no shocker that a classic is the statistical favorite. Cheese pizza is one of the most popular choices', '2021-12-27-61c9696559f47.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[]', '[]', '[]', '[]', 299.00, 0.00, 'percent', 0.00, 'percent', '02:00:00', '08:00:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-12-27 17:51:09', 0),
(25, 'Spicy Thai Basil Chicken', 'The sauce actually acts as a glaze as the chicken mixture cooks over high heat. The recipe works best if you chop or grind your own chicken and have all ingredients prepped before you start cooking.', '2021-12-23-61c46cee17539.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 5.00, 'percent', '01:09:00', '19:09:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:04:54', 0),
(26, 'Meat Pizza', 'If you’re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.', '2021-08-21-6120d1396d3d8.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 310.00, 0.00, 'percent', 11.00, 'percent', '03:30:00', '08:30:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(28, 'BBQ Chicken Pizza', 'If you love BBQ chicken and you love pizza, why not put them together? This has long been a cult favorite of sports fans and college kids', '2021-08-21-6120d1f57eb77.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 210.00, 0.00, 'percent', 39.00, 'amount', '02:15:00', '07:15:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(30, 'FRIED RICE', 'This Chinese-inspired fried rice recipe is my absolute fave. It’s quick and easy to make, customizable with any of your favorite mix-ins, and so irresistibly delicious.', '2021-08-21-6120d2bbcd93d.png', 19, '[{\"id\":\"19\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 240.00, 0.00, 'percent', 10.00, 'percent', '11:20:00', '20:16:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(31, 'THAI RED CURRY NOODLE SOUP', 'It’s so cozy, it’s so comforting, and it’s so fragrant with all the cilantro, basil and lime juice. Although I always add a little bit of extra lime juice to my bowl for that extra zesty kick!', '2021-08-21-6120d38c83375.png', 19, '[{\"id\":\"19\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 90.00, 0.00, 'percent', 0.00, 'percent', '11:40:00', '21:20:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(32, 'BBQ Chicken Pizza', 'If you love BBQ chicken and you love pizza, why not put them together? This has long been a cult favorite of sports fans and college kids.', '2021-08-21-6120d392925d3.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 230.00, 0.00, 'percent', 0.00, 'percent', '10:30:00', '22:30:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(33, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-08-21-6120d43bcc2ad.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 360.00, 0.00, 'percent', 15.00, 'percent', '11:00:00', '19:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(34, 'Spicy Thai Green Papaya Salad', 'n a medium non-reactive mixing or salad bowl, combine the papayas, carrots, mint leaves and chopped cilantro.', '2021-08-21-6120d502c3fda.png', 19, '[{\"id\":\"19\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 10.00, 'percent', '12:26:00', '21:26:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(35, 'Margherita Pizza', 'Deceptively simple, the Margherita pizza is made with basil, fresh mozzarella, and tomatoes.', '2021-08-21-6120d55a3fc61.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 199.00, 0.00, 'percent', 0.00, 'percent', '12:00:00', '22:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(36, 'Spicy Shrimp Soup1', 'Spicy Shrimp Soup is a copycat recipe from our favorite Ecuadorian restaurant. Spicy, garlicky, and comforting, you will eat bowl after bowl of this easy soup recipe!', '2021-12-27-61c9690e64b77.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 10.00, 'percent', '17:05:00', '23:00:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 17:49:42', 0),
(37, 'Thai Stir Fried Noodles', 'The popular Thai stir-fried noodles are straight from the streets of Thailand are made at home! While Pad Thai is sweeter and nuttier, balanced with a touch of sour and a wonderful chargrilled flavor which you can create at home!', '2021-12-27-61c96939ac33e.png', 19, '[{\"id\":\"19\",\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 0.00, 'percent', '06:32:00', '20:32:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 17:50:25', 0),
(39, 'Buffalo Pizza', 'This Buffalo chicken pizza recipe is A MUST for all Buffalo lovers', '2021-08-21-6120d6c510166.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 280.00, 0.00, 'percent', 45.00, 'amount', '10:00:00', '18:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(40, 'Linguine Pasta', 'Long, thin, flat linguine noodles fall somewhere between the thickness of fettuccine and spaghetti', '2021-08-21-6120d74188e55.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 195.00, 0.00, 'percent', 0.00, 'percent', '15:00:00', '23:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(41, 'Cheese Pizza', 'Yearning for a cheesy delight? Then we have an easy cheese pizza recipe to add soul to your weekend binging!', '2021-08-21-6120d7be4e72b.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 10.00, 'percent', '18:36:00', '21:36:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(42, 'Chole Kulche', 'One of the best Indian snacks cum breakfast options out there is Chole kulche! Originated from the Punjab region, this dish is loved all over the country and is now making its way in the west too.', '2021-08-21-6120d821bbef1.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 130.00, 0.00, 'percent', 0.00, 'percent', '18:40:00', '21:40:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(43, 'Fusilli Pasta', 'Fusilli gives any dish an unexpected twist with its spiral shape', '2021-08-21-6120d82e9a806.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 20.00, 'percent', '10:00:00', '18:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(44, 'MASALA FISH FRY IN OIL', 'This Masala fish fry is made with an oil marinade. The masalas are mixed in oil and that I think is a game changer. The fish gets seasoned well and turns out super flavorful.', '2021-08-21-6120d8a6eed20.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, 'percent', '18:42:00', '21:42:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(46, 'Penne Pasta', 'Penne is a classic pasta type and pantry staple.', '2021-08-21-6120d8f31563b.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '19:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(47, 'Fettuccine Pasta', 'Flat, ribbon-like shape of fettuccine makes it a sturdy pasta that can hold up to a variety of sauces', '2021-08-21-6120d9be15172.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 230.00, 0.00, 'percent', 30.00, 'amount', '10:00:00', '16:00:00', 0, 1, 14, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(48, 'Supreme Pizza', 'When you can’t decide which toppings to get, it’s time for the supreme pizza.', '2021-08-21-6120db00b7352.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 300.00, 0.00, 'percent', 33.00, 'amount', '03:00:00', '09:00:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(49, 'Hawaiian Pizza', 'Pineapple might not be the first thing that comes to mind when you think pizza.', '2021-08-21-6120dc06c58cc.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 229.00, 0.00, 'percent', 9.00, 'percent', '01:00:00', '10:00:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(50, 'Paneer Tikka Masala', 'Paneer tikka masala is an Indian dish of marinated paneer cheese served in a spiced gravy. It is a vegetarian alternative to chicken tikka masala.', '2021-12-23-61c46c8d4a421.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[]', '[]', '[]', '[]', 35.00, 0.00, 'percent', 5.00, 'percent', '00:15:00', '20:15:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:03:17', 0),
(51, 'Fish Fry', 'we have shallow fried the fish slices to make it healthy and flavored it with tomato ketchup for an extra taste. You can make this as a side dish with your everyday meals.', '2021-08-21-6120de88ecdf4.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 60.00, 0.00, 'percent', 0.00, 'percent', '18:07:00', '21:07:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(52, 'BBQ chicken Noodles', 'BBQ chicken noodles is one of the most favorite noddles.', '2021-08-21-6120df191fc99.png', 14, '[{\"id\":\"14\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 210.00, 0.00, 'percent', 0.00, 'percent', '17:00:00', '23:00:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(53, 'Chicken and Mushroom Noodles', 'Chicken and garlicky mushrooms pair perfectly and it\'s so yummy.', '2021-08-21-6120e08d98c2a.png', 14, '[{\"id\":\"14\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 19.00, 'percent', '18:00:00', '22:15:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(54, 'French Fries', 'French fries, chips, finger chips, or French-fried potatoes are batonnet or allumette-cut deep-fried potatoes, originating from either Belgium or France.', '2021-12-27-61c96d63c8e2e.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 50.00, 0.00, 'percent', 0.00, 'percent', '18:15:00', '21:15:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 18:08:11', 0),
(55, 'Grilled BBQ Steak', 'Try our Grilled BBQ Steak for a sweet and spicy dish. Combine tangy BBQ sauce, orange marmalade and cinnamon to give our Grilled BBQ Steak some kick.', '2021-12-27-61c979ccb8d09.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 180.00, 0.00, 'percent', 0.00, 'percent', '18:18:00', '21:18:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:01:08', 0),
(56, 'Fry Noodles', 'Fried noodles are common throughout East Asia, Southeast Asia and South Asia.', '2021-08-21-6120e1a9b4dc6.png', 14, '[{\"id\":\"14\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 225.00, 0.00, 'percent', 25.00, 'amount', '19:00:00', '22:00:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(57, 'Mushroom noodles', 'Mushroom Noodles recipe is made with the goodness of sliced mushrooms and fresh noodles which can be relished by many. It tastes best when had with tomato sauce or any other sauce.', '2021-08-21-6120e2b1507bb.png', 14, '[{\"id\":\"14\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 270.00, 0.00, 'percent', 20.00, 'amount', '17:30:00', '22:30:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(58, 'Idli', 'Idli or idly are a type of savoury rice cake, originating from the Indian subcontinent, popular as breakfast foods in Southern India and in Sri Lanka.', '2021-12-24-61c5a2e361d22.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:18:00', '23:56:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:07:23', 0),
(59, 'Steak Kebabs', 'Steak Kebabs are the one of the tastiest summertime dinners! These are layered with juicy tender pieces of flavorful, marinated beef and colorful quartet of tender veggies. An exciting recipe the whole family can agree on!', '2021-08-21-6120e44ea58c5.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '06:31:00', '17:31:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(60, 'Steak Kebabs', 'Steak Kebabs are the one of the tastiest summertime dinners! These are layered with juicy tender pieces of flavorful, marinated beef and colorful quartet of tender veggies. An exciting recipe the whole family can agree on!', '2021-12-24-61c5a38881d65.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '00:31:00', '23:35:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:10:08', 0),
(61, 'FRIED RICE', 'This Chinese-inspired fried rice recipe is my absolute fave. It’s quick and easy to make, customizable with any of your favorite mix-ins, and so irresistibly delicious.', '2021-12-24-61c5a334d9bd1.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 0.00, 'percent', '05:33:00', '18:33:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:08:44', 0),
(62, 'Bihari kabab', 'A Pakistani BBQ delicacy, Bihari Kabab are thin strips of beef marinated in a spicy homemade masala and finished off with coal smoke.', '2021-08-21-6120e529c9361.png', 12, '[{\"id\":\"12\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 5.00, 'percent', '10:10:00', '22:30:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(63, 'Pepperoni Pizza', 'Pepperoni is an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper', '2021-08-21-6120eb4af0745.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 310.00, 0.00, 'percent', 10.00, 'amount', '00:15:00', '23:45:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(64, 'Thai Fried Rice', 'An authentic recipe for Thai fried rice – just like you get in Thailand and at Thai restaurants! Make this with shrimp/prawns, chicken or any protein you wish.', '2021-12-24-61c5a41cd8238.png', 20, '[{\"id\":\"20\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 0.00, 'percent', '05:37:00', '21:37:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:12:36', 0),
(65, 'Grill Kebab', 'The kebab is made of finely ground mince goat meat with spices and then charcoal grilled on a skewer.', '2021-08-21-6120e5c5e5437.png', 12, '[{\"id\":\"12\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 35.00, 0.00, 'percent', 0.00, 'percent', '10:10:00', '22:25:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(66, 'Cheese Pizza', 'It should be no shocker that a classic is the statistical favorite. Cheese pizza is one of the most popular choices', '2021-12-24-61c5a489b1478.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 7.00, 'percent', '00:01:00', '23:57:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:14:25', 0),
(67, 'Boti Kebab', 'Boti kebab is a variety of Indian kebab consisting of chunks of meat (lamb, mutton, chicken, or beef) that are soaked in a mixture of yogurt, garlic, ginger, chilis, papaya, and spices such as garam masala, chili powder, and cumin.', '2021-08-21-6120e65da6c63.png', 12, '[{\"id\":\"12\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 15.00, 0.00, 'percent', 5.00, 'percent', '10:15:00', '22:30:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(68, 'Chicken Shawarma', 'Robust and flavorful easy Chicken Shawarma at home! Beats takeout any day of the week, and is perfect for work or school lunch. Plus, my creamy white garlic sauce for Chicken Shawarma adds a bright creamy tang.', '2021-08-21-6120e6767300f.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 210.00, 0.00, 'percent', 12.00, 'percent', '05:40:00', '20:40:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(69, 'Meat Pizza', 'If you’re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice.', '2021-12-24-61c5a459b7aca.png', 17, '[{\"id\":\"17\",\"position\":1}]', '[]', '[]', '[]', '[]', 400.00, 0.00, 'percent', 30.00, 'amount', '02:00:00', '22:00:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-12-24 21:13:37', 0),
(70, 'grilled lemon herb mediterranean chicken salad', 'This Grilled Lemon Herb Mediterranean Chicken Salad recipe is as close to perfect as you can get! Full of Mediterranean flavours: olives, tomatoes, cucumber, avocados, and chicken for a complete meal in a salad bowl!', '2021-08-21-6120e72547646.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 320.00, 0.00, 'percent', 0.00, 'percent', '00:02:00', '23:46:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(71, 'Medu Vada', 'Menu Vada is crispy, fluffy, soft, and delicious lentil fritters from South Indian cuisine.', '2021-08-21-6120e7a4b7b2a.png', 20, '[{\"id\":\"20\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 95.00, 0.00, 'percent', 0.00, 'percent', '00:01:00', '23:57:00', 0, 1, 2, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(76, 'Grilled Eggplant kebab', 'Eggplant kebabs are marinated and grilled, tucked into a pita, and smothered with a tangy garlic sauce and assorted veggies.', '2021-08-21-6120ec75be180.png', 12, '[{\"id\":\"12\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 46.00, 0.00, 'percent', 7.00, 'percent', '10:10:00', '22:15:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(78, 'Garlic Noodles', 'Garlic noodles are an irresistible combination of garlic and carbs', '2021-12-23-61c46c59d11fa.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 20.00, 'amount', '00:10:00', '18:10:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 23:02:25', 0),
(79, 'Veggie noodles', 'Healthy and tasty', '2021-12-23-61c46b08f020c.png', 14, '[{\"id\":\"14\",\"position\":1}]', '[]', '[]', '[]', '[]', 170.00, 0.00, 'percent', 0.00, 'percent', '02:45:00', '20:59:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:56:48', 0),
(83, 'Fettuccine Pasta', 'Flat, ribbon-like shape of fettuccine makes it a sturdy pasta that can hold up to a variety of sauces', '2021-08-21-6120f010b0f31.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 0.00, 'percent', '11:11:00', '19:45:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(84, 'Penne Pasta', 'Penne is a classic pasta type and pantry staple.', '2021-08-21-6120f09f6ba50.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 165.00, 0.00, 'percent', 14.00, 'percent', '13:30:00', '22:30:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(85, 'Fusilli Pasta', 'Fusilli gives any dish an unexpected twist with its spiral shape', '2021-08-21-6120f11b44d1f.png', 16, '[{\"id\":\"16\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 179.00, 0.00, 'percent', 29.00, 'amount', '15:00:00', '23:00:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(86, 'Elote', 'Elote is made with corn on the cob, slathered with mayonnaise, seasoned with chili powder and fresh lime juice, sprinkled all over with salty Cotija cheese and cilantro.', '2021-08-21-6120f917333f1.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 3.00, 'percent', '00:30:00', '23:35:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(87, 'Veggie Chili Tacos', 'Sweet potato, green beans, sour cream, eggplant, cannellini beans', '2021-08-21-6120f4251a2bf.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:15:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(88, 'Meat Chili Tacos', 'Kidney beans, ground beef, sour cream, taco seasoning, tomato', '2021-08-21-6120f407f01c2.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:15:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(89, 'BEEF Burger', 'The classic burger is an all-time BBQ favorite! This super-easy homemade beef burger recipe gives you delicious patties, packed with onions and herbs for extra flavor.', '2021-08-21-6120f3c043f10.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 10.00, 'percent', '00:14:00', '23:58:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(90, 'Chicken Cheese Blast Burger', 'Prepared with Double chicken patty with molten cheddar cheese inside, 2x sausage slices, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f45806f3d.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 10.00, 'percent', '11:40:00', '21:40:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(91, 'Chicken Cheese Burger', 'Prepared with 1x single chicken patty, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f4c2d5003.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 5.00, 'percent', '00:10:00', '23:57:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(92, 'Chicken & Bacon Bite Burger', 'Prepared with 1x single chicken patty, 2x beef bacon slice, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f5279c4a8.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 210.00, 0.00, 'percent', 5.00, 'percent', '11:43:00', '21:44:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(93, 'Mushroom Chicken Burger', 'Prepared with 1x single chicken patty, caramelized mushrooms, bbq sauce, 1x cheddar cheese slice, our secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f7addf1a5.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 10.00, 'percent', '00:07:00', '23:56:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(94, 'Smokey BBQ Chicken Burger', 'Prepared with 1x single chicken patty, bbq sauce, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120f976c7ee6.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 180.00, 0.00, 'percent', 0.00, 'percent', '11:02:00', '21:02:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(95, 'Chicken Sausage Delight Burger', 'Prepared with 1x single chicken patty, 2x sausage slices, bbq sauce, 1x cheddar cheese slice, house secret sauce, sliced onions, tomatoes & lettuce', '2021-08-21-6120fa10d06f2.png', 5, '[{\"id\":\"5\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 230.00, 0.00, 'percent', 10.00, 'percent', '00:04:00', '23:56:00', 0, 1, 4, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(96, 'Enchiladas', 'An enchilada is a corn tortilla rolled around a filling and covered with a savory sauce. Originally from Mexican cuisine, enchiladas can be filled with various ingredients, including meats, cheese, beans, potatoes, vegetables, or combinations.', '2021-08-21-6120fa76e8fbd.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 54.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(97, 'Enchiladas Rancheras', 'Enchiladas rancheras is a traditional Mexican dish where stove-top cooked enchiladas are drenched in ranchera sauce.', '2021-08-21-6120fb6a2b6fc.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 46.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(98, 'Enchiladas mineras', 'Enchiladas mineras are traditional Mexican enchiladas hailing from Guanajuato, a mining town where the women took this dish to their husbands at the end of their work hours. These enchiladas are traditionally filled with onions, cheese, and a stew-like combination of carrots and potatoes.', '2021-08-21-6120fbf4533db.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 37.00, 0.00, 'percent', 7.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(99, 'Entomatadas', 'Entomatada is a Mexican specialty dish made by drenching a filled, wrapped, and fried corn tortilla in tomato sauce. The sauce consists of tomatoes, onions, and seasonings such as salt, garlic, and oregano, while the tortillas are usually filled with shredded chicken, refried beans, cheese, or chunks of beef.', '2021-08-21-6120fc79e1009.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 32.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(100, 'Chicken Biryani', 'One of the most royal delicacies that you can enjoy on any occasion or festival, Chicken Biryani is the epitome of a one-pot meal. Well, no one can resist the sight of the aromatic and delicious Chicken Biryani.', '2021-08-21-6120fce13dcde.png', 6, '[{\"id\":\"6\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 120.00, 0.00, 'percent', 0.00, 'percent', '11:16:00', '21:16:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(101, 'Chicken dum biryani', 'Crave Biryani every now and then? Then, here\'s a quick and easy recipe to satiate your cravings. It is such a versatile dish that various kinds of biryanis can be prepared using different vegetables and meats.', '2021-08-21-6120fd6758fb1.png', 6, '[{\"id\":\"6\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 130.00, 0.00, 'percent', 0.00, 'percent', '11:18:00', '20:18:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(102, 'Enchiladas Potosinas', 'Enchilada Potosina is a unique enchilada variety from San Luis Potosí in Mexico, prepared by adding ancho peppers in the corn dough, filling it with cheese, closing the dough just like an empanada, and frying the concoction in hot oil until golden-brown in color.', '2021-08-21-6120fd6b22f36.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:25:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(103, 'Spicy Enchiladas Potosinas', 'Enchilada Potosina is a unique enchilada variety from San Luis Potosí in Mexico, prepared by adding ancho peppers in the corn dough, filling it with cheese, closing the dough just like an empanada, and frying the concoction in hot oil until golden-brown in color.', '2021-08-21-6120fd9c4a003.png', 15, '[{\"id\":\"15\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:25:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(104, 'Hyderabadi biryani', 'Hyderabadi biryani, also known as Hyderabadi dum biryani, is a style of biryani from Hyderabad.', '2021-08-21-6120fdda6e5cf.png', 6, '[{\"id\":\"6\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 10.00, 'percent', '13:20:00', '20:20:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(105, 'Mutton Biryani', 'This mutton biryani recipe has layers of mutton and saffron-milk infused rice cooked \'dum\' style. It has a host of aromatic spices and herbs such as star anise, bay leaves, cardamom, cinnamon.', '2021-08-21-6120fe4ca3d61.png', 6, '[{\"id\":\"6\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 180.00, 0.00, 'percent', 0.00, 'percent', '13:22:00', '19:22:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(108, 'Butter Cake', 'A butter cake is a cake in which one of the main ingredients is butter. Butter cake is baked with basic ingredients: butter, sugar, eggs, flour,', '2021-12-27-61c97a297fde3.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 110.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:30:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:02:41', 0),
(111, 'Cake', 'A form of bread or bread-like food. In its current forms, it is usually a sweet baked dessert. In its oldest forms, cakes were usually fried breads or cheesecakes.', '2021-12-23-61c46a57d3f48.png', 29, '[{\"id\":\"8\",\"position\":1},{\"id\":\"29\",\"position\":2}]', '[]', '[]', '[]', '[]', 10.00, 0.00, 'percent', 3.00, 'percent', '00:30:00', '20:45:00', 0, 1, 1, '2021-11-27 14:38:35', '2021-12-23 22:53:51', 0),
(112, 'Sponge Cake', 'Sponge cake is a light cake made with egg whites, flour and sugar, sometimes leavened with baking powder', '2021-12-27-61c97a512ded1.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 150.00, 0.00, 'percent', 5.00, 'percent', '03:30:00', '18:30:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:03:21', 0),
(113, 'Chiffon Cake', 'A chiffon cake is a very light cake made with vegetable oil, eggs, sugar, flour, baking powder, and flavorings', '2021-12-27-61c97a866bc39.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 160.00, 0.00, 'percent', 30.00, 'amount', '06:00:00', '22:00:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:04:14', 0),
(114, 'Chocolate Cupcake', 'Moist and fluffy at the same time with a tender crumb.', '2021-12-27-61c97ab68d6ed.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 18.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:05:02', 0),
(116, 'Molten chocolate cake', 'Molten chocolate cake is a popular dessert that combines the elements of a chocolate cake and a soufflé.', '2021-12-27-61c97af7a3d87.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 22.00, 0.00, 'percent', 2.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:06:07', 0),
(117, 'Peanut Butter Molten Cake', 'Creamy peanut butter, dark chocolate, unsweetened cocoa', '2021-12-27-61c97b3d23a4e.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 17.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:07:17', 0),
(118, 'Arabica Coffee', 'Coffea arabica, also known as the Arabian coffee, \"coffee shrub of Arabia\", \"mountain coffee\" or \"arabica coffee\", is a species of Coffea.', '2021-12-27-61c97b7b498b7.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 0.00, 'percent', '04:00:00', '16:00:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:08:19', 0),
(119, 'Lemon Juice', 'According to World\'s Healthiest Foods, a quarter cup of lemon juice contains 31 percent of the recommended daily intake of vitamin C and 3 percent of folate and 2 percent of potassium', '2021-12-27-61c97bb103f08.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[]', '[]', '[]', '[]', 200.00, 0.00, 'percent', 0.00, 'percent', '05:00:00', '17:00:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:09:13', 0),
(120, 'Toll House Pie', 'Ice cream, brown sugar, deep dish pie, butter, eggs', '2021-12-27-61c97be748953.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:10:07', 0),
(121, 'COOKIE DOUGH BROWNIES', 'Brown sugar, dark chocolate chips, unsweetened cocoa', '2021-12-27-61c97c3a0da05.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:11:30', 0),
(122, 'Hazelnut semifreddo', 'Hazelnuts are used in baking and desserts, confectionery to make praline, and also used in combination with chocolate for chocolate truffles and products such as chocolate bars, hazelnut cocoa spread such as Nutella, and Frangelico liqueur.', '2021-12-27-61c97c8ab8dcd.png', 11, '[{\"id\":\"11\",\"position\":1}]', '[]', '[]', '[]', '[]', 14.00, 0.00, 'percent', 3.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-12-27 19:12:50', 0),
(123, 'MAPO TOFU', 'Mapo Tofu consists of tofu set in a spicy sauce, typically a thin, oily, and bright red suspension, based on douban and douchi, along with minced meat, traditionally beef.', '2021-08-21-61210747e03f2.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 340.00, 0.00, 'percent', 30.00, 'amount', '00:29:00', '23:51:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(124, 'Meringue', 'Meringue is a type of dessert or candy, often associated with Swiss, French, Polish and Italian cuisines, traditionally made from whipped egg whites and sugar, and occasionally an acidic ingredient such as lemon, vinegar, or cream of tartar.', '2021-08-21-61210796c7cdc.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 11, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(125, 'KUNG PAO CHICKEN', 'Kung Pao chicken, also transcribed Gong Bao or Kung Po, is a spicy, stir-fried Chinese dish made with cubes of chicken, peanuts, vegetables, and chili peppers.', '2021-08-21-612107f2cd8c7.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 470.00, 0.00, 'percent', 10.00, 'percent', '08:00:00', '20:00:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(126, 'BAOZI', 'Baozi, or bao, is a type of yeast-leavened filled bun in various Chinese cuisines. There are many variations in fillings and preparations, though the buns are most often steamed', '2021-08-21-612108516b458.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 300.00, 0.00, 'percent', 17.00, 'percent', '00:01:00', '23:57:00', 0, 1, 5, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(127, 'Green Juice', 'Green juice is extracted from green vegetables like kale, spinach, and celery. Some green juices may also include fruit.', '2021-08-21-612109d666c4d.png', 9, '[{\"id\":\"9\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 175.00, 0.00, 'percent', 0.00, 'percent', '03:00:00', '09:00:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(128, 'Orange Juice', 'Orange Juice is good for health.', '2021-08-21-61210a8a6650a.png', 9, '[{\"id\":\"9\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 190.00, 0.00, 'percent', 25.00, 'percent', '03:30:00', '07:30:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(129, 'Stawberry Cake', 'Strawberry cake is a cake that uses strawberry as a primary ingredient.', '2021-08-21-61210b55b24e9.png', 8, '[{\"id\":\"8\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 145.00, 0.00, 'percent', 20.00, 'amount', '07:00:00', '10:00:00', 0, 1, 13, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(130, 'Ramen', 'Ramen is a Japanese noodle soup. It consists of Chinese-style wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso', '2021-08-21-61210c8b6348e.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 290.00, 0.00, 'percent', 15.00, 'amount', '17:00:00', '23:00:00', 0, 1, 10, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(131, 'Burrito', 'A burrito is a dish in Mexican and Tex-Mex cuisine that took form in California cuisine, consisting of a flour tortilla wrapped into a sealed cylindrical shape around various ingredients.', '2021-08-21-61210d9b0a87a.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 20.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(132, 'Chicken chowmein', 'Chow mein are Chinese stir-fried noodles with vegetables and sometimes meat or tofu; the name is a romanization of the Taishanese chāu-mèn.', '2022-02-08-62021673c2e7f.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 185.00, 0.00, 'percent', 15.00, 'amount', '05:00:00', '11:00:00', 0, 1, 12, '2021-11-27 14:38:35', '2022-02-08 17:36:27', 0),
(133, 'Cheese sandwich', 'A cheese sandwich is a sandwich made with cheese on bread. Typically semi-hard cheeses are used for the filling, such as Cheddar, Red Leicester, or Double Gloucester.', '2021-08-21-61210de1ef62b.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 27.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:59:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(134, 'Peking duck', 'Peking duck is a dish from Beijing (Peking) that has been prepared since the Imperial era.', '2022-02-08-620216cc01d25.png', 10, '[{\"id\":\"10\",\"position\":1}]', '[]', '[]', '[]', '[]', 399.00, 0.00, 'percent', 19.00, 'percent', '04:00:00', '13:00:00', 0, 1, 12, '2021-11-27 14:38:35', '2022-02-08 17:37:56', 0),
(135, 'Chicken Roll', 'Chicken Roll is a delectable North Indian recipe made using all purpose flour, stir-fried chicken, yoghurt and a variety of vegetables rolled into paranthas.', '2021-08-21-61210e505f125.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(136, 'CHAR SIU', 'Char siu is a popular way to flavor and prepare barbecued pork in Cantonese cuisine', '2021-08-21-61210e78cec97.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 400.00, 0.00, 'percent', 40.00, 'amount', '06:00:00', '12:00:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(137, 'Dark Fried Chicken Roll', 'Chicken Roll is a delectable North Indian recipe made using all purpose flour, stir-fried chicken, yoghurt and a variety of vegetables rolled into paranthas.', '2021-08-21-61210e8e799b4.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 30.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(138, 'Ham sandwich', 'The ham sandwich is a common type of sandwich. The bread may be fresh or toasted, and it can be made with a variety of toppings including cheese and vegetables like lettuce, tomato, onion or pickle slices.', '2021-08-21-61210ef7bccc6.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(139, 'Chinese chicken and rice porridge congee', 'Chinese chicken and rice porridge congee is a type of rice porridge or gruel eaten in Asian countries.', '2021-08-21-61210f150ff5a.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 485.00, 0.00, 'percent', 15.00, 'percent', '05:30:00', '11:30:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(140, 'Sandwich', 'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.', '2021-08-21-61210f51ee379.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 15.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:45:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(141, 'Cheesy Sandwich', 'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.', '2021-08-21-6121100d50344.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 20.00, 0.00, 'percent', 0.00, 'percent', '00:10:00', '23:50:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(142, 'Melted chocolate sliced cake', 'This chocolate cake is the perfect cake to pair with a glass of milk.', '2021-08-21-6121100e9a3c4.png', 8, '[{\"id\":\"8\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 149.99, 0.00, 'percent', 0.00, 'percent', '02:55:00', '19:15:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0);
INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `set_menu`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`) VALUES
(143, 'Veggie Spring Rolls', 'Spring roll wrappers, cake, cabbage, soy sauce, bell pepper', '2021-08-21-612110d0124a1.png', 11, '[{\"id\":\"11\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 13.00, 0.00, 'percent', 0.00, 'percent', '00:15:00', '23:30:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(144, 'Vegan Chow Mein', 'VeganChow Mein is a delicious Asian side dish or dinner.', '2021-08-21-6121114665a9d.png', 10, '[{\"id\":\"10\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 235.00, 0.00, 'percent', 20.00, 'amount', '14:00:00', '22:00:00', 0, 1, 8, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(145, 'Pizza Napoletana', 'Neapolitan pizza (Italian: pizza napoletana) also known as Naples-style pizza, is a style of pizza made with tomatoes and mozzarella cheese.', '2021-08-21-612111a36d109.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 46.00, 0.00, 'percent', 5.00, 'percent', '00:30:00', '23:15:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(146, 'Chocolate Cupcakes', 'Chocolate Cupcakes is a small cake designed to serve one person', '2021-08-21-6121138178d8a.png', 8, '[{\"id\":\"8\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 205.00, 0.00, 'percent', 10.00, 'amount', '16:00:00', '23:00:00', 0, 1, 3, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(147, 'Creampy Cake', 'A cream cake is a generic description of many varieties of cream-filled pastries', '2021-08-21-6121143eb8c39.png', 8, '[{\"id\":\"8\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 130.00, 0.00, 'percent', 0.00, 'percent', '07:00:00', '13:00:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(148, 'Latte', 'Latte is a coffee drink of Italian origin made with espresso and steamed milk.', '2021-08-21-612114e8a1b4a.png', 9, '[{\"id\":\"9\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 320.00, 0.00, 'percent', 0.00, 'percent', '03:45:00', '10:45:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(149, 'Cappuccino', 'A cappuccino is an espresso-based coffee drink that originated in Italy, and is simply prepared with steamed milk foam.', '2021-08-21-6121155d24947.png', 9, '[{\"id\":\"9\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 0.00, 'percent', '07:00:00', '12:00:00', 0, 1, 12, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(150, 'Pizza Siciliana', 'Sicilian pizza is pizza prepared in a manner that originated in Sicily, Italy. Sicilian pizza is also known as sfincione or focaccia with toppings.', '2021-08-21-6121157903b80.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 25.00, 0.00, 'percent', 0.00, 'percent', '00:30:00', '23:15:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(151, 'Pizza Margherita', 'Pizza Margherita is a typical Neapolitan pizza, made with San Marzano tomatoes, mozzarella cheese, fresh basil, salt, and extra-virgin olive oil.', '2021-08-21-6121199b40ead.png', 17, '[{\"id\":\"17\",\"position\":0},{\"id\":0,\"position\":1}]', '[]', '[]', '[]', '[]', 45.00, 0.00, 'percent', 5.00, 'percent', '00:01:00', '23:59:00', 0, 1, 9, '2021-11-27 14:38:35', '2021-11-27 14:38:35', 0),
(165, 'new food', 'saasfsa', '2021-12-22-61c2bf6faf238.png', 8, '[{\"id\":\"8\",\"position\":1}]', '[{\"type\":\"Large\",\"price\":10}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"Large\"]}]', 1.00, 0.00, 'percent', 0.00, 'percent', '17:00:00', '23:00:00', 0, 1, 11, '2021-12-22 16:32:23', '2021-12-22 16:32:23', 0),
(179, 'Cocktil', 'asdasdadasdas', '2021-12-29-61cbfeb51ab84.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"10\",\"price\":250}]', '[]', '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"ml\",\"options\":[\"10\"]}]', 250.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '23:00:00', 0, 1, 1, '2021-12-29 16:52:45', '2021-12-29 16:52:45', 0),
(184, 'Cocktil', 'cocktail', '2021-12-29-61cbff34228df.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[]', '[]', '[]', '[]', 250.00, 0.00, 'percent', 5.00, 'percent', '18:00:00', '01:00:00', 0, 1, 1, '2021-12-29 16:54:52', '2021-12-29 16:54:52', 0),
(186, 'Traffic Photographic', 'Bourbon Whiskey, Orange Mermalade, Simple Syrup, Orange Spray- Served in a camera lens along with camera reel and orange peel', '2022-02-08-620269b1b54ae.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"600\",\"price\":0}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"600\"]}]', 600.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-08 23:31:37', '2022-02-08 23:31:37', 0),
(187, 'Daru ki Tanki', 'Bacardi White Rum, Baileys, Old Monk Rum, Banana Liqueur, Pineapple Juice, Fresh Cream, Banana Sauces, Banana Slices- Served in a copper tank along with pineapple and cherry leaves', '2022-02-08-62026b8bd239f.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"650\",\"price\":650}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"650\"]}]', 650.00, 0.00, 'percent', 0.00, 'percent', '10:01:00', '22:00:00', 0, 1, 7, '2022-02-08 23:39:31', '2022-02-08 23:39:50', 0),
(188, 'Tumse Na Ho Payega', 'Absinthe, Vodka, Gin, Tequila, Beer, Simple Syrup- Served in a kettle and hum mug with a flipped beer bottle', '2022-02-08-62026cf4cdf03.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"700\",\"price\":700}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"700\"]}]', 700.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-08 23:45:32', '2022-02-08 23:45:32', 0),
(189, 'Murbasa', 'Bombay Sapphire, Mint Leaves, Lime Wedges, Murabba, Simple Syrup, Chaat MAsala- Served in a pickle jar with murabba, mint and lime slice', '2022-02-08-62026e35abed2.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"550\",\"price\":550}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"550\"]}]', 550.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-08 23:50:53', '2022-02-08 23:50:53', 0),
(190, 'Thai Spa', 'Gin, Basil leaves, Kaffir lime leaves, Galangal, Lemon grass, Coconut water- Served in a spa tray along with lemon grass stick', '2022-02-08-62026f23dac2b.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"550\",\"price\":550}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"550\"]}]', 550.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-08 23:54:51', '2022-02-08 23:54:51', 0),
(191, 'Mellow Mellow', 'Marshmallow, Pine apple, Juice, Whiskey, Rosemary, Simple syrup- Served in a martini glass of marshmallows along with a drink in a shaker', '2022-02-08-6202703a158f5.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"525\",\"price\":525}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"525\"]}]', 525.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-08 23:59:30', '2022-02-08 23:59:30', 0),
(192, 'Coke In', 'Rum, Cola, Simple syrup- Served in a injection syringe along with lines of brown sugar and playing cards', '2022-02-08-620271d1e036d.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"525\",\"price\":525}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"525\"]}]', 525.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-09 00:06:17', '2022-02-09 00:06:17', 0),
(193, 'Aquaman', 'Tequila, Blue curacao syrup, Sweet and sour, Orange juice- Served in a fish bowl', '2022-02-08-620272d4ad56f.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"700\",\"price\":700}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"700\"]}]', 700.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 7, '2022-02-09 00:10:36', '2022-02-09 00:10:36', 0),
(194, 'Drown In A Bucket', 'Don Angel Tequila + Peach + Orange Juice + Smoked Rosemary - Down before you drown', '2022-02-09-6203597e5a4ba.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"1445-795\",\"price\":1485}]', '[]', '[\"3\",\"4\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"1445\"]},{\"name\":\"choice_4\",\"title\":\"Half\",\"options\":[\"795\"]}]', 1445.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 16:34:46', '2022-02-09 16:34:46', 0),
(197, 'Bird Cage (1 Ltr.)', 'White Rum + Orange Liqueur + Pineapple Chunks + Hazelnut + Kiwi + Pomegranate - Trapped In A Bird Cage', '2022-02-09-62035b8d68b1c.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"945\",\"price\":945}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"945\"]}]', 945.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 16:43:33', '2022-02-09 16:43:33', 0),
(198, 'Hoppi Johnnie', 'Johnnie Walker Red Label + Lime Juice + Orange Juice+ Ginger Ale', '2022-02-09-62035fd4cd9cd.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"765\",\"price\":765}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"765\"]}]', 765.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:01:48', '2022-02-09 17:01:48', 0),
(199, 'Not So Old Fashioned', 'Black And White + Lime Juice + Sugar Syrup + Orange Peel', '2022-02-09-620360e7c26a8.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"525\",\"price\":525}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"525\"]}]', 525.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:06:23', '2022-02-09 17:06:23', 0),
(200, 'Mango Jalapeno Martini', 'Mango Juice + Lime Juice + Jalapenos With Smirnoff', '2022-02-09-620361d3ec02f.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"365\",\"price\":365}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"365\"]}]', 365.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:10:19', '2022-02-09 17:10:19', 0),
(202, 'Cocopassion Beertail', 'Vodka + Beer + Passion Puree + Coconut Water + Coconut Syrup + Lime Juice', '2022-02-09-620362e6735fd.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"575\",\"price\":575}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"575\"]}]', 575.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:14:54', '2022-02-09 17:14:54', 0),
(203, 'Tipsy Anna', 'Vodka + Coconut Syrup + Curry Leaves + Gunpowder + Pineapple Juice + Sour Mix - With Smirnoff', '2022-02-09-6203648e1782f.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"425\",\"price\":425}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"425\"]}]', 425.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:21:58', '2022-02-09 17:21:58', 0),
(204, 'Apple Pie Smash', 'Whisky + Apple Pie Puree + Vanilla + Apple Juice + Lime Juice - With Black & White/Jim Beam', '2022-02-09-620365d96f284.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[{\"type\":\"495\",\"price\":495}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"495\"]}]', 495.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 6, '2022-02-09 17:27:29', '2022-02-09 17:27:29', 0),
(205, 'Dry Chilly Chicken', 'Crispy fried chicken tossed in garlic, onion, capsicum and a spicy Chinese style Sauce.', '2022-02-09-62038f0bccd95.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[{\"type\":\"260-140\",\"price\":260}]', '[]', '[\"3\",\"4\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"260\"]},{\"name\":\"choice_4\",\"title\":\"Half\",\"options\":[\"140\"]}]', 260.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 20:23:15', '2022-02-09 20:23:15', 0),
(207, 'Fried Prawn', 'Plump and succulent shrimps are crumbed with panko (bread crumbs) and deep fried', '2022-02-09-62039114e9a2b.png', 13, '[{\"id\":\"13\",\"position\":1}]', '[{\"type\":\"460-240\",\"price\":460}]', '[]', '[\"3\",\"4\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"460\"]},{\"name\":\"choice_4\",\"title\":\"Half\",\"options\":[\"240\"]}]', 460.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 20:31:56', '2022-02-09 20:31:56', 0),
(209, 'Basanti Pulao', 'Basanti pulao also called holud pulao or sweet yellow rice is a traditional Bengali recipe made using Gobindobhog rice, turmeric, and saffron, this golden sweet rice is a delight to eat.', '2022-02-09-620393ffce3e4.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"type\":\"210\",\"price\":0}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"210\"]}]', 210.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 20:44:23', '2022-02-09 20:44:23', 0),
(210, 'Daab Chingri', 'Daab Chingri, also known as Chingri Daab is a Bengali prawn curry, cooked and served in green coconut.', '2022-02-09-620394e5338b7.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"type\":\"650\",\"price\":650}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"650\"]}]', 650.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 20:48:13', '2022-02-09 20:48:13', 0),
(212, 'Bhetki Paturi', 'Bengali Bhetki Macher Paturi Recipe is Bengali Style Barramundi Fish cooked by wrapping in banana leaf. The bhetki fish pieces are marinated in a spiced mustard paste, wrapped in banana leaf individually and then slow cooked till tender.', '2022-02-09-6203963c46b9c.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"type\":\"370\",\"price\":370}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"370\"]}]', 370.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 20:53:56', '2022-02-09 20:53:56', 0),
(213, 'Alu Posto', 'Aloo posto is a traditional Bengali recipe of potatoes in a lightly spiced poppy seeds paste.', '2022-02-09-62039817c1db0.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"type\":\"130\",\"price\":130}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"130\"]}]', 130.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 21:01:51', '2022-02-09 21:01:51', 0),
(214, 'Doi Katla', 'Katla fish pieces cooked in rich creamy white gravy made of curd, ginger-garlic-onion, cashew nuts and some spices.', '2022-02-09-6203997197374.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"type\":\"190\",\"price\":190}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"190\"]}]', 190.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 21:07:37', '2022-02-09 21:07:37', 0),
(215, 'Murgi Mangsho', 'This is a Bengali style Chicken curry which usually finds in Kolkata, and it is typical Kolkata style chicken', '2022-02-09-62039a5955c7c.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[]', '[]', '[]', '[]', 220.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 15, '2022-02-09 21:11:29', '2022-02-09 21:11:29', 0),
(216, 'Chicken Tandoori Butter Masala', 'A delicious and vibrant combination of tandoori chicken in a rich, spicy and creamy sauce', '2022-02-09-62039c6300516.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[{\"type\":\"480-285\",\"price\":480}]', '[]', '[\"3\",\"4\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"480\"]},{\"name\":\"choice_4\",\"title\":\"Half\",\"options\":[\"285\"]}]', 480.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 21:20:11', '2022-02-09 21:20:11', 0),
(217, 'Mutton Chaap', 'Mutton Chaap is a Bengali dish that involves cooking mutton rib chops in a host of spices such as cinnamon, mace and saffron. The meat is cooked until it is slightly charred and tender. Juices dripping from the bones, these rib chops are coated with ghee and served with delectable biryani.', '2022-02-09-62039dd2a0263.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[{\"type\":\"230\",\"price\":1}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"230\"]}]', 1.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 21:26:18', '2022-02-09 21:26:18', 0),
(218, 'Mutton Biryani', 'Mutton biryani is a classic dish made by layering rice over slow cooked mutton gravy.', '2022-02-09-62039f3146bbc.png', 9, '[{\"id\":\"9\",\"position\":1}]', '[{\"type\":\"315\",\"price\":315}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"315\"]}]', 315.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 21:32:09', '2022-02-09 21:32:09', 0),
(219, 'Fish Arsalan Kebab (4Pc)', 'Fish Kebab is an easy-to-make snack recipe which is made with cubed fish fillets, lemon juice and garlic paste.', '2022-02-09-6203a1f6d1d2f.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[]', '[]', '[]', '[]', 450.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 21:43:58', '2022-02-09 21:43:58', 0),
(220, 'Firni', 'A sweet dish and a type of wet pudding popular in the Indian subcontinent, usually made by boiling milk, sugar or jaggery, and rice', '2022-02-09-6203a60aba525.png', 23, '[{\"id\":\"23\",\"position\":1}]', '[]', '[]', '[]', '[]', 80.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 22:01:22', '2022-02-09 22:01:22', 0),
(221, 'Chicken Tandoori', 'Chicken dish prepared by roasting chicken marinated in yogurt and spices in a tandoor, a cylindrical clay oven.', '2022-02-09-6203a9d7b3c77.png', 15, '[{\"id\":\"15\",\"position\":1}]', '[{\"type\":\"425-255\",\"price\":425}]', '[]', '[\"3\",\"4\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"425\"]},{\"name\":\"choice_4\",\"title\":\"Half\",\"options\":[\"255\"]}]', 425.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 22:17:35', '2022-02-09 22:17:35', 0),
(222, 'Mutton Rezala (1 Pc)', 'Mutton Rezala is a famous Mughlai mutton delicacy where mutton is cooked with various spices and is served with a subtle gravy.', '2022-02-09-6203ab3fb2bf5.png', 16, '[{\"id\":\"16\",\"position\":1}]', '[{\"type\":\"230\",\"price\":230}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"230\"]}]', 230.00, 0.00, 'percent', 0.00, 'percent', '10:00:00', '22:00:00', 0, 1, 16, '2022-02-09 22:23:35', '2022-02-09 22:23:35', 0),
(223, 'Murgh Masallam', 'Murgh musallam is a Mughlai dish originating from the Indian subcontinent. It consists of whole chicken marinated in a ginger-garlic paste, stuffed with boiled eggs and seasoned with spices like saffron, cinnamon, cloves, poppy seeds, cardamom and chilli.', '2022-02-09-6203ac10cd266.png', 23, '[{\"id\":\"23\",\"position\":1}]', '[{\"type\":\"790\",\"price\":790}]', '[]', '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Full\",\"options\":[\"790\"]}]', 790.00, 0.00, 'percent', 0.00, 'percent', '11:00:00', '23:00:00', 0, 1, 16, '2022-02-09 22:27:04', '2022-02-09 22:27:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_05_081114_create_admins_table', 1),
(5, '2021_05_05_102600_create_attributes_table', 1),
(6, '2021_05_05_102742_create_categories_table', 1),
(7, '2021_05_06_102004_create_vendors_table', 1),
(8, '2021_05_06_153204_create_restaurants_table', 1),
(9, '2021_05_08_113436_create_add_ons_table', 2),
(47, '2021_05_08_123446_create_food_table', 10),
(48, '2021_05_08_141209_create_currencies_table', 10),
(49, '2021_05_09_050232_create_orders_table', 10),
(50, '2021_05_09_051907_create_reviews_table', 10),
(51, '2021_05_09_054237_create_order_details_table', 10),
(52, '2021_05_10_105324_create_mail_configs_table', 10),
(53, '2021_05_10_152713_create_business_settings_table', 10),
(54, '2021_05_11_111722_create_banners_table', 11),
(55, '2021_05_11_134442_create_coupons_table', 11),
(56, '2021_05_12_053344_create_conversations_table', 11),
(57, '2021_05_12_055454_create_delivery_men_table', 12),
(58, '2021_05_12_060138_create_d_m_reviews_table', 12),
(59, '2021_05_12_060527_create_track_deliverymen_table', 12),
(60, '2021_05_12_061345_create_email_verifications_table', 12),
(61, '2021_05_12_061454_create_delivery_histories_table', 12),
(62, '2021_05_12_061718_create_wishlists_table', 12),
(63, '2021_05_12_061924_create_notifications_table', 12),
(64, '2021_05_12_062152_create_customer_addresses_table', 12),
(68, '2021_05_12_062412_create_order_delivery_histories_table', 13),
(69, '2021_05_19_115112_create_zones_table', 13),
(70, '2021_05_19_120612_create_restaurant_zone_table', 13),
(71, '2021_06_07_103835_add_column_to_vendor_table', 14),
(73, '2021_06_07_112335_add_column_to_vendors_table', 15),
(74, '2021_06_08_162354_add_column_to_restaurants_table', 16),
(77, '2021_06_09_115719_add_column_to_add_ons_table', 17),
(78, '2021_06_10_091547_add_column_to_coupons_table', 18),
(79, '2021_06_12_070530_rename_banners_table', 19),
(80, '2021_06_12_091154_add_column_on_campaigns_table', 20),
(87, '2021_06_12_091848_create_item_campaigns_table', 21),
(92, '2021_06_13_155531_create_campaign_restaurant_table', 22),
(93, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 23),
(94, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 24),
(95, '2021_06_14_120713_create_new_banners_table', 25),
(96, '2021_06_15_103656_add_zone_id_column_to_banners_table', 26),
(97, '2021_06_16_110322_create_discounts_table', 27),
(100, '2021_06_17_150243_create_withdraw_requests_table', 28),
(103, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(104, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(105, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(106, '2016_06_01_000004_create_oauth_clients_table', 30),
(107, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(108, '2021_06_21_051135_add_delivery_charge_to_orders_table', 31),
(110, '2021_06_23_080009_add_role_id_to_admins_table', 32),
(111, '2021_06_27_140224_add_interest_column_to_users_table', 33),
(113, '2021_06_27_142558_change_column_to_restaurants_table', 34),
(114, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 35),
(115, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 36),
(118, '2021_06_29_134119_add_schedule_column_to_orders_table', 37),
(122, '2021_06_30_084854_add_cm_firebase_token_column_to_users_table', 38),
(123, '2021_06_30_133932_add_code_column_to_coupons_table', 39),
(127, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 40),
(129, '2021_07_04_142159_add_callback_column_to_orders_table', 41),
(131, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 42),
(133, '2021_07_05_162404_add_otp_to_orders_table', 43),
(134, '2021_07_13_133941_create_admin_roles_table', 44),
(135, '2021_07_14_074431_add_status_to_delivery_men_table', 45),
(136, '2021_07_14_104102_create_vendor_employees_table', 46),
(137, '2021_07_14_110011_create_employee_roles_table', 46),
(138, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 47),
(143, '2021_06_17_145949_create_wallets_table', 48),
(144, '2021_06_19_052600_create_admin_wallets_table', 48),
(145, '2021_07_19_103748_create_delivery_man_wallets_table', 48),
(146, '2021_07_19_105442_create_account_transactions_table', 48),
(147, '2021_07_19_110152_create_order_transactions_table', 48),
(148, '2021_07_19_134356_add_column_to_notifications_table', 49),
(149, '2021_07_25_125316_add_available_to_delivery_men_table', 50),
(150, '2021_07_25_154722_add_columns_to_restaurants_table', 51),
(151, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 52),
(152, '2021_07_31_140756_create_phone_verifications_table', 53),
(153, '2021_08_01_151717_add_column_to_order_transactions_table', 54),
(154, '2021_08_01_163520_add_column_to_admin_wallets_table', 54),
(155, '2021_08_02_141909_change_time_column_to_restaurants_table', 55),
(157, '2021_08_02_183356_add_tax_column_to_restaurants_table', 56),
(158, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 57),
(159, '2021_08_06_123001_add_address_column_to_orders_table', 58),
(160, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 58),
(161, '2021_08_08_112127_add_scheduled_column_on_orders_table', 59),
(162, '2021_08_08_203108_add_status_column_to_users_table', 60),
(163, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 61),
(165, '2021_08_12_112511_add_addons_column_to_order_details_table', 62),
(166, '2021_08_12_195346_add_zone_id_to_notifications_table', 63),
(167, '2021_08_14_110131_create_user_notifications_table', 64),
(168, '2021_08_14_175657_add_order_count_column_to_foods_table', 65),
(169, '2021_08_14_180044_add_order_count_column_to_users_table', 65),
(170, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 66),
(171, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 66),
(172, '2021_08_19_055839_create_provide_d_m_earnings_table', 67),
(173, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 67),
(174, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 67),
(175, '2021_08_21_162616_change_comission_column_to_restaurants_table', 68),
(176, '2021_06_17_054551_create_soft_credentials_table', 69),
(177, '2021_08_22_232507_add_failed_column_to_orders_table', 69),
(178, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 69),
(179, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 70),
(180, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 70),
(181, '2021_09_23_120332_change_available_column_to_delivery_men_table', 71),
(182, '2021_10_03_214536_add_active_column_to_restaurants_table', 72),
(183, '2021_10_04_123739_add_priority_column_to_categories_table', 72),
(184, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 72),
(185, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 72),
(186, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 72),
(187, '2021_10_11_215352_add_adjustment_column_to_orders_table', 72);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0033ec77d188736115f448a136e8736dbc0f9d38e33eddd994ee20bb6781fe1048148dc7ad0053ce', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 21:57:39', '2021-12-30 21:57:39', '2022-12-30 16:57:39'),
('003b647ce62ac55772659795b1a4ab2a7ac1ec4186c65f8dea348dd5c87b9d9c153250605df6db4c', 39, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:54:54', '2021-12-14 19:54:54', '2022-12-14 14:54:54'),
('00aa7f98591d979479291837b079e1bab8d7add53faa7e12f093037b0ae8e1e46a4a6c0dcaee1dcc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:01:48', '2021-12-14 16:01:48', '2022-12-14 11:01:48'),
('01c9169fe5e75621b0fc45117571c22db0ab3e28dfc32dd3bf92d536f53fc9c9c7a55a7cc97934ad', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:21:42', '2022-02-10 01:21:42', '2023-02-09 20:21:42'),
('024e750781664de668f15bd8cd4dddbbb645b2940453c4ecdf717ad9ccbf2ecaefd6014b51f23f02', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 21:58:46', '2021-12-27 21:58:46', '2022-12-27 16:58:46'),
('026d1caf1d1f0fe41a7632fe8d635688906bf8be260fee4161454c0bb19731a09aae4e9e40a917a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:54:19', '2021-12-14 17:54:19', '2022-12-14 12:54:19'),
('02966b2cc9427ab651816a05104ef52ce97d0941d0a5c6f592360928c345ecf92a0f810e2492a375', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 16:08:01', '2022-01-31 16:08:01', '2023-01-31 11:08:01'),
('02c187400441f53687a30af580361503d21ab9e30fc263f729536e3e6fb8e013c5f10f170df66154', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:26:44', '2021-08-14 07:26:44', '2022-08-14 13:26:44'),
('02fa33fc1024f4cf1f4230b5d34ba63f5275565b8f528df21529ff3f5aece52c3845f8513df502a7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 19:33:15', '2022-01-06 19:33:15', '2023-01-06 14:33:15'),
('030563d3457b6a9cba91b2ffc12042c00b97665010f28c928357d2cc4a18e5dd01b1cb55e6f4b7b5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 17:18:02', '2021-12-17 17:18:02', '2022-12-17 12:18:02'),
('032bc5f00794bbb4d06b8aeb6d7b0a45c24eef76807a986b324a34846366d07b88be47fa2e40dbe7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:44:36', '2022-01-06 15:44:36', '2023-01-06 10:44:36'),
('03374f835a20b0b8b29752b023de1f414bca9299a6a2338fe84620c0bd6dca93e9b0f4f6a197e4ef', 75, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 19:08:41', '2022-02-10 19:08:41', '2023-02-10 14:08:41'),
('035ae320a0710afe93ccbc4d8e28b8431bd89274c0646ff4e3cbcb7dca534e27f6c70a317be43d86', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 15:02:06', '2022-02-10 15:02:06', '2023-02-10 10:02:06'),
('0360128f4b6fc02a46dfc003eaa712e94942f88143b57df7d9a55a06442db3ba22bc1637828501b1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 01:09:22', '2022-02-14 01:09:22', '2023-02-13 20:09:22'),
('03652f98734cb46633be656afd61eb9d6bef93da6cb3f97e5d862e758bc8a7458f4271c9fc525a03', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 04:56:56', '2021-07-04 04:56:56', '2022-07-04 10:56:56'),
('038d666642c528eb7a0fd142bca21d38f460fdf68a3297e838b4b0e058fabc6ce0831130f8084b50', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:00:52', '2022-01-10 22:00:52', '2023-01-10 17:00:52'),
('03d43f62dbea3eec55e1e6ccf42e854cfe084964823c96048a990b408ab0c693ffd79b7f8266c2c7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:27:48', '2021-12-16 20:27:48', '2022-12-16 15:27:48'),
('03f8e43aadb9ec51aacd8c69a69247673f868a8a6ff661a142dc272bd376023392a4e546ffd3d728', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:25:37', '2021-12-11 21:25:37', '2022-12-11 16:25:37'),
('0402454fe7f70ff46c9699b2a663544c6d21a328a3677dfe3f425e7f38d7e046844701b0131958d1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:44:26', '2022-01-06 14:44:26', '2023-01-06 09:44:26'),
('0436c5467b60eb6a8eab38390d665ec3393421f4862b7a68725dd1673ef7396e579c8f2e03417156', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 21:00:53', '2021-12-21 21:00:53', '2022-12-21 16:00:53'),
('04b957f80a5c43a5085abe8e5ea5421614f256364a671f428341f26561fb2021b23bbcb4a1ce6f89', 71, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 20:31:50', '2022-01-27 20:31:50', '2023-01-27 15:31:50'),
('052a1e91eb2c3b816bfe10b093dc89dc7f8bf0357add384514deb3da94db742dec27eaeec81bc2d7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:08:49', '2021-12-21 20:08:49', '2022-12-21 15:08:49'),
('058261fc7e43382f39cbc4868d9e9c933b6134ac7c916c5531100b01517d347f1c967e4ecb865952', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 23:35:11', '2021-12-20 23:35:11', '2022-12-20 18:35:11'),
('05c5cd340b9ad98739e2b79c01e100725babb3694e497866f5e9c3d714c8ec1c1685c50fa9b116a5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:48:50', '2021-12-16 19:48:50', '2022-12-16 14:48:50'),
('05d184123b2263e6e0a83ddf86033794923eb0035a34ca13b9ed48b7734e4d945e14677521dc86d2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:14:26', '2021-12-11 21:14:26', '2022-12-11 16:14:26'),
('05d591c625f5cad253cee8c53647fd1ec34202ab43a21d398dd3557266e58447adaaa58fc8b4c745', 17, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:41:46', '2021-12-09 20:41:46', '2022-12-09 15:41:46'),
('05f99bf60886348e0e18f59a68e3805de9bceaead87833700fb84e591436515097c4bd1f50f39e27', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:55:15', '2021-12-15 20:55:15', '2022-12-15 15:55:15'),
('0621f1d3d208d61ec2a41f8d5f8278536f28251b59f131e9b2970ea1940136608ec7b4140656edab', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:20:39', '2021-12-14 21:20:39', '2022-12-14 16:20:39'),
('06236fe4922129e2bdb1e86d4ad004c1950274e21c09bd9c6f5dc2403c4b4aa7c8e54f5f9074bb72', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 15:58:11', '2021-12-24 15:58:11', '2022-12-24 10:58:11'),
('06260ef2dfa6bf88b3cab0fb3820c9d0961775b96a06808200d14ec81c1987c0db5b0fc1c8079cf5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-15 02:06:50', '2022-01-15 02:06:50', '2023-01-14 21:06:50'),
('063e8b66158987f4de4cb31f979d43c58dbb6f3b011881507f06e757e138f8b9ea3cd4f2957a67b9', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 16:55:22', '2022-01-31 16:55:22', '2023-01-31 11:55:22'),
('064eb38c5c0a04ec51f7f284453546ab55e4f2ae2c3ee35e35c5a18f90df02e3570df7a1b1f44567', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:36:01', '2021-12-16 20:36:01', '2022-12-16 15:36:01'),
('06a2476f569fdb238994fefaced2f1e49200f63681d58f02027bf4db34db7fc5f895c9de3c670204', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 21:12:51', '2022-01-10 21:12:51', '2023-01-10 16:12:51'),
('06c3e0070adbd8ba781a9637e9d71604c071c0dbd8cd3d7da498fb6a3188edd6a16d7bb317f50655', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:22:21', '2021-12-16 20:22:21', '2022-12-16 15:22:21'),
('06c589372fc1fe5757bbb12bcb9c9512388fcebfaea5f3e178d101e140f560aada5327b5119e0ed0', 73, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:07:46', '2022-01-27 22:07:46', '2023-01-27 17:07:46'),
('06d6af33137b5ca68658bb73999d8b84801cca2339035ecb8024d4ccbd026dfc609daefff869798b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 20:00:31', '2022-02-04 20:00:31', '2023-02-04 15:00:31'),
('07c457ce246b2abb24c3fe1892555c5308c3e8b14a92e7120d43c4153acde361c252d2a344f5274f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:42:00', '2022-01-27 22:42:00', '2023-01-27 17:42:00'),
('08126f41a4d9ab6ac213750af5f175aa7c9f854d6389bb476831e688bb20ef9bffad4f2019262787', 71, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 20:41:24', '2022-01-27 20:41:24', '2023-01-27 15:41:24'),
('081446482e95430d9b54e9fdfc7a1a8d82b263a10b20b9cb229259afaa06f0e2b2f1d64977b61cc8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 17:27:58', '2022-02-02 17:27:58', '2023-02-02 12:27:58'),
('0861a1aa561c2965a88aacf020a62e16ecf6d45aeee41f910048cfa02f7c840e7a1dfbbb8a28a8eb', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:26:09', '2022-01-17 23:26:09', '2023-01-17 18:26:09'),
('08ace770af59a0888ec86e776620a5a5aae88ec135d1271c96d3c26ef9ac54c0045b56a7d9e3e033', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:04:49', '2021-12-14 20:04:49', '2022-12-14 15:04:49'),
('08bf2521b0a214bf69c7ae470ddf14d30c2eba5969c91a53baa79a3d74bf7e8d791208e296b5052b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:10:54', '2021-12-28 16:10:54', '2022-12-28 11:10:54'),
('096a8734f7039f3c42c1713cc5f9a82b2561cd2559943e1f3d9967d731694824085e0af5541febbb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 17:19:11', '2022-01-19 17:19:11', '2023-01-19 12:19:11'),
('09a1acc948919c36de7ccc1647823461f8ae577e4e1d31580dd970dfefa45209668d57e8f333d7f2', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 19:48:08', '2021-12-31 19:48:08', '2022-12-31 14:48:08'),
('09a401aaa0f423fdd38f2f39c4310fccdc6d13d576b013149c6e713021f1c76750b743bb3a352147', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-18 16:16:40', '2022-02-18 16:16:40', '2023-02-18 11:16:40'),
('0ac96be009512f5be8abaf0ad11d08140671806c3ab8fb7f376b02fde9f3e18d65a1aa932c411294', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:40:07', '2021-12-14 16:40:07', '2022-12-14 11:40:07'),
('0ad748e9a455b51e579a6518a14abf6d47b9f8eceef2f23a8d197b862c467c952e62a5408a075ab2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:50:15', '2021-12-29 16:50:15', '2022-12-29 11:50:15'),
('0b015e2282d7b03b305e8e421ab7698614a65f6009b1e1a345bbc01fc490570353bbf58b2fc8468f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 19:16:14', '2021-12-28 19:16:14', '2022-12-28 14:16:14'),
('0b3de1822122612f66bf65d1b5610581c497c0443ce024a653b16d0dd8844ab6052894357fe6abd9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:42:23', '2021-12-28 16:42:23', '2022-12-28 11:42:23'),
('0b3ebe294af5890d3e2105d1bab74df688083e1d16566f617447c9cf2cb91a9ffb9d394e2777fb5f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 23:37:01', '2021-12-20 23:37:01', '2022-12-20 18:37:01'),
('0b658e2f0325b497ccfd31ae4fed65eb27835485d7893a308e9d92542f60219b059b0c5913a80a96', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:21:03', '2021-12-17 04:21:03', '2022-12-16 23:21:03'),
('0bac049e3b0b8b2dd31a5600b963c511c7c836062ee5ed34fe176c9ae897656b09e0d985b7a627ae', 62, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 22:15:16', '2021-12-22 22:15:16', '2022-12-22 17:15:16'),
('0bad7ca8e5cd84e2f045caefd4fac4439675947527febbb812348e65e31cf45babba6376975e8616', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:03:36', '2022-02-10 01:03:36', '2023-02-09 20:03:36'),
('0be0797f472ecdcf4834ab6f2e3a9b23e1d230c8db79cea6bf718528302d9bbf19f7b754dceab3bb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 20:47:49', '2022-01-10 20:47:49', '2023-01-10 15:47:49'),
('0c51de9bd2e195ff8aa04d9354510834fb577ed1b8dd99eee8770abaffb156c933c670977dafa198', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:57:22', '2022-01-06 15:57:22', '2023-01-06 10:57:22'),
('0c744886fbb5d9f11af20e05de7470343ad71c485baf1922c3e789ab614a1a4711419d2b6d577048', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 17:35:07', '2022-02-02 17:35:07', '2023-02-02 12:35:07'),
('0c8d1d92b189cdc7fc83a0907e9695482ba741a9a257f1ee1967bc6a96f76255426934186b7a423a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 16:42:48', '2021-12-15 16:42:48', '2022-12-15 11:42:48'),
('0cad958cd25a9f777a6490a9ab88d6938b2afedfc7fee6f8cb05431db9e324fc5bcb24383f263d76', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:06:22', '2021-12-29 16:06:22', '2022-12-29 11:06:22'),
('0ce77d214106aa7d2691f22e57a52d61e83c4a74e232b6cf6409728c337a731412d5f011c265abf9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:51:24', '2021-08-08 14:51:24', '2022-08-08 20:51:24'),
('0d08129c1d2ebb370700bbf5fbedb4fdb2d9c8dcda0f638b02a99552cd8037a75f8fb2160784e483', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 23:20:12', '2021-12-16 23:20:12', '2022-12-16 18:20:12'),
('0d1b8ca565c548b450d03cdeccb1faac128b501eabcc9ab410aa70e57d7417f90f540c67a19a217d', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:36:14', '2021-12-15 20:36:14', '2022-12-15 15:36:14'),
('0d85e848b15f04a0b82db6fd6a4b90386f5dfc3077ad21ac5cd87ce65cecc740a275ee86586410d0', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:21:30', '2021-12-28 15:21:30', '2022-12-28 10:21:30'),
('0d9332846e6a9fa4020d23d923bc360216a361937ccdc8d659a48b6d201ecf3fbab2827a59f900d2', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 22:12:00', '2021-12-21 22:12:00', '2022-12-21 17:12:00'),
('0d9fb5e0ef46b4bec6fbad76789bc2051c785c38a345f4bffe5c04110f1d6b864cee08fc34e5f585', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:53:44', '2022-01-06 15:53:44', '2023-01-06 10:53:44'),
('0e4f4e3033dc7b61eac2a0e6b022ba786d92b9ab6cc879564e6b1914bd9beeb93d6e0c230823211e', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:20:25', '2022-01-27 22:20:25', '2023-01-27 17:20:25'),
('0e9474b6fe47c48999e26d4719a561e2097ea0d5d9bfe6912aed00d79464e8ff96947fd8a0ceba40', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 23:03:55', '2021-12-14 23:03:55', '2022-12-14 18:03:55'),
('0e9eaf265f305cbf926a85314a21ce64f7432463df75a694b7b69f3af9d71dd2686c0ae3df030461', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 17:09:01', '2021-12-09 17:09:01', '2022-12-09 12:09:01'),
('0efc5a76806d8a09c8654b19e8d31a542c2a16afb2c316923754c71611e02101c3bc5d17f84c8eab', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 15:49:29', '2021-12-20 15:49:29', '2022-12-20 10:49:29'),
('0fc3e4c7226af3899f32ad5aff95c3a80dc1bc0ed30d8731fec039520c04b29a0cbfad2fb01e2afa', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:27:29', '2022-01-27 21:27:29', '2023-01-27 16:27:29'),
('10d53f41d24875b15dbb1a43c2380840a12816eb4bb1c37e932b33271f3b89e27b85b8883d36bced', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 20:26:45', '2022-02-01 20:26:45', '2023-02-01 15:26:45'),
('11146b6af1fc826f564737dd8b9db963ae73576b25d19983a0660ee3f1513c79c0d972fc4de73dfd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:59:51', '2021-12-16 16:59:51', '2022-12-16 11:59:51'),
('1123390843c56da743435fb68af6b3150f319665fed117f6c20b61a16ebc80ecdb6a01d6e98fa6dd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 17:55:27', '2021-12-11 17:55:27', '2022-12-11 12:55:27'),
('11d5194cf49cc80537f34916c4b4cf017c1ab467f8835d0ddeca4a43474d22b2fcd4b9c1c7725c84', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:16:42', '2021-12-11 21:16:42', '2022-12-11 16:16:42'),
('12df7a25d4bd5332289c6e57cdda3be42585743dbaf9688aeb0fd3010ec790923cb5a57f24c8a90c', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:31:34', '2022-02-10 01:31:34', '2023-02-09 20:31:34'),
('1303ddc6bf8e9f369efe4895afd3efc6b7f012964f8b59fa1642ef6219ce2b0b67fb018875fe1f2f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 23:09:57', '2021-12-21 23:09:57', '2022-12-21 18:09:57'),
('1322c46df48e72f0f4d291b61620c95ba2fac60cc868b020c38124364be4cbe9a84bc9fd5c7c29f2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:14:33', '2021-12-20 20:14:33', '2022-12-20 15:14:33'),
('1397bbaee084ae7f01ed8a6fede4ba37ac4266feb23052fe3c80489e463f40b36e165d8f798feafb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 18:09:06', '2022-02-02 18:09:06', '2023-02-02 13:09:06'),
('13ff9f3b68151ddd78e569e3cf6ad6a864955c9b95f94d0ba15b9420a8645b6ee43b97dad39e41d5', 25, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 21:45:43', '2021-12-09 21:45:43', '2022-12-09 16:45:43'),
('14839af5b6f732732b782082fc31399748a851f7f7188981902e99ee36977069d6e3764794441814', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:57:36', '2021-12-20 21:57:36', '2022-12-20 16:57:36'),
('14a2fbcfa2fde426d0025e7d7b3255f354c1905161be05f7affa44f672607ccd941750f42799c13a', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:54', '2021-12-14 19:59:54', '2022-12-14 14:59:54'),
('15356a7e5841fda74a4de1214798e179d4733e044d1a9ccd6e34606eaee9ca4dea3c6649c8888417', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 16:37:01', '2022-01-12 16:37:01', '2023-01-12 11:37:01'),
('1540d086122936e629c78c14a6536dd5652a0a19bb887366ccbe00cb5ecb962eb288051fb7330543', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 22:55:14', '2021-12-11 22:55:14', '2022-12-11 17:55:14'),
('158bc16e2c7b91b3a33eaaef53c1d7ae793105c21e21d3be35f9d5c161cd27bff0235bdd9063f013', 35, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:38:28', '2021-12-14 19:38:28', '2022-12-14 14:38:28'),
('163608d1c33f60847fcae521702976f0490039bc88e13fd235ae8442228c94b9775ba1a512b5e9cc', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 17:50:20', '2022-02-04 17:50:20', '2023-02-04 12:50:20'),
('164868203663b57f1056ad1ce907693ed46629858a54d996c46542376fc4d93d62a86d39711a5322', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:53:54', '2021-12-24 19:53:54', '2022-12-24 14:53:54'),
('168eca9a4600fe6af64fb8361cde3df836431c9492148595a0e560de04db9338cec265e108aff874', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 21:41:43', '2022-02-08 21:41:43', '2023-02-08 16:41:43'),
('16eeeda380e2bc9584ea87d1bb9eb9809363cd8324144d29aeda4d0810e6cd0daaa99d49c8508cfb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 16:35:58', '2022-02-11 16:35:58', '2023-02-11 11:35:58'),
('1796645666d7dd6ef53186e095fb9c39d2128e5cca19f2e1ac8e7e7da82d6174fe98b14e94925188', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:29', '2021-08-04 07:35:29', '2022-08-04 13:35:29'),
('18144de815bd643bce3e3ca21b1303d9db8fabf0d04214444da3fa4859285f57f2ed4b0670a2ede2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:37:33', '2021-12-16 21:37:33', '2022-12-16 16:37:33'),
('187a8372742291962c5f2389bbabdca66decebde5493a20fae2bd5960e17d6f679521fe3043803c3', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:36:53', '2022-01-27 22:36:53', '2023-01-27 17:36:53'),
('18ce17098eb7c84065b11c8ac8bf9a22e2b5165d2f9989ae8e0cbd0714f89e43a249c556aa26cc4d', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:19:43', '2022-01-27 22:19:43', '2023-01-27 17:19:43'),
('190f5acd22a2ee72850154fd3087533fb1cc5f5844a230ffd25964a9453602e0ec27e915f4786581', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 17:20:48', '2022-01-19 17:20:48', '2023-01-19 12:20:48'),
('1a000535e12ef4e47ef56b1a5fed0d3c4fda9da0bc46d2a626fc8e6e6ab70b2be3dc9a42130a23ff', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 15:28:08', '2022-02-11 15:28:08', '2023-02-11 10:28:08'),
('1a4fa8bff297a13ccc983b0d1f7617f1ee599d9bfdbe481cb79be2532c5b929869e51f3770d6ba29', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:05:07', '2021-12-30 20:05:07', '2022-12-30 15:05:07'),
('1a70b0a466a0b5720210b53da13872b6ce543a2c30084922aabac78f6a5e7e6512b6350875095a0b', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 01:58:55', '2021-12-25 01:58:55', '2022-12-24 20:58:55'),
('1a789480bda20bc1de7bab320529444d2d3ea9d91e0d29f18654c6790439f0710d2bd6d95e0d99af', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 19:22:26', '2021-12-20 19:22:26', '2022-12-20 14:22:26'),
('1acefd2db1027149a87af0abd18d5a779b15f1de4a384944aeefdaff1f7dec0a5cfdc79a7e807d2b', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 17:46:12', '2022-01-31 17:46:12', '2023-01-31 12:46:12'),
('1aff686923ef66fe15322cf93f5d7b4af6113df0186019a65b0b6f5664dafa8342dadc06ea91e201', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 18:23:00', '2022-01-19 18:23:00', '2023-01-19 13:23:00'),
('1b46b8b3f7da1ec09fd1faace478bce9e024e4eb5a5d2771b5143c0286c59c982c11845304f2b272', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 22:10:31', '2021-12-15 22:10:31', '2022-12-15 17:10:31'),
('1c09a5c7dbc79ef2f7be290b76952537e07feabaaaf5a3c986d05a9188795ce491d315a4f5b39f9f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 16:58:45', '2022-01-06 16:58:45', '2023-01-06 11:58:45'),
('1c41e794a6027600182fcad19b0f9920784f6cb9319103a3c59a15966da9449e3773a3029b86ddcf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 19:21:34', '2021-12-17 19:21:34', '2022-12-17 14:21:34'),
('1c7e9a7103723c433163624f415c6608ba907ad49fe03c2b2d5d544a65de0efa0eeadb2ba9ad8782', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:04:10', '2021-12-17 04:04:10', '2022-12-16 23:04:10'),
('1cedfe29db1564330e98d9e8193e492d401061cd963ff091b4305bb76bdc30d30f7fe20b44737e1a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:39:00', '2021-12-14 16:39:00', '2022-12-14 11:39:00'),
('1d2df170692d57a45f3930596151fbeb64897396bc45cc84935132c88a84c194eb607af0be710395', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:28:30', '2021-12-14 16:28:30', '2022-12-14 11:28:30'),
('1d7cdb8e23d84eb4ea50193ef9500bfd2bd09d5c2879a83774b0fb0cac5bae60a0d36cb99732170e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:23:22', '2021-12-16 16:23:22', '2022-12-16 11:23:22'),
('1dbcc586c0c96af129e508ab5b094c450373747cdab8dbe5aec7f432d829d0832c3334b5bc849c6f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 19:40:40', '2022-02-02 19:40:40', '2023-02-02 14:40:40'),
('1e338feb4f145d9988e8323a341a41a8c66c31dcba58ab80cf853ddf6dd519ddb113b87f45c9b833', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 15:15:21', '2021-12-31 15:15:21', '2022-12-31 10:15:21'),
('1e59a271f75d2bca09e99f0540b1d6c6c794e1c6b733538237c2653c2ad24056402bab03838e7ffa', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 21:55:21', '2021-12-30 21:55:21', '2022-12-30 16:55:21'),
('1ea195e42372992d1c34bd73d356f5b172eab5b487af4169b21e5c2c82c6e1ea5098585dbd453103', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 19:20:04', '2022-02-09 19:20:04', '2023-02-09 14:20:04'),
('1ffc54fc073c7b86dd8ae9218af4d3b45d1ecdf6b953b7d6d1207b562308fec0b2034223fb8ca791', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:14:37', '2021-12-11 15:14:37', '2022-12-11 10:14:37'),
('2011c47bf36ec0f794482a992cd580fdb4cab18d20c19619f88634b92afed0755ed519855d0656d6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:18:19', '2021-12-16 20:18:19', '2022-12-16 15:18:19'),
('20409f0fd2b0b7e4a46d03822975bf920e17380993c04aca8786b150dd046ee00d00831e128d0aa4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 15:31:54', '2022-02-02 15:31:54', '2023-02-02 10:31:54'),
('205b126372fda2ea6e7a006dfba03b92160772e715a80cbf9048c7bd616daf1012c8d506751c2739', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 16:01:07', '2021-12-24 16:01:07', '2022-12-24 11:01:07'),
('2132a14f835b6cf72a0a7428126577e66e96f76e0cf8b7df3f30d740052697c3ed1889a69889ca6e', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:36:53', '2022-01-27 23:36:53', '2023-01-27 18:36:53'),
('21f5f62a98702d9d7e42b923de0947f92cf9a47fb25a1a81fffeea6bd74f783417305803f0d850bc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:16:04', '2021-12-15 20:16:04', '2022-12-15 15:16:04'),
('227a4d1be7cd58e2ea841337175fff4c83a541f2a83ae3f6306f5ca457308d50408fa33f24e7a45f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:01:56', '2021-12-17 16:01:56', '2022-12-17 11:01:56'),
('22ca013e58661bdf574da182a6fb904da15604b945da8a11efe560e2d422c72c0b9c20f1554a800d', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:53:29', '2022-01-21 01:53:29', '2023-01-20 20:53:29'),
('231d59f48c73b2c7e8c2b5d2bd7a94db74f3f5b11aec8a48cd5b7e7ddf906bbf46bb64bbc5712af4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:43:44', '2021-12-16 16:43:44', '2022-12-16 11:43:44'),
('233d7a335aa705b11ce7e13f7f672fc0cf63e14e049aa9cbc6b81b9892e317a8b4a606f92122c10c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 22:04:44', '2021-12-28 22:04:44', '2022-12-28 17:04:44'),
('23bcb1e2a45a3d6f571f3723f474f66927f5cf9400d1646405626a6342a3731456abcf8132bb205a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 15:21:37', '2021-12-14 15:21:37', '2022-12-14 10:21:37'),
('23ff6182fd5a431ba1000375511c7d27ca6e2ba71c51af3a1e16b4344a4342f5621075da914f154c', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 20:09:14', '2022-01-28 20:09:14', '2023-01-28 15:09:14'),
('244576a004505a04b746b1a68aecfe25e5b6c59304ca03746af41c978ab24839e284c4a9e5c02399', 21, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 21:35:46', '2021-12-09 21:35:46', '2022-12-09 16:35:46'),
('244cff51d45c385fbff48a0b96ca750aa09a9d7efecb89b71b0f218bb4fc9584014a781664bd3353', 18, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:47:46', '2021-12-09 20:47:46', '2022-12-09 15:47:46'),
('24631356ba8bd62ac7e87b9c3ea1ee3d826ff73713bf1314f13797e32930e4ef1bf5a2710c0d61f3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:21:34', '2022-02-08 23:21:34', '2023-02-08 18:21:34'),
('24b6a74c5180db0cd445ba18af3f6c732bb268cc6f6ab9c7c921b87884cb1bfa02b1fa81c2be41fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-23 15:45:12', '2021-12-23 15:45:12', '2022-12-23 10:45:12'),
('24f36d805a8e4c02941077b6b69881f82acaad098ea8365b7934860ec3c5a4281466a7b341058e92', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:08:49', '2021-12-14 17:08:49', '2022-12-14 12:08:49'),
('251296ba5122c85e8fe1007af4f8a2bded1e7bb8b050f71136e001ed5c0e03e96ee2d03306fd6cff', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:46:22', '2021-12-11 19:46:22', '2022-12-11 14:46:22'),
('254f46061af64093be6584e01690c1a01b4b503a95d5ffd8bb97b6b15d6f0705dc692a1e9799fc65', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 16:58:23', '2022-01-06 16:58:23', '2023-01-06 11:58:23'),
('259bb42577364605961c6d38974365ed2ffd8eabcf131db23978483b69bd53ab3bd25f41a3c6bdd3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 16:37:45', '2021-12-21 16:37:45', '2022-12-21 11:37:45'),
('25aa28647a4faed05649b5b3466baeff981c6c559421e95fb9ebf4a9afacc5f9e78d14cfecbfbf0e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 16:33:28', '2021-12-27 16:33:28', '2022-12-27 11:33:28'),
('25c2b5d39e87ad17f074111cc335408b15ae8fcfd650e055965c02f924a1997d1c85a787b0e784a7', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 16:10:33', '2021-12-31 16:10:33', '2022-12-31 11:10:33'),
('25e29ebaf5e189909547883b2eec8b899d4bf92d2eac6caccafedfbe231b22ec3c71ff27e7e2ad0c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:42:55', '2021-12-29 16:42:55', '2022-12-29 11:42:55'),
('260f19b7366efca4cfbc4909ba3f1e193700c86f55b9b5b2971bfe02dc10cebcb24d3e3a262105e0', 37, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:45:48', '2021-12-14 19:45:48', '2022-12-14 14:45:48'),
('262c35a7875eac26bc02813158c9814af42cfc9d7b17ff6294b168872600671c561a1d25d17cff3e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 00:55:21', '2022-02-14 00:55:21', '2023-02-13 19:55:21'),
('263a6a7fe88aa86852668905dbaae7966731b0fa8f36c614f977fba9e3845001fb30d7748451a2b7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:49:08', '2021-12-29 16:49:08', '2022-12-29 11:49:08'),
('277f8a0f7da20c80f8f58f140c8a2bd4067398023093aca60596e4037f57fe40f4b740fa1e7567a7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 19:53:12', '2021-12-10 19:53:12', '2022-12-10 14:53:12'),
('278dab0bd85800d7100d91402dd5157d25523627392a648d16ab78f04069b6e4d9e7b960c4a15d76', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 15:56:36', '2021-12-30 15:56:36', '2022-12-30 10:56:36'),
('279087ff7457bfb6fb0df8191e1818232553c0715669d0f7f661dc92a07159df7d971a93b7acb135', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 23:28:30', '2021-12-10 23:28:30', '2022-12-10 18:28:30'),
('27e1844e53a639bde7c0ced5a1b4612c73ebd8a5d86b28408a25bcf7153d53da8b4cc339bf2039cd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 21:42:34', '2021-12-17 21:42:34', '2022-12-17 16:42:34'),
('2869713f420b0196de8513877f3b573fde1b6e169343533364c688f2a9a7381d0df1179b9ae0a703', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:00:08', '2021-12-29 17:00:08', '2022-12-29 12:00:08'),
('28bbdeab403da90b4379d0c9a66e7ba1086e4d0dd10b9c77c391a0b11095d0df668e53c8bf425b0a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 17:00:43', '2022-02-08 17:00:43', '2023-02-08 12:00:43'),
('2919672ecc1e3dd9f2759d15f8cc54882d1d9f780cfda82fb83c8359de8654492ea6703956a7c50d', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-15 08:22:28', '2021-07-15 08:22:28', '2022-07-15 14:22:28'),
('295caa734121de47e3b63f35c9f794998e6d028eb14e39de765f44594d50b19d92492e77b1917af4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:06:12', '2021-12-17 06:06:12', '2022-12-17 01:06:12'),
('2ab3b7c6e62d85275ff557280c65dbef8679db9feeeeda9f03f2b3ee0b71db33c3c710bd159bf1f7', 7, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-08 21:16:18', '2021-12-08 21:16:18', '2022-12-08 16:16:18'),
('2ad83b3002f1f2d01f1be6b77102ed5b080a25d7c5f965aeb846e195f2d9d683f00c381606277a52', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 17:53:55', '2021-12-27 17:53:55', '2022-12-27 12:53:55'),
('2b1e5f65ffa0bf5528acf686b5a50e85aa6e1bfa1dbfb5fccdbf57b82d0d2860926bb389692ba9ae', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 23:45:05', '2022-01-08 23:45:05', '2023-01-08 18:45:05'),
('2b21d29a48ac04ed83f30aba79657eed46b409605cd4fc98e72654515e681c7cb75eb84f8d021a18', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:19:15', '2022-01-27 21:19:15', '2023-01-27 16:19:15'),
('2b2dc1234a2e989520ee42f75c7544ad5fe2e864f4f9e2652c7389ec7ed9f5173522231335d4f768', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 17:56:04', '2021-12-18 17:56:04', '2022-12-18 12:56:04'),
('2b566dd87423d2002fa83a98a6411a24eb0f048a82408f96b94899f83c28d199def2265cf3ba303b', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:41:53', '2021-12-28 15:41:53', '2022-12-28 10:41:53'),
('2be04f15fad061e4e45207c833cb389e3f23e3c47c309a649c6b91dc660df0cc2676054ee64e34f3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 00:22:29', '2022-01-12 00:22:29', '2023-01-11 19:22:29'),
('2c108cafa3c57122a47b0608053e38f5ad750acc7f6247d030018476052c34c306f5dd59e77ea549', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:14:45', '2021-12-17 16:14:45', '2022-12-17 11:14:45'),
('2c21979dda216e9ba9ddb76ce94a062b2c57764b5da3edce17003b3c231487a5f9c342faef00f44f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:46:16', '2022-01-06 15:46:16', '2023-01-06 10:46:16'),
('2c39c7cc3d170e816a309a866f099369069986dfa5bf9c59b023714aaad8e624e2d30acd5c4dcfd4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 20:37:06', '2022-02-09 20:37:06', '2023-02-09 15:37:06'),
('2c4c78cf2c245ae273a927bf74deedf3078ae8298cd9fd2a51706c5ef8eb1821262cc502d33c220a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 23:30:04', '2021-12-10 23:30:04', '2022-12-10 18:30:04'),
('2cbbe7aaaa45365f6358b29581705195c908dcf8d5bca90c39373eb530bb727faa8dc6d3516736b8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:51:49', '2021-12-11 21:51:49', '2022-12-11 16:51:49'),
('2d086243b28112acb4d425d1a675c8997580d63e64dcd5473944a520714fb02cff56744eb5d66625', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 17:08:58', '2022-01-17 17:08:58', '2023-01-17 12:08:58'),
('2d436ab897ca187f7069c85af876fb0b5b6989ef890fc8c8c219a7e48ab456564b639d18b0410717', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:48:55', '2021-12-20 21:48:55', '2022-12-20 16:48:55'),
('2e7cf209fcb76a4c30c03dfbd8618e2e2d6cc2b4db9bf4f0ddd9ff9a9c31d8058c1ebb1604423cd5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:57:38', '2021-12-14 17:57:38', '2022-12-14 12:57:38'),
('2ef3ea90aeaa13093622a5b22e4691e901976f610e685fade001c2c147ad6a6c51d953df98394747', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:44:57', '2021-12-16 19:44:57', '2022-12-16 14:44:57'),
('2ef55820aac4f2d7e42f372de3a0ff601cd237c3f67f0ac9579303d31a3396b01b685008666060cc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:41:27', '2021-12-16 19:41:27', '2022-12-16 14:41:27'),
('2f1562ad1cc8255568e6f3ca492afd1b209f7318191b85bf89e8d3b3f9626abeb85d004b9fb82409', 75, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 19:09:06', '2022-02-10 19:09:06', '2023-02-10 14:09:06'),
('2f49586a4ac33179f846e60afba15e655ceef494cd64f6812d4ab109336f5fb008cb3005137f700c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-03 13:21:13', '2021-08-03 13:21:13', '2022-08-03 19:21:13'),
('2f702df997c950e223faac50d8b0ae7b2a384d244b228c430b674e2393249be398618fbe50519e2b', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:59:37', '2022-01-17 23:59:37', '2023-01-17 18:59:37'),
('2fa7fab32a040d562115d1d63d8c87812e7d4eae6b1410ba2e6788c3e07732199fe13245fea61c47', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:43:42', '2022-01-08 00:43:42', '2023-01-07 19:43:42'),
('3072cf82f1a6cf61507243ef7bff7b0e0d4aa7ea095dea63f07dc855dde8cf73cd8b9e0310b5f5af', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:35:28', '2022-01-27 21:35:28', '2023-01-27 16:35:28'),
('30f828b0418dbd0d540b123a432cdc1af27cf96613a2deecfaf4d8da2617936ca2ad25c9590acd20', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 19:51:11', '2022-02-11 19:51:11', '2023-02-11 14:51:11'),
('3115e428f22908fa2d94bf2804d1ed2d9929cb27da233aedf24c8bc71dc8066f91b0c63a795c26e9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:33:37', '2021-07-31 08:33:37', '2022-07-31 14:33:37'),
('3169e898e3528d972cf93863cbec17f232a82c42dc0fde189c995465222d69f6ed14965b1d5165a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:16:32', '2021-12-16 16:16:32', '2022-12-16 11:16:32'),
('31a771041304ada8ba15b4710d4fd3a4201f95664a9bd6e2e4c2230171cf33aa992fc37a5868087e', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:54:32', '2022-01-27 23:54:32', '2023-01-27 18:54:32'),
('31ca53147c64d6137dd61c73e7c077dd47c6a209352d1be8fd93e551d52cf2910a98d97785b573a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 23:13:09', '2021-12-15 23:13:09', '2022-12-15 18:13:09'),
('31f4682449a7fa27dccb193c5555777ab7f0edd3b850f3d0c4b1926b592afaa38a85e647e0d6b00c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:19:45', '2021-12-28 16:19:45', '2022-12-28 11:19:45'),
('322ed0c5cbbf74d3d774c38aedec07a49ed5b7fed1ae00ea795a262e8177202b68fe613a3a48ba02', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 20:00:21', '2022-01-31 20:00:21', '2023-01-31 15:00:21'),
('32448f5f81843e2887d397aca49b3b4205d1af6f4119f74e48deb304b3742ac04aa9ef75e1cbd517', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 23:04:42', '2022-01-20 23:04:42', '2023-01-20 18:04:42'),
('328d610f76a10b2f22d5c6c5955a0a62b82349186e8ad4b7dcfdd7bbed36e0d3d1429b3fb746e0fd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:47:35', '2021-12-29 22:47:35', '2022-12-29 17:47:35'),
('32a44560b70da44cc97b22c63533601af1b5b2d7f976e87a70bb2a1c684cf5d90c26de4951ecd6f1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:29:44', '2021-12-17 16:29:44', '2022-12-17 11:29:44'),
('32adf7fd80bab2e0fc8c9e9696947f79d82efcc37e42785b3a296036e4724522b9c87d8f3a7af8b2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:06:12', '2022-01-10 22:06:12', '2023-01-10 17:06:12'),
('32d23768253706af8c2306e62035a8ee3926a439934f3f01b45f530d0f06cb92bcc801a11bff9360', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:14:15', '2021-12-16 20:14:15', '2022-12-16 15:14:15'),
('3310fc53de4e070ae9cb554336e82a7a2665fcd4647abac1533fc9cc39a8b3801f039d2cd46e1fb9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:11:48', '2021-12-29 19:11:48', '2022-12-29 14:11:48'),
('333c0b3815977d8f4e8d3358e1300b03c0122a7c6baba60a6fdc62f000eeb817af7924d057bbd5d5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 13:53:37', '2022-01-06 13:53:37', '2023-01-06 08:53:37'),
('341fed30e39b738174906233282ed83b379392f21937dd83dd46e41c68b4ab95fd620bfa41529f79', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:21:20', '2021-12-11 19:21:20', '2022-12-11 14:21:20'),
('34226b396566366eac59c0c35981283e8e36c15dfe268f16b1c56c4eab02fb92a34a2f8190107e9b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:14:55', '2022-01-20 22:14:55', '2023-01-20 17:14:55'),
('342e5b904a72c7e77ae059433dfa0218a7f60c1a3666cba09bed6942deb294e730cf6ecb018091d2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 19:50:29', '2021-12-22 19:50:29', '2022-12-22 14:50:29'),
('3440d9ea063f917e6d6f4fba0c44a6c7dbc56f3de2a34e565203cf32f90cda8541c64c794d06a973', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 16:46:03', '2021-12-21 16:46:03', '2022-12-21 11:46:03'),
('34468e799e5e526ddaa44e6a64f8f0a6f62b517f51bf02605e0a4a4e99892d9c4c0681f49d913cb5', 30, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:34:59', '2021-12-10 15:34:59', '2022-12-10 10:34:59'),
('3494ae6fc63a7676d7f335e91e8822c947f34ede6f8d8911f157c7d26627279e6b4d34c23ceb5ccf', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 20:24:53', '2021-12-31 20:24:53', '2022-12-31 15:24:53'),
('34b2a2e8dae0403ac91c1e18d24b7616431c2cc04c7ec7248bf36143f15872155987827999f7e2fd', 20, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:50:16', '2021-12-09 20:50:16', '2022-12-09 15:50:16'),
('34b2afba7c577b0fd8c84f43535acccdde3dade9669cd4fdf631798cd3afac734ce813eafbe6381d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 01:08:51', '2022-01-19 01:08:51', '2023-01-18 20:08:51'),
('351b4014080c7d4370fa1d76f97b6f312949860962cf098617ea1fbcd29076331340b5b62adfb524', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:17:16', '2022-02-11 21:17:16', '2023-02-11 16:17:16'),
('352684659cfeebb4323d3801c182b79a76ba2cb969e7705e5e6bf2591d7b7c73bd1d56ea56ad3a0a', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 01:49:49', '2021-12-25 01:49:49', '2022-12-24 20:49:49'),
('354b76b68ce1d086051db1736f7f1ff0436f0c85a14d4b90670ca77975e2fe7ce17e738b0b17214b', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:12:09', '2021-12-14 20:12:09', '2022-12-14 15:12:09'),
('3569aea1e6f8b54a7e07c5e0d4a72e433d462984aefffe6c46dd9b09470ea08f33fca480fab981e7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:09:21', '2021-12-28 21:09:21', '2022-12-28 16:09:21'),
('35b34a22be76f01f418f3add21b76e8ffedbdbd4a8f41ba440d37868ab42981f09780460af6705f1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-14 23:22:20', '2022-01-14 23:22:20', '2023-01-14 18:22:20'),
('35de3070a5ce99ff07e8921b82ce8d4fb0f2a94505fd4daf22c95977d8d998e1d40a00410614b6d6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:39:41', '2021-12-20 16:39:41', '2022-12-20 11:39:41'),
('36217e984b8904eb4dfd30ed62eef9d725c1e8e63a6c1485bb084ef323ad5eea852c84e17560bd54', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-14 00:51:51', '2021-07-14 00:51:51', '2022-07-14 06:51:51'),
('36d3d77d8576a57fad5a970e0dc0973a9895fc915e50ecee811bef29f57a41ff4ccaaa9798f20cdf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:41:43', '2021-12-16 16:41:43', '2022-12-16 11:41:43'),
('370283e37292285142f143ae4d10af0037816bc24ed3aa0b3f014a875dd5c328d4d416ded13b0ac7', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:47:31', '2021-12-29 19:47:31', '2022-12-29 14:47:31'),
('372ba07de212cd4c2ac9e66fe22d6a74e52b4fe9c6be5bb5d939fdf59e50fb65e29df27601938ea3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:58:57', '2021-12-20 21:58:57', '2022-12-20 16:58:57'),
('372fc47dbe49af3fe4f6e50fea92af0c47fbd6af343a185a5fbc14d3e8ce763d83bfbcfaef10eb4a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 15:20:06', '2021-12-15 15:20:06', '2022-12-15 10:20:06'),
('37384d26e2c0a194d0d6a3b287e38cf5c8534b84638b997c3367aaf81055da6301cd3167e2a708d0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 19:27:44', '2021-12-15 19:27:44', '2022-12-15 14:27:44'),
('37534e1269142f342d5924394a9c0cb5d2821027a07523132be6b4cde12e4bec0af0f2207a358c1c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 16:46:37', '2022-01-21 16:46:37', '2023-01-21 11:46:37'),
('379107707bf46f710ef65c6b2f762f464024bfaddbf8ffd107325bd8011aafbef3ab02836e25d143', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 00:04:21', '2021-12-24 00:04:21', '2022-12-23 19:04:21'),
('37c079822dfdbb565260b18aa7c7b0c129a14ec58b1520f9c994d4f96b0fca0ef1d0803ef2bdc342', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:20:27', '2021-12-16 20:20:27', '2022-12-16 15:20:27'),
('37e0ec2ae2f69a0d3b81bddb79060711e4e539ff9af516e829de7236d99552d86ba15331f50e74ec', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:29:15', '2021-12-15 20:29:15', '2022-12-15 15:29:15'),
('37f82bd3f5c92d8df9649bb7f0eaa065cdea0608be4ed346a7cd3b967e4e0b2740bb1ab2d19e6e51', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:21:14', '2021-12-11 21:21:14', '2022-12-11 16:21:14'),
('37faee250526abcc9d0854b6188fd5d2965689871763f0d512b8010bd09ef50266f900dd70b16d49', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-08 19:55:56', '2021-12-08 19:55:56', '2022-12-08 14:55:56'),
('3830ef66bad9f70c54627ffbe9e6e4459dce3e3deb1db6f0d32be658c513ccae99a2811994512f8e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:03:38', '2021-12-14 16:03:38', '2022-12-14 11:03:38'),
('38c86e2f0cded212a403c86ceb6cdd125ed3d2a976054a5d71806020cef85ad5ebd25a6a5952677c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 19:12:28', '2021-12-22 19:12:28', '2022-12-22 14:12:28'),
('38e1c9bcbf080b5c32c62e0191d7979313369e98a4c5cfac712fda8e0a3850f3ed353c5a40083a67', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:09:00', '2022-01-06 21:09:00', '2023-01-06 16:09:00'),
('39185776a355be02922f8dc425aeb690dad04eef082e5bc410f52d4cf164b4e43f95b647347dbde2', 64, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:47:09', '2021-12-29 22:47:09', '2022-12-29 17:47:09'),
('39252c4958b705301e37eca06f86ef0e1b032a2c7edd9be37f31e90da21f83b1b4021f730b045094', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:10:10', '2021-12-17 16:10:10', '2022-12-17 11:10:10'),
('3949e23f5eb983acff2c36087c01375224b2184189aed3d3bab0d09d33de14b8e0e8ac2ce989cd35', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-03 20:20:46', '2022-02-03 20:20:46', '2023-02-03 15:20:46'),
('39a4fce4e5d9b683c7c3470cc81fd9702f6a8307e71facd8e39cb94e3a82146e4114d39149ea3ef2', 40, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:55:55', '2021-12-14 19:55:55', '2022-12-14 14:55:55'),
('39b25b77f2481348d99f1c91e5d3869562ee5f3f3c5de4bda5f319ec135ac4e800f8c9f0c136208a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:15:47', '2021-12-29 16:15:47', '2022-12-29 11:15:47'),
('39b48c149c32696967c8e96cf4c6978fc13b445ebcee9b365f5beed9c1f552019b272b29ee0d01e5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:42:54', '2022-01-20 22:42:54', '2023-01-20 17:42:54'),
('39e701ce6476e3e21305284744e03a9c86736261611ea0a91ca7e884021d3dd6fb965390b82f902d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:42:27', '2021-12-11 15:42:27', '2022-12-11 10:42:27'),
('3a597618e963dc99e2a3f6f2977e932aa8aad875536080eb5366098e7614ae8f5698026a33d89051', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 00:21:40', '2022-01-28 00:21:40', '2023-01-27 19:21:40'),
('3a9a3021ccbb7b3ca6e757d6814568950af319f8e735164d522d5a3d982042df8516c255dae33703', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:58:35', '2021-12-29 20:58:35', '2022-12-29 15:58:35'),
('3abfb4980fdf3c858e1c371352db40dae9e1e40f095b00dcd09c84ff7c8189a305f1be985e4274b3', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:50:53', '2021-06-19 03:50:53', '2022-06-19 09:50:53'),
('3bddd90f7fa317ca09950b499416b75964c9db66fdb4b3c7d2975f6fc5f94ab2a1440b617902f8be', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:17:39', '2022-01-17 23:17:39', '2023-01-17 18:17:39'),
('3c0c5a2b38c1b367670fe9040dd2ba41e72a0ce9c647e568e8d43e2eaa80ff2b43f2d90d713f21b5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-22 04:20:37', '2022-01-22 04:20:37', '2023-01-21 23:20:37'),
('3c7986a4ba2492ada47c0049d706652b056e6f794e55e593aa880cb95c2311567b583c017819b237', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:47:12', '2022-01-20 22:47:12', '2023-01-20 17:47:12'),
('3c84126a48debf2ff83d97c3702d0a23934a63afa6940945bee1a8ee33ad94c464bc5d0d27c124e1', 23, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 21:43:35', '2021-12-09 21:43:35', '2022-12-09 16:43:35'),
('3c869c9ee8f22f469d90574e16246d6ab3bb3b1d43d5a8a7505666c274837d4bc28e853abf7ee6d6', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 18:01:33', '2021-12-31 18:01:33', '2022-12-31 13:01:33'),
('3cd3269423e543961a7b64e8169875725eb47f8d0f309c69a4a770258de65e9c02057ed9000942da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:35:04', '2021-08-04 07:35:04', '2022-08-04 13:35:04'),
('3d6ecc393627befbf1c6d7391e80be812304b6816de567c6a713b2216848dd12c739778f4f3f67e4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:22:50', '2021-12-28 20:22:50', '2022-12-28 15:22:50'),
('3d858fd07be22fd1e211f924a4bc002ccc9eb0e430b4bb864db22786ce4d81a31123f63be3ee874d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:15:25', '2021-12-21 20:15:25', '2022-12-21 15:15:25'),
('3da253a032215b0f8124dfe20808cbd9179711a2f9d9d65596c6df8093586f318486f0e2a2771fe6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 17:16:26', '2022-01-07 17:16:26', '2023-01-07 12:16:26'),
('3e7ad3bb281372895cbb18360d8605f79a79e46fe35003535843d5d4ea6a30123fb722299907e132', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 15:19:58', '2022-02-11 15:19:58', '2023-02-11 10:19:58'),
('3e923b1f4084faba1a2e5448bd8b72e09b74db6ed25fbe14f6960a5f005107496cc507c1ba15c6e1', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-22 01:32:58', '2021-06-22 01:32:58', '2022-06-22 07:32:58'),
('3ec88fe5ada4105e882b23097949085ff745586ded8fedb15550c54182d1203fbcbae52b6240f939', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:47:56', '2021-12-28 20:47:56', '2022-12-28 15:47:56'),
('3f8ed756c79ccc17d5740e6a99914e2a3fad11fa81ceb745042c006822194b53f2b31efca9a37c86', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 18:05:06', '2021-12-21 18:05:06', '2022-12-21 13:05:06'),
('3fa54ea54ae2446d701b672b5c2947f2281770a825d9fabbb62f5de59a462be9df01ca3d858ccd78', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 17:54:42', '2021-12-31 17:54:42', '2022-12-31 12:54:42'),
('4024cdc3f1a8360aaeefc5a6985a0bb4db9be9da3916c7a3e7766d770cdb7028b2d0a21a766ded9e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:23:09', '2021-12-16 20:23:09', '2022-12-16 15:23:09'),
('4056d613d859c6e5a9867bb9db94eeba8406588f12c008775c03c5339893f94d513e7cdbd6d77734', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:48:20', '2022-01-20 18:48:20', '2023-01-20 13:48:20'),
('40a5d6b53ef00f50aba69f6453027b8644d934861e173e2c7bd4c5342e5915052fe0f2bad539e6d7', 69, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 18:02:07', '2022-01-27 18:02:07', '2023-01-27 13:02:07'),
('410e1ac34e30f029517a6ad887e0a05faaa1a68eacfdb09c1f94376f8d0ea9c4cdf1c677ee971b69', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-29 16:44:38', '2022-01-29 16:44:38', '2023-01-29 11:44:38'),
('4140d5b9b3d16e4bbef1b676b01f13f75d9c3fb2cada6548e50b0b2679562aace3b9b44f82f15f30', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-19 17:10:26', '2021-08-19 17:10:26', '2022-08-19 23:10:26'),
('4175d6b9b3e57b5bf71e1b63173c38013f2a080ff5e0e0566a926dc5869690500611c16df1f7c99d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 20:59:21', '2022-01-10 20:59:21', '2023-01-10 15:59:21'),
('41908b4e65d55f3901263208cf30aadc35bf2184443f71433defd64ff082c7d27d5b17405c290f41', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 22:34:35', '2022-02-07 22:34:35', '2023-02-07 17:34:35'),
('41c4e71e756f738ef79533648cd59969f558dfa68e19bc7cf700f221c508e0b27a2424a0500dbef8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 22:41:35', '2021-12-17 22:41:35', '2022-12-17 17:41:35'),
('41f7d652966f21ce736655d4940fe951529d9ed87dce98171bf1692f20b00d84393196235e74c889', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 23:11:31', '2021-12-10 23:11:31', '2022-12-10 18:11:31'),
('420cff93b4c4f24413c79981d7bfc4eee4465698bee6082bd16fcfcb492012600c6f6f5b8cd0bc8f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 02:45:03', '2022-02-14 02:45:03', '2023-02-13 21:45:03'),
('421c3ed88455c80cd30db1aef2a3c7579e3055e859066faa2b83d445b6b9e6f768915d27cfefa920', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 02:15:59', '2021-12-25 02:15:59', '2022-12-24 21:15:59'),
('423d87fd97cb6d56840fe4e6e3d99772a182177e826eb806e3a282c336165b3b21dffa1763a833b5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:16:39', '2021-12-28 21:16:39', '2022-12-28 16:16:39'),
('43000ad097e45727732bd25f7a20a14faffc1a1ee10e5c49ad45ffefcc3b0a5940cf9f42152ed407', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 02:12:46', '2021-12-18 02:12:46', '2022-12-17 21:12:46'),
('430e2ec727df36202daab61c501062e454fbd41c8b0112b414eeb2b3a7c126838983559d38871c9b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:42:28', '2021-12-17 06:42:28', '2022-12-17 01:42:28'),
('43118fbadc22fe15d212a1995181ed23ee13526f0de6689c1e88b89b6347dc962e2e5c44f2d55338', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-13 09:16:14', '2022-01-13 09:16:14', '2023-01-13 04:16:14'),
('432089818d5814367fbab59ba148f874774ee9af0429b6d9a0cace087dd3338c5a9fc1284112ef03', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 16:04:22', '2021-12-27 16:04:22', '2022-12-27 11:04:22'),
('43553c8a8a0e3b088d14de5cc4c747e4452048771284944b70c0a42d2c816e399eadf05b86452a43', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 20:57:27', '2022-02-08 20:57:27', '2023-02-08 15:57:27'),
('4382989b2e0136460b57dec5163619e8a9dff9d4469c2ba2db00e5f2cb385e91f2d1ce8bd8978247', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 20:32:21', '2021-12-27 20:32:21', '2022-12-27 15:32:21'),
('4384619dfb6b0fe332e045e34382d6daec96ad604afa49fe9fdff1404043368b35dcd316f637107c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 16:37:33', '2021-12-15 16:37:33', '2022-12-15 11:37:33'),
('43a6dea9aae9cc6b8d852c0d56ceb5f7fb066b682c673f700b24bb524578feab202c281c81ea496e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:33:18', '2022-01-27 15:33:18', '2023-01-27 10:33:18'),
('43b4275f8ec90531bc6dbb65751a5375db9a3ed2f0c23eeffae8bfff35f41ed8e5cd71d053263ada', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 00:32:37', '2022-01-21 00:32:37', '2023-01-20 19:32:37'),
('43dcf1bdcee81375d78e3db37cf58259fc44f40d2d59c6582984b8d576062b73fb1a8bb85618f0c3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 23:09:51', '2021-12-14 23:09:51', '2022-12-14 18:09:51'),
('43de68811336b455e190df533b9be88f0aa132ab012b3ec02638d3fed9c5a2b59113766dd7cd8d61', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 17:30:07', '2022-01-19 17:30:07', '2023-01-19 12:30:07');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('44255cd95864d2751adc0e7fa21c182ee54f2d238a2263c090196bfefe9af91b600c265661475780', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:33:17', '2021-12-29 20:33:17', '2022-12-29 15:33:17'),
('447d2205ab9cd36e03163e97e80ef1996a5f23d294fcf60d57f505163202e18aad579b60cf01958d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:03:56', '2021-12-14 16:03:56', '2022-12-14 11:03:56'),
('4499f1e131bdd2f135a7e33992bbce6b4bc5c2c2d599c0403cbb8c5f3acf8b1b4bfa7a018b7c2362', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 00:02:41', '2021-12-25 00:02:41', '2022-12-24 19:02:41'),
('44d235096fab38e94b1f4422bb68129d3248f90e8143add65aa5fb20fd36d7aa6180b08191346597', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:31:36', '2021-12-11 23:31:36', '2022-12-11 18:31:36'),
('45216309a2766256a48fe78f342a1247cff9cd448961a29ef8f095ce7e33a3e33e589460ab75f036', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:43:59', '2022-01-06 21:43:59', '2023-01-06 16:43:59'),
('454d040cebd4df6297023613aad6c0d2c704d876ab64243fba0c9ac9adb685dcb7f8d6ba3f183e11', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 01:50:52', '2021-12-18 01:50:52', '2022-12-17 20:50:52'),
('45599b01cc08558f332b3fa72b95e6b56d39f35593408bdcfecd8afd298945c682f72e4a2313a831', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 17:24:52', '2022-01-19 17:24:52', '2023-01-19 12:24:52'),
('45a3f43fa37fb8f3ff969289318ff1247259308115e1eb90882549c9e2bb286dab1e2a8d6828842c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 19:29:54', '2022-02-10 19:29:54', '2023-02-10 14:29:54'),
('45b8d7fec2d795451cafc9e4fb28d266bb586111fffd799dc863b36661fcf26ee46727e683a985eb', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 22:34:01', '2021-12-31 22:34:01', '2022-12-31 17:34:01'),
('463b64fb94f7a66f47884adcbf9b75afd5b5c64cab1462109d636cd80b4583c8afe57fbfe679c060', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 19:06:33', '2022-02-10 19:06:33', '2023-02-10 14:06:33'),
('464e8d9f487032390ca14b6842772d2acbe41bb94bef5292f5a6b8ca56af4b0bdd1897071e7d2e03', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:49:34', '2021-12-16 20:49:34', '2022-12-16 15:49:34'),
('467c424c79b098f865e08c03d928a3b69445226d142a2c689bbcff4b7d0262ac6483f78024e69283', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:51:10', '2022-01-27 15:51:10', '2023-01-27 10:51:10'),
('46d939e5df973890d048676591eef410e33fd9ac3f372735da54b0e68d826034195a90a997359f3e', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:06:44', '2021-12-30 16:06:44', '2022-12-30 11:06:44'),
('4707af1b5637df7529335b8c44e8b02de6a74203616967c3bfa457dcb3e5336c51a5fc6128822eb0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 16:08:51', '2022-01-12 16:08:51', '2023-01-12 11:08:51'),
('4754cccd174e6bb4d3e06021acb582a74b067c613994b39fe860a49dcc7edfb49e3699ecc21e64e8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:47:36', '2021-12-21 17:47:36', '2022-12-21 12:47:36'),
('475623e3ddedf8377f8db4763f131f7587967352b8d643d337556c27ee36e8e696762351bbf600d9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:36:02', '2021-12-11 21:36:02', '2022-12-11 16:36:02'),
('47a25f4220f0d0e991a1a85332a79fc4eadc35e1b798c44c3b4a147b425e1f5af8c94de0837e45fa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:52:27', '2021-12-20 21:52:27', '2022-12-20 16:52:27'),
('47f068d0857a5e9756d790691e94fd4bf8091f4f950853faa40dd5d61f1ad8e4c10c84815243e968', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:56:18', '2021-12-14 17:56:18', '2022-12-14 12:56:18'),
('48108c230f0ce127aa0b185e69515e26f6e302391fd2bb09cd80c83bea81a288e06e263693ab2838', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 00:47:10', '2022-01-28 00:47:10', '2023-01-27 19:47:10'),
('484b74d11e98e9a6b9804c02eac31e3199b6ac21a7d36c06c3cb4d726e8b3d337d2097b28e4b82c6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-24 22:14:46', '2022-01-24 22:14:46', '2023-01-24 17:14:46'),
('4864c59b1bf507ec01efdc06e217a245bfd50f1805923a449d18c507768b920d0e32bbae56b8d5c9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-03 15:22:09', '2022-02-03 15:22:09', '2023-02-03 10:22:09'),
('4884e362b3f811d7f86fe7845f62aabcc01ece723fce3ed3ed5f06757e9dbba1eec8ea947f53ce3f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:50:46', '2021-12-29 15:50:46', '2022-12-29 10:50:46'),
('489ad2804c3b2b600ffeddc673d3c9a268e6b8baf20c0542045754ed5b9c55db3ddc08e712084d7c', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 18:47:43', '2022-02-04 18:47:43', '2023-02-04 13:47:43'),
('48cc7a0b59085fa72c48c58ce303205d51e00c6374c56ddf55a25f7f17a0c07fae0dd4300b5f123f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 17:46:07', '2022-02-04 17:46:07', '2023-02-04 12:46:07'),
('48e429934fa7b4316a360beb5f3680269e493b3b6e1393afeae0fa3485a5c4a641730b2e4838679b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 21:48:36', '2022-01-06 21:48:36', '2023-01-06 16:48:36'),
('48ebbaa894976d805d8cc9312b5b82e4f648f6ac96063795698ae379000472cd4ee9b8456087f8d5', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-29 16:57:29', '2022-01-29 16:57:29', '2023-01-29 11:57:29'),
('48fd8e2f94861ecb09d003c962f1c2464c77e1e7e74e4d6598262d13ff49be707ab54daa9850f965', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 00:09:38', '2022-01-21 00:09:38', '2023-01-20 19:09:38'),
('491a88f28dd2d3ca8127a2882447b3eac706cd84dc5a12738eba36a26ab36396c00fefdfa7cba3ef', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 21:04:43', '2021-12-31 21:04:43', '2022-12-31 16:04:43'),
('49881081900f7510e2b1eb2a0c1e0340ceb0d73bd6e9f0bf7fa5f8c345fbbae7a20a0a5dcab36e87', 70, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 20:16:55', '2022-01-27 20:16:55', '2023-01-27 15:16:55'),
('49ce440d0a74efbd0753cc9d5b37c8b40998f057bb955b9f0a2af22cfcc5350b5d36e7dee2814638', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 22:03:12', '2022-01-19 22:03:12', '2023-01-19 17:03:12'),
('49d566623fea3fca48f325d872c3b85e0309204bd10d162f30535838c628b2b1c0ccc6c6308e63a9', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:41:40', '2021-12-29 22:41:40', '2022-12-29 17:41:40'),
('49f18493c692ee01c948370d3cdce85870603fddd036f238a65e7a029934906da0d6f5764bce4701', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:18:16', '2022-01-27 15:18:16', '2023-01-27 10:18:16'),
('4a736bc2e43361d3e363317d59233b23b0064952c0faee2e8d0e8cd2e1ac0d7d21dae0182805a326', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:52:31', '2021-12-29 15:52:31', '2022-12-29 10:52:31'),
('4aee046442f5ecd495072e47a9b1323e4d865a0dba75dca17e146d3e381fbbdbe194d86ac31efd13', 28, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 23:42:28', '2021-12-09 23:42:28', '2022-12-09 18:42:28'),
('4b87ec98be204fa58b76477b9d720440c98697280fc24ed6c01a7ff465975143708270d09b3e5f19', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 23:18:11', '2021-12-17 23:18:11', '2022-12-17 18:18:11'),
('4bd87c75d721319bad20f29797e831a1cca8f00f553ade387ef1aa7fa97f44f6cd2a87df744899e8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 17:06:55', '2021-12-28 17:06:55', '2022-12-28 12:06:55'),
('4bf958775d214ebae23f131a7bdf272ac5cf6f57d3d95cb8dfc7f8f4b7549667d9f199323a62d2b3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:29:06', '2021-12-16 20:29:06', '2022-12-16 15:29:06'),
('4c0f6f1a6a50b04e5defdb5bcf30feb776d78c9246a5e52e22423bd1f12ac5d36f32de16777f6da0', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:48:56', '2021-12-29 22:48:56', '2022-12-29 17:48:56'),
('4cee5ea8224335f66d1b075aeb3467866aa4b86ac596746645a277627ebf5fa6521a6d514a2d1017', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:02:54', '2021-12-17 04:02:54', '2022-12-16 23:02:54'),
('4cfad08796e4a1eecfe8bbdc20e512e0954570168990fa60442ad41b5ecf05e4005cadcae08fbddd', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:29:52', '2021-06-19 03:29:52', '2022-06-19 09:29:52'),
('4d1975e4e039058afee7978df281e66af095bb3ab8e39d7b4253291fcc9c6b9876edeaf797f2c7b2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 18:01:04', '2021-12-21 18:01:04', '2022-12-21 13:01:04'),
('4d4add6c90b0ae6f02bbf6b42ba93945138dbd7f0f2aada75d3241f1d839028ae05a3f0b2a0cbeeb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:49:57', '2021-12-21 20:49:57', '2022-12-21 15:49:57'),
('4d847e500f5143fd510cd7bb60d44ab4556e4d81f2ca36e2276462f0e52261290d67ca19bc9bf7c9', 46, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:10:33', '2021-12-14 20:10:33', '2022-12-14 15:10:33'),
('4de10e77891bf78dcdd20ffe64156afe48934abb5afae6d3379f44381ee379c89e413471fae7c33b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 17:26:56', '2022-02-08 17:26:56', '2023-02-08 12:26:56'),
('4dfbcd71b669b839781fff3b6ea6f0eeea204067f2b460ee50ab6a8084305fe33594683a6bd8e896', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:34:28', '2021-12-20 21:34:28', '2022-12-20 16:34:28'),
('4e246da2b09702aaec3dbb29c9acc8efe5831dadd5c273ebd00302e4d126265b18aa3885cf58adb2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 23:20:40', '2022-01-11 23:20:40', '2023-01-11 18:20:40'),
('4e275af3e0c1abf6eac9f00c6b70b102fabc34d8554d9e6068790dda18614d1533294657ae6b30a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 23:37:43', '2022-01-18 23:37:43', '2023-01-18 18:37:43'),
('4e4baf344cbc8eef1d69959214e9253230a911af115d7022b92cb58b9e5efd6e05fe6a960513f485', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:40:01', '2021-12-16 19:40:01', '2022-12-16 14:40:01'),
('4ea098c60b2a8b61cfcded3c2f9863c580d85cf6c6b62bd9ee151498edc8b842347d3300c002b20b', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-30 15:15:53', '2021-11-30 15:15:53', '2022-11-30 10:15:53'),
('4ea3202cd7e43a325d13cd209b5194af761d4f24a591ff3316d496954c2c9bc90cb9cf21dce4a988', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 15:56:07', '2022-01-17 15:56:07', '2023-01-17 10:56:07'),
('4f4c75d33bbd245b482f40e3702cb969e01926c48f5da5070e797ba08f07e8d1228dc9a640251e07', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 21:00:35', '2022-01-19 21:00:35', '2023-01-19 16:00:35'),
('4fcd236fdd696fe0a9d55eb50e1e28c84f11536dc4743647957e3f7c139d28c308e216523e8f7017', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 01:14:58', '2022-02-14 01:14:58', '2023-02-13 20:14:58'),
('4fdb130e5cf4a00d174e29b37d98782287bc16c8da6f4bd2f750add4bf2a8a99d93e23d3ae31c528', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:49:12', '2022-02-11 21:49:12', '2023-02-11 16:49:12'),
('4ff545a3766b982d4cf0357ff7a480c8483389d1746293f5909a0b184caa3190c139b505c32df417', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 23:08:44', '2021-12-30 23:08:44', '2022-12-30 18:08:44'),
('5064d861e1539b60e97bfb56bdd72138e024290fe8257db647d6393222f40c57934bf5116ace6e22', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:54:49', '2021-12-20 22:54:49', '2022-12-20 17:54:49'),
('508ed458f761029ce2814f089be1da4afab41980739b0c5e26a085d4e712b280feb731f063414843', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:38:05', '2021-12-15 21:38:05', '2022-12-15 16:38:05'),
('50f48e51c5aa779442e5967f6e47122c024b915715fa92e936a016892ed45a4b73c2707222cdaafb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:15:58', '2021-12-21 20:15:58', '2022-12-21 15:15:58'),
('51514af74bff9665964c6b7a4169ec655e46acdc4466e577f07733fcb9803cceaeb84b1d735968cd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:37:45', '2021-12-16 19:37:45', '2022-12-16 14:37:45'),
('51a928016ea4eed67ba990ed7c03d2bcfaf79dff5850f5ed11404309d8e7d6cd2a1aa88f1e46b323', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:10:14', '2022-01-11 22:10:14', '2023-01-11 17:10:14'),
('525c56f3c8607b15af852f572616d228df4523470e8b2af70267fecf88be7b01bfdfe3f3ef7c5819', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 15:45:21', '2022-01-28 15:45:21', '2023-01-28 10:45:21'),
('52d3056d7e921d579ea171d374ad9950d680d5e12a1013787e766461e1cc54cef51d3f2b3d727fbd', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 21:21:34', '2021-12-30 21:21:34', '2022-12-30 16:21:34'),
('52d998d55fd3246b5ac7e8675c0f838acd855c44c0cab0714fd1480bf252fa4d478e84ae79dffc6b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:51:40', '2021-12-21 19:51:40', '2022-12-21 14:51:40'),
('530beb7dc1f19deef4d2117dd58e683aa6b2b9f7fcff7f331a984d4dc3408736a2776ed337e49dda', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:53:50', '2021-12-29 15:53:50', '2022-12-29 10:53:50'),
('5335db5ee61ec0260324179e13a0d461b77585441a4537a6ec42259492e93eb9e31e0750750aeb2f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 20:40:22', '2021-12-24 20:40:22', '2022-12-24 15:40:22'),
('539b095147f6b389bc3801b7985ec557beeee80bdc91b573df9ca15e0a11a80584707ffe7a8ab36f', 62, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 22:13:32', '2021-12-22 22:13:32', '2022-12-22 17:13:32'),
('53a03e68d7c4247bd92620e7b396d519535e3b5f48ad926f9b0c5f5c1755cc4166e45e3633105c99', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:50:32', '2022-01-27 15:50:32', '2023-01-27 10:50:32'),
('53a7b4569f7fa77f41689fb8ce945d055685e9e4fb90341d2a36dab9bec236a0a8ccced794120f29', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 21:56:10', '2021-12-22 21:56:10', '2022-12-22 16:56:10'),
('53afc11b36d08435d8ec82c42305f7aa4397d10b2d296f6e7d819e091d0d7c6d48e14cdc5e66e6c9', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:01', '2021-06-23 23:08:01', '2022-06-24 05:08:01'),
('53df1c6d839c0335c9c82794bf727b9fcbdbff7e8405f2c4ddf556a8373a3fb6d6693d5aae38c4f7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:57:56', '2021-12-28 21:57:56', '2022-12-28 16:57:56'),
('546715cb8d7527f5f63e9223a3632ea05639584eecfb3d39ab9a5ad249e56a800ce4058b09c0b5e4', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:05:27', '2021-12-09 20:05:27', '2022-12-09 15:05:27'),
('54a6880e76d8a3b74eaacab52fb8f0ccdf1478e478245e5ed323f01e4ee47bf2bbcbe0b1cf4a7517', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:52:47', '2022-02-10 01:52:47', '2023-02-09 20:52:47'),
('55513841a7d4a39c4f081de69c758fc4b8d96c9bf9833f25c83053a44eeb11dc742e7c0cdda948d8', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:32', '2021-12-14 19:59:32', '2022-12-14 14:59:32'),
('557179389eae67a9cd5cd0382d7c8412b9cdbda1b11bea9ca6b0b59fb8a8c43020758119533d0be7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:02:21', '2021-12-16 17:02:21', '2022-12-16 12:02:21'),
('55ac18ded9f3a4559bc727f345ab389986b8725f91ea8a0cbc03eeb57f53cb39d1d6c66a301cbd96', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:35:16', '2022-01-06 14:35:16', '2023-01-06 09:35:16'),
('5621a00a2ed41f27e39092394268bdef1df2f9a60302da1ab3d866c7438eaefc257336d480fb63fb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 23:03:52', '2022-01-20 23:03:52', '2023-01-20 18:03:52'),
('5646d6337aaed0e662c059ed368372e2da241ff97a42df56310667ec321fdbf2252d92771988640a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-04 07:37:55', '2021-08-04 07:37:55', '2022-08-04 13:37:55'),
('566ae12dc4f5fc45807ad191f0f19bef3e4977cfde56278ed9d9c88b549e26645736bf060c25a296', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:39:37', '2022-01-11 22:39:37', '2023-01-11 17:39:37'),
('56a2ce72b3e8ee1948f326ad4e88b9c9d7fa5c63edc7609e300f868ae4f41669dca7edcbb94101b5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:13:57', '2021-12-16 17:13:57', '2022-12-16 12:13:57'),
('56d1d893e4cc470509aef79223c1cfe002f9eb656965c7fb988e4154e386a86c38b6d9cff3e4a987', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:16:19', '2021-12-28 15:16:19', '2022-12-28 10:16:19'),
('5726fe404280b5521fb3cc6dc293e9f1ff4a2388f3e3a8a8aeee2ebc18825a3fe3e91f28c354c48e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:42:39', '2021-12-28 20:42:39', '2022-12-28 15:42:39'),
('5754dfaf87a7112e9d315a41f6edb8bd59e2c9dd9104a7b70657e114345adf7a1149abc17f811566', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 15:27:36', '2022-01-28 15:27:36', '2023-01-28 10:27:36'),
('5822a65c5848e3ece40d3e946ffe775dd1f6d78b34fdedaaa8f367bed752de782323341d3ffc9132', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 21:41:56', '2022-01-20 21:41:56', '2023-01-20 16:41:56'),
('583665d54bc6242a195004646bb596ec0176a6c46fe6f313db05f4b35db50979ce18f87dbb2af003', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 20:05:26', '2022-01-17 20:05:26', '2023-01-17 15:05:26'),
('58c34cb3f168fe3c108403566797827b92f9500de2b444ca308fc6b136f1027b0729148ad27e6b79', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:51:51', '2021-12-16 19:51:51', '2022-12-16 14:51:51'),
('59551e481bc1fb037bee07e1501d81dad38d4ff34fdca68a49c40d0cf423176ca111940acd359aeb', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 14:50:59', '2021-08-08 14:50:59', '2022-08-08 20:50:59'),
('5974125b42107bc25beaf4c85881d2c7b6cc03ca6d0b67d30c56dd26820624b277e0dbf90e0b4c75', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:38:25', '2021-12-17 16:38:25', '2022-12-17 11:38:25'),
('59c251cf425f2c808b5e279c09481cf7915752dd8462d9dafc6cbb940522cb3126f43a6c6f03ab2a', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:26:45', '2021-12-29 20:26:45', '2022-12-29 15:26:45'),
('59f32277a6f79b926dff7f02a7355577ab5ab31392524eb29e67b5d4d88a8e603358e3cc8b184a35', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 16:47:34', '2022-02-04 16:47:34', '2023-02-04 11:47:34'),
('59fd8b0f6ec00dd9fe5ed553d8dec9f05f77b302def6cd29c558388771cb53be0751e0ea5c30dbe6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 19:41:13', '2022-01-17 19:41:13', '2023-01-17 14:41:13'),
('5a3c120f08a8af8941d9e89ac550eda5515ddb21aeba7866ca35870512e25e0dbcfc06756d66420a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:18:26', '2021-12-16 17:18:26', '2022-12-16 12:18:26'),
('5a3c7e3a7beccc0a374adb752e16679782b42aae2e1f6617976fdc53695328aab1d7a9d7f4416472', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:44:56', '2021-12-14 16:44:56', '2022-12-14 11:44:56'),
('5a670709a54eca91cf497df7791d9a0c1189179f88a8ce879282f2cfd146c07b1da3b3ba4831eb2a', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:41:28', '2022-01-27 22:41:28', '2023-01-27 17:41:28'),
('5a90a13d30e595c29fc300e3b72418ccb4db1a95a8bbe502ae21bd2bf59e82255177265478e98323', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 19:55:14', '2022-02-07 19:55:14', '2023-02-07 14:55:14'),
('5ac75edba2fe3a44665d3aa2d1d4757c263fabc88cb765dee98d187f5d516187532cd0238b99f3f7', 24, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 21:44:57', '2021-12-09 21:44:57', '2022-12-09 16:44:57'),
('5afd8302268e8d6b86dd37ea876149e53eee74385abd3924c95f24586e7a388cabb7d01b3ea9d362', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:14:55', '2021-12-29 17:14:55', '2022-12-29 12:14:55'),
('5b7a3b0b7b9b74015f0114177adb9651c5c36e70ebca9593d60e610795c1bdb7a2f4ce7b54bca0fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 18:27:35', '2022-01-19 18:27:35', '2023-01-19 13:27:35'),
('5b7eda1aeca027253298fedd2bbb236d4964fd2509771ecd25e0c2a57f7c5db50baed632a3b92fb5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:51:20', '2021-12-29 15:51:20', '2022-12-29 10:51:20'),
('5c40a8258f6c1cb920a02e62e90fccacdcfb23dfc1f5c5a57eceff6d55467101d88a0ce729d8febe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 19:29:26', '2022-02-07 19:29:26', '2023-02-07 14:29:26'),
('5c6eb362911195108b126f83fabf4c3f2fb6b30f9cb239f76a23fc859f6622503206f5abd12f098f', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 23:07:20', '2021-12-30 23:07:20', '2022-12-30 18:07:20'),
('5d486fe68999b6cb38b1a854e368136c99fbf2b8951685d5491685e75b6d22ea827aa758e7084515', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:21:18', '2021-12-30 20:21:18', '2022-12-30 15:21:18'),
('5d7428a2dda785fc7ef17d634198ef81f72bae7b27eccfc058c38c29343e581884938de22341f6b9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 16:30:52', '2021-12-27 16:30:52', '2022-12-27 11:30:52'),
('5dde2f94bb1cbd523603b4ad9740476b381fd4c9b9f25f346e1732f2fb6ada2c46443a3d1344eeda', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:04:11', '2022-01-27 21:04:11', '2023-01-27 16:04:11'),
('5dfb1e2281f5554ad03913a995557d3d609fb06f65f9d36e5a6231210a0864d6caf77d5cb4069115', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 03:31:58', '2021-12-17 03:31:58', '2022-12-16 22:31:58'),
('5e07069a2d1639fded707fa4cf878e879280e81949a30ba597c6510b7f820032ba2123fffb0ab76e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 15:37:29', '2022-02-01 15:37:29', '2023-02-01 10:37:29'),
('5e40ffbc18af7d997110533fa6a57e43f36fed24730432b8a323d9f9ff836fceb1c760fe5b316c0a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 15:33:07', '2021-12-17 15:33:07', '2022-12-17 10:33:07'),
('5e6b84edb888992ff2a4ddb31dc3c2266a42def60f5b3beae0dc7415d320a55e875c9c0304bb255e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:40:13', '2021-12-11 21:40:13', '2022-12-11 16:40:13'),
('5e88c838e185c1c8a3eb160bffd76e3cc3d5afcc3a82783c192d9ce0b40ff1270764b3e95e1fda76', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 19:16:07', '2021-12-27 19:16:07', '2022-12-27 14:16:07'),
('5e9e53074a58c2b0774ddfc0ceb5b1697fff74f34feee9c33fde51f7b74257fa1d5cc215024fe794', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 18:08:37', '2022-02-01 18:08:37', '2023-02-01 13:08:37'),
('5ef96f9918d72a0e3fb3495a8426d63c635540cbb0b56c913b14c295d4a0fa7a9ee4e45604263a55', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:56:13', '2022-01-06 14:56:13', '2023-01-06 09:56:13'),
('5f9df7eb875a4d785e342ea512f66588b58d1c0eccf86b43e063c5104bd0c9308a4cfe9c73842d45', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 21:01:09', '2021-12-21 21:01:09', '2022-12-21 16:01:09'),
('5fe1218a10392bf2b7816dfd7bbe0f73eafcd6b2b4d5399835dbb261d07e9636fa212d08e4c478ee', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 22:13:01', '2022-02-12 22:13:01', '2023-02-12 17:13:01'),
('603a0fb4de60167aa15ee17ba56e6a1256021981d3375fbb120bd3d677cc48c6593cd08b2c37bba8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:57:29', '2022-01-10 22:57:29', '2023-01-10 17:57:29'),
('607a0fceda4a6390afbe3cfea872b23d19418bf5d2818efff91fb27a0b2c9e12707bfb06871ca11a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:17:07', '2021-12-17 16:17:07', '2022-12-17 11:17:07'),
('60baf4fb3c434543eb8d97c385f08d78e6fcd61c6d335ba89f5886967b65e238d1d9d05d4ce92939', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 14:53:17', '2022-01-07 14:53:17', '2023-01-07 09:53:17'),
('613bcf85582c0ce12a18a9c32a8d4ffc53363c7dfb54e3bbc35c5054f3b20fb0ca7776c0205c9db4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 17:19:09', '2021-12-17 17:19:09', '2022-12-17 12:19:09'),
('6141e138cbc70bb267b4bd47373796c2ecea2c289212ed54646816f9f769f96f6db0df0767529d39', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 22:01:50', '2021-12-22 22:01:50', '2022-12-22 17:01:50'),
('619acabe33b03cdac9c1479ecd62fe8891f9567ecaca2c813ea751cb31f631039c1736b9a3bde01c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:09:16', '2021-12-17 04:09:16', '2022-12-16 23:09:16'),
('61ad25dce59b3ff54341ffda3ebd0ec36f9d6686d41805e1d2641c476d49c170e2887741ad870c49', 11, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 19:44:23', '2021-12-09 19:44:23', '2022-12-09 14:44:23'),
('61f98218d04bf967a804319c5a8cf07615b9c4b55e98d064a7bb2a5d6300d4ab0e5f1b2eb5609532', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 17:48:24', '2021-12-11 17:48:24', '2022-12-11 12:48:24'),
('61ffc24fa5dd848d4434f865559dcbaf76c200a56e78f4dde023a71f3c2335cbe63f3a85cb5ac833', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:25:16', '2021-12-24 19:25:16', '2022-12-24 14:25:16'),
('620de5f10cbde0ba94c38f3cb710da3537a47a2955e4271c34d20af532a7b8a0c0f9b47c20832790', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 17:02:09', '2022-01-08 17:02:09', '2023-01-08 12:02:09'),
('62334db8fc9782fd4d0c8d2f7cfa3da2af432b7e16a2b056499836118031ab9542cf41238faed1d3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:20:55', '2021-12-17 06:20:55', '2022-12-17 01:20:55'),
('639c557193be4ce53bf94cc016ee314576f102086fa0419d9275dc8d5989464232758236ad90ca96', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:46:42', '2021-12-11 15:46:42', '2022-12-11 10:46:42'),
('639d8f2b6126db7b52977020f49fbca03ebb1541b99ae64b8f7cb69d9cabc2213c6fa300065126e5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:26:24', '2022-01-20 22:26:24', '2023-01-20 17:26:24'),
('6434c771a6ee4b630d773f0c34e7bde0bad8ef8e36542cdb70f3301027eb8501be7d102ad2326828', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:15:30', '2022-01-27 15:15:30', '2023-01-27 10:15:30'),
('645d8e19bcfb5dbbe5b98959da1a90cd06e84d0df0c221f3ff1ae221f1c6601ca19a7d13e6348b88', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-29 16:42:48', '2022-01-29 16:42:48', '2023-01-29 11:42:48'),
('64c08d13abc96b52f74416c89e0356d46c164c903488a11f6621730ff27f07fe9a6c514a38d228dd', 48, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:15:17', '2021-12-14 20:15:17', '2022-12-14 15:15:17'),
('6517df0b63770cb50a5eefae0e4817a49e899fc9d6d803fb1f4269a2ede8e0a13375dc7472fbe342', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:30:48', '2021-12-21 15:30:48', '2022-12-21 10:30:48'),
('65a8a75308fa5753f0e3fc7d8783c3ba5a76abc6bf47faff4c8a7ea9b0c66142d9773f376b614c96', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 19:59:12', '2022-01-06 19:59:12', '2023-01-06 14:59:12'),
('670311a9b685c6f6133008f69e162282b9c04764b5d98633111be828c0bf709592b5513c0ea134be', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:18:00', '2021-12-29 16:18:00', '2022-12-29 11:18:00'),
('671a1e154b70cdad54f5c49cce1415eda689cf92fa10b659a217e8fbe8ddd8527ffc9938a3cd1cb7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:33:08', '2021-12-16 21:33:08', '2022-12-16 16:33:08'),
('67543c74bf4f66e3d5add2bd6be5e71429cd6a5154dffcee81185efe13ecae96171f0335885fd5e5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:20:08', '2021-12-15 20:20:08', '2022-12-15 15:20:08'),
('675ed380f01b20bb9ddda8227787ef026b6dec02fd7aafcee7832b531c65f8873088bd70d04d3115', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 01:13:17', '2022-02-14 01:13:17', '2023-02-13 20:13:17'),
('67a79dc6d8c62c6b815a79d268e4e72922dc25bd76fb6ef85eb67774567133ec03dcc140f5dd0c59', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 21:39:11', '2021-12-27 21:39:11', '2022-12-27 16:39:11'),
('67d7a7286a9c8820886bee0003b80485e7d43ff1ea797dd60dbda8d8f28c64aebe00d24fecf64d95', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:12:57', '2021-12-16 20:12:57', '2022-12-16 15:12:57'),
('67e393c23980b90be69ae3c0815add94a6620c47430ae1571535f22ed101beb7f67e07d444cf0a12', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 21:26:36', '2021-12-24 21:26:36', '2022-12-24 16:26:36'),
('683f8204f7c87fc0d2cd173fa972cc78d8934c52724f14f9ec4e3f09f884d7218288ae12bb3e1c3a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 16:06:37', '2022-02-11 16:06:37', '2023-02-11 11:06:37'),
('68905ae570e1dfb44be2a9b8f09bd2547b9568d27e629e8aa667385915242fb97775a1d4fb56ec0b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:31:53', '2021-12-16 21:31:53', '2022-12-16 16:31:53'),
('68b06321c4bbbea81e7dfcbd8d5fae1a94a2fa0500041ee5774be2d9300c1ff7590d03604b77514a', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-28 02:33:54', '2021-07-28 02:33:54', '2022-07-28 08:33:54'),
('694e9da5c13f8c5bdd521ef7720f5038c2af4fd17c5075f13edc0022f6bc554f6ccb1b53fef703dd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:18:15', '2021-12-11 21:18:15', '2022-12-11 16:18:15'),
('69592f2a9591147d8b35d3b47f68bcaaea5e28407a9a5686f73a38710af0c128f24092ca492d09fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 23:38:04', '2022-01-08 23:38:04', '2023-01-08 18:38:04'),
('697c1fdd5755ea88f7b5ed136cee27ae03f089c7a0869a521587e1e8c9ac2308343bcf2a123b4b97', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:55:04', '2021-12-14 17:55:04', '2022-12-14 12:55:04'),
('698e6fc98d418ffed3b6ca6102815256383d9eb59ef20f6569ceec592d792ccd92286275e3de5d39', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 03:41:09', '2021-12-16 03:41:09', '2022-12-15 22:41:09'),
('69d06ffe12a089993c43762bd7d3f8e175476409c5a12e3bb68a8b6e9900cd73e7e804c40f47e925', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:38:36', '2022-01-20 22:38:36', '2023-01-20 17:38:36'),
('69d3392e0e7b1f356c30056303dafec8623a33cf54e206e3d02d76fd7b020d5490721adf97b8f8eb', 69, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 17:46:13', '2022-01-27 17:46:13', '2023-01-27 12:46:13'),
('6a09cd74e1a42ee9352510b33da36448547280639e1b95a94099f62d9b90ac4a6124855819cbf3fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:09:33', '2021-12-21 15:09:33', '2022-12-21 10:09:33'),
('6a0aa2363769616c2ea2c22c9f521200483d6bf01e1baddc27bf2c12ee316d02793f74c2f2f6615a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:38:38', '2021-12-11 15:38:38', '2022-12-11 10:38:38'),
('6a60c136d4bb871a6af85b3fd2bb19d94d5d1bb977670af04bc5703f08f04bedd896f1814abb8253', 50, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:50:01', '2021-12-14 20:50:01', '2022-12-14 15:50:01'),
('6a6de3a1d8092ea2410d8d76e3a2922e27784b4fa641710093707974b59775e6f4d4632ca8d8f426', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:40:07', '2021-12-28 16:40:07', '2022-12-28 11:40:07'),
('6a9917ed02fcd823ab122092c2168d29be3333574001d205ba73c32d6e0d030f33195aaf62bdb1bd', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-26 15:29:11', '2021-11-26 15:29:11', '2022-11-26 10:29:11'),
('6ae2c3f340c35aa3d951433424789658c52cd1f1f2b6a0216f9d077a31e432768325c467bafe5f31', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:16:58', '2021-12-29 17:16:58', '2022-12-29 12:16:58'),
('6b017b63d54d0d9391aabf67b6f79ace65e21464c86c7d98d6ceb2e57c9896d42f42b5a5d922982c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 23:17:50', '2021-12-20 23:17:50', '2022-12-20 18:17:50'),
('6b266a56db6b3ad88e7ad7814f3056b4b34949a2bce2136701daeb867fc31bcb9f993676bab3b2f6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:21:35', '2022-02-11 22:21:35', '2023-02-11 17:21:35'),
('6b2a83bc6b28daf30a3eb7824a55ca89c47dd76025e0b495838c51f903bff0ce1a132f4d1dce5ca6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:48:58', '2022-01-11 22:48:58', '2023-01-11 17:48:58'),
('6bd8ade1c8be54a5746a7718f32ce7a989dc7c61796e0b05ef5a488aa7e2b88ef6e1592e8bcd8ab6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:02:58', '2021-12-20 20:02:58', '2022-12-20 15:02:58'),
('6be42d107e38b8af1099ac191d48b9950d6477f1411eef96715fb14fe2e0f32d39d29c41aeae7494', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 19:49:04', '2022-02-08 19:49:04', '2023-02-08 14:49:04'),
('6c096b90ce5563e8625da63518307ebd5d9fdb6dc925a91ceb533f35d277c1bae3cae4a4f93e6c4d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 20:53:16', '2022-01-17 20:53:16', '2023-01-17 15:53:16'),
('6c253eaa7349cdb97709f59c2032804e8121f5c075729d6a6aedad1f6dc818d0fc90002237ebac18', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:12:37', '2021-12-29 17:12:37', '2022-12-29 12:12:37'),
('6c2b4acef03e3f60b65d57298b4d94144e6d63e100d10c0384ea75882eef8524ad1ff40bf6d6d914', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:50:00', '2021-12-20 20:50:00', '2022-12-20 15:50:00'),
('6c3035b8e7435a38380001c70c6ca22cd2def61644080c3b8119e3d87c45f47debe61064e7e3030e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 16:44:25', '2021-12-21 16:44:25', '2022-12-21 11:44:25'),
('6c8b868758534394a7a65d2d71d1447c6ad9e1873f3896b8af01ee4872690ea5b9deded3eb3543c0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 19:56:34', '2021-12-20 19:56:34', '2022-12-20 14:56:34'),
('6c9719ab6d8d87c320fb2e16ebead184e99a1bb176f44bcdbfd000feb50bef360be3832014d2eb52', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 05:39:59', '2021-12-20 05:39:59', '2022-12-20 00:39:59'),
('6cda0d3c28edc1f8e924d9eb72d58d3121d4fb2237365178c4ca77b0c7a356abaf2913005a0e90fb', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:15:02', '2022-02-10 01:15:02', '2023-02-09 20:15:02'),
('6d4e03bd6fa5a01b2e5a968ff2b74f8ebaccfcbd61aa1b4b440963c6fe6562cafc849dc4058115a7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:54:12', '2021-12-20 16:54:12', '2022-12-20 11:54:12'),
('6d541fd5f68cca87ba2366b1d1933f5791325a4125e8fd776d96278b0c1a8cde18df0a872269c6cd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:01:24', '2022-02-14 22:01:24', '2023-02-14 17:01:24'),
('6d7239839fe188ad1c7f42dcf8d9add04302072a8df779253542120b1da5dbccd3ff2511e714794f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:44:48', '2021-12-17 16:44:48', '2022-12-17 11:44:48'),
('6db93b5b7d42beeeba026436182398e2903f2866718819dc828c8c366c0033edceb09207a8096034', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 16:59:35', '2022-02-08 16:59:35', '2023-02-08 11:59:35'),
('6e40065f33432a11bad9a0a355de35af71fa472611eb7199b25e1f1a46886d32c4c0bc1c6b785db6', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 04:43:42', '2021-12-25 04:43:42', '2022-12-24 23:43:42'),
('6e425cc1a7878707782eb91b148dcb44f35811b110169dbcec06fee140b9857d304ca5df18623002', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 16:00:30', '2021-12-17 16:00:30', '2022-12-17 11:00:30'),
('6e6b8b87b05ffd3ad6bd171519b15ed4f48650dd1a280eacea60a3e56ea6db2ed3922b6aa1c34bbd', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:22:12', '2021-12-30 20:22:12', '2022-12-30 15:22:12'),
('6e9104f397b4887cbb9408b15355a8245ef9697ad145e4218742a30e9b10e658ad4ac3229cf04ab1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 21:42:40', '2022-01-10 21:42:40', '2023-01-10 16:42:40'),
('6eb4e80f6e13f5a733710f688263b3f01b0a0bbd12f3769c96c07f9aa94ce80d18732e8ffea7bf8b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 16:29:38', '2022-02-12 16:29:38', '2023-02-12 11:29:38'),
('6f397044d1994616d2f2291ba5d197112de40af3377e25f9d76105952aa550977880449ecee4ecd4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 19:55:56', '2021-12-10 19:55:56', '2022-12-10 14:55:56'),
('6f5daa1566d33a1bb13dab80a704754cf11c552aff82fd5386af43f669d19eb8ae1b98823d2e8753', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:55:33', '2021-12-16 17:55:33', '2022-12-16 12:55:33'),
('6f6d2fb26f1673f387ea098de7dee41be9ea951198849231017f8bf4c25cdd6783ac567ec13a8f69', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:16:37', '2021-12-21 19:16:37', '2022-12-21 14:16:37'),
('6fe8c22dbacbc7782b6fe87ecbeacd452bb8beebd8d83db01af3882de84b20267dbc20cfb84f1d0a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:26:07', '2021-12-11 23:26:07', '2022-12-11 18:26:07'),
('702bf41d8b40f3073f6b649f16be0e2a1d71062d05ace9240550c2e307157c6b4cd1a982859573b8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 20:55:04', '2022-02-08 20:55:04', '2023-02-08 15:55:04'),
('70a9d645ece9cc907d0c5fd3691c9c1605fdcbe6091101c5c093eda5df300a7347f9486180d503b8', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 23:03:07', '2021-12-30 23:03:07', '2022-12-30 18:03:07'),
('712cb98b644f2f5912642f41cbfbec80788bd06e2c54019581d916756e4cbadc4cb01bdc5fa39b4c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 23:22:00', '2021-12-20 23:22:00', '2022-12-20 18:22:00'),
('7155a8c2ce9a272903009d620646bff4b15b9aa816217322b6e022c3c38505766a63489bd2d74add', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:12:23', '2021-12-16 21:12:23', '2022-12-16 16:12:23'),
('7174161de245a82b9deec5165a834ceab46ad5d9d50197c13dc29c87c7def12108f99fe8bfa0eeab', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:18:46', '2021-12-29 17:18:46', '2022-12-29 12:18:46'),
('723ceee668cd1a7fc2e977be48cab3f31aed1ace0883692711b5cc2ddf42c2f23c6d75461172105f', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-01 05:46:27', '2021-07-01 05:46:27', '2022-07-01 11:46:27'),
('724dccaa255fbe39ae7068fb343238d5f9698b0060b503d9702f16028267f479f10c73f8e0083b20', 27, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 23:31:03', '2021-12-09 23:31:03', '2022-12-09 18:31:03'),
('7271e913fcc497e11097261664193f5e9a18f206ef0672f8df31c9c45199c6f33ab7b3bbcc551568', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 22:44:12', '2021-12-14 22:44:12', '2022-12-14 17:44:12'),
('72a9a2ffe2998fb435112a3415d997bf4a47a7459948113291bcbbd95b22952a24bf356effd50bd6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:55:55', '2021-12-14 17:55:55', '2022-12-14 12:55:55'),
('72ea29d420915c5fe075afd952a20ba099f7b6a49c0547321f914a10b7b9d276006c0dfa625e11c2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:54:07', '2021-12-28 15:54:07', '2022-12-28 10:54:07'),
('733a3b3e1e8ac33c7c9666caefdc1814fb58dd806daa30cc37d6c04f5419c77dbc430ac2cfa868e0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:31:17', '2021-12-29 15:31:17', '2022-12-29 10:31:17'),
('734658484955daa2aa0c8d28480cae43b8e2e74a80b8809bd00d8380f5438464cd1be7e2de586c53', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 00:20:53', '2022-01-19 00:20:53', '2023-01-18 19:20:53'),
('734842138a0e8a0f4ee2955b10368dc393b668b65e11f9581454bc28ba5d64d773f2cfb77706c139', 55, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:28:05', '2021-12-15 20:28:05', '2022-12-15 15:28:05'),
('73d3b4db7a7ce12cfc5b137d39956f8bce0b12d264303d8da413c557046a00c5baf6a2a7c7c94991', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:51:48', '2021-12-20 22:51:48', '2022-12-20 17:51:48'),
('74553b0beee06e3f10dc9a47ea48ce07402f7c31332f783c289620c3c5253237a0b4bd4fcc765ab2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:32:02', '2021-12-16 16:32:02', '2022-12-16 11:32:02'),
('74c782b75d61269f1e406e6b9db052d0d27e888d4e24c4f1ef253928b0ee4c0382bc936447fd9038', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:25:10', '2022-02-11 21:25:10', '2023-02-11 16:25:10'),
('74e2dd27429bb92c12e33f891ccff32f48c22463166666705d145cfd8968d96ec992fa2cc3a36e76', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-23 23:08:23', '2021-06-23 23:08:23', '2022-06-24 05:08:23'),
('74fc4d79a314606acbe2f2c8b8d706b922a4fb555df14976d230aa9baae58f08dce5d545bfa50667', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 16:02:39', '2022-02-08 16:02:39', '2023-02-08 11:02:39'),
('7559fe1e22b980dc4d5b4894929f84cb2d42491577330c0ee7a2a044d6c56817c41ddb81a1586297', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:11:53', '2021-12-20 21:11:53', '2022-12-20 16:11:53'),
('763291cc03ae4b2b9c4f8165712e40f6f3c1ecfd8685e0baa3d6b50439592a0b1c70388a793f9d82', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:14:51', '2021-12-14 19:14:51', '2022-12-14 14:14:51'),
('7674724c5e0688a4e8e52793c1641dc56879c6a28fa63e51d72ca8be80e3b0aa6fa5276b8a620df6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:05:18', '2021-12-14 17:05:18', '2022-12-14 12:05:18'),
('769f98ada8e9b156cb412d2ad554821aec4e67cc91fd71e7036243683b4402bd4d5a8256f2dce3db', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:37:42', '2021-12-28 20:37:42', '2022-12-28 15:37:42'),
('772f731724aef613fd77a30b0109627b86f7c6105f96ac9d00c9efe0f63754471d32dd7c663b7552', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:04:51', '2021-12-16 16:04:51', '2022-12-16 11:04:51'),
('77743e7dd9c48d16071aa0b01ae4a96e17adc5989d86128589b88f5aade8f62d2934f62f9e5dadc1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 17:09:02', '2021-12-24 17:09:02', '2022-12-24 12:09:02'),
('777e3632ef5f1a2fa8b70e50bc56ee1c2f4d6f88d5712527fe04e42a34e5f026930ece015a3b4a40', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 19:40:28', '2022-02-08 19:40:28', '2023-02-08 14:40:28'),
('778d4143a2a15394a748ffbeb2b5d83da5a6a42d85d54a2a6c448fc624dbe9167ff4d59e37f599a9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:37:15', '2021-12-11 23:37:15', '2022-12-11 18:37:15'),
('778db0a1cdcc836377a9bc8b90067286e9473cbae9985f848a6b7558bacea2b99257e9eca8ba1e30', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:45:35', '2022-01-11 22:45:35', '2023-01-11 17:45:35'),
('77c9389b2ab3031e09005a7e7be90d00496ff073dbbefeb57229cee5d0a240376c1f7c3c8a94faff', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-19 03:38:22', '2021-06-19 03:38:22', '2022-06-19 09:38:22'),
('77e9cb82429dbb6a147f913db57c5b6c28acd5507952843d6d0cf12aea1a63138015b6403a00c580', 26, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 23:30:17', '2021-12-09 23:30:17', '2022-12-09 18:30:17'),
('78f4525fdefd0bc5e89bc9306ac6e411b2debe73bb60d37837033f4fd1edf21b9cc9cff7b84cc299', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:38:22', '2021-12-11 19:38:22', '2022-12-11 14:38:22'),
('79133f9fe03f8d51dc18ee741e1b72311dca8ae224d9301505c90ad52f70f2eb44f67d6eb38ddc64', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:46:13', '2021-12-16 20:46:13', '2022-12-16 15:46:13'),
('7915da1f4c23b9bd788096eb1c89c1a10641ba16beaa337ec1bf83dc09a7f1a3573cdec9bff90b32', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 21:02:29', '2021-12-30 21:02:29', '2022-12-30 16:02:29'),
('793564d6fc288dcb645e411ad1e614e23415bad44b4abab6c2f516d6e992591e030b3fa8cdb9c9a5', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 05:16:45', '2021-12-18 05:16:45', '2022-12-18 00:16:45'),
('796561666a0bffbcd1e8ad3347386fadd7b236aa4b35b58e375a7622262636ff4a44815994a5683d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:50:51', '2021-12-16 19:50:51', '2022-12-16 14:50:51'),
('796d424d92ed2b9fe6e8d94fb28b53186949c9b0d0c7611738e651f1870fbc706db9c1662f6e381a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:34:17', '2022-01-07 20:34:17', '2023-01-07 15:34:17'),
('7a0b7aa62d42d6719920fd6c6180392c7eaaf2443db8316ab53b3b68af60d25d36eae89f7d5b6959', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:02:22', '2022-01-06 15:02:22', '2023-01-06 10:02:22'),
('7a53d8f58a9878ed0f6d1630fa81796b0dfd4b4a3428cb111e44944207bbe30d4014228df7d84b07', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:25:57', '2021-12-15 20:25:57', '2022-12-15 15:25:57'),
('7a6bb32c808be550a846c3083f53720e77e9d6b8fe66982a460d28808ea7c9abce7f29ac5db76ade', 64, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:31:45', '2021-12-29 22:31:45', '2022-12-29 17:31:45'),
('7a6fb4ada958015754e089a9bd15b24848dd85828ce804dcb94897edbe46fefce26f3218484064e2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:34:41', '2021-12-29 15:34:41', '2022-12-29 10:34:41'),
('7af35733ec18ea4ad22a436c9d7c33d17c1fc60f1a0367592f509795d6601108ded239e3a143c9fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 16:53:05', '2021-12-15 16:53:05', '2022-12-15 11:53:05'),
('7b2ecfdf4e6b18a639a127841ffac671eefe2df6730634dfcbc0670a7603df5fd237ce4a800afbbd', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 18:11:53', '2021-12-21 18:11:53', '2022-12-21 13:11:53'),
('7b814b97f6735aeb95f0f2f6ae0078875ff1cf774eb451a7197293f0e57c56f26d8aba57f6852560', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 20:38:58', '2022-01-10 20:38:58', '2023-01-10 15:38:58'),
('7bc8d79ea6583fcfea5e3da9d98666e4ab958e576e48704747aa3ea77c813f67cbb2c913b0ac5872', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 02:21:58', '2021-12-18 02:21:58', '2022-12-17 21:21:58'),
('7c00113a9b7aab7821bac22450ccc2077e324df6323494357a4e43b72413126612376fb0a7848116', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-29 17:06:15', '2021-11-29 17:06:15', '2022-11-29 12:06:15'),
('7c188491a7b1b87edf952099706eda5483782ca6294647b42878420e9d40aefe95994ce4aefa3bd1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:39:41', '2021-12-29 19:39:41', '2022-12-29 14:39:41'),
('7cc819d6b3dece7cd73bf7330ffc4873963efbd603ea434c445814a95e6b40e86d6ed86819705268', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:47:48', '2021-12-28 21:47:48', '2022-12-28 16:47:48'),
('7cda666e054b8c8731f5368f53df16c514242e3765fc5a4af38809fd097121113c9d2f3f2d134f8d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 17:41:00', '2022-01-20 17:41:00', '2023-01-20 12:41:00'),
('7ce4ebf78dafe25c6cb3a4a8f59b178fd0a168854d1f365bb663e286da963059ad0ae1c58690cb66', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:13:28', '2022-02-08 23:13:28', '2023-02-08 18:13:28'),
('7d01658d4a4180526b7c17d365f44f02f6a4e5541d48d6ee865b40143041ef9463d951a6adef0752', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:17:08', '2021-12-29 17:17:08', '2022-12-29 12:17:08'),
('7d05a303b09e04168685c05054cabe3f81579941f3223a7212dcec0abb7c9d234116a7dce968074e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-23 19:13:38', '2021-12-23 19:13:38', '2022-12-23 14:13:38'),
('7d2f74ea7f77a050782b0070f83dd032ce433244332fb6152bff8be1ad739e83e5d414e668b7fa72', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:32:29', '2021-12-14 21:32:29', '2022-12-14 16:32:29'),
('7d34ef80d7e3f4d275b38669b8fcb0d1f61392438bb99b54c1a48de32b85ce1a599b66f9d30bbe0e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 21:40:41', '2021-12-17 21:40:41', '2022-12-17 16:40:41'),
('7d8b578b76d9c603ce9e7b01ca5b275048f6c268f03b9b86af02966bafb8d9b3e9b275d0e1bd9c8f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:15:58', '2022-02-11 21:15:58', '2023-02-11 16:15:58'),
('7d9381c7bb8afdbbe3c0c4ac61c0268e3c2115caca41fccfe7486deb669de6a2787be943465a80e8', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-22 04:14:24', '2022-01-22 04:14:24', '2023-01-21 23:14:24'),
('7d988a66c4253ecf72a2326919241010a8fe71ec1773b95dcae7bf71db394ae6c0a3dc75ab415167', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 20:03:49', '2021-12-31 20:03:49', '2022-12-31 15:03:49'),
('7da9d2b45e00575ca8e19bc5170bb806032bd63ce3390e25a100bd40b87128b62257cb223dbfa4d4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 16:24:46', '2021-12-22 16:24:46', '2022-12-22 11:24:46'),
('7dbacfcb99a94455a55af385d20ae1dedd2021ee81040bb4bfebda9eddad882e39bb06fd6a7eadac', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:39:40', '2021-12-15 20:39:40', '2022-12-15 15:39:40'),
('7ddb0ea402ff2b0a35a1971603ca459dcf9f373d285e007e08ebd6119904465b04520d9e82b52005', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:44:13', '2021-12-17 06:44:13', '2022-12-17 01:44:13'),
('7e0c3fa368926bafdc102c77f1c685e7cfc73b2559411f2ac394c59477df288014564d5a1ec30b5f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 15:24:26', '2021-12-27 15:24:26', '2022-12-27 10:24:26'),
('7e76ecf57cdb8c0609288f4e2925cc6affee94f4e6563507e9f3431e7c457e99662791feb9b97d7c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:57:50', '2021-12-21 19:57:50', '2022-12-21 14:57:50'),
('7ed1b7a99c012517a99f145e5a753e5e150f80b87f53fd1b4aac016bfb97875fbddeea132d87cbec', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 22:46:53', '2022-02-07 22:46:53', '2023-02-07 17:46:53'),
('7ed6df1507da52a078dccf518fca3b2ce7d8a7f54ca2ab06fe76a52bece3c2ad93c662dcbe35864c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 16:26:37', '2022-01-06 16:26:37', '2023-01-06 11:26:37'),
('7f299ea7e83b6e233a044263e2447b0be5cc63bf27a03389f8e6a0f514007b2e0afb3796aaede093', 36, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:41:45', '2021-12-14 19:41:45', '2022-12-14 14:41:45'),
('7f87471f0a8cd0c788ace6c025d2a2d3e63d1693e7b37b8e3976a627f320a52ac42f7b808b5469d4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:49:37', '2021-12-29 15:49:37', '2022-12-29 10:49:37'),
('803472778b83763ba3ba5a33ea6bbb7c7385220075e8422f67f6c8f5d2746777eedc7c7409f43e14', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:26:33', '2021-12-16 20:26:33', '2022-12-16 15:26:33'),
('80a27ec682bdc19dbb00ff04df6bdc9d7cb80a53532ed04ecfccbf55cf4d0f842ce2f5fef0dd953f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:00:19', '2022-01-06 15:00:19', '2023-01-06 10:00:19'),
('80e0a29a4e7c3437f5c044cb8e08c3a3086ec497b3eb80a9f5b2c46b4bd6d1635462f4b93d75a03e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-13 17:33:04', '2022-01-13 17:33:04', '2023-01-13 12:33:04'),
('8109270466f81a13104ea570349751a7599c12d792dcad65449b0f93daedc0057580934654a94db7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:11:06', '2021-12-21 20:11:06', '2022-12-21 15:11:06'),
('816a28ee557f8ceead0873a9b2df89227d80e3f4fef70d713453b3dcea99a213e42bf69c319f0f70', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:35:42', '2021-12-20 16:35:42', '2022-12-20 11:35:42'),
('81730dc5348b6c8fddfa63002b2a581684d092850d5f9a4d65d150718b4f44c51d27ba4841a96aee', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 22:24:35', '2021-12-27 22:24:35', '2022-12-27 17:24:35'),
('81b4a59beeeee556734af0656f9e61bd619caa8a722dbc1504741b32c58a1294f4799366df707835', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:42:08', '2021-12-29 19:42:08', '2022-12-29 14:42:08'),
('81eaca9a07a64e480d766ac915f4cc1e1e3ea5cdeb4ae85bb82aa4861c7ee49ff1e3a1609c76bf04', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 17:59:00', '2022-02-02 17:59:00', '2023-02-02 12:59:00'),
('81ffeacf62cce986bf45b5bb6c055dcde57b7b88b2a775ebfcd4309ab5c446f2c52a6bef52b05c60', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:48:23', '2021-12-16 16:48:23', '2022-12-16 11:48:23'),
('822bf524f63b6c0ac09a03f198d2242ddfe85f6e16d73370b0cca46c48b1a87047924a59fb5be022', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 22:43:21', '2021-12-11 22:43:21', '2022-12-11 17:43:21'),
('823c2e17e6300ced0185735c1098b34e90eae5484e8e78f3311876732a5f2045ae643d01a0046b07', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:04:31', '2021-12-16 20:04:31', '2022-12-16 15:04:31'),
('824cbf0f189774575b1562e05bba3f71fe3a50f537f4ba89509ebfedfb5374c793d7db827ad33591', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 21:44:54', '2022-01-20 21:44:54', '2023-01-20 16:44:54'),
('82588ce3e8da2e8d90a71f1aa407c9a499ef3792bbf41f722b1a665f67e2d6cad8e2c7f16dbef3ea', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:56:35', '2021-12-20 21:56:35', '2022-12-20 16:56:35'),
('8287cd2120343dc0e591c549450ed681bf05a7251d0e4b1684b2442ee8a30387ed691a0ae7aabd87', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 15:55:34', '2021-12-17 15:55:34', '2022-12-17 10:55:34'),
('82f33a70feff1811b64a394ef46f59d43ac997c76c06e1eb2cc5af7be452d6a089e6ecff1f61647d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:34:17', '2022-01-20 22:34:17', '2023-01-20 17:34:17');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('830e98f0a47f629fbf64634a8d792537f7746aca4503217fd2756ee4c7b874acfd07e2a1dcf01463', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:50:16', '2021-12-24 19:50:16', '2022-12-24 14:50:16'),
('838788d97ba81434ecd78595074132af71f40ca441bb7154ed45ff5c3a252928bf5366de7ccd3be5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 15:10:47', '2022-02-07 15:10:47', '2023-02-07 10:10:47'),
('83c85f320e227bd394278114db553d01de158e21f88076dd2c31ee2ed4e061ebbb195f3679268358', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 20:00:21', '2021-12-10 20:00:21', '2022-12-10 15:00:21'),
('83db329712228e590da3fffca2e3cc7fb4a0d89c14d718d6550452aaf384ed8cb300317dc37ccd6e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:40:52', '2021-12-17 06:40:52', '2022-12-17 01:40:52'),
('840119e01730cb999ba4ae610d40dd2d4cdd22e421bf57f8be82579e2c914b42e61d087c42b83e96', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:57:12', '2022-01-17 23:57:12', '2023-01-17 18:57:12'),
('8448e887d8b3c54c3d9eb546228dc6623113c1cb9878ab393d823c817e97e550d8b90b4cd2666a72', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 16:49:56', '2021-12-21 16:49:56', '2022-12-21 11:49:56'),
('84bdf817c99cd805c510872016b97db4654940bb9c2904d82b7a02c84f1ef0fad375825de2f40999', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:54:58', '2021-12-20 21:54:58', '2022-12-20 16:54:58'),
('84d2adea22b117996cbec7c2a5482fcfd8fb62bd355f03d14ca5446847bc04df0a51ad9158361158', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:36:46', '2022-01-17 23:36:46', '2023-01-17 18:36:46'),
('84ec72994882ab70653f0fc9fdfd44cb0c614397343a6182498919ce99c44ef14b45dbe1066c7759', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:22:11', '2022-01-11 22:22:11', '2023-01-11 17:22:11'),
('84fef7d80baf7fc54ed2168b37b779c9a2a81e05e7f209d14f6ddb10e3c9eb405c50c619ad40f8cf', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 23:15:26', '2021-12-30 23:15:26', '2022-12-30 18:15:26'),
('852f5a93d6bece3fe0b6582c374b6217730c8c6c02c82448cc47a16a6dc9894169e583b1854463f8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:38:09', '2021-12-16 20:38:09', '2022-12-16 15:38:09'),
('85b6f5b593325f9007ed9ed9677faf32c3a6317eec18b232ca397eba3e5f66d16ebde0f78bb529a2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:19:57', '2022-02-11 22:19:57', '2023-02-11 17:19:57'),
('860b12cab7f179ba198c7f3c4bea14b691d307737b9eb1337c5be2da28640f409e2909e9bf73aabb', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 01:37:00', '2021-12-31 01:37:00', '2022-12-30 20:37:00'),
('8668ffa03f97ebe292bb98354338f7590709e041e396ce674e4c78d4f70e25515d886dcb91f7655e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 23:24:15', '2021-12-16 23:24:15', '2022-12-16 18:24:15'),
('8673c1bf6652f8274972819542df61d2f10b4f90fdfa4d6b324d474944bac28fc7835d1dcbb39c72', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 00:39:23', '2022-01-28 00:39:23', '2023-01-27 19:39:23'),
('867bde79df7612fedc4bd3457b1c1bd64ff2bfad0cfe1573e806027d445d5a2b6ea18a393ff7386c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:54:24', '2022-01-06 14:54:24', '2023-01-06 09:54:24'),
('86b5e975e2af4ef762e20afe04825223510820155a69cb89eb29ba4d7b4580b28edb08e1f62f9b82', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 19:58:36', '2021-12-10 19:58:36', '2022-12-10 14:58:36'),
('875a4bd3a131b7c1300c6f65f01813f592345ba46f1a3bb083c44429ad3ac571557f28b4648a1696', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 16:02:25', '2021-12-27 16:02:25', '2022-12-27 11:02:25'),
('875f887169beaca13af056c4dd13f7466af27daeb3b5a91b855c29572a5327d60358c639b6956e80', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:18:42', '2021-12-20 20:18:42', '2022-12-20 15:18:42'),
('8765090ecfd84742c91da113f1dd9591d9151e7a03d57cedb4ecd90d36a055f4d4f9781bfa709642', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:19:29', '2021-12-16 20:19:29', '2022-12-16 15:19:29'),
('87715f42e9faca7c75f21eb1b5000d567cb8962f28dbbe1d1530bd67e3bef30baa4fd29067daaffc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:21:41', '2021-12-16 16:21:41', '2022-12-16 11:21:41'),
('87fc4690d7b646dc39debdd70da2d406368e24e47e582dbf3892b42a1d44262e75739e6b4bafbf63', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 23:05:08', '2021-12-30 23:05:08', '2022-12-30 18:05:08'),
('886364a3db2aa445cfa0be0a16ed4b70749f8050daf390450e9a0b5c0b2f2dbe933a1a1d7b8743a0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:15:31', '2021-12-16 20:15:31', '2022-12-16 15:15:31'),
('88875ddc66aab1ef08e3f106d7bcf5347f91d21c8fc51a84910fe8646411d711c50fc94870e69fb6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:24:04', '2022-01-27 21:24:04', '2023-01-27 16:24:04'),
('88d3b615bb681b8a51944677d329b68c54481db8da08ae40503e0ec2bbf175d22767b456fa777d6a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:10:56', '2021-12-14 21:10:56', '2022-12-14 16:10:56'),
('88d7092c388dc87847bfd1ed0276516945c9e374385ba8fd8ea6372a4f66b4c604c5204e31589761', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 17:32:08', '2022-01-19 17:32:08', '2023-01-19 12:32:08'),
('890a951fe73864f414024d855cd9990fd4a89e394cab31f0b623229351bda0bc4f8ada11032c14a2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:42:53', '2021-12-20 20:42:53', '2022-12-20 15:42:53'),
('89641c79226fdb4d344cec12ea95cfe861488ffd62b0710da6e308661dd2bb5885c28dd1f5d40bc6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:23:23', '2021-12-21 15:23:23', '2022-12-21 10:23:23'),
('8981ce4b20bc32a11e8f4ff0f174ae9751369738a1b37344ac5fb2b8cb29ac0df3d24640702aa6e1', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:29:45', '2021-12-14 21:29:45', '2022-12-14 16:29:45'),
('8a20c4f8656e404615f9abc15a95f6754dd87e4e894677647dd17236b95d8a5d7cc243c38457b048', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-04 02:36:57', '2021-07-04 02:36:57', '2022-07-04 08:36:57'),
('8aa5dfd45ec6594ca31970bec765b2ef9db265f512d70c8436d658560aa3c86f57fda68d04b1e53a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:03:18', '2021-12-16 21:03:18', '2022-12-16 16:03:18'),
('8ab76986eb04366804d975f044c1923cc80919c1a4d591c3bf07896ee177e73af086ba97fa36819a', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 17:10:30', '2021-12-09 17:10:30', '2022-12-09 12:10:30'),
('8ac1001acb3767b7a0970faa9ad399d5cb917d4bc2c67672db9f1014d6cdc709bf72512c46884ee7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:29:17', '2021-12-14 21:29:17', '2022-12-14 16:29:17'),
('8af59d034006460bf38a2f46acc0687787840613580f74359cdddc6c57e9f94bbeaa5bda7151995b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:52:13', '2021-12-21 15:52:13', '2022-12-21 10:52:13'),
('8b01cdf9043f78eb13f0399087bea308ce6dcadd0e77e42d2b717cc118ba6fe011b1c69171c0ee94', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:35:12', '2021-12-21 15:35:12', '2022-12-21 10:35:12'),
('8b1971a9452326c20e0d4f2e9125f4ad03d2d6117a699f6092122dc75a85b8a95ec8114ccd5e470d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:00:45', '2021-12-20 22:00:45', '2022-12-20 17:00:45'),
('8baa337d946a9f5d942717f359e06423bac0dcb8853a2951a8b9949264a36898a564b062c8c51069', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 20:01:45', '2022-01-31 20:01:45', '2023-01-31 15:01:45'),
('8bba1490fd4a2aa564aaf78a1f8dea4d3434548444dffc2b4d4029405bdb5298dfe0690110b9b124', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:21:12', '2021-12-28 15:21:12', '2022-12-28 10:21:12'),
('8bdf0b6789c0174f32b997ab0b2372fce411f828573c372376bcc1a86e23d38e711d77d442a69dd0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:38:38', '2021-12-16 21:38:38', '2022-12-16 16:38:38'),
('8bf386501517f8ab44deabe836a399fe57656e626fd3b70b9e95d241b9491875680d0b33687ac93a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 01:25:40', '2022-02-14 01:25:40', '2023-02-13 20:25:40'),
('8c2bd15f01205c4f6c747f1302316f4f710d83b6b799d3d291ec753cecd3d015b72b6e4e1c04d8f1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:19:38', '2021-12-16 17:19:38', '2022-12-16 12:19:38'),
('8c62fae314b84cd5f58e91f9bdf1bea8bd9f96a2cf80b52ae72a9823ce2a513099d9ceae6fb35fb6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 22:11:44', '2022-02-07 22:11:44', '2023-02-07 17:11:44'),
('8d11fee47ab924fde2268cc533cce5686209d8f9b6f53d527aef1f0e522618b761393c76c69a2ee6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 23:17:50', '2022-02-11 23:17:50', '2023-02-11 18:17:50'),
('8d4ab3262a4ac920fbba11c4da97413330d2b5a17e91fa9234622671268c16a3beb793c813bb0e64', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 20:08:08', '2021-12-10 20:08:08', '2022-12-10 15:08:08'),
('8d8b0e1fd0997c93d918022ad4713a5a240a9cb5106de250f947be5e3f2bc59acb033f84aa2c3553', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 16:15:09', '2022-02-09 16:15:09', '2023-02-09 11:15:09'),
('8dc6e09a32b68d43bdf8450d2a9d8ea7322a61b6981303c4dc6903b2f038b51fcc04748802534505', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 16:05:50', '2022-02-10 16:05:50', '2023-02-10 11:05:50'),
('8e77e3e56cae00d7c19ead5c9141ac2b4bebeec2734d9525a589dca1f11c4a75328088a0f5d5afe4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-18 16:21:08', '2022-02-18 16:21:08', '2023-02-18 11:21:08'),
('8ed2f6c112ed847279885e5495ee82e63f82f75cc0274c1111861d8ed653ac62bf20bf4faf640951', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:33:38', '2021-12-10 15:33:38', '2022-12-10 10:33:38'),
('8f253340456a7593a6895c3b13076cdcf948f5f11f990d316dbec34bf7bb29ec65898baf00b3c36f', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 19:58:04', '2021-12-31 19:58:04', '2022-12-31 14:58:04'),
('8ffc458ddbcbbbec17035dc2153c4baeebb5c54796b3a9008f24c8699197a8a2fc1111c36cc1d7da', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-14 07:27:12', '2021-08-14 07:27:12', '2022-08-14 13:27:12'),
('9009fd60fb03a01263f4cb3350fee3074db92ad2ad735f1e8bc09dafcfa6eff75082deba4b4135b7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 15:00:56', '2021-12-15 15:00:56', '2022-12-15 10:00:56'),
('902311e3c7becc183b402aba388c1d391ae53ecd97a8ca749f8486c741c7ce23395585d3132e1ef7', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:33:07', '2022-01-27 23:33:07', '2023-01-27 18:33:07'),
('902e0999a1315a0d886531a3ad2e42afb938b93fcc93db376dfa774ec1c79cac4e5a5e3277d95c0d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 16:40:45', '2021-12-21 16:40:45', '2022-12-21 11:40:45'),
('905782e0c73103348e442056412b1d3e0830bd7a4a81a8e93e124176639a064b35f17c4e7c644ac8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 20:18:38', '2022-02-01 20:18:38', '2023-02-01 15:18:38'),
('90fefbe47fab0d0f4ec6232d41cd95b2a6672bbd8aef1c06402bd4a670135a64a2482afd65b2737a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:34:17', '2021-12-11 19:34:17', '2022-12-11 14:34:17'),
('912f0025656ed6044f945a0b54f7361e1c00bbad7c36aa7b447b4085b6479c86c83a36a0b50bfcc6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:00:32', '2022-02-14 22:00:32', '2023-02-14 17:00:32'),
('916e07c9a9468365bba7e1ac012e0c8672aee3d4d96cbd38edb7179c56cc9fd2226f9f2baed6210e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 15:25:26', '2022-02-12 15:25:26', '2023-02-12 10:25:26'),
('917c22d838a8af1598eeb0c49e36748027dfdb7f9377e5dabe13f6261685c4eb523de2b394493bac', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:07:52', '2021-12-29 19:07:52', '2022-12-29 14:07:52'),
('9190b9561f526cec57f69aed98dbc0975ba6f5dfb64e3771d1c5e6b9df6ef60ab36020c604abcc6b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 15:08:10', '2022-02-10 15:08:10', '2023-02-10 10:08:10'),
('91e4625a54c9901bed8edc19af4851bfd30496504b9d4136a68515cc980dac97e5a2cca3e7190c33', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 16:49:44', '2022-01-07 16:49:44', '2023-01-07 11:49:44'),
('9228b9ab5208a4717f907e309ea4e79eb8a0b63d3167b263af86eed0588a0c49fbc7fcaa97db0ad8', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 21:43:53', '2021-12-24 21:43:53', '2022-12-24 16:43:53'),
('9240dd0eb4a586f4ed81ad4d82fc9b13b54dd2c220cee0269977f98edec216197683506c12b6c5aa', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:34', '2021-12-14 19:59:34', '2022-12-14 14:59:34'),
('92584e2387c01bee96f32a29ed55e56da77386081dee10e0c280d8b49c0d8c2099b0c603293c7ab6', 45, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:10:06', '2021-12-14 20:10:06', '2022-12-14 15:10:06'),
('92ae640d54adde691a38cf041945aaee5b7f4e703678df99d1978b32fdef9d586a65802c48ca0f8a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 00:56:42', '2022-01-21 00:56:42', '2023-01-20 19:56:42'),
('9357264fe0212696402202e67e5b042d9b1213603ed36919b731238c2de36a8f4c58694ef145f3ae', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 23:54:20', '2022-01-08 23:54:20', '2023-01-08 18:54:20'),
('9369196b1f2f5e75ef6426fcdad282ac4b6c3f84e70139e80f841d6fa36bccfa273ac9964f99cdb0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 22:19:11', '2022-01-17 22:19:11', '2023-01-17 17:19:11'),
('9381a8e80f1e024b8c57c4b1c2e41f001fff92f02880f04a777ceaf33a8d1b8fa54809549c3c674a', 47, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:12:38', '2021-12-14 20:12:38', '2022-12-14 15:12:38'),
('93e7ce441a37b784bcc2d747e40f877553dc752cf6d8406b621dd32fdb32fd44e0feff0f8a03d189', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-03 21:40:24', '2022-01-03 21:40:24', '2023-01-03 16:40:24'),
('93fdca568d84566ae482374fceb505a17cc93ad8c5a939ee714421726021055327a2e960682d8eeb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 15:28:17', '2022-01-08 15:28:17', '2023-01-08 10:28:17'),
('944c0c874f49f05c314f32459a7e550f585c521c0b8e32e446fded45af0d3c55d1af2e82490c6fea', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 19:21:32', '2021-12-28 19:21:32', '2022-12-28 14:21:32'),
('9467a0b127ff2eb228395d42d75c1bb477c7c137f1c22fe00a51fd9dce09de60d5878078b3a7a524', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 15:51:35', '2021-12-17 15:51:35', '2022-12-17 10:51:35'),
('95302808583d5c00070b57d9852ea552af0c2e08602b6cf3744bdcc9fdb26a660dcae56359754586', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:25:01', '2021-12-17 06:25:01', '2022-12-17 01:25:01'),
('95306b35020aa24c36374817637e0657347ec026d359376a3856eb77a7f491b3784fe26f576fd0cc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:07:18', '2021-12-16 20:07:18', '2022-12-16 15:07:18'),
('96126cab2215a7ae213a067662de4eaf33ecf8038ad2f5e0b080d87a8aa353753bbe5cae669e01a0', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:33:43', '2022-01-27 23:33:43', '2023-01-27 18:33:43'),
('969ac97f6f9a66071904a771b24aae4b1b7121e3e1e3c796df0e98d09b9ab3cdb8d8b1dc98884093', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-25 13:43:54', '2022-01-25 13:43:54', '2023-01-25 08:43:54'),
('96c954c22cde1b09c6d1c0306ce364c905c2a3b1b88fc3bb773c48f0976fe5d02b541026d0e7c08c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:28:04', '2022-02-11 21:28:04', '2023-02-11 16:28:04'),
('96da4cee2ca2676285bdc733a01d6663e067b8b2fad2d21b4c13fc16e1e06f833acdc40398aff0c1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:17:04', '2021-12-14 17:17:04', '2022-12-14 12:17:04'),
('97b1efa1bd17027bdbd0b68ababccf52316e9c81be0c695056fc8b966b1ec2488c290f280491824b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 19:35:33', '2022-01-08 19:35:33', '2023-01-08 14:35:33'),
('97d07e84698a65829f39ffeb1637e249911ef680933a541a2862887a1e00b5f64992419fd062aa90', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:46:30', '2021-12-16 17:46:30', '2022-12-16 12:46:30'),
('9820618a6b9a7b4989d6245467de74250eec0f8b116a84c92243140e9006452eb74d7e842149d6ea', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:58:05', '2021-12-28 16:58:05', '2022-12-28 11:58:05'),
('9845b9c620f7e1df1d6b1ef78bc47c9890ce2d4a5c60d46a247ece795fca09833353981325456259', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:11:54', '2021-12-11 21:11:54', '2022-12-11 16:11:54'),
('98a3542f4dedeea8504a4bb9569203e6098ad0c1328ca13648dde17e7815788a8ad1c061199a5ca8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 20:44:44', '2022-02-14 20:44:44', '2023-02-14 15:44:44'),
('99384e508fb495bba06007283ad93abb0e82f21baa42485f8362a3819c800c8a20256255f4bea85c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 23:26:10', '2022-01-08 23:26:10', '2023-01-08 18:26:10'),
('9a92c536ae8f23e96eb721191851276a07653adae3a2ac57fb14a76e303b1f8b84fe31615b536c0c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:18:28', '2022-02-08 23:18:28', '2023-02-08 18:18:28'),
('9ae21a353f2a86527c1f4e462a7d128145901fa8a393289bcb1e2656917593fed3c079dac15421c9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:46:28', '2021-12-16 19:46:28', '2022-12-16 14:46:28'),
('9b8716a1c2ea7b305992641205bae9dc34ec4937693a181f4f02acaa22d83c21c64143150b2b76bc', 67, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 01:49:55', '2022-02-10 01:49:55', '2023-02-09 20:49:55'),
('9be4ceccfbed02b9f4de2b866fb5d33ac7f73bb117d8d55afb7751fd9c424322ec093aa726540fed', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:36:23', '2021-12-30 16:36:23', '2022-12-30 11:36:23'),
('9c396a547e8a7b0e14fe3c381ccd66480dc4dce219cd012876682094419ec0311fd369de83bedb5f', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 02:10:56', '2021-12-25 02:10:56', '2022-12-24 21:10:56'),
('9c53617014abfaba1188a579ad171628703e24eec330f6190731d234ee7e327cad3af770ae3183b8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 16:04:53', '2022-02-14 16:04:53', '2023-02-14 11:04:53'),
('9c7ed9357e683622ee541adc4e162344ca9d1cbef68f8fefe143d583901f0fbf289c281c198c1479', 61, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 17:39:39', '2021-12-22 17:39:39', '2022-12-22 12:39:39'),
('9cf6da3f4af85f519e433be7e95473cd539af4e381a5237dbae7ed513ab1c488581c4446c452f15d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:24:10', '2021-12-28 21:24:10', '2022-12-28 16:24:10'),
('9d093f73b604adf8436da39d0602109f7544f526a3e95e38cc988ee7c3299afb7d9b2aaa1a8d45aa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 16:22:21', '2022-02-14 16:22:21', '2023-02-14 11:22:21'),
('9d286533547c577b25a7e292e63e7ba3bae9d712944cf8a664e708d841db2d6a6713ca2997b5dd8e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:46:26', '2021-12-20 22:46:26', '2022-12-20 17:46:26'),
('9d4ac0c797c4801268186ba35bb1575c970c6e5626607163396f880798db23a59d4a2a5bb46e0cc5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 21:46:48', '2021-12-21 21:46:48', '2022-12-21 16:46:48'),
('9daf89069b57cbb2c997ca955e1b1fc4a30a4f8317629b7ee2220b12310f3a59df3edbd3d029549e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-13 16:34:50', '2022-01-13 16:34:50', '2023-01-13 11:34:50'),
('9e04f215afe73e01ef1dddc6051782596552dd1e6394e99aea75cecbb419d8a54806348ccda58d35', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 23:05:46', '2021-12-15 23:05:46', '2022-12-15 18:05:46'),
('9e2d9b38ecc5cd0bf24b05a5309c8332c4e8dc23d3498f36eed62251e47c0094f174c003e4b66929', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:44:13', '2021-12-20 22:44:13', '2022-12-20 17:44:13'),
('9e36c23e90e25c90fd05e5bfd1ae9b9f00ba5f212aa41f8ddedfd4377cb9d4285694625859c5eff3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 21:43:46', '2022-02-08 21:43:46', '2023-02-08 16:43:46'),
('9ec5ad858a1a818dab718497b23b37f3339095096717b2df4c930f00bfbba9c168996d6fbf1892ba', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 17:06:33', '2022-01-21 17:06:33', '2023-01-21 12:06:33'),
('9f5eff55e69fe2ced7acfa6cefe24e97b445f2b9dbb6e05728125a09e912b46343cbeb35721a10f1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 19:15:57', '2021-12-28 19:15:57', '2022-12-28 14:15:57'),
('9f80c6f927578739e5e42260d2a9759b1fbff9a8dabef169aa3b1f24ef439c0228bc9a5b9c157f44', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:10:46', '2021-12-29 17:10:46', '2022-12-29 12:10:46'),
('a02556e48764665c8928c75e6d29c0abdb7e9627642e60fbe5e367f72c56052f143823237bbd2c80', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-23 16:04:36', '2021-12-23 16:04:36', '2022-12-23 11:04:36'),
('a092dc4a49ec27a06d8c9c335446de3d90e03363c6059cdf6fbf2113edaab5fe752053a794ac9236', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-08-08 10:12:49', '2021-08-08 10:12:49', '2022-08-08 16:12:49'),
('a121af03bdad06899fa08c1799f1fd2b8adf6e5421cc4c5dab94af361d44b30b485f984ed7a94af6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 17:26:54', '2021-12-17 17:26:54', '2022-12-17 12:26:54'),
('a15aae6258a9bb560b77a96bbd268aca0771fd7ec1097c80790bc053439f656ca08846a1f471b7e2', 68, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-25 13:43:22', '2022-01-25 13:43:22', '2023-01-25 08:43:22'),
('a1927b4483c64600398bec93fb42022b460eab205ca6dc697304f4ec105cc9fca38524b53283cf5d', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 19:12:35', '2021-12-29 19:12:35', '2022-12-29 14:12:35'),
('a22f27c4090c0f02e2c8421ae19ca770c88787e1a2c45cd5ea80d98bd269f1eecc4feda5e2e4075d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 03:38:25', '2021-12-17 03:38:25', '2022-12-16 22:38:25'),
('a286d82196a340f56a189e95c8516d4b7ffbb9ef6a0284e43280f262e1047ffb31fba0fcf29e84b5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 18:10:01', '2022-02-08 18:10:01', '2023-02-08 13:10:01'),
('a2d102c84af981ca044cdae3537a61eb905300d4df4af6ff2c718a81095381da4f84e70e0b18d296', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:25:05', '2021-12-20 21:25:05', '2022-12-20 16:25:05'),
('a2ecf674a320a8c93d996f22ce7fe832be5b68695a4824a3679e524e5cb624e553836394d71c6bb6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:42:02', '2021-12-11 19:42:02', '2022-12-11 14:42:02'),
('a2f8834c983f26b810ae59ff4f5e29300bbb0b905777ee09c189998c780b22216738b2b7049d525b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 20:49:30', '2022-02-09 20:49:30', '2023-02-09 15:49:30'),
('a306731e12759a8e0ac6f8ec7488a5e613e6e4f53ac2382d315db2b3e79486d8f6904d700f2202f9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:18:39', '2021-12-11 23:18:39', '2022-12-11 18:18:39'),
('a3d8e696dd6f9fcbbf504cedd14567596fe04bc32a2f869abbc6f940aca61e8cb0e52a93d190c98a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:37:03', '2021-12-16 20:37:03', '2022-12-16 15:37:03'),
('a3e71b2032915ddd15320ff3a5a10950d10d1cc19f09715ae2a9236fd067ab37310a9b5854e05238', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:35:49', '2021-12-24 19:35:49', '2022-12-24 14:35:49'),
('a3f2c0416e7456f7d9a3760e2e70cfe9d887f208d2b87c30e9bae9d41dbad41b2e5aae74c1053f9e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:24:51', '2021-12-15 21:24:51', '2022-12-15 16:24:51'),
('a3f457c8ffd50624d4c6bd38bb09779a4ab5abc5fc658955f4747aefc22ed4bd5b3484fa6a4979aa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 15:47:45', '2022-01-18 15:47:45', '2023-01-18 10:47:45'),
('a406205fa84ff0f5b7f17c5ebf3a1557fc89bffc9d6b8b77a4a684a5e9c7054798bdf5acaab1f1e2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 18:13:44', '2022-01-19 18:13:44', '2023-01-19 13:13:44'),
('a48d76466a9f28a2dce096ca00eec29d630c546854babd9e767d27bf05d037f2906b412384e60358', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 23:12:15', '2022-02-12 23:12:15', '2023-02-12 18:12:15'),
('a4e0001bd6f38c1bc00782b5b2d9fa47a49eb1eb61653291746983d02be73a7ae4ea6685611841bd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 01:05:48', '2022-01-08 01:05:48', '2023-01-07 20:05:48'),
('a50bd155f3e3c6f336ad818623333cdf9f1e1236da7eec6795256963a4e98a9ad5c650d29610cef3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:59:28', '2021-12-29 16:59:28', '2022-12-29 11:59:28'),
('a51396ea24ecb0ad70adf3103aec4f49f7845bcac6bac1cb751bbe2e211e979624b8fd737b02d5eb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 16:04:39', '2022-01-07 16:04:39', '2023-01-07 11:04:39'),
('a5145c142d21b1f1ce326d234b4199a93d298b46067c3e3a7f484a56e1659b48ebde157e4959fdf0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 16:55:53', '2022-01-21 16:55:53', '2023-01-21 11:55:53'),
('a536a462f1162ded0667b1b4d8fb9321b7b21e36bcd51b092f6a96ab041c69f5a88f4feecd8c85ff', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:20:11', '2021-12-16 19:20:11', '2022-12-16 14:20:11'),
('a598b510fd73c546c4bcbb04ac2a625e97b874f0211340e2eed190dd52c26f0443d4d1ac1c56e638', 44, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:04:30', '2021-12-14 20:04:30', '2022-12-14 15:04:30'),
('a5bff6cecb2ba41084ab59fa56fe9ffc8e76e57c2f552557f4e41e2d11d660f278ed05b9ec5ddd6d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:54:27', '2021-12-14 16:54:27', '2022-12-14 11:54:27'),
('a5dfa6b43d494f511423576ff7688f64c3ee571cd367b344fe88286bc996506cdc673602b9afdec4', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-29 15:01:44', '2022-01-29 15:01:44', '2023-01-29 10:01:44'),
('a6501284397d6cbd46db5e39c9e42ea172e30658f9fc937865d2539ea4f621012a549d9f90dc59bf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:48:58', '2022-02-08 23:48:58', '2023-02-08 18:48:58'),
('a6ccc8c08914552515f41da2dc4df2746ec658459278d5b69d9be4cbf5157e710ba1cfcb85205853', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:12:27', '2021-12-29 22:12:27', '2022-12-29 17:12:27'),
('a6e57082ab3c4c5e11f77a10c3c2ff9eded2bf11f7609e8ea7dfe2822475d11670a9010bed98171e', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 16:58:17', '2022-01-28 16:58:17', '2023-01-28 11:58:17'),
('a6f73d38c886dfd325f47bb920f5448f84ea46f347913f3c86021a6ac49f084663496520b3839d9f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 05:08:07', '2021-12-16 05:08:07', '2022-12-16 00:08:07'),
('a6fa3a3f04e807e462cd821ae24aa65ecac6f4eb107bfccf6ee77a01e90d724167b9eaf36fcac76b', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:41:14', '2021-12-14 21:41:14', '2022-12-14 16:41:14'),
('a70a28206bb8b232c064071fed852d459598940efae0dd9c0ab32a952c846c3f2a1796be4c0e0c9b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 15:06:26', '2021-12-14 15:06:26', '2022-12-14 10:06:26'),
('a7f6c0c3dd72cd65c8febf41fd0fb65abaec78f969eb033f5c7e525c380a212ef69710fef8a531fa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-02 23:53:55', '2022-02-02 23:53:55', '2023-02-02 18:53:55'),
('a86389aa3782fe68392cbdac46d6e1c1a4ce26719cda79e4ae2ac93b2bd885391bfa7ee0c80cf2ae', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:28:42', '2021-12-17 06:28:42', '2022-12-17 01:28:42'),
('a8bedc2b18536b7a72e1ba72c28cc42dc52e86a1f2917e5e6342bb78b7157500e5693a5be5af1f2e', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:20:07', '2021-12-29 17:20:07', '2022-12-29 12:20:07'),
('a9071f2f9d8b4a14137c85dcefd9bf44d7db057e5c315a1e14389434ddfe649e0dc3ca2219e5a1f6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-13 16:25:50', '2022-01-13 16:25:50', '2023-01-13 11:25:50'),
('a96ff38629adcf371c3a63888b8d7ccf60ae073e19f648dd4052da9b5cb478353ef0dc3ec7e59f58', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 15:41:21', '2022-01-10 15:41:21', '2023-01-10 10:41:21'),
('a9c00a828c2f44d22230a4cc5bd80bd5ba8c46e518aa9c43689421dd9c1a9863d45463cbd36e8bae', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:19:02', '2021-12-15 21:19:02', '2022-12-15 16:19:02'),
('a9c37726bbe93d0c16e29b5842a1114b3679c57e585b8667bad21dffc288108d348c94ce577d8a5c', 69, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 17:44:28', '2022-01-27 17:44:28', '2023-01-27 12:44:28'),
('a9d9edc459fa5c3481f970be5f60b4461c0e5cf3a6f25f30a892ae9b001af6ca99eda786cd0830f2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-22 21:51:42', '2022-01-22 21:51:42', '2023-01-22 16:51:42'),
('a9e2d3813ab718981297f9e866de5a76e20599ffe2fa94ec3f3a1ac4d86c0120e939a46b00aefb32', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 15:44:50', '2022-01-28 15:44:50', '2023-01-28 10:44:50'),
('a9e8eb7ba8f7af8c967cfc0bfa0df54fc0f80293ec2812cc0327d5cf611cba9fee9e2460c8492a19', 60, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 17:35:05', '2021-12-22 17:35:05', '2022-12-22 12:35:05'),
('a9ef6f83c6843a91f070ff1d9a6e749af1fdedbaf9f82aa4ef03749054b8b0dc754b1a5fc0321e39', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 20:11:17', '2022-02-01 20:11:17', '2023-02-01 15:11:17'),
('aa358eb0eb1816720a7e0959cb0229701017e692d3c35467f8c82783a1576a9e9c3c1522e9df6b92', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 19:17:12', '2021-12-28 19:17:12', '2022-12-28 14:17:12'),
('aabb51f987fc0275b0cfc367a33c7b2f71010faf615a9b9ac41d78301d8beaf467e1ddcd4a48e225', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-25 02:12:23', '2021-12-25 02:12:23', '2022-12-24 21:12:23'),
('ab844d2589c7b6cca258fc3755c8522815aa9448144b0d6eb149da5e8546a33482723a6280b103c0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 01:06:52', '2022-01-08 01:06:52', '2023-01-07 20:06:52'),
('ab8695086c1d18ace51cc7b86e26fab4a6d02c25b8834c5140d266635099ae2a506c780d10cf6b8a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 20:27:24', '2022-02-04 20:27:24', '2023-02-04 15:27:24'),
('aba21be363574644d7bb314fe6ae7c195258f8e5babb771044df5162b3b6177a14753c5582203482', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 00:44:45', '2022-02-10 00:44:45', '2023-02-09 19:44:45'),
('aba25cbde52be3979af5e5a94dc20998942dcabbc72a0848cf25e18e3b8ccb6483839d3409e506d2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-01 18:06:40', '2022-02-01 18:06:40', '2023-02-01 13:06:40'),
('ac052d5ad2b43e45f8da3eaba8042f830eb10ebdeddbe11f5d640af4f375b7f5e985e923d8207b5a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 23:14:30', '2021-12-20 23:14:30', '2022-12-20 18:14:30'),
('ac21330a8e1cfe88b0ac98b98467def9ad572ca04ca66c26999eb4e18f29ecad98f85db0fd68da5d', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 17:21:13', '2021-12-31 17:21:13', '2022-12-31 12:21:13'),
('acf41fe18cea7535add3b1be95952c4bcfa9725a9af3c2d5af0f7597428f91aa05115e01e54e09fa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 00:06:41', '2021-12-24 00:06:41', '2022-12-23 19:06:41'),
('ae527cfec5d6ea98c7ad80519cc2289e07fc94cd91cdc16199b7479c2dac943789ce389e7d2cf32a', 31, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:43:31', '2021-12-10 15:43:31', '2022-12-10 10:43:31'),
('aead551778f8c4989dbdc5c4d646d68b48c97c3b93e877a38219e713ed250dcdc4e687d32bf14d7d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 23:04:18', '2022-02-07 23:04:18', '2023-02-07 18:04:18'),
('aeb60a5999332326fc699d7c6bfc7b89aebc242ed1db0f5b48519e163363d3ab7e1a0b27d73cd424', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:20:02', '2022-01-21 01:20:02', '2023-01-20 20:20:02'),
('af44a0a5358aa1b5e5d9d8c1be8ef2b1508513df31f829a2ab140d5d7c901e19590e283f85134579', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:37:50', '2021-12-21 17:37:50', '2022-12-21 12:37:50'),
('af6e016be4ac0acff7cfeb9a39b07f41a031810c00c5838d39117ee00b43b07aba28795a5715a0aa', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:32:30', '2021-12-17 06:32:30', '2022-12-17 01:32:30'),
('af92b2d8a296c67682ec891e6e74c992bb1bc45edbeb165ec03617e1175849aa3ab7fefbe82e9b98', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 20:06:17', '2021-12-21 20:06:17', '2022-12-21 15:06:17'),
('af9d51944bd839c0ca25f1fe461142db1240c614979e534e20a17edf0a1e676cd4eaf2c23ba1b04d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 03:09:23', '2021-12-17 03:09:23', '2022-12-16 22:09:23'),
('b01e2d3c6e6ac123011925746cb0e84dca79038d212d757b4d2554a94889e98f9d6dce753af2ae69', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:39:27', '2022-02-11 22:39:27', '2023-02-11 17:39:27'),
('b0302558036db111a9b1c147032638d57a5567c1a52ba74113ee19231cfbc8e8aea490ef349d566e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 05:04:32', '2021-12-16 05:04:32', '2022-12-16 00:04:32'),
('b033aef650d5c20e5be74d4403eb3a875b3a15ce11b53b58e5e5a2ceb7b1bc13bd3cfa6b19a99115', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:05:12', '2021-12-16 20:05:12', '2022-12-16 15:05:12'),
('b03b545590982894fa42dba1f55ccc493526e4a029157abbc8dadd150f71087ae9bdd3b01a909f81', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 22:35:51', '2022-01-11 22:35:51', '2023-01-11 17:35:51'),
('b04ec569a4ec4f714e730726a27708770507465093fb90bd8d69b8b8187a40347d066d73e448ea15', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:36:36', '2021-12-21 19:36:36', '2022-12-21 14:36:36'),
('b09948ce3ec190f078565824f734542541fc67e4d3cc03cf6686101983ea771180bc822196bfa0c6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-14 21:46:25', '2022-01-14 21:46:25', '2023-01-14 16:46:25'),
('b0a317ad796160d640d71522ad9a37744745e0427629650e8af4d2455a10adde5295574c1fddf2e9', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:46:27', '2021-12-29 22:46:27', '2022-12-29 17:46:27'),
('b18c7929895f72864c3f146167a64a330bde62d4db3128497d7733c2bbd5cdf640f2432757e6ae11', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 23:13:24', '2022-01-20 23:13:24', '2023-01-20 18:13:24'),
('b1b3a7b24e15dfac2bbce03e569754da34754d836ef9c12b61b90f0b1c4c243aae6636786a9c9a11', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:27:33', '2021-12-29 20:27:33', '2022-12-29 15:27:33'),
('b1b6274f0b3cdb3d9f8acbdc8663433e3c3daa40d479d3b67137b731bad9dbcafc6707f32f44cee1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:13:26', '2021-12-17 06:13:26', '2022-12-17 01:13:26'),
('b2155e9c8bda2e89ae51e427e33fd820ac304da3c453744fd2f6bc12e3968704e883685f8a57d08e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 16:45:59', '2021-12-15 16:45:59', '2022-12-15 11:45:59'),
('b22c09f6308e3f33eb2ebcb4a9a4fcb5a615134136ca6c220ef317b67d680d566035252a57f72690', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:00:52', '2022-02-11 22:00:52', '2023-02-11 17:00:52'),
('b255b3e05a0e59043068b1bfc195ce10803a68e010b92a02970f317657cb22411f61f84c33fdf051', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 00:30:40', '2022-01-28 00:30:40', '2023-01-27 19:30:40'),
('b260c844ad1fd20e22afc15bff2ba199ea6d7ee5e281a8d659f8d04e1679d1ab41bfdb8999456f50', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 18:06:54', '2021-12-20 18:06:54', '2022-12-20 13:06:54'),
('b29052f1078142661a9d5653bb51b79364ef3a0aceadae9e4a14b4e569e0beaedfbdb3e0d8e7a9cb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:17:17', '2021-12-28 21:17:17', '2022-12-28 16:17:17'),
('b34ff56d66df712ab43fb4809dd87df2b4ec89cb2bd738148fd68a3fdeb2002eeed2c904e48c5c83', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 15:27:46', '2022-01-11 15:27:46', '2023-01-11 10:27:46'),
('b3968c14c795b8862aaca9aa8708920aad93ccd779ccb3d50e7211fe533b65a85898bfe938428c35', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 19:56:32', '2021-12-10 19:56:32', '2022-12-10 14:56:32'),
('b3fe15d73e568773984543eb8137d7d4005fbda8bbc4f579dd7ce6c450d8f940708a75dc74d8a1d0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 22:03:06', '2021-12-16 22:03:06', '2022-12-16 17:03:06'),
('b4120f74ac97a047e206a6de08a7b6432942951e0c82bfb31e1cf007829640ddf0ff333fde94dec2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:50:34', '2022-01-21 01:50:34', '2023-01-20 20:50:34'),
('b4651c7e8bbe8a68b4959504c3a7e3705208cbdb79fcc2498b9b3d0efa9c7cadc77699590cf8f2d4', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-20 03:59:46', '2021-06-20 03:59:46', '2022-06-20 09:59:46'),
('b46bf313646242a84c071d46b0eb64efd857c8c85548760e94ad9d2aeab86bd4f430b21f7c7fb8b1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-08 00:41:13', '2022-01-08 00:41:13', '2023-01-07 19:41:13'),
('b473b1480e7dcab84f9774af9bc4eec7053845aeca14e21bb01f2e08ac649914484819892fd298f7', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:53', '2021-12-14 19:59:53', '2022-12-14 14:59:53'),
('b4751f6fa4d086f3950412bfc77939b0cda3c13c6d8fee295455bb9bba77245e0451c88596996d80', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-15 01:51:48', '2022-01-15 01:51:48', '2023-01-14 20:51:48'),
('b591344cb627d193bc2fca2afded15166acc9f671537b5fd9c311ee03bdff913c3acc4c0557c968e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:46:07', '2021-12-21 15:46:07', '2022-12-21 10:46:07'),
('b5a5e3f22bc74c922f313a9d0f0e575688a51773f5ca58e519ea57d5316b7c85deb0a12399ce3cb6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:40:55', '2022-01-27 22:40:55', '2023-01-27 17:40:55'),
('b5a8d35206e1790057f81d9f357583194d02556816fef1fae64837f8c7ad4aa1ff78caa6d2b4ef5a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 22:49:12', '2021-12-11 22:49:12', '2022-12-11 17:49:12'),
('b5c7e4ff1d2295f4dba350e5be73ba90e6d2e03b493ced4065197b775fe0c4fc138b945b2ef3505b', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:30:49', '2022-01-27 22:30:49', '2023-01-27 17:30:49'),
('b6175e7c6250cf6d7949d3114700414f6f73ba498f2a19d96fb0530e165d1240c8a584e7881bd1b3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 17:44:42', '2022-02-08 17:44:42', '2023-02-08 12:44:42'),
('b619e8765bff8bfedcf14e5d30a483ead94eccae06d15c97840191b9c7fea669992a91220e7c847f', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-30 15:05:58', '2021-11-30 15:05:58', '2022-11-30 10:05:58'),
('b61b5e6f74ed1dd3c4728ea7aa2fc52adc92a878c5fd3c40e9b4606ed52e0ef674033f43b884b1d2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 16:40:26', '2022-01-12 16:40:26', '2023-01-12 11:40:26'),
('b6d28cc7b3872881b3ed75c0d55a783923e8d8d4255c5ddb549061e269dbdf8a3bca78a2ae841cb2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:32:30', '2022-01-27 15:32:30', '2023-01-27 10:32:30'),
('b6e0c2e94b2d64383293a966ff7bbac9ccda4512abe037c8b30be609d8ab5d80a59caca6e8f83b32', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 16:08:26', '2021-12-11 16:08:26', '2022-12-11 11:08:26'),
('b765f46f192c5ffb32178109613e1f9f3d105a1f09a7a7339815d5c865382dc314ccfa199b2b5e72', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:41:34', '2022-01-21 01:41:34', '2023-01-20 20:41:34'),
('b7d5aa706eb3385a3cd171fa85cb1d4286c6acda9572f10c39ba7e4ecc6be437adc218637f231720', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:17:40', '2021-12-16 16:17:40', '2022-12-16 11:17:40'),
('b81fd9052b02c5d5b83e6823028b8b33c97816c78899438f76635f5ba65bf444b7c7f1508b82a2b1', 16, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:22:16', '2021-12-09 20:22:16', '2022-12-09 15:22:16'),
('b8847772c5fb5bdae596e6ff6fe41500aeec482b3856e21852dd02b2ed91d9f84c8e781da2a0d949', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:15:29', '2021-12-20 20:15:29', '2022-12-20 15:15:29'),
('b8884e93c79cfbb061a848c016cd4ed785d87352066ef02a1d2b2d6174a9655d99f537d988669685', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:36:52', '2021-12-20 20:36:52', '2022-12-20 15:36:52'),
('b8bb7fea37f27309b3002beaf662fa5904c1306b9c583365455e9f7deee97e76609e8f98ee84b79a', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-29 16:41:37', '2021-11-29 16:41:37', '2022-11-29 11:41:37'),
('b8e430535e5596b65a04525a30c56e33aa23aa143eae13deac77ccb318426de4eaa78faf8c86abdb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-23 16:09:08', '2021-12-23 16:09:08', '2022-12-23 11:09:08'),
('b8fd4f19a7e1a3ef6871062bd05d6193d76f48628135b6cf5398821a4e55ff2010c522422f4da017', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:51:16', '2021-12-24 19:51:16', '2022-12-24 14:51:16'),
('b936b2f51835312d09d74fa7db974d9746c638454850511cf407ce4e0f060dcf24c6c024f78b6f99', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:41:30', '2021-12-11 19:41:30', '2022-12-11 14:41:30'),
('b99ceefa9e229e83ab2d4d99c41e951eefd59c281916788e7db3b23e136d6dcec3953007cbeb851f', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 21:17:10', '2021-12-29 21:17:10', '2022-12-29 16:17:10'),
('b9a20d2014fe8f76e3ff3314adee318ccbc97c804728cbd252cdaab3050b58cca6474094b3cae1a8', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 23:01:29', '2021-12-31 23:01:29', '2022-12-31 18:01:29'),
('b9ae1394c8ea76f0a6680a0eaf0a93025fbedad9d21a8db198b3b394d623aa2f0c565817a53c693e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 01:11:26', '2022-02-14 01:11:26', '2023-02-13 20:11:26'),
('b9eaef9e61252edc96ab382a506521076ad4acb5ed210bc275668487dab8393a6ab4c5f77ef78468', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:41:47', '2021-12-30 16:41:47', '2022-12-30 11:41:47'),
('ba10bd16e23a4b0b178b3cda080a6abf34f174cfef9e93caee7ad15166fd6bee201f89365fda4813', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 22:32:40', '2022-02-12 22:32:40', '2023-02-12 17:32:40'),
('ba6281aeb803d4a338a41cc60edfbb47dda442ae9753ad29e59a3530de5fadb55f054d4c78c99f27', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 20:23:40', '2022-01-28 20:23:40', '2023-01-28 15:23:40'),
('baea0baa1d7f1051ad4c5e914b2251ff4090c92f500389e8d6f3c90f61736f8492a700baa31c0d4d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 19:43:15', '2021-12-11 19:43:15', '2022-12-11 14:43:15'),
('bafcd1bed47b0b0992400b58883dbaeb60a3284ada448a137ba14c5cf8660350a9b2a8ef954b2ff2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 22:57:42', '2021-12-14 22:57:42', '2022-12-14 17:57:42'),
('bb3827338fe8c8b032477c39a6a91314eb6cd1da1a3650375d5a969e08da5b8a679684d2be0f3b51', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 22:46:38', '2021-12-30 22:46:38', '2022-12-30 17:46:38'),
('bbb5a79454d12ef37c498de204ab1a12d546ba16246650239b03f2ead17782595a164a1adf0e3760', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:33:01', '2021-12-20 20:33:01', '2022-12-20 15:33:01'),
('bbe2304c1ae7b4e5a8fba541d44ee04da0dceaa0ae4c59705708d0a4cb48bc1496765d190c36a7c2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:24:03', '2021-12-24 19:24:03', '2022-12-24 14:24:03'),
('bbf4d7258be6856562b7986385650181bc9cdaa7311f8eed7a95046966d9b9dd2adc173dc1944cc8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 19:54:06', '2021-12-27 19:54:06', '2022-12-27 14:54:06'),
('bc94dbb2dc9a162bed0db4a7cfebf6f4f8b6d1f08fc347641e8b8d70105b976eeee030dc70bdf886', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-13 08:21:56', '2021-11-13 08:21:56', '2022-11-13 03:21:56'),
('bd35d71fd76915bfc995029d0dac42fd8cd0baffcc914a4d7f25a97f851274edb3be039d42f9ec0a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 23:02:40', '2021-12-16 23:02:40', '2022-12-16 18:02:40'),
('bd6161581dafe7cc1c819be66255e56586451dd2eb9c64a42db26daf4df752e272302faf23721034', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 21:30:46', '2022-01-20 21:30:46', '2023-01-20 16:30:46'),
('be31e7eae427be90a04318aa54c1c44457c50da7e73055593adb611bb651bfe2f18c9de20a678938', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 20:53:51', '2022-01-07 20:53:51', '2023-01-07 15:53:51'),
('be414b663828f384c4f78a46eab9fc6b6eb8d815561aea2284f658cc62aa84d3b25366c771cb6ebe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:50:23', '2021-12-14 17:50:23', '2022-12-14 12:50:23'),
('bf24e16194d82c4e2982724df0fef68f7923d6d01ce8c5e1b64e2716d2412db6e62891f0f8dae8a6', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-07-31 08:34:19', '2021-07-31 08:34:19', '2022-07-31 14:34:19'),
('bf3c9221aafb8653d94d1c8fef680c12e148560069a35cb8dbace5b47cba8d765726f422a9c5f6f1', 71, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 20:39:25', '2022-01-27 20:39:25', '2023-01-27 15:39:25'),
('bf73904d522c0ba598fa53693352774c0953d8f7203b5e9122e90246cffbd083e01fd0b80a5d15aa', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 02:15:48', '2022-02-10 02:15:48', '2023-02-09 21:15:48'),
('bfaf8a2a3ad6b341ba34c667b28799a7ffdb4de9c73cae4636c1992d981bbe885b259e228f06cfa7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:29:31', '2021-12-17 06:29:31', '2022-12-17 01:29:31'),
('c04ee738b5845e3f938f2ac2308f08fdfd2c5bd2f309761879f3cadb7f88ce694304513929c92404', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 15:02:41', '2022-02-09 15:02:41', '2023-02-09 10:02:41'),
('c0563596ba0643d78879bfb69ceec9e93fc042385178e25acce710d8ba70be6de62cf2d3212b5480', 9, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 19:41:30', '2021-12-09 19:41:30', '2022-12-09 14:41:30'),
('c12bfe87e269a48d82850779f05d6c5c0f295c8e41bf76cfca5df8a126e948f1251ab4ccaa8a2fa8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 17:59:45', '2022-02-08 17:59:45', '2023-02-08 12:59:45'),
('c184175b04b3fb487722a0ac4a65553811c2c37477cc0daa117daecafbedffcfd8a3dee89725e2c3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 15:03:17', '2021-12-16 15:03:17', '2022-12-16 10:03:17'),
('c1b7df78e7373f5eca5f64083ac9bbc6c9bd582adf6c143f520c8a65420d3ee050044e6f65f0a033', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-24 03:40:43', '2021-06-24 03:40:43', '2022-06-24 09:40:43'),
('c25ccc65593f7a9fdd5e69994a6328ba79fe11a138f5b5930d2a44309e78612b0290d5b62b564c87', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:15:31', '2021-12-29 15:15:31', '2022-12-29 10:15:31'),
('c274e92fceb214a6ce2920cd73e6b7392eb19081689788d8aef9e3e66495cf51a4c6fed40753d988', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 19:53:14', '2022-02-04 19:53:14', '2023-02-04 14:53:14'),
('c28435854fd3e358fd33691ee82dae0eb503c729bf10101813c0dec4fc8192a8ae168dbe3bd9993c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 17:08:54', '2022-01-21 17:08:54', '2023-01-21 12:08:54'),
('c3092b16de47fe1955d17a739d19805cdb37db50a9dca13a91e68ec0dcdea923abb7014c4ca74fa5', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:17:38', '2021-12-29 17:17:38', '2022-12-29 12:17:38'),
('c347de56ec84139de555a4874ad84dfee2b486bdb6da8fa8830b3fe33c42a536b923659245d5142f', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 00:30:08', '2022-01-28 00:30:08', '2023-01-27 19:30:08'),
('c384e79e1657642454709b251bf94dc945c2e3079203ba52c38e814893e19151a5b580a7455fc103', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:31:24', '2021-12-21 17:31:24', '2022-12-21 12:31:24'),
('c38f85e898ce585cb150aaef97264dd4a1f003f2bd8a52a2bd0bdf346cdb913d9032f2410b1de466', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 20:03:11', '2022-02-07 20:03:11', '2023-02-07 15:03:11'),
('c39d0d05a0eb97e4dc333896e58d2346524c7c00c89ce12a8df2231b7ab14201ebad637ce66a17a7', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 16:47:00', '2021-12-18 16:47:00', '2022-12-18 11:47:00'),
('c3dadd46e782147ac354a21792c0aeea5ca5db4ad62f78956c1bfed7c3e9c658e4c9e9369f116219', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 16:00:12', '2021-12-29 16:00:12', '2022-12-29 11:00:12'),
('c3eccc7baabbd7c9f14406d9c6ca14839da79c8bbf82188675ffc360df36cea771c2fb0e07f2ce40', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 18:00:02', '2021-12-16 18:00:02', '2022-12-16 13:00:02'),
('c4eb9e922e4a19968a0a2be36c0a0c80f63eef1d73ce86d89e700105250b10312d809ddd0820bf62', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 23:20:32', '2022-02-11 23:20:32', '2023-02-11 18:20:32'),
('c4eecd7cc8529c3d278c006652f381f2d7dcc24109903e7bd7b24924bd8b0b2d0efed63c63a2383e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:21:56', '2021-12-20 20:21:56', '2022-12-20 15:21:56'),
('c52c2475270854058f2dfd3591946811d92a71a88b53e3168f50224951d3f82b6dec4b22385d92d6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 20:37:41', '2021-12-11 20:37:41', '2022-12-11 15:37:41'),
('c52ddbe32b5590130974f9e0213cacd08901463eb8e2596574626ea5cff39829be00e263f5e72a5c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:53:13', '2021-12-21 17:53:13', '2022-12-21 12:53:13'),
('c5404fbe7b8a6caf96e1b7758ef6b0eded2f580a2b61d6235c19a28446a8d42f95fd90c2a315379d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 08:05:17', '2022-02-14 08:05:17', '2023-02-14 03:05:17'),
('c5701e297b72069c8bcb649aca29550290af248cec236b3def8ffd4b0b663f262c6993fdb99ed791', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:44:16', '2022-01-20 22:44:16', '2023-01-20 17:44:16'),
('c592d3f67c118e97657bf3af4d0dbd3aef054f240029ea087b6a7b7a56f561df5bf8e2adec637165', 75, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-10 19:11:24', '2022-02-10 19:11:24', '2023-02-10 14:11:24'),
('c5f95f5b97ab2c3c263ebadf985c7407ab30363e6a65c0fac7e60d4e2d61053589aa021af273f6cc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 16:29:01', '2022-01-06 16:29:01', '2023-01-06 11:29:01'),
('c614be059d6f3c4f1e2c3061f9131959bccef1e4de2005d3fe5f4d39e8ca44efe4c48aed5b6e76d8', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 21:14:14', '2021-12-18 21:14:14', '2022-12-18 16:14:14'),
('c66679aea98cfa75e43f6fb25927079207e5b094719c21556cba82d47416ee743907f925826d163f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 15:51:48', '2021-12-29 15:51:48', '2022-12-29 10:51:48'),
('c6da03238c4636682f8f8d458387e9334fa0752d2e270d021910e29ec19a2891de466e9dc06f9e3e', 22, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 21:41:38', '2021-12-09 21:41:38', '2022-12-09 16:41:38'),
('c6e45b0c1c7c76574e1ca5ae64f94591a7c213787a949f456d9777a586fb02729afef2e10f794101', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:49:40', '2021-12-11 15:49:40', '2022-12-11 10:49:40'),
('c720a4788f7b2b79a2963dc59ae8a2d006972df63ebd1c16a9371a6ecec3804d09e8f12e6d15be24', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:33:11', '2021-12-16 20:33:11', '2022-12-16 15:33:11'),
('c73854ff227d0f110e181cd3f4d8b7e17e4bda232dcdc6f7016986912de449fe86debcc1fc2f7cd5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 22:35:59', '2021-12-11 22:35:59', '2022-12-11 17:35:59'),
('c7650a7fb202d57b64dfd6ffea5fde1204861ae0ac8e8e3c033ad034a83291f87908457d6d21267c', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:32', '2021-12-14 19:59:32', '2022-12-14 14:59:32'),
('c7f945f186fa5fd672eb2f0a5963a7b8582e46c656907db444bb5571bc2a1061cb0b6aa33a6cd14b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:23:13', '2021-12-11 21:23:13', '2022-12-11 16:23:13'),
('c83361017460456cd3e79f65cd583ab082777424fb003432121939461cdd5aae98fc3f0828178cdc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:49:03', '2021-12-21 17:49:03', '2022-12-21 12:49:03'),
('c84ffa7b29b418529a62e23a5d5a05faf203116837854f30ce8aaf04c4003b34e5a56c0b79d91c54', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 19:57:24', '2021-12-20 19:57:24', '2022-12-20 14:57:24'),
('c88a7e4b0ecd6700cc30ae4558a794a0aa1372aafaabc25537cd94cefa6efcde561e63c53a8d4ad1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 15:31:04', '2022-01-12 15:31:04', '2023-01-12 10:31:04');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('c9c9cf92f6eaf0d389c414dc18328842b6b6635562a4c518db29a125e44a3e340577e17938aa88da', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:41:15', '2021-12-11 21:41:15', '2022-12-11 16:41:15'),
('c9d713eecad1247ee8a1669a910c88920eae74987891905d2c65f18f335865b386552966cd1a1dd6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:15:20', '2021-12-20 22:15:20', '2022-12-20 17:15:20'),
('c9da0f77d3db1a3cc87ed67d2091085637f144e503fb2e78e38c6704bd13e2bb6ce72421b179ee7a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 21:04:19', '2021-12-27 21:04:19', '2022-12-27 16:04:19'),
('c9ec6485defa696b6f2383d2ec13b737c843b4e6e5a7371c1e975496a2175b9542b40a1e3c3b7208', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-22 04:23:36', '2022-01-22 04:23:36', '2023-01-21 23:23:36'),
('caf02674d236c2b87b14cfc63e3019032f87870d9de2ef774e9a05df218e2a39ff0a637dab407bcf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 15:52:44', '2021-12-17 15:52:44', '2022-12-17 10:52:44'),
('cb1f5c24004d6c9d4ddb67b7e21c92fd97c451786f93e48671f7c8763a60c9ae6e704bf3997d62c5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 03:41:11', '2021-12-16 03:41:11', '2022-12-15 22:41:11'),
('cb23b074b4b08ffc1a1fa19396d9940ec6629552647e31edbe82a916d302c204aa7220e3ca132a8e', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:30:08', '2021-12-30 16:30:08', '2022-12-30 11:30:08'),
('cb7f516f27de2a20f14c33db5435da8cbaef9bc905216693f9d0d5e80d8f5659fdd60064bd958258', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:28:06', '2022-01-27 21:28:06', '2023-01-27 16:28:06'),
('cba741cc7c2e958b256ba3fda45d72a1ed6dd6e6ff421127c1d7317cee0f29ca4e6205fd8caf3e5a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 22:17:12', '2022-01-17 22:17:12', '2023-01-17 17:17:12'),
('cc316e6bbe2532101c29e690c991439c23387c9770fa19237846bfa70de4a74270208f99bb7abb9b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:06:32', '2021-12-20 20:06:32', '2022-12-20 15:06:32'),
('cc7afc6b0d9efcd297bb20eef4194e766cef471ba654d1c2e954c9095ea31e0b1283338f13c1a9e4', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:28:33', '2022-01-27 22:28:33', '2023-01-27 17:28:33'),
('cc9e8f17a4938aa45731a6ace7401624ef8eea80973ac0cb37e25bf5bc1deec531019016b45fce01', 72, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:04:35', '2022-01-27 21:04:35', '2023-01-27 16:04:35'),
('ccb54c99f4671a8efc42f2965d6050a3117eb9242135df3779198653380713ae66e329fd75075c45', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:21:37', '2021-12-17 04:21:37', '2022-12-16 23:21:37'),
('ccda951f07d926a65c0dd0bb2680aa67e2aff49efda6be97bb54015e73ed27cbf57e3ebc54c43203', 53, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:31:14', '2021-12-14 21:31:14', '2022-12-14 16:31:14'),
('cce9f78807e1b9f3ecbf445593d25ab075b0b6bcae7c7adbf5f4db852fc05c3960714247661b8d09', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:39:43', '2021-12-11 15:39:43', '2022-12-11 10:39:43'),
('ce003d7ebcc92bbfd1ce87e0305121c98cb21b2034326fd33f11b2a3b37b377a28d30b1826e2708a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-03 23:48:53', '2022-02-03 23:48:53', '2023-02-03 18:48:53'),
('ce271b55d2b44c0c94179856f960b0c2c9b94615d9c10c48e11405674a7751918e6b5b10afbe1cc2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:35:09', '2021-12-15 21:35:09', '2022-12-15 16:35:09'),
('ce59763f7be6744890c920fad37d75829f56b07a477cc3811818fb9b3a39a43f272370fa9df191fd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 16:04:39', '2021-12-11 16:04:39', '2022-12-11 11:04:39'),
('ce7154225ce48eafa46aac89dfc04fcff5458ddcffcb0c32f7ae7d97d97ad2c81530260e1a75353a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:27:03', '2021-12-24 19:27:03', '2022-12-24 14:27:03'),
('ce8e43e8247b11d86b05fd65e70515e5c8ccfdca921375ab7e983374be94492c2524b7cfc245225e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 22:53:55', '2022-02-08 22:53:55', '2023-02-08 17:53:55'),
('cedeec38a8b74e637d139d72a024bfbdbd48562f94900657878e3db04649aac8556398f0d2f563e9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 23:31:23', '2022-01-10 23:31:23', '2023-01-10 18:31:23'),
('cf186126231842fc70af2e78d39d9d4f974fbb00d03615fab3bbfb4c5b4c12c0d34dc9971a65a909', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:40:07', '2021-12-15 20:40:07', '2022-12-15 15:40:07'),
('cf3a12a39ba056f370327ff0e1952d90a976fb1b4d639a27c916217aeed0a7182a553844a51d84e4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 15:28:11', '2021-12-21 15:28:11', '2022-12-21 10:28:11'),
('cf5bd80813ef384f22e564a5a9a2cc708a9dc892dfa592a6a551947731ff1933d6788343e59d055b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:08:06', '2021-12-17 04:08:06', '2022-12-16 23:08:06'),
('cfda27de4bbcba51332d33262d8702b23c51afc3d8f7cc9b3b88d38923824b56a9d0497da4031565', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:48:34', '2021-12-11 21:48:34', '2022-12-11 16:48:34'),
('cff456c8af52fd6d5029ad2ab0a908a2504a97896195dc65bcaf54c15a47f1c3e8a0d5e0d78c1b00', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 22:52:26', '2021-12-24 22:52:26', '2022-12-24 17:52:26'),
('d006a9b7a2bdf0453f5eed8083a86952f76200a4cac72f6e314a47488085f3d97a88fc1e06e9f50b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 21:04:51', '2022-02-07 21:04:51', '2023-02-07 16:04:51'),
('d052ea69531b2eaa260df947c96dccf4b9374619f208c24b320f533f30ca72467a656959daae1b93', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-24 21:59:05', '2022-01-24 21:59:05', '2023-01-24 16:59:05'),
('d09177aa2360485765c840cbe86ce5e340028efed432c6fc2c8ae4039891e517cd676443f14a71b1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:38:55', '2021-12-11 23:38:55', '2022-12-11 18:38:55'),
('d0e8767bff6d158d377bdd5480b85bc036583b3955874661883f047669beadb65c97b5be22f2c8d2', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:31:30', '2021-12-15 20:31:30', '2022-12-15 15:31:30'),
('d0e8cf90ec899677d905914b9cc2319bcf9ed71fa434ddd03e99267714401d67cb102548baf66728', 73, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:10:05', '2022-01-27 22:10:05', '2023-01-27 17:10:05'),
('d151e4dbb89b611d6ae3c7082687b733315d9486ee90089ef008ee6a8f7935f086df86eefc790d44', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 21:51:19', '2022-02-08 21:51:19', '2023-02-08 16:51:19'),
('d1ad3ea91593d918dd7e15ff81688d42a67be3c15ed5fa8aced0042d85aaa3e9c7d146656f02d31b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-07 19:25:54', '2022-01-07 19:25:54', '2023-01-07 14:25:54'),
('d20f6613bfb99ecf7d17b7ad1e0f0c9e19a07ae5d83e4bc8fb9b09260f8541c23c80077f3b88f897', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 21:01:51', '2021-12-27 21:01:51', '2022-12-27 16:01:51'),
('d291a2cf4878659f7bbd7ba2a323a22f7ef03b749c06592de90bc31497facd4005bf5de3367c6568', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:40:15', '2021-12-11 23:40:15', '2022-12-11 18:40:15'),
('d2b3d59a3f93859cd33852bc753531f260e9938473e4d789f84538181c748c56c92d13466ffc2f50', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:00:55', '2022-02-11 22:00:55', '2023-02-11 17:00:55'),
('d2c029ac9f0aae6f93c3d97bb9b6d7557e89441baa78858a811b4bb2f9e85a0384a013f5a788cd5c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:40:07', '2021-12-20 22:40:07', '2022-12-20 17:40:07'),
('d2d7f85db0c81126e41f1580cb0aa9e3b631d76a7ba5d43be52dcdd89a74cc5641634dd38d3884bc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 19:39:06', '2021-12-15 19:39:06', '2022-12-15 14:39:06'),
('d2e78a9b59239588281a915b7527e65be080b9be5724ac7a43aa1d92b8df9967378f379d82d39f63', 14, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:11:05', '2021-12-09 20:11:05', '2022-12-09 15:11:05'),
('d2f0bbe3ebd44c2d10a0d8de1b0f3c883444429d7eaec415b230a85a6cdfadc504ba8be5c515b7c3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 23:00:22', '2022-01-19 23:00:22', '2023-01-19 18:00:22'),
('d30297d7df75e45275234e063580d2d49c6893772c54e8071392bb4cf3a274acda9c14836a0c14ba', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:40:56', '2021-12-16 17:40:56', '2022-12-16 12:40:56'),
('d39b7640681b36eabdaf22d2a3bf7396a92baabfed084b59fd68ecb22f347efc6350e0025e79c1b0', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 00:15:57', '2022-01-19 00:15:57', '2023-01-18 19:15:57'),
('d3afec372bd1d31f4db885432973640e789131ad9586664f0ab75d8d28c14a98ffe7e43da23b5069', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 05:05:34', '2021-12-16 05:05:34', '2022-12-16 00:05:34'),
('d4179242c8a8c90700d6323e14ed3f42693b87caf7ca788b6768cc4343efa2b69ee7168a612a97ee', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-22 04:12:50', '2022-01-22 04:12:50', '2023-01-21 23:12:50'),
('d41b5ebebeaae03190fae604c548d4508ffd2eb9301e0a4b501b20847e2080e815b9e6494a6f2448', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 16:11:22', '2021-12-16 16:11:22', '2022-12-16 11:11:22'),
('d440cdddde79407216ff4bd7f5a4c4f72178b6925b817ca855d71c06300ce40d7d9428a683138bea', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:29:33', '2021-12-16 21:29:33', '2022-12-16 16:29:33'),
('d4718a37e9420de06d87dbaefdbaaa186c98096e2880fa65f4226685dd7cf1dcda7d65040904ec46', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 20:25:40', '2021-12-30 20:25:40', '2022-12-30 15:25:40'),
('d4b9388e0701528b77bb65e98383b418a8d8f480c847804b7c02d0b0e2cb08090aaac6bbcd52970f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 16:26:38', '2022-02-09 16:26:38', '2023-02-09 11:26:38'),
('d4c4312966bf105657cb8e24d8225fd8ce54565e69d32a61d538660d71dd724b8ca41895606a8121', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 20:41:39', '2021-12-24 20:41:39', '2022-12-24 15:41:39'),
('d4c83f93524465ec5e262391be2ebc9b8cf8c65eede183efb1ac9fa113276805f7e774e4395dba56', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:26:17', '2022-02-08 23:26:17', '2023-02-08 18:26:17'),
('d4ef3de714c3b00624f2667495b98777f7aeb1ff6ec1a35979d2e26f204adad49df07a72d77e73b0', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 22:05:46', '2021-12-29 22:05:46', '2022-12-29 17:05:46'),
('d519afd08bb0e854a0f340b1e785fd9355af1f6d2582ee05b0fd7c8c00b2b27cf9233d6fd7ad5934', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:15:53', '2022-02-14 22:15:53', '2023-02-14 17:15:53'),
('d5632d67e7d0b4c13447c720dc62b2607f85172af46b757da57a1be703230caac7f915f4ea71056d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:47:47', '2021-12-20 21:47:47', '2022-12-20 16:47:47'),
('d6bd334cd4680f8c967be168e405b89a8c2281385e7962889f64cc10751cc7011f3ad479cc2b9a25', 61, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 17:41:10', '2021-12-22 17:41:10', '2022-12-22 12:41:10'),
('d7230afd9a412f6954a3441185b7c0a9dfb61c3d262e5ddb4ef891ff9282a1984695d8809fb9d9cf', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:11:17', '2022-01-27 23:11:17', '2023-01-27 18:11:17'),
('d76e0657834413aa90163bb485fba1934f4613faecc4852dcc8647c62e993b155dbd2a3e26db58c8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 19:30:03', '2021-12-16 19:30:03', '2022-12-16 14:30:03'),
('d878f727383e1d5ef87db3fd685d55b29c5509641d9933afee33d678a270964293d90469c36de352', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:38:15', '2021-12-20 16:38:15', '2022-12-20 11:38:15'),
('d883923e02d3832c8da48a72d850515d9c6c087ef3309119f384632510ea2e8002470c8684771211', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-04 15:27:59', '2022-02-04 15:27:59', '2023-02-04 10:27:59'),
('d8b8b57e99c3e3b8939c9ee0b29c2f1675c58402c4f4c18c4c24065553749c4922285bf2e10809f7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 18:08:16', '2022-01-20 18:08:16', '2023-01-20 13:08:16'),
('d8e056c521d603bb76db12689cd6a1d161791d47f315a1f8caa8b004642753e93428f5e86465adf2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 23:31:58', '2021-12-21 23:31:58', '2022-12-21 18:31:58'),
('d99ae3d5355a7204abf3f3ac42a5c5337431d3bba51221d7cc92debbae2e01e51190d2485bb7f4c6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 15:58:48', '2021-12-14 15:58:48', '2022-12-14 10:58:48'),
('d99f59db5b42c352d2162f84c66c0a8bff297a7b21a2680c914741a3f599fb08eb9e08ed366575a3', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 00:07:04', '2022-01-18 00:07:04', '2023-01-17 19:07:04'),
('d9b61b878b3fcb2de21537c3fe81c05ccc85429cebbc24254badc4847cb35b3c6b3ba4571243ff97', 32, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:44:13', '2021-12-10 15:44:13', '2022-12-10 10:44:13'),
('d9ca72ed9d402f82fb178163790afb27c76051072005789f276912f78169133a900738da67f008b3', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:12:01', '2021-12-16 20:12:01', '2022-12-16 15:12:01'),
('da142f5a5037c90fd00738664859c9b8010b113846adf6a4b4650c9db1bda30bfd240e19063cded6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:29:34', '2021-12-20 20:29:34', '2022-12-20 15:29:34'),
('da3ce468089a19c65f6ffddec2446277754fe3c1900b22aea5779dbaaaaf44ae5cfa8b2fe0861de2', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 02:52:24', '2021-12-18 02:52:24', '2022-12-17 21:52:24'),
('da56ee9f7c97c5dfe316091401d16092c28c4f755d88f6eea6b05a3d7fbefcbd0a744f46486457b7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:04:35', '2022-02-14 22:04:35', '2023-02-14 17:04:35'),
('da5c53c8cad9acb83d8de9ac885d80de05d361d8364d8f3c43baadbb85e3c5065ca66b36afa15ab6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 17:05:43', '2021-12-28 17:05:43', '2022-12-28 12:05:43'),
('da89f02554842c57758c284e8e28c9b5ca824b28aef59e853aeced5e21ca513315214adfec07f7f6', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 20:55:52', '2022-02-07 20:55:52', '2023-02-07 15:55:52'),
('dacb95336cc3b860208c6e96514b33ac02f4e51b3cb3f026c84398ed3d8cebad9c1e8d3efcb1e804', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 19:32:38', '2022-02-08 19:32:38', '2023-02-08 14:32:38'),
('db10439a8555621a18c1e7f4865ab5c06e7932b992a05e8a99133150c46cd3a530f7906f1c496f1f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:22:59', '2021-12-20 20:22:59', '2022-12-20 15:22:59'),
('db3d07acce52773d7abcdc74e35a3175197145c87d8ca5417ef88b602ba389abad893497ada1b623', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:36:25', '2021-12-20 16:36:25', '2022-12-20 11:36:25'),
('dbaa69b511527e2cbcdac93d6f6176fbbd046c58ba3452d24785acaf379d6cd01d908aa8984cd4e0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 15:04:26', '2022-01-06 15:04:26', '2023-01-06 10:04:26'),
('dbdfdc70287ef01a04da6eb569738c192ac4667d2bdd8ff3626d482c7235b297f92814732c219565', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:07:05', '2022-02-14 22:07:05', '2023-02-14 17:07:05'),
('dc1e4d7f742b7343e35015ce2682c6b6ef6a8628f08de3b864a0c84f9788d23917662ca85b3136e2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 16:09:55', '2021-12-11 16:09:55', '2022-12-11 11:09:55'),
('dc89e6868e7ac916c84d4d17c28e1be4a608c1cf27b37e91e2a62eb85a2fcb0d722ca9be64e7a77a', 54, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:25:06', '2021-12-15 20:25:06', '2022-12-15 15:25:06'),
('dcd0ebc81b22d9e14e908b817775deb96d197ebbb89a707fc31c1141917a40abd0caf5b0b729631d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 19:45:56', '2021-12-27 19:45:56', '2022-12-27 14:45:56'),
('dd1d74a267dcf4ef25ab8ed0d7c17ed8f75a615f236e5684a1e852d7c90c3aeddf64f0aeb1b7c8d6', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-11-26 16:20:58', '2021-11-26 16:20:58', '2022-11-26 11:20:58'),
('dd41af2d5f13d41d2d3e8839f6bffb23f176d62d792f6dbe446bea602384e2925441e334ac598606', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:27:55', '2021-12-11 23:27:55', '2022-12-11 18:27:55'),
('dd591ddd131ad4890d17c2db901d405d92edb898085caf3c9f756f8c79bb82b725a645a00685e4fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 18:05:08', '2021-12-20 18:05:08', '2022-12-20 13:05:08'),
('dd5ed11a3b84b1971d379b18178972aa5c2a888c13f28836129400963f05276af136a66ba8ea51c0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:29:13', '2021-12-20 22:29:13', '2022-12-20 17:29:13'),
('dd64ac01a58ee17d3d7f7731b6b1c60b4669c386f122c4121718430ff225e255920ad9e22ab0f3ec', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-11 21:24:31', '2022-01-11 21:24:31', '2023-01-11 16:24:31'),
('dd6578c99fc90f666b9433871d28f9913fefc860d9a60427388cfcf727be6f5c10eb8b764b39c557', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-28 10:20:50', '2021-06-28 10:20:50', '2022-06-28 16:20:50'),
('dd943410ac1aa591fe66197a9b95c2c6e2d27c5e8ca739a3c803c3f38c547863ddf8959ad4932849', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 21:07:37', '2022-02-11 21:07:37', '2023-02-11 16:07:37'),
('dd9ffb16c5b7d0dcff15ab2290fd3644e8bada1ca7570e2137dfbb3206298f91aab00dae96af3cac', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 15:44:39', '2021-12-16 15:44:39', '2022-12-16 10:44:39'),
('ddfb367eb7dbefb4e2e9f09b19a5e9857c10a954bed77619043cbda904c7d9c0a0f994fb5e45e1c7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 22:37:42', '2022-02-12 22:37:42', '2023-02-12 17:37:42'),
('de28c3248e249eeae46969cbcf059d4a261eb9351e74175ac035d195074adc81f00819e3fb99e92d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:03:53', '2021-12-17 06:03:53', '2022-12-17 01:03:53'),
('de6a85ce4eb2745afa69f7f05e2385ef11392b082c57743284b8df1cd8f36acf0537859cf0058cd4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 19:43:28', '2022-02-08 19:43:28', '2023-02-08 14:43:28'),
('de798bac8f62fe8348cf564684eca5693f072a2180a15b90d7d4e2e60a25bc3c66f63c83497e7d68', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:25:30', '2021-12-29 20:25:30', '2022-12-29 15:25:30'),
('df24b4576a19e54594ea2ae4d3311ba0d606e09d97223ebe5ad37fe020bcc557c24b33391524dc5b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:23:37', '2021-12-11 23:23:37', '2022-12-11 18:23:37'),
('df29377c569606f2a4cba82140f5fab331441a90f3bdce457655272036a2d081a9dc1c01eedbcdb8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 00:55:04', '2022-01-21 00:55:04', '2023-01-20 19:55:04'),
('df666c8261ff4a24f896fa6d34de55c682a328facb086be4d13666a389fcbd442f0a44bd0bd0ca7d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:46:51', '2021-12-20 16:46:51', '2022-12-20 11:46:51'),
('dfa6bf031488eb769600c1fb5852e100426324a30fee377779ec7542499335d7d92f641963b3fe15', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:43:19', '2021-12-28 16:43:19', '2022-12-28 11:43:19'),
('dfc08357b715a0d71f315f0d16dc59cf5e599332198036dd0a09b888eba5b2add23feea48d3c84fe', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 16:03:28', '2021-12-24 16:03:28', '2022-12-24 11:03:28'),
('dfd952182ff2db7034f7bef2676409687123075c8aad7c8c4b888ab17a9f7fc33c99d600ec094dbb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 18:19:12', '2022-01-19 18:19:12', '2023-01-19 13:19:12'),
('e01d45ce96e9d39402ba24a5ea8740ce8d4fcc17f4be00591183701a920d1793979eff165d7579c1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-09 15:53:32', '2022-02-09 15:53:32', '2023-02-09 10:53:32'),
('e0966696efa2eba44d513e059fe4e6954377325c86aa62f42c2f8020c9b20ae522656453f5184840', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:27:54', '2021-12-16 21:27:54', '2022-12-16 16:27:54'),
('e1062a2917531dc8c708301c14d7ffb7a9a4109a9cf74f412e17162ff5f97959b3c20446dd5b172a', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 17:36:26', '2022-01-31 17:36:26', '2023-01-31 12:36:26'),
('e187889be297818c5eaa11417f185735931b38b0ff9cb8cda62a3671a07d12088618b061c7f52b7c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:07:00', '2021-12-20 22:07:00', '2022-12-20 17:07:00'),
('e1a8e75042a4a2ede6bc4dea90fc9222c11e1ac69eab61fd7a8bb6d2450f2758efda61678b674117', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-31 19:22:36', '2022-01-31 19:22:36', '2023-01-31 14:22:36'),
('e1c0ecde1e1d7a08853eaa4d4d394da3c1fa67173dd6d69f45d0b127ef223eb1f211e792b0d7bd8f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 20:01:18', '2022-01-06 20:01:18', '2023-01-06 15:01:18'),
('e1d2b36d1a7d6f39a54bbecb711f4bac1b9c22c54d90baaec1586e36989f52f3a76e04afd56774f4', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:55:21', '2021-12-10 15:55:21', '2022-12-10 10:55:21'),
('e20f0f8b27963112afdb3da17d030c83b6db0e655ba127540cf8bd093974c3e62338de05799f20dd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:00:10', '2021-12-17 04:00:10', '2022-12-16 23:00:10'),
('e227cbc60309c0dde03b985ef9c5c798f3f278e40dcaa5f697ab3fdc465dbfa06e39faaa13ac11ad', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 21:36:44', '2021-12-24 21:36:44', '2022-12-24 16:36:44'),
('e297fa3686cffa4e92eae8f60ad9a6282c874d272b3e60401e54c915fe792f0febebc3d70a611219', 49, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:35:02', '2021-12-14 20:35:02', '2022-12-14 15:35:02'),
('e2a23f9a0632f20a439ff5141c543d808b5e7248ba408cb84c845d6d9bd27cce4da6bb3805f22bf1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:08:59', '2022-02-11 22:08:59', '2023-02-11 17:08:59'),
('e2c6a57c32d6912c5439dceb42665aef843bfca3abd563d87a1e7707821ab1f7f74dd5b24e147ccb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:50:08', '2022-01-20 22:50:08', '2023-01-20 17:50:08'),
('e2fe585d8c7c22611c6a0fb2c90b6d6df735f189341158c19d90298a2e748b1a5178a58fe31529db', 41, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:56:44', '2021-12-14 19:56:44', '2022-12-14 14:56:44'),
('e3761caee92bf6d095d031113f1c52a8b3bdefb71470e2c73a12e2d6bed437648ebe0d56ab058fdf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 21:24:51', '2022-01-27 21:24:51', '2023-01-27 16:24:51'),
('e38f2f2dc0f4d4a33f18b30390e607ac677b3faa0f0b83613ec2f7457aacb41f47cbfde05c3ffd0c', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 22:33:47', '2022-02-14 22:33:47', '2023-02-14 17:33:47'),
('e3b1e1710959a1d307abc4056d34e800cf5c366ba94e813116471384120c37d52e58903dc52059ac', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:19:08', '2022-01-21 01:19:08', '2023-01-20 20:19:08'),
('e3b94b993ed0abc700811bfda91f52dcb4b5e235aeb145707b14eab8a31475b66f59d55c4de6b20b', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 22:15:42', '2021-12-24 22:15:42', '2022-12-24 17:15:42'),
('e3f0d0bdcbedbfb3bd8844774b96ceb39e7186dd2db40976a3d7a46a2c98e046e192ef3c90d62100', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:33:04', '2021-12-16 17:33:04', '2022-12-16 12:33:04'),
('e42878692859d75832e0e6aca7076b154edb02c8bc4051a6513b2df3d2ca7fa0f01c26c4d67fd470', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 21:15:08', '2021-12-28 21:15:08', '2022-12-28 16:15:08'),
('e45fc64d15af0a54f3f122169fd45e792423cf2b99fa7807c839d0f6d10bc08640e7a8f2d6904b71', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-07 21:15:20', '2022-02-07 21:15:20', '2023-02-07 16:15:20'),
('e47ec819d79efc6d1e0d5e18d80db88f68785bc4f20a8710b62954e96991cea5cf34d38bf7ce37a5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 16:19:43', '2022-01-06 16:19:43', '2023-01-06 11:19:43'),
('e4acec444c33eae1437e8fd5615ea6a8bfcd9630b0841ea35158b75b0da677b0d1bb40259e0087d2', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 21:01:35', '2021-12-30 21:01:35', '2022-12-30 16:01:35'),
('e4acf121abad6d4742f5280fd4180bbf65f4527aaed6245ad4346d23d19ee0d463ad3d0c2b266709', 59, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 17:32:22', '2021-12-22 17:32:22', '2022-12-22 12:32:22'),
('e53935d3a8eee41232b3c084962300894ce91a6081e6a0e5cd951a8076cd6c426d795fd3536f9363', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:17:53', '2021-12-28 20:17:53', '2022-12-28 15:17:53'),
('e564a895470fb397cecd9028ed178f90d620663e80abad517a23cc15b05b061201908155e626c5a0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 15:13:17', '2021-12-14 15:13:17', '2022-12-14 10:13:17'),
('e687cdcb26c40d987c4322fc02213888b10e43ef1681e322876001e6aebad0428a309f726c00a7c8', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 23:43:13', '2022-01-27 23:43:13', '2023-01-27 18:43:13'),
('e68e1e9c53f24be7671596f3416499c6e97c68a8450266c82fbacb9f61383d68c0c8abfe04edea44', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 16:44:46', '2022-02-12 16:44:46', '2023-02-12 11:44:46'),
('e6acca5d31a07f12015d78cea49a2a2bb70ce63fd812b0af0ac4c0f94cfc10dcab66a36f89c56001', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 21:43:24', '2022-01-20 21:43:24', '2023-01-20 16:43:24'),
('e7297cf83099a4c762f49f88d83ffce68e3dace96b30430b9ab0c10e24b2616f6f95757d94905f70', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 17:48:42', '2022-01-28 17:48:42', '2023-01-28 12:48:42'),
('e758656d47ea0e8ffff68dadfac5926ba73927611f4f7aa1ba23dc9f7f4ab6c25560259caf5d8dd1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:58:30', '2021-12-16 17:58:30', '2022-12-16 12:58:30'),
('e7dd2500d68c4c8b476ccd8047cc09ec09cc1d244640dcae64cee15b08ade7933be6b461aed0675b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 16:27:09', '2021-12-14 16:27:09', '2022-12-14 11:27:09'),
('e7f51b3412741d153c888b9ce06076518e96a73b004c1d05223fb9221abd7416e5f448b983388c8e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:40:40', '2021-12-15 21:40:40', '2022-12-15 16:40:40'),
('e83631401d0d9e3826aea7f379bac9199799fe9faa989a2a6ff34d3a9a90c14df51009a3952e7815', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 15:08:55', '2021-12-15 15:08:55', '2022-12-15 10:08:55'),
('e862ea837025d06a4a52da79a373db6c8ea5ed42f2d67a1abdffdfccb5843e846552bc5c3ecc4a6b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 23:34:17', '2021-12-11 23:34:17', '2022-12-11 18:34:17'),
('e8a28631ec1031a788393dcdcfd4b61c9ebfee026badc8b8188832e93aab52c13130bde43cfc8ec2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 22:11:04', '2022-02-11 22:11:04', '2023-02-11 17:11:04'),
('e93e3797ddfccf28358180206a1d2db3d86efa693896f30910d8355cb2b731ac8f2fdd98a3002a2f', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 01:04:22', '2022-01-28 01:04:22', '2023-01-27 20:04:22'),
('e9406a1f996daa4de20c51b5f6828423b07ab9515f6ea2e38cd462f2b4a5a925f8a6649cf98397a2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 22:34:57', '2021-12-27 22:34:57', '2022-12-27 17:34:57'),
('e9452a9160b09706c857c5b46511ca813847dab8b0c50807ac976759e680ad29123e098498b8dfdd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 19:55:31', '2021-12-10 19:55:31', '2022-12-10 14:55:31'),
('e9bf5226c5b86fa5b98e403477651c5eeadc0f4b4a793a00a44900c2750e4f8463bfbc4c724f916f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 16:27:52', '2022-01-21 16:27:52', '2023-01-21 11:27:52'),
('e9f41a85899a5182873ecbcba93dac00b966ebb758d7430b9a58eb87d2efaf49081a09edde593d71', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:45:56', '2021-12-20 20:45:56', '2022-12-20 15:45:56'),
('ea32f7a6191014c565a3acec3e6b59ad2bd56f36311944cfac261254741c61d8ee1af6bb514d8e0b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 21:51:23', '2021-12-27 21:51:23', '2022-12-27 16:51:23'),
('ea3ca170bd7935fe3f2a9c80c74d1e8e6eda8cc197ce2066305a286d175ad250475a4657e498779b', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-06-21 01:24:25', '2021-06-21 01:24:25', '2022-06-21 07:24:25'),
('ea7ad67077ccd8b8713223c9cbc3e7d4405f4c642963a21fc811c90e4f7e960bfc9230dc9d95afa5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 18:22:22', '2022-02-08 18:22:22', '2023-02-08 13:22:22'),
('ea9a3d2ad0c60c7a9353aa8e71801b4fb0ef0e06eba12fa6b43c3cd0c19d28e9e1a3ebaf8cbd53d1', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 19:12:11', '2022-02-14 19:12:11', '2023-02-14 14:12:11'),
('eac9cb823303bd034f4f45840d65c360ab275da6b5c21c2420fdd831d330da0e268e16e235a3d61e', 2, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-02 19:47:56', '2021-12-02 19:47:56', '2022-12-02 14:47:56'),
('eaf1645e9bf6f79774e6fdf7335fa49addcba92eca6585fa294a3b7b0b553a739cb022fa39a662a2', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 15:43:54', '2021-12-28 15:43:54', '2022-12-28 10:43:54'),
('eafbffe221eb462f6bcbfed3066b1035c94acf693d303beae19c4f347fdc71e68edf77af32323a27', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 20:02:21', '2021-12-22 20:02:21', '2022-12-22 15:02:21'),
('eb91d25edc61383ac552564b95f3f4820012cba8118f51ce498e98d8cfc3f31e198078f51c37567e', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 23:40:42', '2022-01-17 23:40:42', '2023-01-17 18:40:42'),
('ebaccd95a9be5b906abaa4a9011f950d8866a1ae6112121b9f7f661a44bdfcb7e957297aae9cae20', 12, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 15:47:19', '2021-12-11 15:47:19', '2022-12-11 10:47:19'),
('ebc9b31583aa326adc8ed8d5f39bfc5562e03c3dae896ada1771eeb750022a572d6479485ed25d91', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-12 00:38:08', '2022-01-12 00:38:08', '2023-01-11 19:38:08'),
('ec0bc80a762e5ca8e9350fbde5405d9b66f79cd664539299814e65864bcbb2ed3111f0447e9d66c4', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:21:29', '2021-12-21 19:21:29', '2022-12-21 14:21:29'),
('ec1164ec28b9da659e20e0f600484f0b0b6045964ff142e8fb492783b9425dfb6ed4410e00d7254e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:44:24', '2022-01-10 22:44:24', '2023-01-10 17:44:24'),
('ec251b5d3549a6f404d3b42fc94748a878befae9ff8c9c50ba002744824d2a9c488c1ee23003ff4f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 17:33:32', '2021-12-21 17:33:32', '2022-12-21 12:33:32'),
('ec3db5663a083a1de369e74740dba6a2d163fba04fcabe6b8674973df64f4f8cbf94cbb45b0b1d59', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:52:54', '2021-12-16 21:52:54', '2022-12-16 16:52:54'),
('ec6fcf797e90982975aa7d72768a24ffa964482a2dcfe8df1eaaa64cb9162c00622b768da55831e5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:04:55', '2021-12-16 17:04:55', '2022-12-16 12:04:55'),
('ed01c0153a3d45ec20511a7f4b88efb34789924de77e6bfabe3f482c9d9d95239cfd2ce0f666bc1e', 73, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 22:17:06', '2022-01-27 22:17:06', '2023-01-27 17:17:06'),
('ed074e76139bda33d46b5c873677d38efb10311ac762d5afe948842e45ff58b3aebbc6467cc872e7', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-31 21:02:44', '2021-12-31 21:02:44', '2022-12-31 16:02:44'),
('ed9d62753a0d2cfefcd34d5fc30a0ad13798b0d38fa5962182f1184e01c5859fb2872b1ad320057a', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 15:07:19', '2021-12-30 15:07:19', '2022-12-30 10:07:19'),
('eda23ab25995986496da042d9a76a9915e071846932b3d8a430ef9f3374448a4a2f3ddaf1499b9cb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:35:15', '2021-12-16 20:35:15', '2022-12-16 15:35:15'),
('ede371905b5c1025765806b41286b62dd510f0d114dd6731908dbe23ada13bb96fd344da7a264741', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 17:25:48', '2021-12-20 17:25:48', '2022-12-20 12:25:48'),
('ef071a39adf4e7780ba45933794bc3f7fea43b5c4a8add1881ede003366f608db02f5af96f8297c9', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 20:48:15', '2021-12-27 20:48:15', '2022-12-27 15:48:15'),
('f0c9bfb685d11519a0a08f2dc44f2e6759c82b5c2737658028460093431f83b3339834caf8df1d8d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:53:44', '2021-12-14 20:53:44', '2022-12-14 15:53:44'),
('f15d936f5ae752d794d0bef5c934772bc1bd18b9bf38aa6d7015dc0dbfe3d6b7811fc094b0636c75', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-08 19:51:20', '2021-12-08 19:51:20', '2022-12-08 14:51:20'),
('f190a94ca1fe7aff4e39a8c74ed321ea1944d31cbcda3b16250021911f3f2d1fdcd6322220ec2ecb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-22 15:22:54', '2021-12-22 15:22:54', '2022-12-22 10:22:54'),
('f22f38cedf6a94e68e9502b396bcc1f64101b8815b9f208e5886443ecb399ea3b060f9beeea4ecec', 56, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 20:51:15', '2021-12-15 20:51:15', '2022-12-15 15:51:15'),
('f23b5a195abda5cc0d45194ec1967f69cf99f511853e23f64651f6824c9e1d614afb6fe243f8e85f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:25:29', '2022-01-27 15:25:29', '2023-01-27 10:25:29'),
('f24b4eb39789904dc872ad85106417a33a9e9231561c2cf907078466aa88b4713e87e56369c5e1c5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 21:15:40', '2021-12-20 21:15:40', '2022-12-20 16:15:40'),
('f25971866b31f14fd208c07a7c6a999b6b8c15670b46ad81b2f175f1d90a2f62509667419717ff1e', 34, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:59:33', '2021-12-14 19:59:33', '2022-12-14 14:59:33'),
('f2781c02dab9ad0a17744ebbdd3c52c3068d60164f6e42a94eebada6bb3d9d44fad2cfe5ca7bc3e7', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-01 21:17:54', '2021-12-01 21:17:54', '2022-12-01 16:17:54'),
('f298bb3f54616a92587ecb2ff7e766cfb7414824f5020917a0bf4f615e1f7c13c4159149605d06a8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:45:40', '2022-01-20 22:45:40', '2023-01-20 17:45:40'),
('f2ad28d280b8d657cf4c59c71af1eacd4f7b147ff2700c395e57d066c738df2ef0f93061d06e5f50', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 21:58:10', '2021-12-16 21:58:10', '2022-12-16 16:58:10'),
('f2e5039573562d703d70631dbe11f861bd171e1f0e5fc87c2fbeec8310a340a5385ff7ff8c1bfb95', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:53:39', '2021-12-11 21:53:39', '2022-12-11 16:53:39'),
('f3254c85e1071c0aad40d01fc42f0ee0dabdd9c1ea5045e834184740096c0eeb1da1b5b0cc78d9eb', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-10 22:13:19', '2022-01-10 22:13:19', '2023-01-10 17:13:19'),
('f35d3c723e8bec1bc7bdb9e58f0b45b8ba25735691b6625c554e66a0cb762ce614595c1aeb254eec', 13, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:10:25', '2021-12-09 20:10:25', '2022-12-09 15:10:25'),
('f36af23f9bdcca6f5d1f8c2d5227de84d57f2d1ef7d013c77ce797c07aef3fe842ea2634bd82c0db', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 20:10:35', '2022-01-19 20:10:35', '2023-01-19 15:10:35'),
('f3786a37bab50d7329ecb8bb6ad64a922ae234c2bf595d3f665fa6fc11e39e9490c4f90d33876d7b', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-11 21:15:41', '2021-12-11 21:15:41', '2022-12-11 16:15:41'),
('f37e9e9a9e4e494ca0f940ce8c6f9e6102fd913d98240c1b0732f0c97563e075bc09c53da47742e3', 42, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:58:52', '2021-12-14 19:58:52', '2022-12-14 14:58:52'),
('f398cab20c3de14019b9680fd2c30683dc7ede686302bc82c1baebff7e01da1d47993b41106ae964', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:08:14', '2021-12-29 17:08:14', '2022-12-29 12:08:14'),
('f3eeb0082eeec449a16ba6ad3653fc62304dd7b7a673e271f360abd939fcd73deb1cf24771e48c6f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:53:30', '2021-12-16 17:53:30', '2022-12-16 12:53:30'),
('f3fed2be9373d00ec3466c32ad22ea660a933dc87169f980967c053cc104c8e9b33ff508d1b3a903', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-20 22:40:52', '2022-01-20 22:40:52', '2023-01-20 17:40:52'),
('f4353762583be7fa0e8e937dd2a8ce6e79d94c010361dcc5520ed05ab1bf2327d8dd3c726deb2596', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-14 08:36:28', '2022-02-14 08:36:28', '2023-02-14 03:36:28'),
('f45adf366aae172f25aa87a5db46042a7b412d202245422b5702aad1178529ee433c044fd2c3a1ff', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:22:11', '2021-12-15 21:22:11', '2022-12-15 16:22:11'),
('f4f57ae8827fd0a780961eee01296e64f32c6d0803873f92d8ee6fc670d3d3f1216fc79271fc877c', 10, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 19:42:13', '2021-12-09 19:42:13', '2022-12-09 14:42:13'),
('f4f5df6d736bfe85e4c37ff3f4ce09add401ff89bc75731e6d88912f0a6c5b4661b6f6438f237a35', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-18 03:00:25', '2021-12-18 03:00:25', '2022-12-17 22:00:25'),
('f53bbcf2fcfac48a28ac95f42c0e185a7a890e53479dff80efa8315490014eb8f3a7adf91bd6706f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 17:05:01', '2021-12-29 17:05:01', '2022-12-29 12:05:01'),
('f561965664d7ce5a194882933bca2f83557f7b6fff49f09f8e89f5ef5317cdf4c36b8ebf7cfd5a2a', 19, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-09 20:48:40', '2021-12-09 20:48:40', '2022-12-09 15:48:40'),
('f5a7914d2cd7a1aa9ab608d6c76eb659f033ef30edf7c35acf73793fae9074828e62deb3998792fb', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:40:43', '2021-12-14 21:40:43', '2022-12-14 16:40:43'),
('f5d75c2654daa89c8cc5c85639bba73dbf28f208db1aa5183d0b70f31e286c7a58c2ea1db7277264', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 07:01:11', '2021-12-17 07:01:11', '2022-12-17 02:01:11'),
('f623e01d3abfcd118fcae013db84901cbd3000165bb3e5df3e73d955b0c9e1d68f7febbd1423d78e', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:48:08', '2021-12-30 16:48:08', '2022-12-30 11:48:08'),
('f6359c951bb0988afdd336ec7a33c5aa8e9a0622a2a4cdccf22c4f4360df9d975decb9d11f4319ce', 1, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 17:44:44', '2022-01-06 17:44:44', '2023-01-06 12:44:44'),
('f657f0c8f384657442e78d3959dbdff803e9053c1928df2d6c97664c1cef8dacff21f7f38b132034', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:51:49', '2021-12-30 16:51:49', '2022-12-30 11:51:49'),
('f6685790d29f6d391caa36f0af69d5e8f17383add726df8fdecb73110e8aaeda5f411ab9ad4183f5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 15:25:44', '2021-12-20 15:25:44', '2022-12-20 10:25:44'),
('f6686e38f6bb706b64d2eec600bfb7bed21870e8012810dd902a042f7fdc10386a9ed52be4b03384', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-11 01:07:20', '2022-02-11 01:07:20', '2023-02-10 20:07:20'),
('f6928b1e020508e20b70e5f7803324ccdad7eac3725c27452c80b34c91a2b023fd533b767862ccbd', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-14 15:17:27', '2022-01-14 15:17:27', '2023-01-14 10:17:27'),
('f6a297b60f6bc886680a49e784faf9a7a88898583a23ba75d256c553c1dea8d942d7e134696ca008', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-24 19:39:52', '2021-12-24 19:39:52', '2022-12-24 14:39:52'),
('f6c78df6505ba7010c195bc2950a2057a064829bf188b56d595a2db239ff5572190818f7929551cf', 8, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-10 15:53:28', '2021-12-10 15:53:28', '2022-12-10 10:53:28'),
('f74b52b53a1c5de4462e8f9c53805896dbbb93b2dc58d1e04b1f9e31b4b1f724111edf0438ac926e', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-27 15:34:34', '2022-01-27 15:34:34', '2023-01-27 10:34:34'),
('f785f57c17b67e62f3edd7f88b6abe2d0266b2612f50066f4442447429a1a7b809061eb7d0e45776', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 16:32:53', '2021-12-20 16:32:53', '2022-12-20 11:32:53'),
('f7aeb91441bf59e2ee702c4891ca98ce43c23c287fa6dd8eafbbbe71f1d065ca9e856da4ac0bbfa9', 52, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 21:32:09', '2021-12-14 21:32:09', '2022-12-14 16:32:09'),
('f7ddf25ae32a95a3473e3332fe1480bd1cb7ea56c69cd4eb6380e3470a5523c04f4798d2f803cebf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:10:11', '2021-12-17 04:10:11', '2022-12-16 23:10:11'),
('f80edc7138ab2d773a744acbb1e48a1f705751013a3780b4858751a1c2e22117d2140cd7cf7c60a7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-13 19:33:30', '2022-01-13 19:33:30', '2023-01-13 14:33:30'),
('f817681aee6f276c0e1d5b5fe5dfc0e5517a0e894197505454f69a4531f5fca1e30ec790cf4acfcc', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 04:14:03', '2021-12-17 04:14:03', '2022-12-16 23:14:03'),
('f841caa99af2599b9d20a9678bf7ef4876e8234d95a02e190a389b427f72cea26bc790abb2c0708f', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-18 21:40:21', '2022-01-18 21:40:21', '2023-01-18 16:40:21'),
('f896fb2406fefc5902beada310fb13430e3bc0d7283cfc75746ce14d955dc8bef385cf092df7c008', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 20:38:37', '2021-12-20 20:38:37', '2022-12-20 15:38:37'),
('f92691b72cf9d14a080ff0f27d28bbca90ed1c38720fba85fad6706f9528e2439bfb86741705ac3a', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-14 20:04:41', '2022-01-14 20:04:41', '2023-01-14 15:04:41'),
('f944881a67a9477a59a6f3404e8b0ffeaf1d65aa2071be06bd43af1315f5c2441db87751fb7e9c4f', 57, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-12 20:49:29', '2022-02-12 20:49:29', '2023-02-12 15:49:29'),
('f997913b6ff676ab18a7ed20c24ea6c10bb4bf826eeccaf7d03edacc57a54807b5454f1229711b22', 51, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 20:56:29', '2021-12-14 20:56:29', '2022-12-14 15:56:29'),
('f9c9147fbed48af86c6deb71f9b4b158faeacbadcadfa163c8f0eaa2498a2e7e462c46a47572c9ad', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:48:36', '2021-12-14 19:48:36', '2022-12-14 14:48:36'),
('f9db62a5156ff6fd67000d7273adc4e8f1039cac893ab674e0b4be05b64e571bdafd3ac033bd7dc8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 17:59:23', '2021-12-14 17:59:23', '2022-12-14 12:59:23'),
('f9f3fae1f4730562e92d98bda940eca9ed346c954f9f607206e2608a1a70772a3c5c58c11b283a05', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 21:56:38', '2022-02-08 21:56:38', '2023-02-08 16:56:38'),
('fa16e35c6bcceffbebd397cd53b5b26cb34cad64b90025dbf45dd5d0af48ca67b2ed5a112b2686ab', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 15:47:02', '2022-01-19 15:47:02', '2023-01-19 10:47:02'),
('fa7f8123a52fac9a2eed7e74df44f9d951bb69b2fe6ad3b0e8b708cf8a0b7ad6c4bba7f836feebe4', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 19:08:56', '2022-01-28 19:08:56', '2023-01-28 14:08:56'),
('fab938fb74688303152b862369dc8bd4bec2acc556c3fdfe504be4c17c429fc5eff9b94384d56ad8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 20:21:14', '2021-12-16 20:21:14', '2022-12-16 15:21:14'),
('faf5ec9f3a72f7068b426b2fd08fe8bdc2c8c254f868ee5d5cbbfcca24a8cd296b4e1b242fd26f7d', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:25:11', '2022-01-06 14:25:11', '2023-01-06 09:25:11'),
('fb1cc1a34b176ae363f8f27b6902796ce2382f3d4f5c35c4b31d12de4ac3e9d2ef9e4f7194376999', 74, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-28 20:55:49', '2022-01-28 20:55:49', '2023-01-28 15:55:49'),
('fb4a54b3a8fadf74f5aaaea105226c7f09d5d4a7c2600ed4e3ddfbd7eb853ad545989203b9d25169', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-24 21:59:11', '2022-01-24 21:59:11', '2023-01-24 16:59:11'),
('fc1f25d7ec6ef83c888b6d062542868b10a6974a973d30a8997d092ef28e6766dc8d7ec9ec43d873', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-15 21:39:36', '2021-12-15 21:39:36', '2022-12-15 16:39:36'),
('fce40545d8a82169d886299f98349d7964ae1ca8c3c6332cb4ab52dedac0af3cc816af03f6667e88', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-21 01:40:23', '2022-01-21 01:40:23', '2023-01-20 20:40:23'),
('fce6759dfdee982b31aa08f43045cd4e79c192cb18da42dc4cf85b53c8786f85d1d39cea22b671f5', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-17 06:47:39', '2021-12-17 06:47:39', '2022-12-17 01:47:39'),
('fdad4168ff68518759ec727153f3554f5611b0febe84fc8d02c0c898a0ea12073f2472200ac4c040', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:07:06', '2022-02-08 23:07:06', '2023-02-08 18:07:06'),
('fddf882a5e4a128fa92d67a121351158a7bb68ed411d7a23bd282ab12f499ad5ae68fbc9be152a9e', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-30 16:04:41', '2021-12-30 16:04:41', '2022-12-30 11:04:41'),
('fde40abcffdaa7162d74e0881eb538f71cc95a5530d05556992f23f84b716e697b6acc36ae786f42', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 20:12:57', '2021-12-28 20:12:57', '2022-12-28 15:12:57'),
('fdf52a036f7772955a74265371febcd5163546f6c7302fe043bb742cde892f8e4bbfe95caa3b3622', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 03:45:24', '2021-12-16 03:45:24', '2022-12-15 22:45:24'),
('fe185a6f5cf079dd611f18ac2985635510e49a8c10b26a971cadf5879cec2319b0bc597bcfa75555', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-17 19:43:48', '2022-01-17 19:43:48', '2023-01-17 14:43:48'),
('fe481674a4a91e1ddaf53f8e33a3f21f44c6a582dcc7050bc4d22c530d6bdfa76b63c5da8be61eb0', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-20 22:48:47', '2021-12-20 22:48:47', '2022-12-20 17:48:47'),
('feb7c4c83d9668c7fef3e8c5f72504ab70d4d1c76fc4dd3a8018520e13ae514d4efa3e52fba801ff', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-28 16:38:10', '2021-12-28 16:38:10', '2022-12-28 11:38:10'),
('fed35cbedcb681f11964f9c08226eb8b78702d513c0c99c53d20be50e9560a24e5cc07bbd3b5e6f7', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-21 19:46:19', '2021-12-21 19:46:19', '2022-12-21 14:46:19'),
('ff04d5b750dd08b04fc626f0a75bfa5e6b1b91345d219c8f7f804b748951df2cc0393de80e656854', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-27 16:21:36', '2021-12-27 16:21:36', '2022-12-27 11:21:36'),
('ff350b8235ea678cad76f33290730504dd0a067c1438e6daef7421deb157537d64cb5f4c14115c01', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-16 17:57:49', '2021-12-16 17:57:49', '2022-12-16 12:57:49'),
('ff6e5a96de9d97bd016a6bb3c26b00ad2b328fb51fe62aed5e3158cda2837694f217e31747f0da55', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-19 19:41:46', '2022-01-19 19:41:46', '2023-01-19 14:41:46'),
('ffb42420feb214566df3786d35d6d2f572d26f739e15c2531e66a06e96d455db90acb5edd6e3e234', 38, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-14 19:53:59', '2021-12-14 19:53:59', '2022-12-14 14:53:59'),
('ffc4c30cbe28bd74700d354b66f788dfa220241f8c5cba99270e40124010e7a5de7350d321c4fcca', 63, 1, 'RestaurantCustomerAuth', '[]', 0, '2021-12-29 20:44:16', '2021-12-29 20:44:16', '2022-12-29 15:44:16'),
('ffc9f9a0d9a66707a7b64f56f0591df28190d403e61dd7807a30c00cd8831b6168cca42e261a9fdf', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-02-08 23:20:15', '2022-02-08 23:20:15', '2023-02-08 18:20:15'),
('ffd204213ed5a83818a0d03b791b75c1cb3146ebd75b06545b3a63dab8607345086ddda13c440ed8', 29, 1, 'RestaurantCustomerAuth', '[]', 0, '2022-01-06 14:17:06', '2022-01-06 14:17:06', '2023-01-06 09:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qFAwGhxq8A6SDmolyxZunXyQ4mxOH0jEezXsgaxP', NULL, 'http://localhost', 1, 0, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59'),
(2, NULL, 'Laravel Password Grant Client', 'qdV021R3MGGAwRxvvqG0mWgnypwzolzusBq1L5W6', 'users', 'http://localhost', 0, 1, 0, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-19 03:27:59', '2021-06-19 03:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_id` bigint(20) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(6,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `restaurant_discount_amount` decimal(8,2) NOT NULL,
  `original_delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(8,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `food_id`, `quantity`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `restaurant_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `transaction_id`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`) VALUES
(100001, 29, 0, 0, 744.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2022-02-14 17:06:19', '2022-02-14 19:10:48', 100.00, '2022-02-14 17:06:19', NULL, '6832', '2022-02-14 17:06:19', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 17:06:31', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100002, 29, 0, 0, 1094.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2022-02-14 17:29:59', '2022-02-14 19:10:48', 100.00, '2022-02-14 17:29:59', NULL, '7107', '2022-02-14 17:29:59', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 17:30:21', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100003, 29, 0, 0, 2444.00, 0.00, '', 'paid', 'canceled', 0.00, 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 7, '2022-02-14 19:13:39', '2022-02-14 19:13:58', 100.00, '2022-02-14 19:13:39', NULL, '1354', '2022-02-14 19:13:39', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 19:13:58', NULL, NULL, 'pay_IvpMHMuVwqqyek', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100004, 29, 0, 0, 993.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 1, 6, '2022-02-14 19:20:22', '2022-02-14 20:37:59', 100.00, '2022-02-14 19:20:22', NULL, '8504', '2022-02-14 19:20:22', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-14 20:37:59', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100005, 29, 0, 0, 1094.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 7, '2022-02-16 00:05:20', '2022-02-16 00:05:51', 100.00, '2022-02-16 00:05:20', NULL, '7120', '2022-02-16 00:05:20', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-16 00:05:51', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100006, 29, 0, 0, 1094.00, 0.00, '', 'paid', 'canceled', 0.00, 'digital_payment', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 7, '2022-02-16 00:07:52', '2022-02-16 00:08:24', 100.00, '2022-02-16 00:07:52', NULL, '4451', '2022-02-16 00:07:52', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-16 00:08:24', NULL, NULL, 'pay_IwIuDzA3CioJW9', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100007, 29, 0, 0, 1094.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 7, '2022-02-16 00:10:08', '2022-02-16 00:10:08', 100.00, '2022-02-16 00:10:08', NULL, '9062', '2022-02-16 00:10:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100008, 29, 0, 0, 1094.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 7, '2022-02-16 00:10:49', '2022-02-16 00:10:49', 100.00, '2022-02-16 00:10:49', NULL, '7350', '2022-02-16 00:10:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100009, 29, 0, 0, 1094.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 7, '2022-02-16 00:12:09', '2022-02-16 00:12:09', 100.00, '2022-02-16 00:12:09', NULL, '7296', '2022-02-16 00:12:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100010, 29, 0, 0, 994.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-16 00:14:15', '2022-02-16 00:15:39', 100.00, '2022-02-16 00:14:15', NULL, '7415', '2022-02-16 00:14:15', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-16 00:15:39', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100011, 29, 0, 0, 993.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-16 17:50:35', '2022-02-16 17:50:59', 100.00, '2022-02-16 17:50:35', NULL, '6153', '2022-02-16 17:50:35', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-16 17:50:59', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100012, 29, 0, 0, 993.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-18 16:13:48', '2022-02-18 16:14:10', 100.00, '2022-02-18 16:13:47', NULL, '5715', '2022-02-18 16:13:48', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-18 16:14:10', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100013, 29, 0, 0, 994.00, 0.00, '', 'unpaid', 'pending', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-18 16:21:36', '2022-02-18 16:21:36', 100.00, '2022-02-18 16:21:36', NULL, '8813', '2022-02-18 16:21:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100014, 29, 0, 0, 544.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-18 16:58:44', '2022-02-18 16:59:43', 100.00, '2022-02-18 16:58:44', NULL, '7062', '2022-02-18 16:58:44', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-18 16:59:43', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0),
(100015, 29, 0, 0, 544.00, 0.00, '', 'unpaid', 'canceled', 0.00, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, 'delivery', 0, 6, '2022-02-18 17:00:05', '2022-02-18 17:00:28', 100.00, '2022-02-18 17:00:05', NULL, '8643', '2022-02-18 17:00:05', NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-18 17:00:28', NULL, NULL, '', '{\"contact_person_name\":\"Rai Rai\",\"contact_person_number\":\"9474029024\",\"address_type\":\"Delivery\",\"address\":\"kolkata, sdf\",\"longitude\":\"88.4202935801241\",\"latitude\":\"22.584990444621944\"}', 0, 0.00, 100.00, NULL, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `food_details` text COLLATE utf8mb4_unicode_ci,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci,
  `discount_on_food` decimal(8,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `tax_amount` decimal(8,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(8,2) NOT NULL,
  `restaurant_amount` decimal(8,2) NOT NULL,
  `admin_commission` decimal(8,2) NOT NULL,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sujoy.lnsel@gmail.com', '3886', '2021-11-26 15:39:35'),
('sujoy.lnsel@gmail.com', '3139', '2021-11-26 15:40:32'),
('sujoy.lnsel@gmail.com', '5204', '2021-11-26 15:40:59'),
('sujoy.lnsel@gmail.com', '5909', '2021-11-29 14:45:39'),
('sujoy.lnsel@gmail.com', '6047', '2021-11-29 14:48:13'),
('sujoy.lnsel@gmail.com', '9122', '2021-11-29 20:28:43'),
('sujoy.lnsel@gmail.com', '4474', '2021-11-29 20:29:14'),
('sujoy.lnsel@gmail.com', '7892', '2021-11-29 20:30:11'),
('abc@gmail.com', '4745', '2021-12-15 16:39:45'),
('abc@gmail.com', '2956', '2021-12-15 16:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_verifications`
--

INSERT INTO `phone_verifications` (`id`, `phone`, `token`, `created_at`, `updated_at`) VALUES
(1, '0123456789', '8783', '2021-11-13 08:21:56', '2021-11-13 08:21:56'),
(2, '9874892612', '1744', '2021-11-26 16:20:58', '2021-11-26 16:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(6,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(8,2) DEFAULT '0.00',
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `food_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(6,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `offerprice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offertext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `opening_time`, `closeing_time`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `description`, `offerprice`, `discount`, `offertext`) VALUES
(1, 'Chines', '0123456789', 'sujoy.lnsel@gmail.com', '2021-11-13-618f929ed5c2f.png', '22.584990444621944', '88.4202935801241', 'Sector 5', NULL, 0.00, 20.00, 1, '10:00:00', '23:00:00', 1, 1, '2021-11-13 07:25:34', '2022-01-18 18:40:41', 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"4.0\":1}', '2021-11-13-618f929ed6fc8.png', 1, 1, 1, 5.00, 2, 1, 1, '124', '{\"status\":null,\"code\":null}', 1, 0, 0.00, 'South Indian , Chines , Beverage', '₹400 for', '60%', '1. \"60% off upto ₹125 + Flat ₹930 cashback with Paytm | Use code WELCOMEBACK\"\r\n2. \"20% off upto ₹150 | Use code TRYNEW\"'),
(2, 'Café Monarch', '+910111111111', 'joshef.doe1025822@gmail.com', '2021-08-20-611fc4cd9c598.png', '19.055908041476712', '72.92335204083659', NULL, NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 2, '2021-11-27 14:41:50', '2022-01-18 20:36:04', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"3.0\":1}', NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(3, 'Hungry Puppets', '+8801710000000', 'test.restaurant@gmail.com', '2021-08-20-611fc6cd6b011.png', '25.186958967714926', '85.00810402562027', NULL, NULL, 0.00, 0.00, 0, '10:01:00', '23:59:00', 1, 3, '2021-11-27 14:41:50', '2021-11-27 14:41:50', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(4, 'Cheesy Restaurant', '+8801747413273', 'nipon34.bd@gmail.com', '2021-08-20-611fc7b17088c.png', '23.62608237589538', '90.34303799676506', NULL, NULL, 0.00, 0.00, 0, '10:00:00', '23:00:00', 1, 4, '2021-11-27 14:41:50', '2022-01-19 20:27:18', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"3.0\":1}', NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(5, 'Cheese Burger', '+88525695888', 'test.restaurant1@gmail.com', '2021-08-20-611fc9b200e8c.png', '25.506848691070893', '74.1576624261471', NULL, NULL, 0.00, 0.00, 0, '00:01:00', '23:58:00', 1, 5, '2021-11-27 14:41:50', '2021-11-27 14:41:50', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(6, 'Hoppipola', '8965742346', 'test.restaurant2@gmail.com', '2022-02-08-6202607e9b811.png', '22.58988023216237', '88.40656066996785', '164/1, 4th Floor, Mani Square Mall, EM By Pass, Maniktala Main Road, Kankurgachi, Kolkata', NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 6, '2021-11-27 14:41:50', '2022-02-18 16:21:22', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"5.0\":1}', '2022-02-08-6202607e9ba8f.png', 1, 1, 1, 12.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(7, 'Traffic Gastropub', '9836741259', 'test.restaurant3@gmail.com', '2022-02-08-620263d3bd605.png', '22.589404757782898', '88.41239715678425', '2nd Floor, City Centre 2 Mall, Rajarhat, Chinar Park, Kolkata', NULL, 0.00, 0.00, 0, '10:00:00', '23:00:00', 1, 7, '2021-11-27 14:41:50', '2022-02-18 16:17:27', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"5.0\":1}', '2022-02-08-620263d3bd905.png', 1, 1, 1, 12.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(8, 'Vintage Kitchen', '+12562458744', 'test.restaurant4@gmail.com', '2021-08-21-612008a117429.png', '34.037046130269005', '71.57724860778772', NULL, NULL, 0.00, 0.00, 0, '00:01:00', '14:00:00', 1, 8, '2021-11-27 14:41:50', '2021-11-27 14:41:50', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(9, 'The Capital Grill', '+12584555555', 'test.restaurant5@gmail.com', '2021-08-21-612009adefa47.png', '28.55772186629488', '83.20696357360804', NULL, NULL, 0.00, 0.00, 0, '10:00:00', '23:00:00', 1, 9, '2021-11-27 14:41:50', '2021-11-27 14:41:50', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(10, 'Tasty Takeaways', '+880100000000', 'test.restaurant6@gmail.com', '2021-08-21-61200a8ff04a6.png', '23.04107198840827', '90.98442557922327', NULL, NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 10, '2021-11-27 14:41:50', '2021-11-27 14:41:50', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(11, 'Tasty Lunch', '+91025888888', 'test.restaurant7@gmail.com', '2021-12-21-61c162719ed3c.png', '22.590831175996335', '88.40810562236042', 'Sector 5', NULL, 0.00, 0.00, 0, '17:00:00', '23:00:00', 1, 11, '2021-11-27 14:41:51', '2021-12-21 15:43:21', 0, NULL, '2021-12-21-61c1624509599.png', 1, 1, 1, 0.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, 'South Indian , Chines , Beverage', '₹500 for 2 persons', '', ''),
(12, 'Redcliff Cafe', '+91025558884', 'test.restaurant8@gmail.com', '2021-12-21-61c162984c51b.png', '22.595268827057264', '88.41840530497761', 'Collage more busstand', NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 12, '2021-11-27 14:41:51', '2022-02-08 22:16:48', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":1,\"5\":2,\"2.0\":1}', '2021-12-21-61c162984c7cd.png', 1, 1, 1, 0.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, 'South Indian , Chines , Beverage', '₹300 for 2 persons', '25%', ''),
(13, 'Mini Kebab', '+02541255888', 'test.restaurant10@gmail.com', '2021-08-21-61200e081c2b7.png', '7.280452008158948', '80.63957083753274', NULL, NULL, 0.00, 0.00, 0, '02:00:00', '13:00:00', 1, 13, '2021-11-27 14:41:51', '2021-11-27 14:41:51', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(14, 'Pizza restaurant', '+212588888', 'test.restaurant13@gmail.com', '2021-08-21-61200ff9e3cb0.png', '15.672099947435255', '101.45834449401819', NULL, NULL, 0.00, 0.00, 0, '01:00:00', '10:00:00', 1, 14, '2021-11-27 14:41:51', '2021-11-27 14:41:51', 0, NULL, NULL, 1, 1, 1, 0.00, 1, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(15, 'Bhajohari Ranna', '9865741238', 'test.restaurant12@gmail.com', '2022-02-08-62025d6f19e84.png', '22.591782113263527', '88.40947891337605', 'Sarat Colony, 185/1, Jessore Rd, Khalisha Kota, Birati, Kolkata, West Bengal 700081', NULL, 0.00, 0.00, 0, '00:01:00', '23:59:00', 1, 15, '2021-11-27 14:41:51', '2022-02-09 17:44:25', 0, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"3.0\":1}', '2022-02-08-62025d6f1a206.png', 1, 1, 1, 5.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', ''),
(16, 'Arsalan Restaurant & Caterer', '9012569871', 'testrestaurant123@yahoo.com', '2022-02-08-62025b6698a3a.png', '22.58464992370392', '88.40913559062214', 'Service Rd, opposite Spencers, Chinar Park, Sukanta Pally, Newtown, Kolkata, West Bengal 700157', NULL, 0.00, 0.00, 0, '10:00:00', '01:10:00', 1, 16, '2021-11-27 14:41:51', '2022-02-08 22:41:14', 0, NULL, '2022-02-08-62025b6698c65.png', 1, 1, 1, 5.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(8,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(8,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_wallets`
--

INSERT INTO `restaurant_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, 0.00, 0.00, 0.00, 0.00, '2021-11-15 15:41:35', '2021-11-15 15:41:35'),
(2, 11, 0.00, 0.00, 0.00, 0.00, '2021-11-30 16:36:58', '2021-11-30 16:36:58'),
(3, 12, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:15:58', '2022-02-08 22:15:58'),
(4, 6, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:18:27', '2022-02-08 22:18:27'),
(5, 13, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:23:46', '2022-02-08 22:23:46'),
(6, 10, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:24:08', '2022-02-08 22:24:08'),
(7, 9, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:24:26', '2022-02-08 22:24:26'),
(8, 7, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:24:43', '2022-02-08 22:24:43'),
(9, 5, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:25:14', '2022-02-08 22:25:14'),
(10, 16, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:25:37', '2022-02-08 22:25:37'),
(11, 2, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:32:40', '2022-02-08 22:32:40'),
(12, 3, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:32:56', '2022-02-08 22:32:56'),
(13, 15, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:33:34', '2022-02-08 22:33:34'),
(14, 14, 0.00, 0.00, 0.00, 0.00, '2022-02-08 22:41:37', '2022-02-08 22:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cart_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `food_id`, `user_id`, `comment`, `attachment`, `rating`, `order_id`, `cart_id`, `created_at`, `updated_at`, `item_campaign_id`) VALUES
(1, 12, 29, 'test', '[]', 4, 100039, 0, '2022-01-18 16:57:44', '2022-01-18 16:57:44', NULL),
(2, 148, 29, 'null', '[]', 5, 100042, 0, '2022-01-18 18:37:37', '2022-01-18 18:37:37', NULL),
(3, 6, 29, 'null', '[]', 2, 100002, 0, '2022-01-18 18:38:03', '2022-01-18 18:38:03', NULL),
(4, 148, 29, 'test', '[]', 5, 100041, 0, '2022-01-18 18:40:24', '2022-01-18 18:40:24', NULL),
(5, 6, 29, 'test', '[]', 4, 100003, 0, '2022-01-18 18:40:41', '2022-01-18 18:40:41', NULL),
(6, 5, 29, 'test', '[]', 3, 100001, 0, '2022-01-18 20:36:04', '2022-01-18 20:36:04', NULL),
(7, 7, 29, 'test', '[]', 3, 100004, 0, '2022-01-19 20:27:18', '2022-01-19 20:27:18', NULL),
(8, 152, 29, 'test', '[]', 3, 100045, 0, '2022-01-19 20:30:36', '2022-01-19 20:30:36', NULL),
(9, 12, 74, 'test', '[]', 2, 100048, 0, '2022-01-28 00:50:42', '2022-01-28 00:50:42', NULL),
(10, 193, 29, 'test', '[]', 1, 100001, 0, '2022-02-14 18:15:45', '2022-02-14 18:15:45', NULL),
(11, 192, 29, 'test', '[]', 2, 100002, 0, '2022-02-14 18:15:55', '2022-02-14 18:15:55', NULL),
(12, 191, 29, 'test', '[]', 5, 100002, 0, '2022-02-14 18:21:29', '2022-02-14 18:21:29', NULL),
(13, 193, 7, 'test', '[]', 4, 100001, 0, '2022-02-14 19:41:15', '2022-02-14 19:41:15', NULL),
(14, 192, 7, 'test', '[]', 5, 100002, 0, '2022-02-14 19:52:45', '2022-02-14 19:52:45', NULL),
(15, 189, 7, 'test', '[]', 2, 100003, 0, '2022-02-18 16:17:03', '2022-02-18 16:17:03', NULL),
(16, 190, 7, 'test', '[]', 5, 100003, 0, '2022-02-18 16:17:27', '2022-02-18 16:17:27', NULL),
(17, 197, 6, 'test', '[]', 5, 100012, 0, '2022-02-18 16:21:22', '2022-02-18 16:21:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(11) NOT NULL DEFAULT '0',
  `agestatus` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `agestatus`) VALUES
(1, 'joy', 'sen', '0123456789', 'joy@gmail.com', NULL, 0, NULL, '$2y$10$ApqwR9GXC.02EzfrZz0BZ.g6s4RLegyVNZMvzjgyO6g4oFC2E8M5G', NULL, '2021-11-13 08:21:56', '2021-12-29 19:10:14', NULL, NULL, 1, 0, 2),
(2, 'demo', 'demo', '919874892612', 'demo1@demo.com', NULL, 0, NULL, '$2y$10$ujAxA/SRrhotNvT9TcgbPuykvq3aS3ehGhErn6u2ng1fSKhrpWnka', NULL, '2021-11-26 15:29:11', '2021-11-26 15:29:11', NULL, NULL, 1, 0, 1),
(3, 'Deep', 'Das', '911234567890', 'sujoygaraikolkata@gmail.com', NULL, 1, NULL, '$2y$10$Ta0sb4CyDHkbP7b3WEzyUuhpv5lVHM6cdovZJvqMSOuHnhT1OYRpy', NULL, '2021-11-29 16:41:37', '2021-12-31 21:32:08', NULL, NULL, 1, 0, 2),
(4, 'JK', 'Sen', '919874892616', 'shive@gmail.com', NULL, 1, NULL, '$2y$10$k3bSlycdyFTKJfwH5l/qTeWXGQGGPfr.3hMz0ail0fV9jf6Iml4cy', NULL, '2021-11-30 15:05:58', '2021-12-31 21:36:34', '[\"[I love Biryani,sweets]\"]', NULL, 1, 0, 2),
(5, 'abc', 'xyz', '1234567890', 'abc@gmail.com', NULL, 0, NULL, '$2y$10$QDB9FpyIny2iyInHqv0skuhOPXRwwHxJV0ivtra4/PqjnYUJZi/uy', NULL, '2021-12-08 19:51:20', '2021-12-31 21:40:12', NULL, NULL, 1, 0, 2),
(6, 'lmm', 'll', '5252525252', 'll@gmail.com', NULL, 0, NULL, '$2y$10$ZEVXVl4Zs.GlTGJ8ND83Gu7d5CwdyvThhd5COLBMtl2lhkSIf3wYK', NULL, '2021-12-08 19:55:56', '2021-12-31 21:42:00', NULL, NULL, 1, 0, 2),
(7, 'lmm', 'll', '5252525253', 'llm@gmail.com', NULL, 0, NULL, '$2y$10$LWrd3WV7U80GivRHcXsLaOMx/Dn56UxEiMNkzF31wBYmdWIA.0fbe', NULL, '2021-12-08 21:16:18', '2021-12-08 21:16:18', NULL, NULL, 1, 0, 0),
(8, 'tr', 'ty', '4444444444', 'tf@gmail.com', NULL, 0, NULL, '$2y$10$0O1wkiIbOnVWrD0LQ0ll5./vnPfFqN/qYjSs05OPtujwCtvYGp/YC', NULL, '2021-12-09 17:09:01', '2021-12-09 17:09:01', NULL, NULL, 1, 0, 0),
(9, 'rt', 'ui', '3232323232', 'fg@gmail.com', NULL, 0, NULL, '$2y$10$74oJEP3FhkmlMY/v21CFCuPxvEKbaCs2wQM7tgP5hs7MRmnnRhzVq', NULL, '2021-12-09 19:41:30', '2021-12-09 19:41:30', NULL, NULL, 1, 0, 0),
(10, 'lmmm', 'lll', '5252525251', 'llmi@gmail.com', NULL, 0, NULL, '$2y$10$EjPSdhheeVIIGja5T1iVueKCOYEQ7Yx/xdnGXRzBu.qruuvUj2z1m', NULL, '2021-12-09 19:42:13', '2021-12-09 19:42:13', NULL, NULL, 1, 0, 0),
(11, 'rtr', 'uii', '3232323230', 'fgi@gmail.com', NULL, 0, NULL, '$2y$10$AeGpTUi2V6L.982K/rYbS.Ou9KsYTEctk8XLsUrMSZSK17GIK3Mry', NULL, '2021-12-09 19:44:22', '2021-12-09 19:44:22', NULL, NULL, 1, 0, 0),
(12, 'yyyyyy', 'yyyyyy', '123456789', 'yyy@gmail.com', NULL, 0, NULL, '$2y$10$PmkWxaloelPfg4uieGu2tOFchbKJbxe9AonZd3NF1EUQZYsuBXAZq', NULL, '2021-12-09 20:05:27', '2021-12-11 22:13:01', NULL, NULL, 1, 0, 0),
(13, 'lmmmm', 'llll', '5252525250', 'llmii@gmail.com', NULL, 0, NULL, '$2y$10$kdXutlBPGnECwqZKzEI6QusAbCka8tBrm/FsfkO3a5awAcfVYq26i', NULL, '2021-12-09 20:10:25', '2021-12-09 20:10:25', NULL, NULL, 1, 0, 0),
(14, 'lmmmml', 'lllll', '5252525258', 'llmiil@gmail.com', NULL, 0, NULL, '$2y$10$Mf.eGRN62dQsPguvbWbuFe/TuNNcdz5.Rck/cJMSwqw9ZCD1Omevq', NULL, '2021-12-09 20:11:05', '2021-12-09 20:11:05', NULL, NULL, 1, 0, 0),
(15, 'joy', 'Das', '91123456789', 'joy1.das@gmail.com', NULL, 0, NULL, '$2y$10$lA3I4wJuyUIKfi7EV5eDtubCrBBNfgI1YLib7z0lkuZTDvaT4G2Nm', NULL, '2021-12-09 20:20:15', '2021-12-29 19:32:13', NULL, NULL, 1, 0, 0),
(16, 'lmmmmla', 'llllla', '5252525255', 'llmiila@gmail.com', NULL, 0, NULL, '$2y$10$imJIf6nLQ3ghPhqOhEMelOWTHogyp9rlHwvaRnkaEjKOTlB3Widca', NULL, '2021-12-09 20:22:16', '2021-12-09 20:22:16', NULL, NULL, 1, 0, 0),
(17, 'lmmmmla', 'lllllaq', '5252525259', 'llmiilaq@gmail.com', NULL, 0, NULL, '$2y$10$udjMtk92XiJ3ij7SgqovL.vYOpW899Tz4dmrqjP8xlErJX.B/9eG.', NULL, '2021-12-09 20:41:46', '2021-12-09 20:41:46', NULL, NULL, 1, 0, 0),
(18, 'lmmmmla', 'lllllaqq', '5252525254', 'llmiilaqq@gmail.com', NULL, 0, NULL, '$2y$10$p8WHXE11rv4VmJu8MCDEe.G5UOifZ591V2H7CyB5ETUhfIA3AfD0W', NULL, '2021-12-09 20:47:46', '2021-12-09 20:47:46', NULL, NULL, 1, 0, 0),
(19, 'rtre', 'uiiq', '3232323235', 'fgii@gmail.com', NULL, 0, NULL, '$2y$10$YcyYVYm0GTRR6yAHH5nY6uMPAQt6UElD0eQXvzXMkoeDSu9ePlZJy', NULL, '2021-12-09 20:48:40', '2021-12-09 20:48:40', NULL, NULL, 1, 0, 0),
(20, 'lmmmmlar', 'lllllaqqr', '5252525257', 'llmiilaqqr@gmail.com', NULL, 0, NULL, '$2y$10$zYZUESisIMxSeAZheV.WMuepnZV6rdRniz1vTWE.WIXyTBheKVzre', NULL, '2021-12-09 20:50:16', '2021-12-09 20:50:16', NULL, NULL, 1, 0, 0),
(21, 'lmmmmlara', 'lllllaqqra', '5252525245', 'llmiilaqqra@gmail.com', NULL, 0, NULL, '$2y$10$q7KymL5/U8BLGIEeD7DfoOMkIDqa8OD079WZNBL1d6BXVY8HpF3vK', NULL, '2021-12-09 21:35:46', '2021-12-09 21:35:46', NULL, NULL, 1, 0, 0),
(22, 'Rima', 'Sing', '1231231231', 'rima@gmail.com', NULL, 0, NULL, '$2y$10$uulaHgUuxBya03WbBIaEH..aPcufshnCEAZIUeL6uy7f0IANC6XNC', NULL, '2021-12-09 21:41:38', '2021-12-09 21:41:38', NULL, NULL, 1, 0, 0),
(23, 'Riya', 'Sing', '1231231232', 'riya@gmail.com', NULL, 0, NULL, '$2y$10$TsGJTlAQLlwXY6VCMRCxOesnmkppn40T2hfeiA0xl9Tpd5eynr3MC', NULL, '2021-12-09 21:43:35', '2021-12-09 21:43:35', NULL, NULL, 1, 0, 0),
(24, 'Riki', 'Sing', '1231231235', 'riki@gmail.com', NULL, 0, NULL, '$2y$10$LKd1c5X1ME2U9aNHQnVtvuiRO1K6kf9kxowEoaLy3Yo05O3pH3q7u', NULL, '2021-12-09 21:44:56', '2021-12-09 21:44:56', NULL, NULL, 1, 0, 0),
(25, 'Rik', 'Sing', '1231231230', 'rik@gmail.com', NULL, 0, NULL, '$2y$10$OCRSNYW12DV3adS.PPDjwOWopZmIe.hbjzYUeSRwToTg7kcsvLlwu', NULL, '2021-12-09 21:45:43', '2021-12-09 21:45:43', NULL, NULL, 1, 0, 0),
(26, 'Rik', 'Sing', '1231231239', 'riko@gmail.com', NULL, 0, NULL, '$2y$10$Sv08cnxAlpnVuUWWDFw5WOvrGzS1EwOABxLnfYkik.VfN4nSCkOd.', NULL, '2021-12-09 23:30:17', '2021-12-09 23:30:17', NULL, NULL, 1, 0, 0),
(27, 'Rik', 'Sing', '1231231238', 'riku@gmail.com', NULL, 0, NULL, '$2y$10$OKFM3tFx6EzHl4EVvjrUhOxIDS5PI3GhkFHcEcEvj1VQS0V7IjjkC', NULL, '2021-12-09 23:31:03', '2021-12-09 23:31:03', NULL, NULL, 1, 0, 0),
(28, 'Rik', 'Sing', '1231231249', 'ri@gmail.com', NULL, 0, NULL, '$2y$10$9N2QEy9BQExb7lAtdNLa1eNzQPVnlaLgAhox1O1AjdDxwn.zqSTk2', NULL, '2021-12-09 23:42:28', '2021-12-09 23:42:28', NULL, NULL, 1, 0, 0),
(29, 'Rai', 'Sen', '9474029024', 'rai@gmail.com', NULL, 1, NULL, '$2y$10$YN1lq2TXUL7kotI6X6DHvevG15KKeUAfE9ENofT.rPxQtSPEsqC3W', NULL, '2021-12-10 15:33:38', '2021-12-14 20:44:44', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGU3N2UzZTU2Y2FlMDBkN2MxOWVhZDVjOTE0MWFjMmI0YmViZWVjMjczNGQ5NTI1YTU4OWRjYTFmMTFjNGE3NTMyODA4OGEwZjVkNWFmZTQiLCJpYXQiOjE2NDUxNjM0NjguNDQ2MzI0MTEwMDMxMTI3OTI5Njg3NSwibmJmIjoxNjQ1MTYzNDY4LjQ0NjMzMDA3MDQ5NTYwNTQ2ODc1LCJleHAiOjE2NzY2OTk0NjguNDQwNzQ1MTE1MjgwMTUxMzY3MTg3NSwic3ViIjoiMjkiLCJzY29wZXMiOltdfQ.pHZPphfg5aH58ef4YqKPD3ZRu_7nsmTCRTlEMX1Tz9W3Na-vs45Dxbe44CPKGXX3N-35yj0IMZPWtfsqskJ1YWLXXF-TmhrojetDrFOehBfKUGiKlkZSJGJCybFIwwt35LFNy6_FhRCEDLBel5U0xOKoICV1tSok87p3fayNa3dUBtX9HDCNwyBLndv9maYrtRGedWMVdBMTe13b1gnZn2mG6bA2EnatShhTvgY6kSAlrwqvcY70CMli31iN5o15nT5v9tX5g8ND3ozh_52XJ3R7GKYLB4bROojUBcJwuwv0KwrdmxamzjCgw4DkxpNv3j4CuVrpemfBuPXuxstCi_nOwMTTwlCBTV3-7ocErWch2TE37glganMLtPdQ34pOEOAmgEKrXSaATqLEicOAMOVuJrn57PnFp5R2pDCg34tVeRSlYoYuz-jFHoKWKZ8idfzBdV13tIS_zKlOzp1n-R4RonOFZT22R6zPVgkvhsc_Bt46y2MpBp0myRRh5KBbAAXubiA_0Taw9igJL2qs1vbpY3_T3FimC4m86ds-euKY7M9LhRcAnpDGDYVky7d_TCt0OD1CPETdHk25EeYwFaK9ssRKSc9jWHm4DSb6Lm45k5jc3-N6-NnQtOCqxlp1NPhxUwhHgU1RYjpwKVdPQT1m5nrekzpMMy2E5J7RWC4', 1, 0, 1),
(30, 'Rai', 'Sen', '9474029023', 'raii@gmail.com', NULL, 0, NULL, '$2y$10$.lpykuvFEjDq82J8OVVJAuZ9TLDP2ZDEU1ZpLce0FUx3CG2Plpe6y', NULL, '2021-12-10 15:34:59', '2021-12-10 15:34:59', NULL, NULL, 1, 0, 0),
(31, 'yy', 'yy', '2222221212', 'tyt@gmail.com', NULL, 0, NULL, '$2y$10$h2LRR6ygjAQ8IE2Oz5rjV.JsdqtXaM/kYGk16Kd2CXiJkeTA2yyx6', NULL, '2021-12-10 15:43:31', '2021-12-10 15:43:31', NULL, NULL, 1, 0, 0),
(32, 'yy', 'yy', '2222221210', 'tytp@gmail.com', NULL, 0, NULL, '$2y$10$B.t4/rrFIfZN4nddXgk17OBHFaDt6aTT0bOqMp89yqBuQrw9vGsSy', NULL, '2021-12-10 15:44:13', '2021-12-10 15:44:13', NULL, NULL, 1, 0, 0),
(33, 'yy', 'yy', '2222221214', 'tytp5@gmail.com', NULL, 0, NULL, '$2y$10$uT505CEFp6vR6oBDcyqxke/DquyU0iNJ7MvpRDhifvNSqXlyflgVW', NULL, '2021-12-10 15:44:55', '2021-12-11 20:43:56', NULL, NULL, 1, 0, 0),
(34, 'prasanta', 'shee', '9836755564', 'coordinator@lnsel.net', NULL, 0, NULL, '$2y$10$XXK.aTDUf7PLBA8yGQCGr.2OERosw5Vy5zX2Cu71TpqUtooMZALe2', NULL, '2021-12-14 19:37:49', '2021-12-30 21:49:09', NULL, NULL, 1, 0, 0),
(35, 'prasanta', 'shee', '9748925561', 'support@lnsel.net', NULL, 0, NULL, '$2y$10$Vb3iaeAhzG.KXmF99cZCH.mU1.bDW8pgpwki7MKtXDsR87/dNkNEK', NULL, '2021-12-14 19:38:28', '2021-12-14 19:38:28', NULL, NULL, 1, 0, 0),
(36, 'prasanta', 'shee', '6290603972', 'monojitroy.lnsel@gmail.com', NULL, 0, NULL, '$2y$10$tUUPnaInWsncKijCKWoGde3Rcoj/UhWpAqSrQFYmzOybJnMPFOSf6', NULL, '2021-12-14 19:41:45', '2021-12-14 19:41:45', NULL, NULL, 1, 0, 0),
(37, 'prasanta', 'shee', '9836755565', 'coordinator1@lnsel.net', NULL, 0, NULL, '$2y$10$vGyqi8JaOj7gj/99QrPyzOd3q2IeXatfv6o/WOebuCXIFhrPast72', NULL, '2021-12-14 19:45:48', '2021-12-14 19:45:48', NULL, NULL, 1, 0, 0),
(38, 'snigdho', 'upadhupadhyay', '9735117684', 'snigdho.lnsel@gmail.com', NULL, 0, NULL, '$2y$10$AFSGSQJPRsTbWbH1f9sEauejEdmaF5PWu7h.CHO9N/hfvwU1SOjxS', NULL, '2021-12-14 19:53:59', '2021-12-14 19:53:59', NULL, NULL, 1, 0, 0),
(39, 'snigdho', 'upadhyay', '9735117685', 'snigdho.lnsel1@gmail.com', NULL, 0, NULL, '$2y$10$w3N9H6RHEBWWVpxf369mZeUj7msTP.rLaoxcVzZuNLnvnmHicrmFy', NULL, '2021-12-14 19:54:54', '2021-12-14 19:54:54', NULL, NULL, 1, 0, 0),
(40, 'lmmmmlarau', 'lllllaqqrau', '5252525288', 'llmiilaqqra6@gmail.com', NULL, 0, NULL, '$2y$10$rBBMiOYzFhfToQQVAbfYiuZ7I26.0IddHbgagj0MSH.jkPjL9zfpu', NULL, '2021-12-14 19:55:55', '2021-12-14 19:55:55', NULL, NULL, 1, 0, 0),
(41, 'ttt', 'ttr', '2536253625', 'rd@gmail.com', NULL, 0, NULL, '$2y$10$iVyqTc5VwI9Ego5RH0.zxeauCAnLpAFK7oomiVa3BHt7wW.mzd.Qa', NULL, '2021-12-14 19:56:44', '2021-12-14 19:56:44', NULL, NULL, 1, 0, 0),
(42, 'kkk', 'llpp', '5252525277', 'kk@gmail.com', NULL, 0, NULL, '$2y$10$kCmXIbsrRokqDUqyfycv3ukyhfxdCkZ9LAl5rz3L6lQDtra.28KV.', NULL, '2021-12-14 19:58:52', '2021-12-14 19:58:52', NULL, NULL, 1, 0, 0),
(43, 'sana', 'ali', '8521478007', 'sana@mailinator.com', NULL, 0, NULL, '$2y$10$tudTQHnsNzQ5a1WEGJxq2.cllnX/qE3673GpYEBJCpuAeJSfOSguO', NULL, '2021-12-14 20:03:28', '2021-12-31 20:40:54', NULL, NULL, 1, 0, 0),
(44, 'sana', 'ali', '9876543210', 'sana1@mailinator.com', NULL, 0, NULL, '$2y$10$sOi5/52ZOMlVihzboJMf3O7WAGj4/IlySWEP59uwgSnY/VdB1Q0dO', NULL, '2021-12-14 20:04:30', '2021-12-30 21:19:03', NULL, NULL, 1, 0, 2),
(45, 'kkkp', 'llppa', '5252525270', 'kkp@gmail.com', NULL, 0, NULL, '$2y$10$sV8zqGus.67XRWvM/Dvi1eWICo2YsxZHpYxSqn2MXY.Wg65sd3nSy', NULL, '2021-12-14 20:10:06', '2021-12-14 20:10:06', NULL, NULL, 1, 0, 0),
(46, 'ttte', 'ttrp', '2536253622', 'rdq@gmail.com', NULL, 0, NULL, '$2y$10$RsAjIQ4iRJwP4jVMv.Km.u0MbJPpuFe.8SVLfBLp8lWeN653r4yee', NULL, '2021-12-14 20:10:33', '2021-12-30 21:29:45', NULL, NULL, 1, 0, 2),
(47, 'tttg', 'ttru', '2536203622', 'rdqt@gmail.com', NULL, 0, NULL, '$2y$10$nJsXzyUcUfwGTNhdY7s0x.yXjnGlnI1trlRhAgmC6i17QWRGdH266', NULL, '2021-12-14 20:12:09', '2021-12-14 20:12:09', NULL, NULL, 1, 0, 0),
(48, 'tttg', 'ttru', '2536203621', 'rdot@gmail.com', NULL, 1, NULL, '$2y$10$361yY.cWO.Ynkld.Yrm04.F1Pmn27IT.9M7sZRY5xwG8W6DWM2L82', NULL, '2021-12-14 20:15:17', '2021-12-14 20:46:20', NULL, NULL, 1, 0, 0),
(49, 'tf', 'yy', '2142142142', 'ii@gmail.com', NULL, 1, NULL, '$2y$10$dNErXgNvJbARUGTNvtj6xemXSSRILHI3iY4A0yII.VjKByZZesyr6', NULL, '2021-12-14 20:35:02', '2021-12-14 20:45:33', NULL, NULL, 1, 0, 0),
(50, 'tf', 'yy', '2142142144', 'pp@gmail.com', NULL, 1, NULL, '$2y$10$U1UG9WjhQ3w9yZSM5ZBpXemK.M9VyMfJXOfTBsAtrmU0naI1rPraa', NULL, '2021-12-14 20:50:01', '2021-12-14 20:50:16', NULL, NULL, 1, 0, 0),
(51, 'tfl', 'yyo', '2142142148', 'ppl@gmail.com', NULL, 0, NULL, '$2y$10$HJJiTNjaqxAo6BAEPE2w5OfTtsB/dXG5w/jpuOrSLnj01W3sGNBYC', NULL, '2021-12-14 20:56:29', '2021-12-14 20:56:29', NULL, NULL, 1, 0, 0),
(52, 'uhi', 'oo', '1471471471', 'uu@gmail.com', NULL, 1, NULL, '$2y$10$JHeFvQMuLdH004bHK5qBouHFaFNcgwBgCMvW9IBoOTZSxXGA3rR8O', NULL, '2021-12-14 21:29:45', '2021-12-14 21:32:21', NULL, NULL, 1, 0, 0),
(53, 'kkl', 'llpo', '5252025270', 'kkpm@gmail.com', NULL, 0, NULL, '$2y$10$gh7ocswxp52f.ghGoVc4hedE/cLKLCw7makpFeMvzQNDiqmmIXNUS', NULL, '2021-12-14 21:31:14', '2021-12-14 21:31:14', NULL, NULL, 1, 0, 0),
(54, 'awantika', 'maurya', '7054052713', 'awani@gmail.com', NULL, 1, NULL, '$2y$10$CcWdf9eIR5j.jZWBNAJgf.XfhqbAX/ScPwFeO7/./zlEeT9lzRopG', NULL, '2021-12-15 20:25:06', '2021-12-15 20:25:36', NULL, NULL, 1, 0, 0),
(55, 'manick', 'bhatta', '0009784123', 'manick.lnsel@gmail.com', NULL, 1, NULL, '$2y$10$xlrrGJ2vjXGF/420VRkgTuV6Vep.rWqcmPsZ3H4hEdJ3ObD7jB.Um', NULL, '2021-12-15 20:28:05', '2021-12-15 20:28:11', NULL, NULL, 1, 0, 0),
(56, 'Achinta Kumar', 'Santra', '9804351577', 'achintakumarsantra@gmail.com', NULL, 1, NULL, '$2y$10$tzvzeMdx9gj07OLPHDtH2esAj0kjEHMRB0gT8tCL3tNj/bkrjnwGe', NULL, '2021-12-15 20:36:14', '2021-12-15 20:39:49', NULL, NULL, 1, 0, 0),
(57, 'Pradip', 'Mohanty', '9007170848', 'bazimat@gmail.com', NULL, 1, NULL, '$2y$10$hCNLux83XuOz6c97CrOIEuGnWmM.A6DPopuuvxaeciHc0CE4TSU/C', NULL, '2021-12-17 04:21:03', '2021-12-30 16:36:58', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjk0NDg4MWE2N2E5NDc3YTU5YTZmMzQwNGU4YjBmZmVhZjFkNjVhYTIwNzFiZTA2YmQ0M2FmMTMxNWY1YzI0NDFkYjg3NzUxZmI3ZTljNGYiLCJpYXQiOjE2NDQ2NjExNjkuODU3MTg4OTQwMDQ4MjE3NzczNDM3NSwibmJmIjoxNjQ0NjYxMTY5Ljg1NzE5Mjk5MzE2NDA2MjUsImV4cCI6MTY3NjE5NzE2OS44NDk1NDkwNTUwOTk0ODczMDQ2ODc1LCJzdWIiOiI1NyIsInNjb3BlcyI6W119.BrnG3N-Rzjz7iN8yDAs9zMfDl5OY5VOLa2OGkHzq45ufl9OuZ9PZD_qR43PX3R39ek2V4AsW7rGE2yjabuwEIq7v631-t5nXeYhK57M75_2Sw22oz-UwaNLWy5_KpgWhUpAfCLkTr_DpsRgRbOpM_YYp3LJR_AVOPOgp9hbEOSPJ7MfkGjo44fyT1titUlWlY_840opTTjnPiMaYfO8Bb9JuDYsMugRnFE5ZLH8H3uo35Ejj_YarPHEGrqhO6gGRRlPnAPb_4Oh2Bor1WwRErhFucyBR7KAEM2741YEC4aGbt9B1BjJt92q3t4hNdnbFvLNnM86RYlff9AeA8VhDN-hsApMk-_8yB_gXqN3aqcSptRjmgk693SIPcmYHR924asA_oqBdcorQxZxIA8FxpUyttFkPPK3lMiGG9NZ1RkJBZG5EMQiEiUBAlzEcCPJY9Idy-YNBV_G-pm1I_4BDd6HIATywkW3T-UQ2_p6efgf-RqD42du89IqB9WHAuCPRBmrHqf3pxLBFYS-g6mb2eMSdUyCP4_zLsrbCas5weeHwJnWxuUSukpcv1Qm7jebaV1r6eS3OJaEV_RFLGJ6K_CKzzVPxetChgJC_oL-EiXwhjEoAewgvB4af7c9ruoCaeH2awBB7Eqap5R_PNVJaSfjKmw_kHuBB7xVMSdt4etU', 1, 0, 1),
(58, 'ffffffff', 'ffff', '9874892690', 'demo_user@gmail.com', NULL, 0, NULL, '$2y$10$Z2WmG2tvlyTU4jmOcZc7sOGXKbZKJn1wisf0mcAOdHeoclmaj6Q5m', NULL, '2021-12-22 17:31:14', '2021-12-31 20:12:42', NULL, NULL, 1, 0, 0),
(59, 'kklp', 'llpop', '5252025200', 'kkpmp@gmail.com', NULL, 0, NULL, '$2y$10$AEhRpcHlCUGtR8Q5V4nr0uED4CC4Jh.lBDns100nnZkOip0Tlpdnq', NULL, '2021-12-22 17:32:22', '2021-12-30 21:22:39', NULL, NULL, 1, 0, 2),
(60, 'hhh', 'uuu', '6056056056', 'vbnni@gmail.com', NULL, 0, NULL, '$2y$10$ZkNE78v3gVxCU4nAG45zPOwMdB9TI798LlvSFPDFAloYCCLIgZDxa', NULL, '2021-12-22 17:35:05', '2021-12-22 17:35:05', NULL, NULL, 1, 0, 0),
(61, 'hhh', 'uuu', '6056056058', 'vbnniyu@gmail.com', NULL, 1, NULL, '$2y$10$tyn77BHdaaeZiuX6mE3c8..9vGaLyW0yWtaoNR9kUfR8eqXrVANxm', NULL, '2021-12-22 17:39:39', '2021-12-22 17:40:17', NULL, NULL, 1, 0, 1),
(62, 'koyel', 'Sengupta', '2580852580', 'koyel@gmail.com', NULL, 1, NULL, '$2y$10$6Z2Q8IRiTg1EzJ6lBR.0Ue2w4a8QtFzYNxy1/t0OO.HmcNCvJBqnW', NULL, '2021-12-22 22:13:32', '2021-12-22 22:13:57', NULL, NULL, 1, 0, 0),
(63, 'Jhinuk', 'Sen', '6969696969', 'jhinuk@gmail.com', NULL, 1, NULL, '$2y$10$Exv8277IfO8FZ/oKSEW5g.EPd5uTEDgjZ5Y8fsjY0b3TfBGDIVkti', NULL, '2021-12-28 15:21:12', '2021-12-31 22:34:50', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzI3NGU5MmZjZWIyMTRhNmNlMjkyMGNkNzNlNmI3MzkyZWIxOTA4MTY4OTc4OGQ4YWVmOWUzZTY2NDk1Y2Y1MWE0YzZmZWQ0MDc1M2Q5ODgiLCJpYXQiOjE2NDM5NjY1OTQuMzYwMTY4OTMzODY4NDA4MjAzMTI1LCJuYmYiOjE2NDM5NjY1OTQuMzYwMTcyOTg2OTg0MjUyOTI5Njg3NSwiZXhwIjoxNjc1NTAyNTk0LjM1NTA5NjEwMTc2MDg2NDI1NzgxMjUsInN1YiI6IjI5Iiwic2NvcGVzIjpbXX0.yEOgLt3fTHwR4nXr889bzsVTdT93MvGvQAG3Fvsg3mxUMY1oyKD33zaDkzt8mG7qqmc15mcGMRjSSMxWjF3hHbOKEpBl0499kzS6BKqb5W_oy_zVON0UdHFVn9JRm7GYMC1NUE8nREG_Y6rJU8MHVDdAd_7gFxPfnu92loz1p9At6UzanvSRlC11-SuI4f9bRKyZ9scaReoUyV6lyXYQcW984-jVGk7-oCbjelyX0vsRzBHOo87p31yjAONfM-B1MWHYHnkutdtX55R-P9b58-G1grDAXSMiWpes64hfq0aPO7MIISAkFV_Qrb84D3WiuIvoE6SHH_UEsSFx2cnb7PaScfYe_LXihwuozFPgAqI-1k89XOvxyNRfPUGIQDMQ5-ACvlxS5eAAcXxrBR1pIHFu-FIXp1lGwdA6HGQHY0srz7gqBhgkFFX6HRWNq_Nfshpdl5M5cxvnR7TulDx1xZ8ES1BcMd-9tOj9sLv9ESMpoV6ijUaYmdO4AtyC9_9B_4Rd6-CeSQwW5PBnmgOvamkY47Y0fkRsK49KtqwTk4ujW1PD9aaM4Ev0ArrMDRfXwPc1wLwyNbmonVyyIeA-QhHifDDUeL8QJkMOWFDcsNiPm1XS52GchaLditbdMj-0M5cwCxfA0OOkFvtIwIF0jMZqY_wA9y137HWlE2PLEmA', 1, 0, 2),
(64, 'tii', 'ujj', '2424242424', 'tii@gmail.com', NULL, 1, NULL, '$2y$10$IIuE2.YXJwAtfzO4l6ic2eO6Yl9oZekvhaHTugiIw0J.DbGrmdA2i', NULL, '2021-12-28 15:43:13', '2021-12-29 17:54:26', NULL, NULL, 1, 0, 0),
(65, 'kklp', 'llpop', '5250025200', 'kkpmpe@gmail.com', NULL, 0, NULL, '$2y$10$BqhQGG1BkEfxpBEVO2qFJOUc6hH10YUrNGUbtYUqETm61j99GMJ8y', NULL, '2021-12-28 15:44:14', '2021-12-31 20:40:21', NULL, NULL, 1, 0, 0),
(66, 'rfgg', 'fgh', '2542542525', 'fgh@gmail.com', NULL, 1, NULL, '$2y$10$dpdVVAhH580PR7dfhUr1ZuiMOgl.fI0iwH1cbX85n6gMAzoagdVPW', NULL, '2021-12-30 15:55:13', '2021-12-31 20:40:34', NULL, NULL, 1, 0, 2),
(67, 'Samir', 'Mohanty', '8770663036', 'samirkool21@gmail.com', NULL, 1, NULL, '$2y$10$S/PnYTdkb2QCH7WWWgqUDufPGa..Votx1p9Lr2KabsdOM3YRfKrla', NULL, '2021-12-30 20:05:07', '2021-12-30 20:23:39', NULL, 'test', 1, 0, 1),
(74, 'Lnsel', 'App', '7865079187', 'applnsel@gmail.com', NULL, 1, NULL, '$2y$10$X2RBvyNdyOc9cOGBuwuZIu3MEc4U/4RBYZlGjfikKlcOql3SsuDb.', NULL, '2022-01-27 22:19:43', '2022-01-27 22:19:56', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTFhOGU3NTA0MmE0YTJlZGU2YmM0ZGVhOTBmYzkyMjJjMTFlMWFjNjllYWI2MWZkN2E4YmI2ZDI0NTBmMjc1OGVmZGE2MTY3OGI2NzQxMTciLCJpYXQiOjE2NDM2MTkxNTYuNTA3NTc1MDM1MDk1MjE0ODQzNzUsIm5iZiI6MTY0MzYxOTE1Ni41MDc1ODAwNDE4ODUzNzU5NzY1NjI1LCJleHAiOjE2NzUxNTUxNTYuNTAyODk2MDcwNDgwMzQ2Njc5Njg3NSwic3ViIjoiNzQiLCJzY29wZXMiOltdfQ.te-Aa4BCiLf-gpf_qMAOnR-8V07D9LLDUw7dQG7eUZ0GtY9VGK_AbgcROlQEAAgqmuU4vIDR7rfvyX_UjK12dKyXhPbcPjhKIo7K-un8wTzAS-Ucu73dc-wz-oZcd_ZAR-DW-LTJcQHzZuGIamazMHsCCGs8Z7lcK2RqLnU34d_EywstQc9ByOemNRQaBjVC1lDR8bpu08Jb2kevuS7dnXnDgipZK9qv2gVgXMAnKr60Bk7bpaGgpXpLaUH0Q-drGfQEblfVM0DvghA2irH8GUZoHs9jxNyaFZv1kdrO1c0FymLH2UBX1mKpg9jKapwnYI6GqgrtqQq5vPVlXQpyLg3kZ6v3tZuDDBKr16-w8wZE1bEPKNJTa0VosKnvITjNwatrgJCw0mjQUkXzPRvComX_ry5Z97gIY2plZ5JaKKai3stpTzsWuwT4orilUel_ufDNGnBiUB5TvzxBsaj87EuZdJmGmaIZRg_JecfIKKcLsKQi2ZI4sbJXy_UBWLgdHU-nHoM6CqrNUlLeGnDFB9_a2NZWfPfPCGwVldpPT4ZDHzXGnjRWW9WPxMJZg1zEUl1dPRWa4Z6iyOpoRw1rmv9OpsVv63Iibft9bmey6WHncoWDfmpIHA1wv3L8aUPRKEFzCEU5jVQFhl9tYqi54kxVol9XdrTobQVXHa2cZhY', 1, 0, 0),
(75, 'Awantika', 'Mourya', '6565656565', 'awantika.lnsel@gmail.com', NULL, 1, NULL, '$2y$10$dYG8yIDDpmUjubmFOAabKOcXom0OqD3LDMsY94grhQbn7j3ojwMBC', NULL, '2022-02-10 19:08:41', '2022-02-10 19:08:49', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzU5MmQzZjY3YzExOGU5NzY1N2JmM2FmNGQwZGJkM2FlZjA1NGYyNDAwMjllYTA4N2I2YTdiN2E1NmY1NjFkZjViZjhlMmFkZWM2MzcxNjUiLCJpYXQiOjE2NDQ0ODI0ODQuMTk2NDI0OTYxMDkwMDg3ODkwNjI1LCJuYmYiOjE2NDQ0ODI0ODQuMTk2NDI5MDE0MjA1OTMyNjE3MTg3NSwiZXhwIjoxNjc2MDE4NDg0LjE5MzA1Mzk2MDgwMDE3MDg5ODQzNzUsInN1YiI6Ijc1Iiwic2NvcGVzIjpbXX0.y_RVcCdDM2LcwQXUE48KAuRypW6vLhyWnCKom9Z-oQi6NFydypdPlc0jwoWymSMtb4sTrrYfnlt1kVaRvQyfqIr77h9nJxLTBq14kQEGf1AK1eC855YzqVqdvYbMnYuIb8dgRYpkLbXev75ZaVyLtt2GZYU96Qlqgza0l8ss3F_kyw4rXEPU5-eamdKMWotJr0YQIselwYWEq-dOUYgNeeli1VTPsQmGhGyvmvr1rFdBuZJZOBvhmkFcVitJcDIYa2VOr9Fozd01tuAA-2RtQxu8cd5lOeMU632dxGkt6R9eAW-i2EU_aCMyrj44M_5tDD-QqaeonrYVuqL-TpNbTXZ8Atdy--QbEwm_1b1D76kCgt50ClBBNXdQP-nBIpTUgk70dctWEc_el0a7cjCCQihAbYu9AUeXWceu6PCop0ZGvjHKrxP4FNKig04pjH4CSMY3bLcLFzdM3qOGe98C4MBUdUpJVvNkEHjY28awj0XCYPDrpBaqSGQLOF1nNY4kggZiSp5Z8KiLXa-N3GKGOXtDckCA_MqtsDSZOVwYbWNmxLjwOS51VcmPJf1r4hgFrmjGdMw7Ts3wFyYT6IAj1mXBd2S1opZGAP9slE9KY3tIQuxjkrdhfFCTsmnkJJWjhfOIX-WuFreUY9l5P-m59M0URBCyjR-1wfz0ejKneVQ', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(2, '{\"title\":\"Order test ttttest 332253\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in\",\"order_id\":100069,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:10:40', '2022-01-28 17:10:40'),
(3, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100070,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-01-28 17:13:16', '2022-01-28 17:13:16'),
(4, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100071,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:18:00', '2022-01-28 17:18:00'),
(5, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100072,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:26:42', '2022-01-28 17:26:42'),
(6, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100073,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:27:18', '2022-01-28 17:27:18'),
(7, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100074,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:28:34', '2022-01-28 17:28:34'),
(8, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100078,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:51:00', '2022-01-28 17:51:00'),
(9, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100079,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 17:51:32', '2022-01-28 17:51:32'),
(10, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100080,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 21:34:09', '2022-01-28 21:34:09'),
(11, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100081,\"image\":\"\",\"type\":\"order_status\"}', 1, 74, NULL, NULL, '2022-01-28 21:34:50', '2022-01-28 21:34:50'),
(12, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100082,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:11:12', '2022-02-05 00:11:12'),
(13, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100083,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:18:16', '2022-02-05 00:18:16'),
(14, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100084,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:20:00', '2022-02-05 00:20:00'),
(15, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100085,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:20:49', '2022-02-05 00:20:49'),
(16, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100086,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:21:42', '2022-02-05 00:21:42'),
(17, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100087,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:29:26', '2022-02-05 00:29:26'),
(18, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100088,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:33:45', '2022-02-05 00:33:45'),
(19, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100089,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:36:54', '2022-02-05 00:36:54'),
(20, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100090,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-05 00:39:02', '2022-02-05 00:39:02'),
(21, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100091,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 20:51:20', '2022-02-09 20:51:20'),
(22, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100092,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 20:55:30', '2022-02-09 20:55:30'),
(23, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100093,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:03:24', '2022-02-09 21:03:24'),
(24, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100094,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:13:50', '2022-02-09 21:13:50'),
(25, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100095,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:17:04', '2022-02-09 21:17:04'),
(26, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100096,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:18:44', '2022-02-09 21:18:44'),
(27, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100097,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:19:22', '2022-02-09 21:19:22'),
(28, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100098,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:19:39', '2022-02-09 21:19:39'),
(29, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100099,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:20:14', '2022-02-09 21:20:14'),
(30, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100100,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:20:17', '2022-02-09 21:20:17'),
(31, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100101,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:21:15', '2022-02-09 21:21:15'),
(32, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100102,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:22:49', '2022-02-09 21:22:49'),
(33, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100103,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:23:16', '2022-02-09 21:23:16'),
(34, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100104,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:24:19', '2022-02-09 21:24:19'),
(35, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100105,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:24:22', '2022-02-09 21:24:22'),
(36, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100106,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:25:01', '2022-02-09 21:25:01'),
(37, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100107,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:25:19', '2022-02-09 21:25:19'),
(38, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100108,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:25:47', '2022-02-09 21:25:47'),
(39, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100109,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:27:11', '2022-02-09 21:27:11'),
(40, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100110,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:27:30', '2022-02-09 21:27:30'),
(41, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100111,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:28:07', '2022-02-09 21:28:07'),
(42, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100112,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:29:02', '2022-02-09 21:29:02'),
(43, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100113,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:29:15', '2022-02-09 21:29:15'),
(44, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100114,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:30:36', '2022-02-09 21:30:36'),
(45, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100115,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(46, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100116,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(47, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100117,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:31:34', '2022-02-09 21:31:34'),
(48, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100118,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:32:10', '2022-02-09 21:32:10'),
(49, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100119,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:32:26', '2022-02-09 21:32:26'),
(50, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100120,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:33:26', '2022-02-09 21:33:26'),
(51, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100121,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:33:37', '2022-02-09 21:33:37'),
(52, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100122,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:33:58', '2022-02-09 21:33:58'),
(53, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100123,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:34:15', '2022-02-09 21:34:15'),
(54, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100124,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:34:47', '2022-02-09 21:34:47'),
(55, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100125,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:35:00', '2022-02-09 21:35:00'),
(56, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100126,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:35:26', '2022-02-09 21:35:26'),
(57, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100127,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:35:54', '2022-02-09 21:35:54'),
(58, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100128,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:38:24', '2022-02-09 21:38:24'),
(59, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100129,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:38:32', '2022-02-09 21:38:32'),
(60, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100130,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:47:38', '2022-02-09 21:47:38'),
(61, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100131,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:49:01', '2022-02-09 21:49:01'),
(62, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100132,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:51:08', '2022-02-09 21:51:08'),
(63, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100133,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:52:19', '2022-02-09 21:52:19'),
(64, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100134,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:52:40', '2022-02-09 21:52:40'),
(65, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100135,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:53:27', '2022-02-09 21:53:27'),
(66, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100136,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:54:13', '2022-02-09 21:54:13'),
(67, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100137,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 21:56:12', '2022-02-09 21:56:12'),
(68, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100138,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 22:07:00', '2022-02-09 22:07:00'),
(69, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100139,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 23:24:16', '2022-02-09 23:24:16'),
(70, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100140,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-09 23:43:04', '2022-02-09 23:43:04'),
(71, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100141,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 15:10:21', '2022-02-10 15:10:21'),
(72, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100142,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 15:13:32', '2022-02-10 15:13:32'),
(73, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100143,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 15:25:56', '2022-02-10 15:25:56'),
(74, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100144,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 15:48:20', '2022-02-10 15:48:20'),
(75, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100145,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 15:49:31', '2022-02-10 15:49:31'),
(76, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100146,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-10 16:27:49', '2022-02-10 16:27:49'),
(77, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100147,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-14 16:39:32', '2022-02-14 16:39:32'),
(78, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-14 17:06:20', '2022-02-14 17:06:20'),
(79, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-14 17:30:00', '2022-02-14 17:30:00'),
(80, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-14 19:13:40', '2022-02-14 19:13:40'),
(81, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-14 19:20:23', '2022-02-14 19:20:23'),
(82, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:05:21', '2022-02-16 00:05:21'),
(83, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100006,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:07:52', '2022-02-16 00:07:52'),
(84, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100007,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:10:09', '2022-02-16 00:10:09'),
(85, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100008,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:10:50', '2022-02-16 00:10:50'),
(86, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100009,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:12:10', '2022-02-16 00:12:10'),
(87, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100010,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 00:14:16', '2022-02-16 00:14:16'),
(88, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100011,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-16 17:50:36', '2022-02-16 17:50:36'),
(89, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100012,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-18 16:13:48', '2022-02-18 16:13:48'),
(90, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100013,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-18 16:21:37', '2022-02-18 16:21:37'),
(91, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100014,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-18 16:58:45', '2022-02-18 16:58:45'),
(92, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100015,\"image\":\"\",\"type\":\"order_status\"}', 1, 29, NULL, NULL, '2022-02-18 17:00:06', '2022-02-18 17:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'Sanjoy', 'Sen', '0123456789', 'sujoy.lnsel@gmail.com', NULL, '$2y$10$PtpvgVWRJeq9O1KOhV.doOnFGlCnGkeUvs8Z7Er3FFMsSWFQI0NyC', NULL, '2021-11-13 07:25:34', '2021-12-23 22:17:29', NULL, NULL, NULL, NULL, '2021-11-13-618f9a403d55c.png', 1, NULL, NULL),
(2, 'Joshef', 'Doe', '+910111111111', 'joshef.doe1025822@gmail.com', NULL, '$2y$10$F.5pK0aAnRNRQFVVF3aaKOfn2OnVLItYmqHUDeZsGJEGzKXAskOiC', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Pichart', 'Anthony', '+8801710000000', 'test.restaurant@gmail.com', NULL, '$2y$10$lnusvl0qpWrBkxMiozEyGeNhsm4qZrWWu4XUFccnbUKd75xeTdPou', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, 'Nipon', 'Roy', '+8801747413273', 'nipon34.bd@gmail.com', NULL, '$2y$10$7XoZ/wKt2qTos3qk/lJTVeaXMvT7Xv3rEDxbBNRuzYP42LG04kGAm', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(5, 'Jakatta', 'Potin', '+88525695888', 'test.restaurant1@gmail.com', NULL, '$2y$10$/Gza8qfTL.36OvoMtCpJo.fZFQ7dTQE89KV4JsLFR4iCaA5TtaL8a', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(6, 'Sanjeev', 'Sinha Roy', '8965742346', 'test.restaurant2@gmail.com', NULL, '$2y$10$20x4uqBq6lhvDQwYxNCDvOJmGB1PXxR9MRPD4O6wQ48A0kaXtuywe', NULL, '2021-11-27 14:41:50', '2022-02-14 19:26:13', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(7, 'Neel', 'Bhowmik', '9836741259', 'test.restaurant3@gmail.com', NULL, '$2y$10$GYHrHGnmhAGTm1cdpC17B.Y0zIYZe9uqM.YccbT44M/uquipPaygC', NULL, '2021-11-27 14:41:50', '2022-02-08 23:06:35', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(8, 'Mirra', 'Roy', '+12562458744', 'test.restaurant4@gmail.com', NULL, '$2y$10$7NFwXacf/dCL9eNynDFssOZpw9o8HCqcJ/EmHkN/SXuDiggVaRDJy', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(9, 'Kutman', 'Beneti', '+12584555555', 'test.restaurant5@gmail.com', NULL, '$2y$10$Z8fuyE4cdXTEkqhPi6LtouMNrJm7WbmvDb499z3xhT/RRrTiienAi', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(10, 'Sunny', 'Sultan', '+880100000000', 'test.restaurant6@gmail.com', NULL, '$2y$10$EPuUJ8aKEdJ1cBX2Znht.uC.3/fQHqgdXKifhsd9nhRv1HdqdZ/1i', NULL, '2021-11-27 14:41:50', '2021-11-27 14:41:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(11, 'Sumitro', 'Das', '+91025888888', 'test.restaurant7@gmail.com', NULL, '$2y$10$JI8Jxs.sIW6RHRVYjKU3bOlpnZs.8qrMMaJBzmhZMcnISM1Z1H0HS', NULL, '2021-11-27 14:41:51', '2021-12-22 16:23:24', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(12, 'Pinku', 'Das', '+91025558884', 'test.restaurant8@gmail.com', NULL, '$2y$10$22XWmVomqNpNCZlgHp.nae.XVYQnhidEe9hZdj3VOs5jco8BAmMfm', NULL, '2021-11-27 14:41:51', '2022-01-03 20:27:07', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(13, 'Punchuk', 'Yangru', '+02541255888', 'test.restaurant10@gmail.com', NULL, '$2y$10$BXkSCWGoJ/Mdbnu7Ep3nTuT4zH5TIZiTq2pDayukdDb5VghRmro2e', NULL, '2021-11-27 14:41:51', '2021-11-27 14:41:51', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(14, 'Jhon', 'Chung', '+212588888', 'test.restaurant13@gmail.com', NULL, '$2y$10$EP25rxjLTW1PGXEn.pNEnOrzM4eCy09vWSeBVvWxV/1EfapB44EZu', NULL, '2021-11-27 14:41:51', '2021-11-27 14:41:51', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(15, 'Sanjeev', 'Dutta', '9865741238', 'test.restaurant12@gmail.com', NULL, '$2y$10$628pEATNdwYR.j31nVwh1ee0SIUtxyziKrnVx4b74KR94/7yhWeua', NULL, '2021-11-27 14:41:51', '2022-02-09 17:44:25', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(16, 'Avishek', 'Sen', '9012569871', 'testrestaurant123@yahoo.com', NULL, '$2y$10$i2E/9zn8eoF7xlUGbLMbLuAo9utbR/71lzTg64yfRav6au4QX1Wda', NULL, '2021-11-27 14:41:51', '2022-02-08 22:41:14', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(17, 'Akhtar', 'Parwez', '+91 9007007942', 'info@arsalanrestaurants.com', NULL, '$2y$10$fgyHjeCSxtwvYF.5mTdtS.a2Ab/UpTDGtz2C3hOXuAg0GOkrcqhS2', NULL, '2022-02-08 22:05:34', '2022-02-08 22:05:34', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(18, 'Akhtar', 'Parwez', '9015874652', 'info@testrestaurant.com', NULL, '$2y$10$vXqedZCv9bTCrKf4A6s5YuUfriUYvV4ZnfMSccjZYCQYfePXgWbkW', NULL, '2022-02-08 22:15:22', '2022-02-08 22:15:22', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `food_id`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(6, 1, 17, '2022-01-03 21:57:34', '2022-01-03 21:57:34', NULL),
(7, 1, 184, '2022-01-03 22:03:13', '2022-01-03 22:03:13', NULL),
(11, 29, NULL, '2022-01-07 17:55:34', '2022-01-07 17:55:34', 1),
(15, 29, NULL, '2022-02-03 20:48:50', '2022-02-03 20:48:50', 12),
(16, 29, NULL, '2022-02-14 01:25:57', '2022-02-14 01:25:57', 7);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'Anthony Chapman', 0x000000000103000000010000000700000076ffffffffdf203f163ee7ffffaf633ffbffffff9f0ca7bf1c7b7bfbff1f8c3fc5ffffff1fe8a5bf6afcfeffffdf40bf35b4c05959359bbf5b42fcffff7f26bffa6881b3b2668cbfbcf4e8ffffef5e3fda9f05ceca6a6abf584dfcffffdf50bf76ffffffffdf203f163ee7ffffaf633f, 0, '2021-11-11 22:01:01', '2021-11-13 08:05:40', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man'),
(2, 'Laketown', 0x0000000001030000000100000008000000ac0098e7eb1a56403436161c86943640ca0098379d195640cc43507f90943640d50098976a1956409d645ec90d983640cb009827161a5640a58896265a993640d7009877101b564094af0554009a3640c80098577b1b56402387995f7c973640c7009867b61b5640589847f5a8953640ac0098e7eb1a56403436161c86943640, 1, '2021-11-12 16:42:17', '2021-11-18 16:11:43', 'zone_2_restaurant', 'zone_2_customer', 'zone_2_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ageverification`
--
ALTER TABLE `ageverification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`,`restaurant_id`,`food_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ageverification`
--
ALTER TABLE `ageverification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100016;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
