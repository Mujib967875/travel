-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 10:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tripsummit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `photo`, `password`, `token`, `created_at`, `updated_at`) VALUES
(1, 'mujib my', 'admin@gmail.com', 'admin_1741198521.png', '$2y$12$5sXrx7jjXhqS8rfgmXoYoOuBpX3PjFezwvGzDj9PUtO86TYnPKPmC', '1c262c316d622bf0cfd14189e9755444f73845a03c4ae9050834046a58b92f55', '2025-01-28 04:12:53', '2025-03-21 00:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Swimming Pool', '2025-03-21 00:32:40', '2025-03-21 00:32:40'),
(2, 'Sightseeing', '2025-03-21 00:36:45', '2025-03-21 00:36:45'),
(3, 'Free Wifi', '2025-03-21 00:36:57', '2025-03-21 00:36:57'),
(5, 'Personal Guide', '2025-03-21 00:37:17', '2025-03-21 00:37:17'),
(6, 'Mountain Bike', '2025-03-21 00:37:28', '2025-03-21 00:37:28'),
(7, 'Festival', '2025-03-21 00:37:36', '2025-03-21 00:37:36'),
(8, 'Airconditioner', '2025-03-21 00:38:13', '2025-03-21 00:38:13'),
(9, 'Free Transportation', '2025-03-21 00:38:40', '2025-03-21 00:38:40'),
(11, 'Gym', '2025-03-21 22:41:22', '2025-03-21 22:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Flight', 'flight', '2025-03-12 17:26:41', '2025-03-12 17:26:41'),
(2, 'Country', 'country', '2025-03-12 17:27:07', '2025-03-12 17:27:07'),
(3, 'Health', 'health', '2025-03-12 17:27:36', '2025-03-12 17:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counter_items`
--

CREATE TABLE `counter_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item1_number` varchar(255) DEFAULT NULL,
  `item1_text` varchar(255) DEFAULT NULL,
  `item2_number` varchar(255) DEFAULT NULL,
  `item2_text` varchar(255) DEFAULT NULL,
  `item3_number` varchar(255) DEFAULT NULL,
  `item3_text` varchar(255) DEFAULT NULL,
  `item4_number` varchar(255) DEFAULT NULL,
  `item4_text` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counter_items`
--

INSERT INTO `counter_items` (`id`, `item1_number`, `item1_text`, `item2_number`, `item2_text`, `item3_number`, `item3_text`, `item4_number`, `item4_text`, `status`, `created_at`, `updated_at`) VALUES
(1, '40', 'Destinations', '1200', 'Clients', '130', 'Packages', '60', 'Feedbacks', 'Show', '2025-03-11 00:13:31', '2025-03-11 01:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `visa_requirement` text DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `best_time` text DEFAULT NULL,
  `health_safety` text DEFAULT NULL,
  `map` text DEFAULT NULL,
  `featured_photo` varchar(255) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `slug`, `description`, `country`, `language`, `currency`, `area`, `timezone`, `visa_requirement`, `activity`, `best_time`, `health_safety`, `map`, `featured_photo`, `view_count`, `created_at`, `updated_at`) VALUES
(1, 'Sydney', 'sydney', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Australia, the land Down Under, is a vast and diverse country known for its stunning natural landscapes, unique wildlife, and vibrant cities. From the sun-kissed beaches of the Gold Coast to the rugged outback of the Northern Territory, Australia offers an array of experiences that cater to every type of traveler. Whether you\'re looking to relax on pristine shores, explore ancient rainforests, or venture into the heart of the desert, Australia has something for everyone.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">In addition to its natural beauty, Australia is home to several bustling cities that boast a rich cultural heritage and modern attractions. Sydney, with its iconic Opera House and Harbour Bridge, offers a dynamic urban experience with world-class dining, shopping, and entertainment. Melbourne, known for its artistic vibe and diverse population, is a hub for street art, coffee culture, and live music. Other cities like Brisbane, Perth, and Adelaide each offer their own unique charm and attractions, making urban exploration in Australia equally rewarding.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Australia\'s wildlife is another major draw, with unique species such as kangaroos, koalas, and the platypus. The Great Barrier Reef, a UNESCO World Heritage site, is a must-visit for snorkeling and diving enthusiasts, showcasing a vibrant underwater ecosystem. Additionally, the country\'s commitment to preserving its natural and cultural heritage is evident in its numerous national parks and heritage sites. Whether you\'re an adventure seeker, a nature lover, or a cultural enthusiast, Australia\'s diverse offerings promise an unforgettable travel experience.</p>', 'Australia', 'English', 'AUD', '120038 sqft', 'GMT-6', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29736668.18356832!2d111.81148767494898!3d-24.521314978627814!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2b2bfd076787c5df%3A0x538267a1955b1352!2sAustralia!5e0!3m2!1sen!2sbd!4v1716870853572!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'destination_featured_1741942564.jpg', 25, '2025-03-14 01:56:04', '2025-03-23 23:06:30'),
(5, 'Paris', 'paris', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', 'France', 'France, English', 'Euro', '1536372 sq miles', 'GMT-8', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d83998.96769582611!2d2.2646330900042075!3d48.85882554171061!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C%20Prancis!5e0!3m2!1sid!2sid!4v1742190907287!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'destination_featured_1742184457.jpg', 20, '2025-03-16 21:07:37', '2025-03-16 23:57:52'),
(6, 'Phuket', 'phuket', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', 'Thailand', 'thailand', 'Baht', '1532 sq miles', 'GMT+7', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d505924.05086369475!2d98.04094006683732!3d7.839289289997534!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x305031e2c462524f%3A0xe9ca9a85063dba21!2sPhuket%2C%20Thailand!5e0!3m2!1sid!2sid!4v1742185652460!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'destination_featured_1742185675.jpg', 2, '2025-03-16 21:27:55', '2025-03-16 21:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `destination_photos`
--

CREATE TABLE `destination_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destination_photos`
--

INSERT INTO `destination_photos` (`id`, `destination_id`, `photo`, `created_at`, `updated_at`) VALUES
(4, 1, 'destination_1742013174.jpg', '2025-03-14 21:32:54', '2025-03-14 21:32:54'),
(6, 1, 'destination_1742016614.jpg', '2025-03-14 22:30:14', '2025-03-14 22:30:14'),
(7, 1, 'destination_1742016636.jpg', '2025-03-14 22:30:36', '2025-03-14 22:30:36'),
(8, 1, 'destination_1742016663.jpg', '2025-03-14 22:31:03', '2025-03-14 22:31:03'),
(9, 1, 'destination_1742016678.jpg', '2025-03-14 22:31:18', '2025-03-14 22:31:18'),
(10, 1, 'destination_1742016708.jpg', '2025-03-14 22:31:48', '2025-03-14 22:31:48'),
(11, 1, 'destination_1742016723.jpg', '2025-03-14 22:32:03', '2025-03-14 22:32:03'),
(12, 1, 'destination_1742016743.jpg', '2025-03-14 22:32:23', '2025-03-14 22:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `destination_videos`
--

CREATE TABLE `destination_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` int(11) NOT NULL,
  `video` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destination_videos`
--

INSERT INTO `destination_videos` (`id`, `destination_id`, `video`, `created_at`, `updated_at`) VALUES
(1, 1, 'HRg1gJi6yqc', '2025-03-15 00:24:18', '2025-03-15 00:24:18'),
(5, 5, 'XC5ssX_RZa0', '2025-03-16 23:56:25', '2025-03-16 23:56:25'),
(6, 5, 'RBd5VXQTOuQ', '2025-03-16 23:57:29', '2025-03-16 23:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'How to book a travel package online?', 'To book a travel package online, browse through our website’s offerings, select your desired destination and dates, and follow the prompts to customize your trip. Once you have chosen your options, proceed to the checkout page, enter your details, and make the payment securely. You will receive a confirmation email with your itinerary and booking details.', '2025-03-12 11:37:02', '2025-03-12 11:37:02'),
(2, 'What is included in travel packages?', 'Our travel packages typically include accommodation, transportation, and selected activities or tours. Some packages may also offer meals, travel insurance, and airport transfers. Each package is designed to provide a comprehensive travel experience, but you can always customize your package to include additional services or specific requests. Please check the package details for exact inclusions.', '2025-03-12 11:42:55', '2025-03-12 11:42:55'),
(3, 'Are there any travel discounts available?', 'Yes, we offer various travel discounts throughout the year, including early bird specials, last-minute deals, and seasonal promotions. To stay updated on our latest discounts, subscribe to our newsletter, follow us on social media, or check the “Deals” section of our website. We aim to provide affordable travel options without compromising quality.', '2025-03-12 11:43:50', '2025-03-12 11:43:50'),
(4, 'How to cancel or modify bookings?', 'To cancel or modify a booking, log into your account on our website and go to the “My Bookings” section. Here, you can view your current reservations and follow the prompts to make changes or cancellations. Please note that cancellation policies and modification fees may apply, depending on the terms and conditions of your booking. Contact our customer support for assistance if needed. To cancel or modify a booking, log into your account on our website and go to the “My Bookings” section. Here, you can view your current reservations and follow the prompts to make changes or cancellations. Please note that cancellation policies and modification fees may apply, depending on the terms and conditions of your booking. Contact our customer support for assistance if needed.', '2025-03-12 11:44:42', '2025-03-12 11:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'fas fa-briefcase', 'Explore Destinations', 'Discover amazing places to visit, from bustling cities to serene beaches, and plan your perfect adventure with our expert guides.', '2025-03-10 21:17:10', '2025-03-10 21:17:10'),
(2, 'fas fa-search', 'Custom Travel Packages', 'Create custom travel packages designed to your accommodations, activities & transportation for a smooth journey.', '2025-03-10 21:33:31', '2025-03-10 21:33:31'),
(3, 'fas fa-share-alt', 'Travel Deals & Discounts', 'Take advantage of our exclusive travel deals and discounts, ensuring you get the best value for your dream vacation.', '2025-03-10 21:34:40', '2025-03-10 21:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_14_050125_create_admins_table', 1),
(5, '2025_03_08_094815_create_sliders-table', 2),
(6, '2025_03_10_022316_create_welcome_item_table', 3),
(7, '2025_03_11_023035_create_features_table', 4),
(8, '2025_03_10_022316_create_welcome_items_table', 5),
(9, '2025_03_11_064337_create_counter_items_table', 6),
(10, '2025_03_11_135217_create_testimonials_table', 7),
(11, '2025_03_12_025655_create_team_member_table', 8),
(12, '2025_03_12_025655_create_team_members_table', 9),
(13, '2025_03_12_044743_create_team_members_table', 10),
(14, '2025_03_12_044743_create_team_member_table', 11),
(15, '2025_03_12_045726_create_team_member_table', 12),
(16, '2025_03_12_175339_create_faqs_table', 13),
(17, '2025_03_12_233511_create_blog_categories_table', 14),
(18, '2025_03_13_033048_create_posts_table', 15),
(19, '2025_03_13_222605_create_destination_table', 16),
(20, '2025_03_14_203226_create_destination_photos_table', 17),
(21, '2025_03_15_054838_create_destination_videos_table', 18),
(22, '2025_03_17_072756_create_packages_table', 19),
(23, '2025_03_21_032951_create_amenities_table', 20),
(24, '2025_03_21_075733_create_package_amenities_table', 21),
(25, '2025_03_22_062038_create_package_itineraries_table', 22),
(26, '2025_03_22_073629_create_package_photos_table', 23),
(27, '2025_03_23_080316_create_package_videos_table', 24),
(28, '2025_03_24_045227_create_package_faqs_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` int(11) NOT NULL,
  `featured_photo` varchar(255) DEFAULT NULL,
  `banner` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `map` text DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `destination_id`, `featured_photo`, `banner`, `name`, `slug`, `description`, `map`, `price`, `old_price`, `created_at`, `updated_at`) VALUES
(2, 1, 'package_fetured_1742274662.jpg', 'package_fetured_1742275046.jpg', 'Great Barrier Reef', 'great-barrier-reef', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">The Great Barrier Reef, located off the coast of Queensland, Australia, is the world\'s largest coral reef system, stretching over 2,300 kilometers and comprising more than 2,900 individual reefs and 900 islands. Renowned for its stunning biodiversity, the reef is home to an extraordinary variety of marine life, including over 1,500 species of fish and 400 types of coral. Its vibrant coral formations and crystal-clear waters make it a premier destination for snorkeling and diving enthusiasts.</p>\r\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Beyond its natural beauty, the Great Barrier Reef holds significant ecological and economic importance. It supports a vast array of marine life and contributes to the livelihoods of many local communities through tourism and fishing. However, the reef faces numerous threats, including climate change and coral bleaching, making conservation efforts crucial for its future.</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424143.8759805434!2d150.60231267007427!3d-33.847805231787184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney%20New%20South%20Wales%2C%20Australia!5e0!3m2!1sid!2sid!4v1742285686544!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '300', '600', '2025-03-17 09:53:33', '2025-03-18 01:15:41'),
(6, 2, 'package_featured_1742720023.jpg', 'package_banner_1742720023.jpg', 'aaa', 'aaa', '<p>aaa</p>', 'aaa', '1', '2', '2025-03-23 01:53:43', '2025-03-23 01:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `package_amenities`
--

CREATE TABLE `package_amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `amenity_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_amenities`
--

INSERT INTO `package_amenities` (`id`, `package_id`, `amenity_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Include', '2025-03-21 22:51:58', '2025-03-21 22:51:58'),
(2, 2, 7, 'Include', '2025-03-21 22:52:01', '2025-03-21 22:52:01'),
(3, 2, 11, 'Include', '2025-03-21 22:52:05', '2025-03-21 22:52:05'),
(4, 2, 9, 'Exclude', '2025-03-21 22:52:11', '2025-03-21 22:52:11'),
(5, 2, 6, 'Exclude', '2025-03-21 22:52:19', '2025-03-21 22:52:19'),
(7, 2, 5, 'Exclude', '2025-03-21 22:52:37', '2025-03-21 22:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `package_faqs`
--

CREATE TABLE `package_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_faqs`
--

INSERT INTO `package_faqs` (`id`, `package_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 2, 'What activities are included in the tour?', 'The Great Barrier Reef tour includes snorkeling, diving, and glass-bottom boat tours, allowing you to explore the vibrant marine life and coral formations. Additionally, the package offers guided reef tours, informative presentations by marine biologists, and leisure time on stunning beaches.', '2025-03-23 22:30:57', '2025-03-23 22:30:57'),
(2, 2, 'What should I bring on the tour?', 'We recommend bringing swimwear, sunscreen, a hat, sunglasses, and a reusable water bottle. If you plan to snorkel or dive, bring your own gear if you prefer, although equipment is provided. Don’t forget a camera to capture the incredible underwater scenery!', '2025-03-23 22:31:54', '2025-03-23 22:31:54'),
(3, 2, 'Is the tour suitable for beginners?', 'Yes, the tour is designed for all experience levels. Our guides provide comprehensive instructions and safety briefings for snorkeling and diving. Beginners can enjoy glass-bottom boat tours and shallow water snorkeling, while experienced divers can explore deeper parts of the reef.', '2025-03-23 22:32:15', '2025-03-23 22:32:15'),
(4, 2, 'How long is the tour and what’s the schedule?', 'The Great Barrier Reef tour typically lasts a full day, starting early in the morning and returning by late afternoon. The schedule includes transportation to and from the reef, several hours of water activities, lunch, and free time for relaxation and exploration.', '2025-03-23 22:32:53', '2025-03-23 22:32:53'),
(5, 2, 'What measures are in place for reef conservation?', 'Our tours adhere to strict environmental guidelines to protect the reef. We use eco-friendly boats, limit visitor numbers, and provide education on reef conservation. Our guides also ensure that all activities are conducted responsibly, minimizing impact on the marine ecosystem.', '2025-03-23 22:33:11', '2025-03-23 22:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `package_itineraries`
--

CREATE TABLE `package_itineraries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_itineraries`
--

INSERT INTO `package_itineraries` (`id`, `package_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Day 1', '<p><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Morning:</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Arrive at Cairns or Port Douglas and check into your hotel.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome meeting with the tour guide and fellow travelers.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Afternoon</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Lunch at a local restaurant.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Visit the Cairns Aquarium to get an introduction to the marine life of the Great Barrier Reef.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Evening</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Free time to explore the local area.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome dinner at the hotel, with an overview of the tour itinerary and reef conservation briefing.</span></p>', '2025-03-22 00:08:41', '2025-03-22 00:08:41'),
(2, 2, 'Day 2', '<p><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Morning:</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Arrive at Cairns or Port Douglas and check into your hotel.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome meeting with the tour guide and fellow travelers.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Afternoon</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Lunch at a local restaurant.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Visit the Cairns Aquarium to get an introduction to the marine life of the Great Barrier Reef.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Evening</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Free time to explore the local area.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome dinner at the hotel, with an overview of the tour itinerary and reef conservation briefing.</span></p>\r\n<p>&nbsp;</p>', '2025-03-22 00:09:52', '2025-03-22 00:09:52'),
(4, 2, 'Day 3', '<p><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Morning:</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Arrive at Cairns or Port Douglas and check into your hotel.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome meeting with the tour guide and fellow travelers.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Afternoon</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Lunch at a local restaurant.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Visit the Cairns Aquarium to get an introduction to the marine life of the Great Barrier Reef.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"box-sizing: border-box; font-weight: bolder; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">Evening</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">1. Free time to explore the local area.</span><br style=\"box-sizing: border-box; color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\" /><span style=\"color: #212529; font-family: Roboto, sans-serif; font-size: 16px; background-color: #ffffff;\">2. Welcome dinner at the hotel, with an overview of the tour itinerary and reef conservation briefing.</span></p>', '2025-03-22 00:10:59', '2025-03-22 00:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `package_photos`
--

CREATE TABLE `package_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_photos`
--

INSERT INTO `package_photos` (`id`, `package_id`, `photo`, `created_at`, `updated_at`) VALUES
(8, 2, 'package_1742791484.jpg', '2025-03-23 21:44:44', '2025-03-23 21:44:44'),
(9, 2, 'package_1742791492.jpg', '2025-03-23 21:44:52', '2025-03-23 21:44:52'),
(10, 2, 'package_1742791497.jpg', '2025-03-23 21:44:57', '2025-03-23 21:44:57'),
(11, 2, 'package_1742791501.jpg', '2025-03-23 21:45:01', '2025-03-23 21:45:01'),
(12, 2, 'package_1742791508.jpg', '2025-03-23 21:45:08', '2025-03-23 21:45:08'),
(13, 2, 'package_1742791514.jpg', '2025-03-23 21:45:14', '2025-03-23 21:45:14'),
(14, 2, 'package_1742791517.jpg', '2025-03-23 21:45:17', '2025-03-23 21:45:17'),
(15, 2, 'package_1742791521.jpg', '2025-03-23 21:45:21', '2025-03-23 21:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `package_videos`
--

CREATE TABLE `package_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_videos`
--

INSERT INTO `package_videos` (`id`, `package_id`, `video`, `created_at`, `updated_at`) VALUES
(2, 6, 'r9PeYPHdpNo', '2025-03-23 01:54:29', '2025-03-23 01:54:29'),
(4, 2, 'AR1cSKxxSmU', '2025-03-23 21:45:38', '2025-03-23 21:45:38'),
(5, 2, 'wbNeIn3vVKM', '2025-03-23 21:46:01', '2025-03-23 21:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `blog_category_id`, `title`, `slug`, `short_description`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(1, 3, 'Partnreing to create a strong community', 'Partnreing-create-strong-community', 'In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.', '<p>In order to create a good community we need to work together. We need to help,support each other an be respectful to each other. In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.</p>\r\n<p>In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.In order to create a good community we need to work together. We need to help,support each other an be respectful to each other.</p>', 'post1741845056.jpg', '2025-03-12 22:50:56', '2025-03-12 22:50:56'),
(2, 1, 'Turning your emergency donation into instant aid', 'Turning-emergency-donation-instant-aid', 'We are working hard to help the poor people. We are trying to provide them food, shelter, clothing, education and medical assistance.', '<p><span style=\"color: #333333; font-family: Roboto, sans-serif; font-size: 15px; background-color: #ffffff;\">We are working hard to help the poor people. We are trying to provide them food, shelter, clothing, education and medical assistance.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">We are working hard to help the poor people. We are trying to provide them food, shelter, clothing, education and medical assistance.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">We are working hard to help the poor people. We are trying to provide them food, shelter, clothing, education and medical assistance.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">We are working hard to help the poor people. We are trying to provide them food, shelter, clothing, education and medical assistance.</span></p>', 'post1741847650.jpg', '2025-03-12 23:34:10', '2025-03-12 23:34:10'),
(3, 1, 'Charity provides educational boost for children', 'Charity-provides-educational-boost-for-children', 'In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.', '<p><span style=\"color: #333333; font-family: Roboto, sans-serif; font-size: 15px; background-color: #ffffff;\">In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.</span></p>\r\n<p><span style=\"color: #333333; font-family: Roboto, sans-serif; font-size: 15px; background-color: #ffffff;\">In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.</span><span style=\"background-color: #ffffff; color: #333333; font-family: Roboto, sans-serif; font-size: 15px;\">In order boost the education of the children, we are providing them books, pens, pencils, notebooks and other necessary things.</span></p>', 'post1741847843.jpg', '2025-03-12 23:37:23', '2025-03-12 23:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('w6PnGf4nXDPbLH9HSyKxp0evQsaZtXsIyRWRdYUy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVTI2THdNTnJoUXl1NW9LRkV1YWoxUXlnQUVOcW9nTzlrenR3TVNUdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWNrYWdlL2dyZWF0LWJhcnJpZXItcmVlZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1742803942);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `heading`, `text`, `button_text`, `button_link`, `photo`, `created_at`, `updated_at`) VALUES
(9, 'Trip to Nice Cities', 'Exploring vibrant cities, immersing in diverse cultures, visiting landmarks, savoring local cuisine, and engaging with locals offer unforgettable experiences, enriching your perspective, and creating lasting memories, making city trips unique and invaluable.', 'Read More', '#', 'slider_1741460603.jpg', '2025-03-08 12:03:23', '2025-03-08 12:03:23'),
(10, 'Hire Quality Cars', 'Hire quality cars for a comfortable and reliable journey, ensuring top performance, advanced features, and exceptional service, making every trip smooth, enjoyable, and stress-free, whether for business or leisure travel.', 'Read More', '#', 'slider_1741503746.jpg', '2025-03-09 00:02:26', '2025-03-09 06:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `name`, `slug`, `designation`, `address`, `email`, `phone`, `biography`, `photo`, `facebook`, `twitter`, `linkedin`, `instagram`, `created_at`, `updated_at`) VALUES
(1, 'qwerty1', 'qwerty1', 'qwerty1', 'qwerty1', 'qwerty@qwerty.com1', 'qwerty1', '<p>1qwerty</p>', 'team_member_1741761538.jpg', '#', '#', '#', '#', '2025-03-11 23:37:39', '2025-03-12 08:45:52'),
(2, 'test', 'test', 'test', 'test', 'visual@gmail.com', 'test', '<p>test</p>', 'testimonial_1741761658.jpg', 'test', 'test', 'test', 'test', '2025-03-11 23:40:58', '2025-03-11 23:40:58'),
(3, 'test2', 'test2', 'test2', 'test2', 'test2@gmail.com', 'test2', '<p>test2</p>', 'testimonial_1741761714.jpg', 'test2', 'test2', 'test2', 'test2', '2025-03-11 23:41:54', '2025-03-11 23:41:54'),
(5, 'test3', 'test3', 'test3', 'test3', 'test3@gmail.com', 'test3', NULL, 'testimonial_1741794477.jpg', 'test3', 'test3', 'test3', 'test3', '2025-03-12 08:47:57', '2025-03-12 08:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `designation`, `comment`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Robert Krol', 'CEO, ABC Company', 'Volunteering with this charity has been a transformative experience. Their unwavering dedication to helping those in need is truly inspiring. I\'m proud to be part of their mission, witnessing the remarkable impact they make. I\'m grateful for the opportunity to contribute to their efforts.', 'testimonial_1741703390.jpg', '2025-03-11 07:29:50', '2025-03-11 07:29:50'),
(2, 'Pastrick Handerson', 'CEO, BB Company', 'As a long-time donor, I\'m consistently impressed by this charity\'s transparency and life-changing impact. They provide real support to those in need, making a meaningful difference in various communities. I\'m proud to be a part of their mission and will continue to support their efforts.', 'testimonial_1741703657.jpg', '2025-03-11 07:34:17', '2025-03-11 07:34:17'),
(4, 'David', 'President', 'Your Website is so good', 'testimonial_1741705346.jpg', '2025-03-11 08:02:26', '2025-03-11 08:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=active, 2=suspended',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `password`, `phone`, `country`, `address`, `state`, `city`, `zip`, `token`, `status`, `created_at`, `updated_at`) VALUES
(22, 'lasttest', 'lasttest@gmail.com', '1741444611.jpg', '$2y$12$Spt3M6/ZEDpyU9LZvW3J9ui0Blmz//zOdAE3wCWEKvT7.eG4V..bK', '083128319917', 'Indonesia', '04,ABC Street', 'NYC', 'NYC', '91281', '', '1', '2025-03-07 03:52:10', '2025-03-08 07:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `welcome_items`
--

CREATE TABLE `welcome_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `welcome_items`
--

INSERT INTO `welcome_items` (`id`, `heading`, `description`, `button_text`, `button_link`, `photo`, `video`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Welcome to TripSummit', '<p>At TripSummit, our mission is to turn travel dreams into reality by providing personalized and memorable experiences. We leverage our expertise and trusted partners to ensure every trip is seamless and enjoyable.<br /><br />We believe travel fosters personal growth and cultural understanding. Our goal is to help clients explore new destinations and connect with diverse cultures. We promote sustainable travel to positively impact communities and preserve our planet&rsquo;s beauty.</p>', 'Read More', '###', 'about-1.jpg', 'HRg1gJi6yqc', 'Show', '2025-03-09 20:26:50', '2025-03-10 21:39:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `counter_items`
--
ALTER TABLE `counter_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destination_photos`
--
ALTER TABLE `destination_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destination_videos`
--
ALTER TABLE `destination_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_amenities`
--
ALTER TABLE `package_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_faqs`
--
ALTER TABLE `package_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_itineraries`
--
ALTER TABLE `package_itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_photos`
--
ALTER TABLE `package_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_videos`
--
ALTER TABLE `package_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `welcome_items`
--
ALTER TABLE `welcome_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `counter_items`
--
ALTER TABLE `counter_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `destination_photos`
--
ALTER TABLE `destination_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `destination_videos`
--
ALTER TABLE `destination_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package_amenities`
--
ALTER TABLE `package_amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `package_faqs`
--
ALTER TABLE `package_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `package_itineraries`
--
ALTER TABLE `package_itineraries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package_photos`
--
ALTER TABLE `package_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `package_videos`
--
ALTER TABLE `package_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `welcome_items`
--
ALTER TABLE `welcome_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
