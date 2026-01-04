-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2025 at 11:19 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `server_nasaspaceapss`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `total_participants` int NOT NULL,
  `total_marits` int NOT NULL,
  `champion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `highlight_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievement_img_one` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement_img_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement_img_three` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `image`, `title`, `slug`, `date`, `total_participants`, `total_marits`, `champion`, `description`, `highlight_text`, `achievement_img_one`, `achievement_img_two`, `achievement_img_three`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(9, 'upload/achievement/220814113700-8640sust_5.jpg', 'Team Olik', 'team-olik', '2018-10-05', 300, 18, '1', '<p>Olik won the award for a VR application titled Lunar VR. The application lets users immerse themselves in their own space odysseys, such as, taking part in the landing of the Apollo 11, experiencing a solar eclipse from the moon and orbiting over the moon with LRO satellite. The team collected the 3D models and other assets from NASA.</p>', 'Team Olik', 'upload/achievement_gallery/220828092226-6430IMG_3603.jpeg', 'upload/achievement_gallery/220828092226-4683IMG_3603.jpeg', 'upload/achievement_gallery/220828092226-9881IMG_3603.jpeg', 0, 'active', '2022-08-14 05:37:00', '2022-08-28 03:22:26'),
(10, 'upload/achievement/220815060001-7537Team-Mohakash-01-1.jpg', 'Team Mohakash', 'team-mohakash', '2021-12-31', 350, 27, '1', '<p>Team \'Mohakash\' consisted of Barnita Basak Trisha and Md. Momenul Haque from BAUET (Bangladesh Army University of Engineering and Technology) and Sumit Chanda, Samir Imtiaz, Shishir Kairy and Alvi Rownok from KUET (Khulna University of Engineering &amp; Technology).</p><p>The theme for NASA Space Apps Challenge 2021 was \'Virtual Planetary Exploration V2.0\', for which participants had to create interactive 3D models of geology tools that astronauts can use when exploring surfaces of celestial bodies or planets.</p><p>&nbsp;</p><p>Team \'Mohakash\' came up with the concept of \'Advanced Regolith Sampler System (ARSS)\': a battery-powered motor tool consisting of bucket blades. These buckets are placed in a certain sequence to easily scoop materials known as regoliths, which are fragments found on planetary surfaces.</p>', 'Best Mission Concept', 'upload/achievement_gallery/220820062414-2723IMG_20211213_142612.jpg', 'upload/achievement_gallery/220820062414-4620team_mohakash.jpg', 'upload/achievement_gallery/220820062414-3405121455608_3384089971675979_5613540186644556880_n.jpg', 0, 'active', '2022-08-15 00:00:01', '2022-08-20 00:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` tinyint NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Deactive',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `mobile`, `profile`, `address`, `block`, `status`, `remember_token`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nasa', 'Nasa', 'nasa@gmail.com', '$2y$10$31IibWllThsbcBNKfakDzOUzdf3g74i8SofVkKSlM1mOkex1YJYGS', '01883847733', '', NULL, 0, 'active', '2JizJSfKXODCcQioMlEE0OpGs2fcKFlvrIRbhjqQzMrh6pH1xiNtFXY5bm8v', NULL, NULL, NULL, NULL, '2022-07-19 05:06:39', '2022-08-14 02:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `app_challenge_categories`
--

CREATE TABLE `app_challenge_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenges` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_challenge_categories`
--

INSERT INTO `app_challenge_categories` (`id`, `title`, `challenges`, `parent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'EdTech', 'Adaptive AI Tutor (Bangla & English curricula) | Exam preparation recommender with mock tests | Personalized remedial learning for struggling subjects | Multimodal learning assistant (text, voice, visuals) | Learning analytics dashboard for educators/parents | Custom: User-defined EdTech challenge', NULL, 'active', '2025-12-15 14:46:05', '2025-12-15 14:46:05'),
(2, 'AgriTech', 'Crop health detection via satellite/drone imagery | Pest/disease early-warning system | Fertilizer / irrigation recommendation engine | Real-time farmer dashboard (weather, soil, yield forecast) | Farm-to-market supply chain & price forecasting tool | Custom: User-defined AgriTech challenge', NULL, 'active', '2025-12-15 14:46:05', '2025-12-15 14:46:05'),
(3, 'HealthTech', 'Maternal health companion (nutrition, pregnancy care) | Health worker assistant for community health & patient triage | Telehealth + offline mode for rural clinics | Nutrition & diet recommender using local food data | Health risk early-warning system (e.g. pregnancy complications) | Custom: User-defined HealthTech challenge', NULL, 'active', '2025-12-15 14:46:05', '2025-12-15 14:46:05'),
(4, 'E-Commerce', 'Demand forecasting for SMEs in Bangladesh | Dynamic pricing & inventory optimization engine | Product recommendation & personalization for SMEs | SME business dashboard: sales, trends, analytics | Integration with local e-commerce / payment / delivery platforms | Custom: User-defined E-commerce challenge', NULL, 'active', '2025-12-15 14:46:05', '2025-12-15 14:46:05'),
(5, 'FinTech', 'Alternative-data credit scoring for micro-lending | Real-time fraud / anomaly detection for digital lenders | Dashboard for MFIs and credit analysts | Explainable AI for credit decisions | Inclusive lending tool for underserved/rural populations | Custom: User-defined FinTech challenge', NULL, 'active', '2025-12-15 14:46:05', '2025-12-15 14:46:05'),
(6, 'Adaptive AI Tutor (Bangla & English)', 'Build an AI tutor that personalizes lessons, practice, and feedback based on student level, pace, and learning gaps.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(7, 'Exam Preparation Recommender', 'Create a system that generates mock tests, predicts readiness, and recommends targeted study plans aligned with curriculum.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(8, 'Personalized Remedial Learning', 'Identify weak subjects for students and deliver focused remedial lessons, exercises, and assessments.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(9, 'Multimodal Learning Assistant', 'Develop a learning assistant using text, voice, and visuals to improve engagement and accessibility.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(10, 'Learning Analytics Dashboard', 'Build analytics for teachers and parents to track progress, identify risks, and improve learning outcomes.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(11, 'Custom EdTech Challenge', 'Define your own EdTech problem while staying within the education domain.', 1, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(12, 'Crop Health Detection', 'Use satellite or drone imagery to detect crop stress, disease, or growth anomalies', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(13, 'Pest & Disease Early Warning', 'Predict pest or disease outbreaks and generate early alerts and preventive recommendations', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(14, 'Fertilizer & Irrigation Recommender', 'Optimize fertilizer and irrigation schedules based on soil, weather, and crop data.', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(15, 'Farmer Decision Dashboard', 'Provide farmers with real-time insights on weather, soil, yield forecasts, and advisories.', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(16, 'Farm-to-Market Price Forecasting', 'Forecast crop prices and recommend optimal selling and supply-chain strategies.', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(17, 'Custom AgriTech Challenge', 'Define a new agriculture-focused AI solution within the AgriTech domain.', 2, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(18, 'Maternal Health Companion', 'Build an AI assistant for pregnancy care, nutrition guidance, and health reminders.', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(19, 'Health Worker Assistant', 'Support community health workers with patient triage, summaries, and care recommendations.', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(20, 'Telehealth with Offline Mode', 'Design a telehealth system that works reliably in low-connectivity rural environments', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(21, 'Nutrition & Diet Recommende', 'Recommend personalized diets using local food availability, prices, and health needs.', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(22, 'Health Risk Early Warning', 'Predict high-risk health events (e.g., pregnancy complications) and trigger alerts.', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(23, 'Custom HealthTech Challenge', 'Define a new AI healthcare challenge within HealthTech boundaries.', 3, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(24, 'SME Demand Forecasting', 'Predict product demand to reduce overstock and stockouts for small merchants.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(25, 'Dynamic Pricing & Inventory', 'Optimize pricing and inventory levels using demand and market signals.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(26, 'Product Recommendation Engine', 'Personalize product recommendations to increase conversions and retention.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(27, 'SME Business Intelligence Dashboard', 'Provide actionable analytics on sales, trends, customers, and inventory.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(28, 'Platform Integration Tool', 'Build integrations with local e-commerce, payment, and delivery platforms.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(29, 'Custom E-Commerce Challenge', 'Define a new AI commerce problem within the E-Commerce domain.', 4, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(30, 'Alternative-Data Credit Scoring', 'Detect fraud, identity abuse, or suspicious transactions in real time.', 5, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(31, 'Fraud & Anomaly Detection', 'Optimize pricing and inventory levels using demand and market signals.', 5, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(32, 'MFI & Credit Analyst Dashboard', 'Build dashboards for portfolio risk, repayment trends, and inclusion metrics.', 5, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(33, 'Explainable Credit Decisions', 'Create transparent AI models that explain why credit is approved or denied.', 5, 'active', '2025-12-15 14:46:15', '2025-12-15 14:46:15'),
(34, 'Inclusive Lending Platform', 'Design end-to-end lending solutions for rural or unbanked populations', 5, 'active', '2025-12-15 14:46:16', '2025-12-15 14:46:16'),
(35, 'Custom FinTech Challenge', 'Define a new AI finance problem within the FinTech domain.', 5, 'active', '2025-12-15 14:46:16', '2025-12-15 14:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `app_challenge_infos`
--

CREATE TABLE `app_challenge_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_cover` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `about` text COLLATE utf8mb4_unicode_ci,
  `local_description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_challenge_infos`
--

INSERT INTO `app_challenge_infos` (`id`, `title`, `slug`, `session`, `start_date`, `end_date`, `cover`, `local_cover`, `description`, `about`, `local_description`, `status`, `created_at`, `updated_at`) VALUES
(21, 'NASA Space Apps Challenge Bangladesh 2025', 'nasa-space-apps-challenge-bangladesh-2025', '2025', '2025-06-04', '2025-08-01', NULL, NULL, '', '  This is the Preliminary Registration process. You are requested to fill up the\r\n                                information with Correct\r\n                                &amp; Real statements. By this application, you will be nominated for the second step.\r\n                                You\r\n                                can apply with your team only. Please follow the instructions properly when you are\r\n                                going to\r\n                                fill up the form. NASA Space Apps Challenge is an international mass collaboration\r\n                                focused\r\n                                on space exploration that takes place over 48 hours in cities around the world. NASA is\r\n                                going to organize this global event with the Bangladesh Association of Software and\r\n                                Information Services (BASIS) as the local organizer for the event in Bangladesh. This\r\n                                mega\r\n                                event will be solely supported by BASIS Student’s Forum. BASIS is the core organizer of\r\n                                the\r\n                                International Space Apps Challenge 2025 across Bangladesh where Dhaka,\r\n                                Chattogram, Sylhet,\r\n                                Rajshahi, Rangpur, Barisal, Khulna, Cumilla &amp; Mymensingh will be the participating\r\n                                cities.\r\n                                <br><strong>What Your Project Should Highlight: </strong>\r\n                                <a href=\"https://www.spaceappschallenge.org/\">www.spaceappschallenge.org</a><br>\r\n                                <strong>What Type of Projects:</strong>\r\n                                1. Beginner/Youth\r\n                                2. Intermediate\r\n                                3. Advanced\r\n                                4. Arts\r\n                                5. Astrophysics\r\n                                6. Climate\r\n                                7. Diversity & Equity\r\n                                8. Earth\r\n                                9. Games\r\n                                10. Hardware\r\n                                11. Open Science\r\n                                12. Planets & Moons\r\n                                13. Software\r\n                                14. Space Exploration and\r\n                                15. Sun<br>\r\n                                <strong>If Your Age is Below 18, Complete This Form: <a\r\n                                    href=\"https://forms.gle/TjmEhXDcJgBD8Enf8\" target=\"_blank\">https://forms.gle/TjmEhXDcJgBD8Enf8</a></strong>', NULL, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('categories', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:35:{i:0;O:8:\"stdClass\":7:{s:2:\"id\";i:1;s:5:\"title\";s:6:\"EdTech\";s:10:\"challenges\";s:298:\"Adaptive AI Tutor (Bangla & English curricula) | Exam preparation recommender with mock tests | Personalized remedial learning for struggling subjects | Multimodal learning assistant (text, voice, visuals) | Learning analytics dashboard for educators/parents | Custom: User-defined EdTech challenge\";s:9:\"parent_id\";N;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:05\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:05\";}i:1;O:8:\"stdClass\":7:{s:2:\"id\";i:2;s:5:\"title\";s:8:\"AgriTech\";s:10:\"challenges\";s:291:\"Crop health detection via satellite/drone imagery | Pest/disease early-warning system | Fertilizer / irrigation recommendation engine | Real-time farmer dashboard (weather, soil, yield forecast) | Farm-to-market supply chain & price forecasting tool | Custom: User-defined AgriTech challenge\";s:9:\"parent_id\";N;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:05\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:05\";}i:2;O:8:\"stdClass\":7:{s:2:\"id\";i:3;s:5:\"title\";s:10:\"HealthTech\";s:10:\"challenges\";s:326:\"Maternal health companion (nutrition, pregnancy care) | Health worker assistant for community health & patient triage | Telehealth + offline mode for rural clinics | Nutrition & diet recommender using local food data | Health risk early-warning system (e.g. pregnancy complications) | Custom: User-defined HealthTech challenge\";s:9:\"parent_id\";N;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:05\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:05\";}i:3;O:8:\"stdClass\":7:{s:2:\"id\";i:4;s:5:\"title\";s:10:\"E-Commerce\";s:10:\"challenges\";s:305:\"Demand forecasting for SMEs in Bangladesh | Dynamic pricing & inventory optimization engine | Product recommendation & personalization for SMEs | SME business dashboard: sales, trends, analytics | Integration with local e-commerce / payment / delivery platforms | Custom: User-defined E-commerce challenge\";s:9:\"parent_id\";N;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:05\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:05\";}i:4;O:8:\"stdClass\":7:{s:2:\"id\";i:5;s:5:\"title\";s:7:\"FinTech\";s:10:\"challenges\";s:286:\"Alternative-data credit scoring for micro-lending | Real-time fraud / anomaly detection for digital lenders | Dashboard for MFIs and credit analysts | Explainable AI for credit decisions | Inclusive lending tool for underserved/rural populations | Custom: User-defined FinTech challenge\";s:9:\"parent_id\";N;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:05\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:05\";}i:5;O:8:\"stdClass\":7:{s:2:\"id\";i:6;s:5:\"title\";s:36:\"Adaptive AI Tutor (Bangla & English)\";s:10:\"challenges\";s:116:\"Build an AI tutor that personalizes lessons, practice, and feedback based on student level, pace, and learning gaps.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:6;O:8:\"stdClass\":7:{s:2:\"id\";i:7;s:5:\"title\";s:28:\"Exam Preparation Recommender\";s:10:\"challenges\";s:123:\"Create a system that generates mock tests, predicts readiness, and recommends targeted study plans aligned with curriculum.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:7;O:8:\"stdClass\":7:{s:2:\"id\";i:8;s:5:\"title\";s:30:\"Personalized Remedial Learning\";s:10:\"challenges\";s:101:\"Identify weak subjects for students and deliver focused remedial lessons, exercises, and assessments.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:8;O:8:\"stdClass\":7:{s:2:\"id\";i:9;s:5:\"title\";s:29:\"Multimodal Learning Assistant\";s:10:\"challenges\";s:100:\"Develop a learning assistant using text, voice, and visuals to improve engagement and accessibility.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:9;O:8:\"stdClass\":7:{s:2:\"id\";i:10;s:5:\"title\";s:28:\"Learning Analytics Dashboard\";s:10:\"challenges\";s:106:\"Build analytics for teachers and parents to track progress, identify risks, and improve learning outcomes.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:10;O:8:\"stdClass\":7:{s:2:\"id\";i:11;s:5:\"title\";s:23:\"Custom EdTech Challenge\";s:10:\"challenges\";s:73:\"Define your own EdTech problem while staying within the education domain.\";s:9:\"parent_id\";i:1;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:11;O:8:\"stdClass\":7:{s:2:\"id\";i:12;s:5:\"title\";s:21:\"Crop Health Detection\";s:10:\"challenges\";s:82:\"Use satellite or drone imagery to detect crop stress, disease, or growth anomalies\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:12;O:8:\"stdClass\":7:{s:2:\"id\";i:13;s:5:\"title\";s:28:\"Pest & Disease Early Warning\";s:10:\"challenges\";s:90:\"Predict pest or disease outbreaks and generate early alerts and preventive recommendations\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:13;O:8:\"stdClass\":7:{s:2:\"id\";i:14;s:5:\"title\";s:35:\"Fertilizer & Irrigation Recommender\";s:10:\"challenges\";s:83:\"Optimize fertilizer and irrigation schedules based on soil, weather, and crop data.\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:14;O:8:\"stdClass\":7:{s:2:\"id\";i:15;s:5:\"title\";s:25:\"Farmer Decision Dashboard\";s:10:\"challenges\";s:90:\"Provide farmers with real-time insights on weather, soil, yield forecasts, and advisories.\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:15;O:8:\"stdClass\":7:{s:2:\"id\";i:16;s:5:\"title\";s:32:\"Farm-to-Market Price Forecasting\";s:10:\"challenges\";s:79:\"Forecast crop prices and recommend optimal selling and supply-chain strategies.\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:16;O:8:\"stdClass\":7:{s:2:\"id\";i:17;s:5:\"title\";s:25:\"Custom AgriTech Challenge\";s:10:\"challenges\";s:72:\"Define a new agriculture-focused AI solution within the AgriTech domain.\";s:9:\"parent_id\";i:2;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:17;O:8:\"stdClass\":7:{s:2:\"id\";i:18;s:5:\"title\";s:25:\"Maternal Health Companion\";s:10:\"challenges\";s:83:\"Build an AI assistant for pregnancy care, nutrition guidance, and health reminders.\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:18;O:8:\"stdClass\":7:{s:2:\"id\";i:19;s:5:\"title\";s:23:\"Health Worker Assistant\";s:10:\"challenges\";s:90:\"Support community health workers with patient triage, summaries, and care recommendations.\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:19;O:8:\"stdClass\":7:{s:2:\"id\";i:20;s:5:\"title\";s:28:\"Telehealth with Offline Mode\";s:10:\"challenges\";s:85:\"Design a telehealth system that works reliably in low-connectivity rural environments\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:20;O:8:\"stdClass\":7:{s:2:\"id\";i:21;s:5:\"title\";s:27:\"Nutrition & Diet Recommende\";s:10:\"challenges\";s:85:\"Recommend personalized diets using local food availability, prices, and health needs.\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:21;O:8:\"stdClass\":7:{s:2:\"id\";i:22;s:5:\"title\";s:25:\"Health Risk Early Warning\";s:10:\"challenges\";s:83:\"Predict high-risk health events (e.g., pregnancy complications) and trigger alerts.\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:22;O:8:\"stdClass\":7:{s:2:\"id\";i:23;s:5:\"title\";s:27:\"Custom HealthTech Challenge\";s:10:\"challenges\";s:66:\"Define a new AI healthcare challenge within HealthTech boundaries.\";s:9:\"parent_id\";i:3;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:23;O:8:\"stdClass\":7:{s:2:\"id\";i:24;s:5:\"title\";s:22:\"SME Demand Forecasting\";s:10:\"challenges\";s:77:\"Predict product demand to reduce overstock and stockouts for small merchants.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:24;O:8:\"stdClass\":7:{s:2:\"id\";i:25;s:5:\"title\";s:27:\"Dynamic Pricing & Inventory\";s:10:\"challenges\";s:70:\"Optimize pricing and inventory levels using demand and market signals.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:25;O:8:\"stdClass\":7:{s:2:\"id\";i:26;s:5:\"title\";s:29:\"Product Recommendation Engine\";s:10:\"challenges\";s:74:\"Personalize product recommendations to increase conversions and retention.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:26;O:8:\"stdClass\":7:{s:2:\"id\";i:27;s:5:\"title\";s:35:\"SME Business Intelligence Dashboard\";s:10:\"challenges\";s:72:\"Provide actionable analytics on sales, trends, customers, and inventory.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:27;O:8:\"stdClass\":7:{s:2:\"id\";i:28;s:5:\"title\";s:25:\"Platform Integration Tool\";s:10:\"challenges\";s:74:\"Build integrations with local e-commerce, payment, and delivery platforms.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:28;O:8:\"stdClass\":7:{s:2:\"id\";i:29;s:5:\"title\";s:27:\"Custom E-Commerce Challenge\";s:10:\"challenges\";s:62:\"Define a new AI commerce problem within the E-Commerce domain.\";s:9:\"parent_id\";i:4;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:29;O:8:\"stdClass\":7:{s:2:\"id\";i:30;s:5:\"title\";s:31:\"Alternative-Data Credit Scoring\";s:10:\"challenges\";s:70:\"Detect fraud, identity abuse, or suspicious transactions in real time.\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:30;O:8:\"stdClass\":7:{s:2:\"id\";i:31;s:5:\"title\";s:25:\"Fraud & Anomaly Detection\";s:10:\"challenges\";s:70:\"Optimize pricing and inventory levels using demand and market signals.\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:31;O:8:\"stdClass\":7:{s:2:\"id\";i:32;s:5:\"title\";s:30:\"MFI & Credit Analyst Dashboard\";s:10:\"challenges\";s:77:\"Build dashboards for portfolio risk, repayment trends, and inclusion metrics.\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:32;O:8:\"stdClass\":7:{s:2:\"id\";i:33;s:5:\"title\";s:28:\"Explainable Credit Decisions\";s:10:\"challenges\";s:75:\"Create transparent AI models that explain why credit is approved or denied.\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:15\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:15\";}i:33;O:8:\"stdClass\":7:{s:2:\"id\";i:34;s:5:\"title\";s:26:\"Inclusive Lending Platform\";s:10:\"challenges\";s:69:\"Design end-to-end lending solutions for rural or unbanked populations\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:16\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:16\";}i:34;O:8:\"stdClass\":7:{s:2:\"id\";i:35;s:5:\"title\";s:24:\"Custom FinTech Challenge\";s:10:\"challenges\";s:58:\"Define a new AI finance problem within the FinTech domain.\";s:9:\"parent_id\";i:5;s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-12-15 20:46:16\";s:10:\"updated_at\";s:19:\"2025-12-15 20:46:16\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2081323320),
('test1@gmail.com|127.0.0.1', 'i:1;', 1765968987),
('test1@gmail.com|127.0.0.1:timer', 'i:1765968987;', 1765968987);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'asfd', 'masud9667@gmail.com', '01632859986', 'afsd', 'asfd', '2022-08-17 00:38:36', '2022-08-17 00:38:36'),
(2, 'Farzim', 'sohanikings001@gmail.com', '01715666787', 'Universe', 'We all have been living our lives on the floating sack of mass called earth. And there are many more just like this, maintaining a system allowing all the necessary  phenomenons to occur which effect our lives.\nWonder how planets work?\nThen let\'s get started.\n\nUniverse (defination)\n\nNow, we are trying to make a project about our solar system Now for step one we have collect a 4feet*4feet cardboard and painted it with spray paint(black) together. After the completion of the painting, we have collected some small balls and then,  we have colored it with water paints. Then we came to electronics, the electronic work is mainly the light for the sun,aas you can see he is building the light for the Sun. After making the light for the sun,the we have put glitters in the card board we have put together all the planets, sun and the cardboard all together as you can see on the screen. Now let’s enjoy the final project.  Now,you might wonder how we have orbited earth around the sun, we have done it by placing a magenet underneath the earth and behind the cardboard.Then,we have moved the magenet behind the cardboard and wala we have the earth m=orbiting around the sun!', '2022-09-28 11:19:46', '2022-09-28 11:19:46'),
(3, 'Farzim', 'sohanikings001@gmail.com', '01715666787', 'Universe', 'We all have been living our lives on the floating sack of mass called earth. And there are many more just like this, maintaining a system allowing all the necessary  phenomenons to occur which effect our lives.\nWonder how planets work?\nThen let\'s get started.\n\nUniverse (defination)\n\nNow, we are trying to make a project about our solar system Now for step one we have collect a 4feet*4feet cardboard and painted it with spray paint(black) together. After the completion of the painting, we have collected some small balls and then,  we have colored it with water paints. Then we came to electronics, the electronic work is mainly the light for the sun,aas you can see he is building the light for the Sun. After making the light for the sun,the we have put glitters in the card board we have put together all the planets, sun and the cardboard all together as you can see on the screen. Now let’s enjoy the final project.  Now,you might wonder how we have orbited earth around the sun, we have done it by placing a magenet underneath the earth and behind the cardboard.Then,we have moved the magenet behind the cardboard and wala we have the earth m=orbiting around the sun!', '2022-09-28 11:19:46', '2022-09-28 11:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_meta` tinyint NOT NULL DEFAULT '0',
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `slug`, `title`, `description`, `image`, `status`, `is_meta`, `meta`, `created_at`, `updated_at`) VALUES
(1, 'about-nasa-space-app-challenge', 'NASA Space Apps Challenge Bangladesh', '<p>The wealth of data that NASA holds possession of can prove beyond valuable for aspiring scientists, researchers, and developers to formulate groundbreaking applications and solutions for our world and space. By channeling these valuable datasets through an open-source platform to engage communities of “coders, scientists, designers, storytellers, makers, builders, technologists, and others in cities around the world” NASA inaugurated its seminal Space App Challenge back in 2012.</p><p>&nbsp;</p><p>BASIS, the local organizer of the event, has accompanied NASA for 8 consecutive years of the competition letting participants in the cities of Bangladesh compete in this international challenge. Bangladeshi teams have achieved tremendous milestones through the years of their participation in the challenge, bagging the 3rd and 5th place in 2018 and the securing championship in 2019 with an additional finalist team. Team Olik from Shahjalal University of Science and Technology (SUST) snatched the championship under the Best Use of Data category, beating 1395 teams around the world. For the challenge, Team Olik developed a lunar virtual reality (VR) application on a 48-hour sprint that enables users a virtual-reality experience of the Apollo 11 landing site.</p><p>&nbsp;</p><p>In 2020, in the sub-category of \"Orbital Sky\" under the category \"Connect\", one of the winning teams was BUET Zenith from Bangladesh. In 2021, for the second time, Bangladesh became the world champion at NASA Space Apps Challenge. In Best Mission Concept Category, \"Team Mohakash\" from Khulna secured TOP place by beating 4,534 teams from 162 countries. \"Team Mohakash\" became Champion of Khulna Division in 2021’s NASA Space Apps Challenge National Hack-a-Thon.</p>', 'upload/content/220814113219-2902nasa-space-apps-challenge-20195fdee93461fef.jpeg', 'active', 0, NULL, '2022-07-25 21:19:25', '2022-08-17 00:56:15'),
(4, 'registration-page-info', 'Complete the form with correct information', '<p>This is the Preliminary Registration process. You are requested to fill up the information with Correct &amp; Real statements. By this application, you will be nominated for the second step. You can apply with your team only. Please follow the instructions properly when you are going to fill up the form. NASA Space Apps Challenge is an international mass collaboration focused on space exploration that takes place over 48 hours in cities around the world. NASA is going to organize this global event with the Bangladesh Association of Software and Information Services (BASIS) as the local organizer for the event in Bangladesh. This mega event will be solely supported by BASIS Student’s Forum. BASIS is the core organizer of the International Space Apps Challenge 2022 across Bangladesh where Dhaka, Chattogram, Sylhet, Rajshahi, Rangpur, Barisal, Khulna, Cumilla &amp; Mymensingh will be the participating cities.<br><strong>What Your Project Should Highlight:</strong> <a href=\"https://2022.spaceappschallenge.org/challenges/\">https://2022.spaceappschallenge.org/challenges/</a><br><strong>What Type of Projects:</strong> 1. &nbsp;Software; 2. Hardware; 3. Mobile App; 4. Games; 5. 1/2/3/4 Prototype</p><p>If necessary, please contact: <strong>Team- NASA Space Apps Challenge 2022 (Bangladesh)&nbsp;</strong></p><p><strong>Slack Channel:</strong> <a href=\"https://rb.gy/j5gzle\">https://rb.gy/j5gzle</a> || <strong>Email:</strong> <a href=\"mailto:bsf@basis.org.bd\">bsf@basis.org.bd</a> || <strong>Hotline:</strong> 16488</p>', 'upload/content/220817050846-1669OpenGraph_Image-2.original.png', 'active', 0, NULL, '2022-08-03 04:49:52', '2022-08-29 03:26:58');

-- --------------------------------------------------------

--
-- Table structure for table `content_files`
--

CREATE TABLE `content_files` (
  `id` bigint UNSIGNED NOT NULL,
  `content_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finalist_nominees`
--

CREATE TABLE `finalist_nominees` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finalist_nominees`
--

INSERT INTO `finalist_nominees` (`id`, `image`, `title`, `position`, `registration_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 'upload/finalist-nominee/220724083315-770440995FB0.png', 'asdfsd', 'sadfsdf', '24233', 'active', '2022-07-24 02:28:33', '2022-07-24 02:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `front_menus`
--

CREATE TABLE `front_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `menu_look_type` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `position` varchar(15) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `params` varchar(191) DEFAULT NULL,
  `status` enum('active','deactive') NOT NULL DEFAULT 'active',
  `sorting` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_menus`
--

INSERT INTO `front_menus` (`id`, `parent_id`, `content_id`, `menu_look_type`, `type`, `url`, `position`, `title`, `slug`, `params`, `status`, `sorting`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'normal', NULL, NULL, 'header', 'NASA Space app Challenge', 'nasa-space-app-challenge', NULL, 'active', 2, '2022-07-27 23:02:10', '2022-07-27 23:02:10'),
(4, 1, 1, 'mega', 'content', NULL, 'header', 'About NASA Space App Challenge', 'about-nasa-space-app-challenge', 'about-nasa-space-app-challenge', 'active', 1, '2022-07-27 23:30:33', '2022-08-13 04:11:23'),
(5, NULL, NULL, 'normal', NULL, NULL, 'header', 'Resources', 'resources', NULL, 'active', 3, '2022-07-27 23:36:18', '2022-07-27 23:36:18'),
(6, 1, NULL, 'normal', 'external_link', 'web.localOrganizerLead', 'header', 'Local Organizer Lead', 'local-organizer-lead', NULL, 'active', 4, '2022-07-27 23:37:34', '2022-07-27 23:37:34'),
(7, 1, NULL, 'normal', 'external_link', 'web.jugdes', 'header', 'Jugdes', 'jugdes', NULL, 'active', 5, '2022-07-27 23:38:41', '2022-07-27 23:38:41'),
(8, 1, NULL, 'mega', 'external_link', 'web.mentors', 'header', 'Mentors', 'mentors', NULL, 'active', 6, '2022-07-27 23:53:29', '2022-07-27 23:53:29'),
(9, 1, NULL, 'normal', 'external_link', 'web.winners', 'header', 'Local Winner', 'local-winner', NULL, 'active', 7, '2022-07-27 23:54:16', '2022-07-27 23:54:16'),
(11, 1, NULL, 'mega', 'external_link', 'web.achievements', 'header', 'Our Global Achievement', 'our-global-achievement', NULL, 'active', 9, '2022-07-28 00:00:08', '2022-07-28 00:00:08'),
(12, NULL, NULL, 'normal', NULL, NULL, 'header', 'Media Center', 'media-center', NULL, 'active', 10, '2022-07-28 00:02:21', '2022-07-28 00:02:21'),
(13, NULL, NULL, 'normal', 'external_link', 'web.registration', 'header', 'Registration', 'registration', NULL, 'active', 11, '2022-07-28 00:03:19', '2022-07-28 00:03:19'),
(16, NULL, NULL, 'normal', 'external_link', 'web.faq', 'header', 'FAQ', 'faq', NULL, 'active', 12, '2022-07-28 00:17:27', '2022-07-28 00:17:27'),
(17, NULL, NULL, 'normal', 'external_link', 'web.contact', 'header', 'Contact', 'contact', NULL, 'active', 13, '2022-07-28 00:27:18', '2022-07-28 00:27:18'),
(19, NULL, 1, 'normal', 'content', NULL, 'quick_link', 'About NASA Space App Challenge', 'about-nasa-space-app-challenge', 'about-nasa-space-app-challenge', 'active', 14, '2022-07-28 00:49:22', '2022-07-28 00:49:22'),
(20, 5, NULL, 'normal', 'external_link', 'web.programSchedules', 'header', 'Program Schedules', 'program-schedules', NULL, 'active', 0, '2022-07-28 00:53:18', '2022-07-28 00:53:18'),
(21, NULL, NULL, 'normal', 'external_link', 'web.programSchedules', 'quick_link', 'Program Schedules', 'program-schedules1', NULL, 'active', 0, '2022-07-28 00:58:06', '2022-07-28 00:58:06'),
(22, NULL, NULL, 'normal', 'external_link', 'web.gallary', 'quick_link', 'Photo Gallary', 'photo-gallary', NULL, 'active', 17, '2022-07-28 01:05:55', '2022-07-28 01:05:55'),
(23, NULL, NULL, 'normal', 'external_link', 'web.mentors', 'quick_link', 'Mentors', 'mentors1', NULL, 'active', 18, '2022-07-28 01:06:50', '2022-07-28 01:06:50'),
(24, NULL, NULL, 'normal', 'external_link', 'web.jugdes', 'quick_link', 'Jugdes', 'jugdes1', NULL, 'active', 19, '2022-07-28 01:07:25', '2022-07-28 01:07:25'),
(25, NULL, NULL, 'normal', 'external_link', 'web.localOrganizerLead', 'quick_link', 'Local Organizer Lead', 'local-organizer-lead1', NULL, 'active', 20, '2022-07-28 01:08:12', '2022-07-28 01:08:12'),
(27, 5, NULL, 'normal', 'external_link', 'web.resourcesDocument', 'header', 'Important Document', 'important-document', NULL, 'active', 21, '2022-07-30 04:27:01', '2022-07-30 04:27:01'),
(28, 12, NULL, 'normal', 'external_link', 'web.gallary', 'header', 'Our Gallary', 'our-gallary', NULL, 'active', 22, '2022-07-30 20:30:11', '2022-07-30 20:30:11'),
(29, 12, NULL, 'normal', 'external_link', 'web.pressCoverage', 'header', 'Press Coverage', 'press-coverage', NULL, 'active', 23, '2022-07-30 20:36:19', '2022-07-30 20:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `global_merits`
--

CREATE TABLE `global_merits` (
  `id` bigint UNSIGNED NOT NULL,
  `achievement_id` int NOT NULL,
  `merit_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merit_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_merits`
--

INSERT INTO `global_merits` (`id`, `achievement_id`, `merit_position`, `project_name`, `team_name`, `merit_image`, `link`, `created_at`, `updated_at`) VALUES
(2, 7, 'Merit', 'asdfasdf', 'afdasd', 'upload/achievement/merits/220810071009-7327abc1.jpeg', 'asdasdsad', '2022-08-10 01:10:09', '2022-08-10 01:10:09'),
(3, 8, 'Winner', 'asdfa', 'asdf', 'upload/achievement/merits/220810071142-4466ed.jpg', NULL, '2022-08-10 01:11:42', '2022-08-10 01:17:32'),
(4, 5, 'Merit', 'massa', 'massa', 'upload/achievement/merits/220810102738-7289ed.jpg', 'adf', '2022-08-10 04:27:38', '2022-08-10 04:27:38'),
(5, 4, 'Merit', 'massa', 'massa', 'upload/achievement/merits/220810102810-9122ed.jpg', 'asdasdsad', '2022-08-10 04:28:10', '2022-08-10 04:28:10'),
(6, 7, 'Merit', 'massa', 'massa', 'upload/achievement/merits/220814045810-8258bgg.jpg', NULL, '2022-08-13 22:58:10', '2022-08-13 22:58:10'),
(7, 7, 'Winner', 'DSF', 'ASDFASDF', 'upload/achievement/merits/220814045810-9822pu.jpeg', NULL, '2022-08-13 22:58:10', '2022-08-13 22:58:10'),
(8, 9, 'Winner', 'Lunar VR', 'Team Olik', 'upload/achievement/merits/220814113700-5695sust_5.jpg', 'https://2018.spaceappschallenge.org/challenges/universe-beauty-and-wonder/virtual-space-exploration/teams/olik/', '2022-08-14 05:37:00', '2022-08-20 00:33:45'),
(9, 10, 'Winner', '\'Advanced Regolith Sampler System (ARSS)\'', 'Team Mohakash', 'upload/achievement/merits/220820062414-8899121455608_3384089971675979_5613540186644556880_n.jpg', 'https://2021.spaceappschallenge.org/challenges/statements/virtual-planetary-exploration-v20/teams/mohakash-1/project', '2022-08-15 00:00:01', '2022-08-20 00:24:14'),
(10, 10, 'Merit', 'Implant Nutrient Veggies on Space', 'Team Fly High', 'upload/achievement/merits/220820062816-1298244316440_1054778145269175_1373189972936811749_n.png', NULL, '2022-08-20 00:28:16', '2022-08-20 00:28:16'),
(11, 10, 'Merit', 'Explorer', 'Team Young Explorer', 'upload/achievement/merits/220820062946-5857244468866_1054778135269176_8478694023202271981_n.png', NULL, '2022-08-20 00:29:46', '2022-08-20 00:29:46'),
(12, 10, 'Merit', 'Test', 'Test', 'upload/achievement/merits/220821093648-2165WhatsApp Image 2022-08-21 at 1.39.13 PM.jpeg', NULL, '2022-08-21 03:36:48', '2022-08-21 03:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `local_winners`
--

CREATE TABLE `local_winners` (
  `id` bigint UNSIGNED NOT NULL,
  `app_challenge_info_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_participants` int NOT NULL,
  `total_merit` int NOT NULL,
  `vanue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `local_winners`
--

INSERT INTO `local_winners` (`id`, `app_challenge_info_id`, `start_date`, `end_date`, `total_participants`, `total_merit`, `vanue`, `image`, `description`, `status`, `created_at`, `updated_at`) VALUES
(21, 15, '2021-10-01', '2021-10-10', 650, 27, 'Bangladesh', 'upload/local-winner/220828113248-2522211190802_992949664785357_716799004280784224_n.png', '<p>The wealth of data that NASA holds possession to can prove beyond valuable for aspiring scientists, researchers and developers to formulate groundbreaking applications and solutions pertaining to our world and space. By channeling these valuable datasets through an open-source platform to engage communities of “coders, scientists, designers, storytellers, makers, builders, technologists, and others in cities around the world” NASA inaugurated its seminal Space App Challenge back in 2012.</p><p>BASIS, the local organizer of the event, has accompanied NASA for 8 consecutive years of the competition letting participants in the cities of Bangladesh compete in this international challenge. Bangladeshi teams have achieved tremendous milestones through the years of its participation in the challenge, bagging the 3rd and 5th place in 2018 and the securing championship in 2019 with an additional finalist team. Team Olik from Shahjalal University of Science and Technology (SUST) snatched the championship under the Best Use of Data category, beating 1395 teams around the world. For the challenge, Team Olik developed a lunar virtual reality (VR) application on a 48-hour sprint that enables users a virtual-reality experience of the Apollo 11 landing site.</p><p>In 2020, in the sub-category of \"Orbital Sky\" under the category \"Connect\", one of the winner team was BUET Zenith from Bangladesh. In 2021, for the second time, Bangladesh became the world champion at NASA Space Apps Challenge. In Best Mission Concept Category, \"Team Mohakash\" from Khulna secured TOP place by beating 4,534 teams from 162 countries. \"Team Mohakash\" became Champion from Khulna Division in 2021’s NASA Space Apps Challenge National Hack-a-Thon.</p>', 'active', '2022-08-28 04:54:38', '2022-08-28 05:34:13'),
(23, 17, '2022-08-30', '2020-10-10', 750, 18, 'Dhaka', 'upload/local-winner/220830103419-7560117746170_781072292639763_7277650702976224373_n.jpg', '<p>The wealth of data that NASA holds possession to can prove beyond valuable for aspiring scientists, researchers and developers to formulate groundbreaking applications and solutions pertaining to our world and space. By channeling these valuable datasets through an open-source platform to engage communities of “coders, scientists, designers, storytellers, makers, builders, technologists, and others in cities around the world” NASA inaugurated its seminal Space App Challenge back in 2012.</p><p>BASIS, the local organizer of the event, has accompanied NASA for 8 consecutive years of the competition letting participants in the cities of Bangladesh compete in this international challenge. Bangladeshi teams have achieved tremendous milestones through the years of its participation in the challenge, bagging the 3rd and 5th place in 2018 and the securing championship in 2019 with an additional finalist team. Team Olik from Shahjalal University of Science and Technology (SUST) snatched the championship under the Best Use of Data category, beating 1395 teams around the world. For the challenge, Team Olik developed a lunar virtual reality (VR) application on a 48-hour sprint that enables users a virtual-reality experience of the Apollo 11 landing site.</p><p>In 2020, in the sub-category of \"Orbital Sky\" under the category \"Connect\", one of the winner team was BUET Zenith from Bangladesh. In 2021, for the second time, Bangladesh became the world champion at NASA Space Apps Challenge. In Best Mission Concept Category, \"Team Mohakash\" from Khulna secured TOP place by beating 4,534 teams from 162 countries. \"Team Mohakash\" became Champion from Khulna Division in 2021’s NASA Space Apps Challenge National Hack-a-Thon.</p>', 'active', '2022-08-30 04:34:19', '2022-08-30 04:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `local_winner_participants`
--

CREATE TABLE `local_winner_participants` (
  `id` bigint UNSIGNED NOT NULL,
  `local_winner_id` int NOT NULL,
  `zone_id` int NOT NULL,
  `merit_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `local_winner_participants`
--

INSERT INTO `local_winner_participants` (`id`, `local_winner_id`, `zone_id`, `merit_position`, `project_name`, `cover_image`, `created_at`, `updated_at`) VALUES
(19, 21, 4, 'winner', 'WEBB Origami Design Challenge', 'upload/local-winner-cover-image/220828111929-2543244585488_1054780248602298_7401544217776373718_n.png', '2022-08-28 04:54:38', '2022-08-28 05:19:29'),
(21, 21, 4, 'merit', 'You Are My Sunshine', 'upload/local-winner-cover-image/220828111929-2071244438880_1054780178602305_6653582191569735058_n.png', '2022-08-28 05:19:29', '2022-08-28 05:19:29'),
(23, 21, 4, 'merit', 'Plasticity', 'upload/local-winner-cover-image/220828112925-8681244504131_1054780188602304_2511998028712681651_n.png', '2022-08-28 05:29:25', '2022-08-28 05:29:25'),
(25, 21, 8, 'merit', 'Synthetic Aperture Radar', 'upload/local-winner-cover-image/220828120504-8989243919998_1054775808602742_3254416162292256207_n.png', '2022-08-28 06:05:04', '2022-08-28 06:05:04'),
(26, 21, 8, 'merit', 'Life Saver', 'upload/local-winner-cover-image/220828120504-9456244644590_1054775775269412_524878772542551264_n.png', '2022-08-28 06:05:04', '2022-08-28 06:05:04'),
(27, 21, 8, 'winner', 'Blitz Learn', 'upload/local-winner-cover-image/220828120617-9777244516625_1054775785269411_1098635102504805255_n.png', '2022-08-28 06:06:17', '2022-08-28 06:06:17'),
(28, 21, 3, 'winner', 'Robot Vitamin Sea', 'upload/local-winner-cover-image/220828032004-9605NASA Space App 2021- Local Winner-33.png', '2022-08-28 09:20:04', '2022-08-28 09:20:04'),
(29, 21, 3, 'merit', 'Recirculation Fabric', 'upload/local-winner-cover-image/220828032005-5320NASA Space App 2021- Local Winner-32.png', '2022-08-28 09:20:05', '2022-08-28 09:20:05'),
(30, 21, 3, 'merit', 'COVID-19 Tracker', 'upload/local-winner-cover-image/220828032117-1419team_nasa_cover-01.2e16d0ba.fill-591x300.jpg', '2022-08-28 09:20:05', '2022-08-28 09:21:17'),
(31, 21, 1, 'winner', 'Trash Track', 'upload/local-winner-cover-image/220828041434-8656NASA Space App 2021- Local Winner-17.png', '2022-08-28 10:14:34', '2022-08-28 10:14:34'),
(32, 21, 1, 'merit', 'Plastic Crocodile', 'upload/local-winner-cover-image/220828041434-8726NASA Space App 2021- Local Winner-16.png', '2022-08-28 10:14:34', '2022-08-28 10:14:34'),
(33, 21, 1, 'merit', 'Sunshine', 'upload/local-winner-cover-image/220828041434-8095NASA Space App 2021- Local Winner-15.png', '2022-08-28 10:14:34', '2022-08-28 10:14:34'),
(34, 21, 2, 'winner', 'Eye06', 'upload/local-winner-cover-image/220829063438-9288NASA Space App 2021- Local Winner-29.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(35, 21, 2, 'merit', 'Moontrave', 'upload/local-winner-cover-image/220829063438-6715NASA Space App 2021- Local Winner-28.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(36, 21, 2, 'merit', 'Inter-connect', 'upload/local-winner-cover-image/220829063438-2985NASA Space App 2021- Local Winner-27.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(37, 21, 6, 'winner', 'ARSS-Advanced Regolith Sampler System', 'upload/local-winner-cover-image/220829063438-5242NASA Space App 2021- Local Winner-21.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(38, 21, 6, 'merit', 'CBSTPGM-1', 'upload/local-winner-cover-image/220829063438-1308NASA Space App 2021- Local Winner-20.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(39, 21, 6, 'merit', 'NASA Young Explorer', 'upload/local-winner-cover-image/220829063438-5722NASA Space App 2021- Local Winner-19.png', '2022-08-29 00:34:38', '2022-08-29 00:34:38'),
(43, 21, 7, 'winner', 'SOLARSPEC : Enhancing lives with solar energy', 'upload/local-winner-cover-image/220829064033-4763NASA Space App 2021- Local Winner-5.png', '2022-08-29 00:40:33', '2022-08-29 00:40:33'),
(44, 21, 7, 'merit', 'MARVO', 'upload/local-winner-cover-image/220829064033-9764NASA Space App 2021- Local Winner-8.png', '2022-08-29 00:40:33', '2022-08-29 00:40:33'),
(45, 21, 7, 'merit', 'PRODUCE CROPS IN SPACE - RECYCLING HUMAN WASTE AS FERTILIZERS', 'upload/local-winner-cover-image/220829064033-3985NASA Space App 2021- Local Winner-7.png', '2022-08-29 00:40:33', '2022-08-29 00:40:33'),
(46, 21, 9, 'winner', 'TexGen', 'upload/local-winner-cover-image/220829064234-4333NASA Space App 2021- Local Winner-13.png', '2022-08-29 00:42:34', '2022-08-29 00:42:34'),
(47, 21, 9, 'merit', 'Green X', 'upload/local-winner-cover-image/220829064234-2214NASA Space App 2021- Local Winner-12.png', '2022-08-29 00:42:34', '2022-08-29 00:42:34'),
(48, 21, 9, 'merit', 'Heat Alarm', 'upload/local-winner-cover-image/220829064234-2779NASA Space App 2021- Local Winner-11.png', '2022-08-29 00:42:34', '2022-08-29 00:42:34'),
(49, 21, 5, 'winner', 'Solaris', 'upload/local-winner-cover-image/220829064750-7140NASA Space App 2021- Local Winner-25.png', '2022-08-29 00:47:50', '2022-08-29 00:47:50'),
(50, 21, 5, 'merit', 'DronX', 'upload/local-winner-cover-image/220829064750-7391NASA Space App 2021- Local Winner-24.png', '2022-08-29 00:47:50', '2022-08-29 00:47:50'),
(51, 21, 5, 'merit', 'Disaster Response', 'upload/local-winner-cover-image/220829064750-3749NASA Space App 2021- Local Winner-23.png', '2022-08-29 00:47:50', '2022-08-29 00:47:50'),
(52, 23, 1, 'winner', 'Satellight', 'upload/local-winner-cover-image/220830103419-8389Team-BUET-Zenith-2101302010.jpg', '2022-08-30 04:34:19', '2022-08-30 04:34:19'),
(53, 23, 1, 'merit', 'HAM SOS COM', 'upload/local-winner-cover-image/220830103419-6078placeholder-profile-sq.jpg', '2022-08-30 04:34:19', '2022-08-30 04:34:19'),
(54, 23, 2, 'winner', 'EXPLORO', 'upload/local-winner-cover-image/220830104514-5315placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(55, 23, 2, 'merit', 'A.I. Tree Nation', 'upload/local-winner-cover-image/220830104514-1377placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(56, 23, 3, 'winner', 'Ambulance UAV', 'upload/local-winner-cover-image/220830104514-8939placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(57, 23, 3, 'merit', 'Sustainable breeze', 'upload/local-winner-cover-image/220830104514-9463placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(58, 23, 4, 'winner', 'Data Discovery for Earth Science', 'upload/local-winner-cover-image/220830104514-3791placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(59, 23, 5, 'winner', 'Digital History', 'upload/local-winner-cover-image/220830104514-2387placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(60, 23, 5, 'merit', 'Space-O', 'upload/local-winner-cover-image/220830104514-2311placeholder-profile-sq.jpg', '2022-08-30 04:45:14', '2022-08-30 04:45:14'),
(61, 23, 6, 'winner', 'STOP SPREAD 19', 'upload/local-winner-cover-image/220830110356-3868placeholder-profile-sq.jpg', '2022-08-30 05:03:56', '2022-08-30 05:03:56'),
(62, 23, 6, 'merit', 'Next Gen EVA Tools', 'upload/local-winner-cover-image/220830110356-1143placeholder-profile-sq.jpg', '2022-08-30 05:03:56', '2022-08-30 05:03:56'),
(63, 23, 7, 'winner', 'GreenX', 'upload/local-winner-cover-image/220830111147-9548placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47'),
(64, 23, 7, 'merit', 'What Is Our Carbon Footprint?', 'upload/local-winner-cover-image/220830111147-4518placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47'),
(65, 23, 8, 'winner', 'vaccPicker', 'upload/local-winner-cover-image/220830111147-7841placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47'),
(66, 23, 8, 'merit', 'A One Health Approach', 'upload/local-winner-cover-image/220830111147-7045placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47'),
(67, 23, 9, 'winner', 'ANDS Alert-Advanced Natural Disasters Security Alert', 'upload/local-winner-cover-image/220830111147-1312placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47'),
(68, 23, 9, 'merit', 'NASA Local Area Road Traffic Monitoring', 'upload/local-winner-cover-image/220830111147-7152placeholder-profile-sq.jpg', '2022-08-30 05:11:47', '2022-08-30 05:11:47');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `registration_id` bigint UNSIGNED NOT NULL,
  `influence` tinyint UNSIGNED NOT NULL COMMENT '1-20',
  `creativity` tinyint UNSIGNED NOT NULL COMMENT '1-20',
  `validity` tinyint UNSIGNED NOT NULL COMMENT '1-20',
  `relevance` tinyint UNSIGNED NOT NULL COMMENT '1-20',
  `presentation` tinyint UNSIGNED NOT NULL COMMENT '1-20',
  `round_influence` decimal(5,2) NOT NULL COMMENT 'Scaled influence',
  `round_creativity` decimal(5,2) NOT NULL COMMENT 'Scaled creativity',
  `round_validity` decimal(5,2) NOT NULL COMMENT 'Scaled validity',
  `round_relevance` decimal(5,2) NOT NULL COMMENT 'Scaled relevance',
  `round_presentation` decimal(5,2) NOT NULL COMMENT 'Scaled presentation',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `user_id`, `registration_id`, `influence`, `creativity`, `validity`, `relevance`, `presentation`, `round_influence`, `round_creativity`, `round_validity`, `round_relevance`, `round_presentation`, `created_at`, `updated_at`) VALUES
(6, 5, 848, 8, 5, 4, 4, 5, 10.00, 8.33, 10.00, 6.67, 10.00, '2025-12-17 03:55:11', '2025-12-17 04:57:10'),
(7, 5, 1, 3, 6, 3, 6, 2, 3.75, 10.00, 7.50, 10.00, 4.00, '2025-12-17 04:56:54', '2025-12-17 04:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `show_dasboard` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `menu_name`, `icon`, `route_name`, `params`, `sorting`, `show_dasboard`, `created_at`, `updated_at`) VALUES
(1, 35, 'Admin', '<i class=\'fa fa-user\'></i>', 'admin.index', NULL, 5, 0, NULL, '2022-08-03 00:36:28'),
(2, NULL, 'Contents', '<i class=\'fas fa-star-of-david\'></i>', NULL, NULL, 2, 0, NULL, '2022-08-03 01:45:45'),
(3, 2, 'About Nasa Space Apps', '<i class=\'fa fa-list text-aqua\'></i>', 'content.create', 'about-nasa-space-app-challenge', 0, 0, NULL, '2022-08-03 04:48:58'),
(5, NULL, 'Gallery / Images', '<i class=\'fa fa-windows\'></i>', NULL, NULL, 3, 0, NULL, NULL),
(6, 5, 'Albums', '<i class=\'fa fa-list text-aqua\'></i>', 'album.index', NULL, 0, 0, NULL, NULL),
(7, 5, 'Photos', '<i class=\'fa fa-list text-aqua\'></i>', 'photo.index', NULL, 1, 0, NULL, NULL),
(8, 5, 'Videos', '<i class=\'fa fa-list text-aqua\'></i>', 'video.index', NULL, 2, 0, NULL, NULL),
(9, 5, 'Sliders', '<i class=\'fa fa-list text-aqua\'></i>', 'slider.index', NULL, 3, 0, NULL, NULL),
(10, NULL, 'System Settings', '<i class=\'fas fa-cog\'></i>', NULL, NULL, 20, 0, NULL, '2022-08-03 01:37:44'),
(11, 10, 'Role', '<i class=\'fa fa-list text-aqua\'></i>', 'role.index', NULL, 0, 1, NULL, NULL),
(12, 10, 'Menu List', '<i class=\'fa fa-list text-aqua\'></i>', 'menu.index', NULL, 1, 0, NULL, NULL),
(13, 10, 'Site Settings', '<i class=\'fa fa-cog text-aqua\'></i>', 'siteSetting.index', NULL, 2, 1, NULL, NULL),
(14, 10, 'Activity Log', '<i class=\'fa fa-history\'></i>', 'activityLog.index', NULL, 3, 0, NULL, NULL),
(15, 10, 'Module Create', '<i class=\'fa fa-folder text-aqua\'></i>', 'module.create', NULL, 4, 0, NULL, NULL),
(16, NULL, 'Achievement', '<i class=\'fas fa-book-reader\'></i>', 'achievement.index', NULL, 4, 0, '2022-07-20 03:19:13', '2022-08-03 01:36:04'),
(17, NULL, 'Organizer', '<i class=\'fas fa-network-wired\'></i>', 'organizer.index', NULL, 5, 0, '2022-07-20 20:52:57', '2022-08-03 01:36:41'),
(18, NULL, 'Press Coverage', '<i class=\'fas fa-bullhorn\'></i>', 'pressCoverage.index', NULL, 9, 0, '2022-07-21 02:33:15', '2022-08-03 01:46:38'),
(19, 35, 'Faq', '<i class=\'fas fa-question\'></i>', 'faq.index', NULL, 0, 0, '2022-07-21 03:37:43', '2022-08-03 01:47:37'),
(20, 35, 'Partner', '<i class=\'fas fa-hands-helping\'></i>', 'partner.index', NULL, 0, 0, '2022-07-21 04:59:10', '2022-08-03 01:47:59'),
(22, NULL, 'Resource Document', '<i class=\'fas fa-parachute-box\'></i>', 'resourceDocument.index', NULL, 8, 0, '2022-07-22 23:26:44', '2022-08-03 01:43:46'),
(23, NULL, 'Local Winner', '<i class=\'fas fa-award\'></i>', 'localWinner.index', NULL, 7, 0, '2022-07-23 23:36:53', '2022-08-03 01:46:28'),
(25, NULL, 'Program Schedule', '<i class=\'fas fa-border-all\'></i>', 'programSchedule.index', NULL, 6, 0, '2022-07-24 02:50:07', '2022-08-03 01:44:14'),
(27, 10, 'Front Menu', '<i class=\'fas fa-align-justify\'></i>', 'frontMenu.index', NULL, 3, 0, '2022-07-27 21:13:38', '2022-08-03 00:34:01'),
(29, 35, 'App Challenge Info', '<i class=\'fas fa-award\'></i>', 'appChallengeInfo.index', NULL, 0, 0, '2022-07-31 21:10:40', '2022-08-03 01:44:03'),
(30, 35, 'App Challenge Category', '<i class=\'fas fa-align-center\'></i>', 'appChallengeCategory.index', NULL, 0, 0, '2022-07-31 21:27:48', '2022-08-03 01:43:54'),
(32, NULL, 'Applicant Registration', '<i class=\'fas fa-graduation-cap\'></i>', 'registration.index', NULL, 1, 0, '2022-08-03 00:15:31', '2022-08-03 00:32:54'),
(35, NULL, 'Master Setup', '<i class=\'fas fa-ad\'></i>', NULL, NULL, 0, 0, '2022-08-03 00:25:28', '2022-08-03 00:32:49'),
(36, 2, 'Registration Page Info', '<i class=\'fas fa-info\'></i>', 'content.create', 'registration-page-info', 28, 0, '2022-08-03 04:48:07', '2022-08-03 04:48:07'),
(37, NULL, 'Zone', '<i class=\'fas fa-search-location\'></i>', 'zone.index', NULL, 10, 0, '2022-08-06 21:17:48', '2022-08-06 21:26:58'),
(38, 35, 'Contact', '<i class=\'fab fa-contao\'></i>', 'contact.index', NULL, 30, 0, '2022-08-16 04:14:51', '2022-08-16 04:14:51'),
(39, 35, 'News Letter', '<i class=\'fas fa-newspaper\'></i>', 'newsletter.index', NULL, 31, 0, '2022-08-16 04:15:17', '2022-08-16 04:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_05_26_071839_create_roles_table', 1),
(6, '2020_06_01_101148_create_site_settings_table', 1),
(7, '2020_06_01_102821_create_contents_table', 1),
(8, '2020_06_02_044523_create_content_files_table', 1),
(9, '2020_06_08_140638_create_sliders_table', 1),
(10, '2020_06_09_051430_create_albums_table', 1),
(11, '2020_06_09_053929_create_photos_table', 1),
(12, '2020_06_09_072128_create_videos_table', 1),
(13, '2020_06_10_120859_create_front_menus_table', 1),
(14, '2021_02_22_050702_create_permissions_table', 1),
(15, '2021_02_22_050735_create_role_permissions_table', 1),
(16, '2021_02_22_062756_create_menus_table', 1),
(17, '2022_06_23_053641_create_admins_table', 1),
(18, '2022_07_16_095130_create_activity_log_table', 1),
(19, '2021_02_26_100135_create_news_table', 2),
(20, '2022_07_20_091912_create_achievements_table', 3),
(21, '2022_07_21_025256_create_organizers_table', 4),
(22, '2022_07_21_083315_create_press_coverages_table', 5),
(23, '2022_07_21_093743_create_faqs_table', 6),
(24, '2022_07_21_105909_create_partners_table', 7),
(25, '2022_07_23_032501_create_registration_infos_table', 8),
(26, '2022_07_23_052643_create_resource_documents_table', 9),
(28, '2022_07_24_071728_create_finalist_nominees_table', 11),
(29, '2022_07_24_085006_create_program_schedules_table', 12),
(30, '2022_08_01_031040_create_app_challenge_infos_table', 13),
(31, '2022_08_01_032748_create_app_challenge_categories_table', 14),
(32, '2022_08_01_103617_create_registrations_table', 15),
(33, '2022_08_01_103801_create_team_members_table', 15),
(34, '2022_08_07_031748_create_zones_table', 16),
(35, '2022_08_08_073134_create_local_winner_participants_table', 17),
(36, '2022_07_24_053652_create_local_winners_table', 18),
(37, '2022_08_08_062729_create_global_merits_table', 19),
(38, '2022_08_13_042023_create_contacts_table', 20),
(39, '2022_08_14_104002_create_news_letters_table', 21),
(40, '2014_10_12_100000_create_password_reset_tokens_table', 22),
(45, '2023_06_25_113751_create_album_folder_table', 23),
(46, '2023_06_25_113826_create_album_image_table', 24),
(47, '2023_07_08_055826_create_news_table', 25),
(48, '2023_07_12_061326_create_organizer', 26),
(49, '2023_07_10_095705_create_about_table', 27),
(50, '2023_07_23_093958_create_resources', 28),
(51, '0001_01_01_000000_create_users_table', 29),
(52, '0001_01_01_000001_create_cache_table', 29),
(53, '0001_01_01_000002_create_jobs_table', 30),
(54, '2024_08_20_052058_create_sponsors_table', 31),
(55, '2025_09_24_104904_create_rooms_table', 31),
(56, '2025_09_24_104917_create_project_room_table', 31),
(57, '2025_09_24_104937_create_room_user_table', 31),
(58, '2025_09_29_082638_create_participants_table', 31),
(59, '2025_09_29_104305_add_auth_fields_to_participants_table', 31),
(61, '2025_09_29_234039_add_some_fild_to_site_configs_table', 31),
(62, '2025_09_30_103940_create_marks_table', 31),
(63, '2025_12_15_184102_create_universities_table', 32),
(64, '2025_12_15_191041_add_more_fild_to_app_challenge_categories_table', 33),
(66, '2025_12_15_201550_add_more_fild_to_zones_table', 34),
(67, '2025_10_02_114419_add_more_fild_to_registrations_table', 35);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `registration_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `email`, `password`, `remember_token`, `email_verified_at`, `registration_id`, `created_at`, `updated_at`) VALUES
(4, 'mahmudrana.dev@gmail.com', '$2b$10$bP9/2qsxAalJmA/uF6z92OZnWFapoAh1fb9rSD3YpN8y5L7TC7wlC', NULL, NULL, 1, NULL, NULL),
(5, 'habibulbashar412@gmail.com', '$2b$10$G5XMuNdhPVCBGbhBtNEImuANXsQFmfDgTfqzvuKtQBq8FdrqfxUTa', NULL, NULL, 2, NULL, NULL),
(6, 'emran.alarif8@gmail.com', '$2b$10$ITdCJxapqslP6T7V/063eudrG3KYovQ3K0eRcc3PhT3INu7xdTOBK', NULL, NULL, 3, NULL, NULL),
(8, 'ashabulyamintuhin@gmail.com', '$2b$10$V86dQrgD8tigCRAcARhCcOwAMUdHqfZnzeC2eql2Ye18g.RF19OKe', NULL, NULL, 4, NULL, NULL),
(9, 'nafisfuad2024@gmail.com', '$2b$10$5Ly8vXf5xAjC2No5KcoyYeeTB8VIbTVA19Ww8w.B4WXsctRs3BEuG', NULL, NULL, 5, NULL, NULL),
(10, 'ug2102019@cse.pstu.ac.bd', '$2b$10$Z9Jn26zuLeaSjgO4OLdnNOgZ.6MC.IcOkFTUO6KNt/WtvhZgYya3C', NULL, NULL, 6, NULL, NULL),
(12, 'hasibul.hasan.rahimm@gmail.com', '$2b$10$ozEPkFaFCF8im2zDd2seUOBqFjg55oOYP.7TpO2qkZETB.GIjt7e6', NULL, NULL, 7, NULL, NULL),
(13, 'abdullahibrahimmahi001@gmail.com', '$2b$10$VD6zWvzW9jVaPDnU9YyCdOr8kZx1prLqseOVIVdyPKTbcpS39bGzO', NULL, NULL, 8, NULL, NULL),
(15, 'codeblacklive@gmail.com', '$2b$10$3PUD9ECiBhezpzLnFMZJQ.UVgN1.rPoLsd8In2rSaGSB8YRuqqy1i', NULL, NULL, 9, NULL, NULL),
(16, 'wahid55100@gmail.com', '$2b$10$xuabQrgQmIZpGsS75a9M2urVR.FnxzHa0XSnKh4HD.cVUGn/BnXlu', NULL, NULL, 10, NULL, NULL),
(17, '252-16-046@diu.edu.bd', '$2b$10$vcdhwJQI9B2vI4e0QYHL0OiEMpPkbLRi91tYK284gCKkPeR3R5B7a', NULL, NULL, 11, NULL, NULL),
(18, 'sagorhs329@gmail.com', '$2b$10$aD5Li3iOhwEumzr57RLelOaGS6ZzGF5F4JhfZO5uVQDWmt4NTRWrC', NULL, NULL, 12, NULL, NULL),
(21, 'anisurerahaman06@gmail.com', '$2b$10$I4sbkC360tbl.BlYhBK0TeOvrtqHKKprD4JtMMcqk9Dw16a4cIoXS', NULL, NULL, 13, NULL, NULL),
(22, 'sunnysaminyasar@gmail.com', '$2b$10$yK5K.JTTgd0qiSZD.6snFeFs6fte0twDfWhZ3x0i6mwBOejdyHVYO', NULL, NULL, 14, NULL, NULL),
(23, 'imranraton599@gmail.com', '$2b$10$cUlbt22VazKLvMjkZkQ6Q.v6AdPMSUc3iqbtixrSIvlvXrrgg3mGm', NULL, NULL, 15, NULL, NULL),
(24, 'saminyasarsunny@gmail.com', '$2b$10$Wp1QFCk47iRNUr4GVEbwZ.Y1j0Nl9yofyTpXVXPiiuBS3NO8lHpL.', NULL, NULL, 16, NULL, NULL),
(26, 'musfique.contact@gmail.com', '$2b$10$16igOGsDKM2LIqDhWbFv9.gcnGT1r4ES1DUwk83WQpfMxKgrZuZTe', NULL, NULL, 17, NULL, NULL),
(28, 'turjojps@gmail.com', '$2b$10$L1tz2KVjEvvABTWAPWUZoO9lg3a3vha2JXtVk.ZsdiHTh2qHImB8e', NULL, NULL, 18, NULL, NULL),
(29, 'nahid1719abd@gmail.com', '$2b$10$Gxe.XzCyZMIhKU8fY94ObOD6Td/NHy2doHqthAzn.LpMcGq4gdise', NULL, NULL, 19, NULL, NULL),
(30, 'nadim153rahman@gmail.com', '$2b$10$KW8o24TzBrWkAfftNoX4TeDV4iIgCqsjFKb8MNrVqIgp.xG277Ksm', NULL, NULL, 20, NULL, NULL),
(31, 'rafify139913@gmail.com', '$2b$10$DgiTt0TsAkRAfmPsXdOVoeL/uofjeLEJDO2GJ7MpTw0k6sXNQZdxi', NULL, NULL, 21, NULL, NULL),
(32, '357anindya@gmail.com', '$2b$10$lkX9KpR6p.jhT/ejQe/rl.x9pEMEMDe0H0Hv2.llgXw2cD1Z0FJPW', NULL, NULL, 22, NULL, NULL),
(33, 'jubayer17@cse.pstu.ac.bd', '$2b$10$j9Vu75oiB4bvTV7jWmw/oOXmAu5m/WR5R0UrZT83VJNDvtEzDUjGK', NULL, NULL, 23, NULL, NULL),
(34, 'jibonkumarcse@gmail.com', '$2b$10$c6vVktGiPNPtPT3olYyxuelzbcGqSVd2zHkOR2effQq32J3fVOeJK', NULL, NULL, 24, NULL, NULL),
(40, 'shahriarsaikat24@gmail.com', '$2b$10$6MmvH9nYZ56ozJrejiMqC.93da2YS6wkaHm/Kz9zWDCYtDu/.jRI6', NULL, NULL, 25, NULL, NULL),
(41, 'meetmehedi1@gmail.com', '$2b$10$RiuwZZPnKYMjC.eJPcg8X.fF09aqRoTphkWuiJR.Kty6OBFz8LzvK', NULL, NULL, 26, NULL, NULL),
(42, 'n47712338@gmail.com', '$2b$10$0wb56WrGK/N1LI06z6uzVuF4taou3ydfguVzm5tDsNhIX5342sWbS', NULL, NULL, 27, NULL, NULL),
(43, 'mr.rahim.5231@gmail.com', '$2b$10$dNpkEDHl8Ip/19Rbi6.MIeZR1bFLcOgo.bsx/bXhSLjH/GbjP7HFS', NULL, NULL, 28, NULL, NULL),
(45, 'tipuagarwal68@gmail.com', '$2b$10$oCJrflw1jXJdrw7TP66vROUi4Lh0T9Y2BuclKw1IxrXlQG7fM8BMy', NULL, NULL, 29, NULL, NULL),
(46, 'sabafiha111@gmail.com', '$2b$10$Pvzb50b66d/aYz7D5.1aj.W4f/dmSaCuSm8We.3D3wL.8eyt0sOGq', NULL, NULL, 30, NULL, NULL),
(47, 'afiaadibahafsa@gmail.com', '$2b$10$SZ4QMsFGGMiWRLBMFnkS2e0HcmtQxrDIH3/P5xUjk1nsNrhiD9.WK', NULL, NULL, 31, NULL, NULL),
(48, 'mrsalamsiam94@gmail.com', '$2b$10$8cTIQZlOSSS0fQnIjDe2N.vJfeiEVmWK2XcYqjYNprAFoIGIo2Gk.', NULL, NULL, 32, NULL, NULL),
(51, 'cascascac@gmail.com', '$2b$10$SiixLgc1azRC7P36flezkOfkjBMCK7UVB8LAeKt7soobuwPljhxUO', NULL, NULL, 33, NULL, NULL),
(53, 'barirafiull@gmail.com', '$2b$10$sKpykrn4Jjrfu.Sa0FbhlO67HSmrRqaLv.9aYbQihkD90JpQG6o4C', NULL, NULL, 34, NULL, NULL),
(54, 'tanvir.rahman.contact@gmail.com', '$2b$10$06n7hhPXBxNYuxzawffWguBy6c4QcuOMTa9CDiRfTzU7Z7G6osBBa', NULL, NULL, 35, NULL, NULL),
(55, 'sadique21.hossain@gmail.com', '$2b$10$DPhMRdbltD5lrqqaWAkgb.4g7GzhwuBerqR39Q7rB.YZi9yoV4Y4O', NULL, NULL, 36, NULL, NULL),
(56, 'afzalhossainalif@gmail.com', '$2b$10$ZWbidWDIv4c4XUYg/BVZh.43crafOfnP.PfFHz6HX2/XPfnjM.D6.', NULL, NULL, 37, NULL, NULL),
(57, 'sabbirahmed12546@gmail.com', '$2b$10$rhgkhqPstzFK3GelVOBAguwKXeROruRRRX703AdYQhm7mPW3jcaxe', NULL, NULL, 38, NULL, NULL),
(58, 'zasif855@gmail.com', '$2b$10$269gsOohj8c.Oadqy2vA/ugaYtmcb9BgjkM6jF5mtaer4KGcYbzSK', NULL, NULL, 39, NULL, NULL),
(59, 'rakibullhaques@gmail.com', '$2b$10$yZdaS8KiaQxhEuD1YbVAKOK841mopUSZkAhH0jpUowhegOm1iUl3u', NULL, NULL, 40, NULL, NULL),
(60, 'inayeemul909@gmail.com', '$2b$10$fW4IBwGoemavTnq/TIp6dOl.TuwipfgIBjNclr3morsKLNgUYTfAy', NULL, NULL, 41, NULL, NULL),
(61, 'fahmida30dec2@gmail.com', '$2b$10$iDX48uZn1in9vQcuxfmyu.n4Tng/9E/rAJRK0o/7BKZvzc5cbecee', NULL, NULL, 42, NULL, NULL),
(62, 'tanjilsarwar30@gmail.com', '$2b$10$o9y7jJWDREPmL19Rz1m4guTX4ogzVVRlGVyZhQGrYUvlu/yYctUzu', NULL, NULL, 43, NULL, NULL),
(63, 'abdullah.azonedev@gmail.com', '$2b$10$rhkMHIR/r8zHVsQYsa91r.EaXXjtST.BIBd8THP1TNp0TE8NVk6Wu', NULL, NULL, 44, NULL, NULL),
(64, 'ratulhasan1644@gmail.com', '$2b$10$T4pc5OpEx6.l1Hzj/f.RPOlAaGPJbdzBGtXrMSsDFB/2l9..kC6XS', NULL, NULL, 45, NULL, NULL),
(65, 'nhabir1904@gmail.com', '$2b$10$0gIjMpzm/qeHEZJMqdfHOey8WQCJyW8RwPhZPEGfaHqdGlDErHhU6', NULL, NULL, 47, NULL, NULL),
(66, 'shovonshahriar01@gmail.com', '$2b$10$L8vdmzrSIi93ueCE7g3ih.xAOsmGiONjpkHarYS10ceAPe5f7FnQW', NULL, NULL, 52, NULL, NULL),
(67, 'sanjidtalukder02@gmail.com', '$2b$10$5zfdpGE/tgdy..io7RPT.OqsmxmnZF5.5IX.jRcb6og3T8JgI64oa', NULL, NULL, 53, NULL, NULL),
(69, 'najiba005@gmail.com', '$2b$10$KX.QF/LG7BtM7uEXmQ3tier22Fey2auaseIILZFpXdsNe.F/waqym', NULL, NULL, 54, NULL, NULL),
(70, 'ropamdebnath6@gmail.com', '$2b$10$rPgR.SH5H1ka9AGHqkNPbuhxiY3Eh496RFM0ZA0ZA6RKqJfu6/65i', NULL, NULL, 55, NULL, NULL),
(71, 'irfanshazd814@gmail.com', '$2b$10$OXWjRORMLAxUPsG3Yv2iMuaMMjBwHfYZ.DMC0MiTmD/lHDb1Qtz7a', NULL, NULL, 56, NULL, NULL),
(72, 'k.rifat.muhtasim@gmail.com', '$2b$10$qCL5jimwvpvQtk8D8nTVV.EB1.fjue0/RtT7228llB68TyDM.biV6', NULL, NULL, 58, NULL, NULL),
(74, 'nilantoashik@gmail.com', '$2b$10$TT7VSEWjFaltKip73/AAceOy2FVaU0QtXIXq4h2dv32rvuK5y91Om', NULL, NULL, 59, NULL, NULL),
(76, 'hellonabil30@gmail.com', '$2b$10$lAkCUV5vvfKGSFUmzPK90uqmDl9mMIYa2mDsrjt2nHKl1eFRlpGp.', NULL, NULL, 60, NULL, NULL),
(77, 'gmrafi365@gmail.com', '$2b$10$ulX43qdszJm/1Aa9mZHeeeLo3C1MhHC9MG.gTSoZfJULy.2YVSxk6', NULL, NULL, 61, NULL, NULL),
(78, 'msa050861@gmail.com', '$2b$10$v4Rt858.afQ4FjZnpt8VHuRiiSNdQDRPbt.meHRH8NOsV.cU7dL8O', NULL, NULL, 63, NULL, NULL),
(79, 'msafwaan30@gmail.com', '$2b$10$lVmTSySuYg2SqO.ryC.3G.SM8yMAe6NeHc3bEfNXRqNNQGX1SFJSu', NULL, NULL, 64, NULL, NULL),
(80, 'md.rifat.muhtasim@gmail.com', '$2b$10$wfr1TC0nqsQkmp4Wx.E4TeUMKmIQjY028qsKs0U6LXYkcCoEvP3NC', NULL, NULL, 65, NULL, NULL),
(81, 'mislam9095@gmail.com', '$2b$10$G4hxXVvFRDaFmVpuXqC7U.QwXMgtw80Nlj3G3S0tG5EicBXOVPxTu', NULL, NULL, 66, NULL, NULL),
(82, 'rifatahsan39@gmail.com', '$2b$10$fdXWnGqT0o7R8FxJtxUP7./tdk./PlSFVAHcEfVzXzOfYqnejQMyu', NULL, NULL, 67, NULL, NULL),
(83, 'tajwaruzzaman@iut-dhaka.edu', '$2b$10$vTsKYXjf3ZSwB9rahyRLL.xqhUMbFtSULo3BEUOKnFJBkRNV99Esi', NULL, NULL, 68, NULL, NULL),
(84, 'mdzisanulhaque989@gmail.com', '$2b$10$LWLcmPkmO7m8GE3XL/aJBOlKPGRgdYhmIRvuqaogzi8igf2eP.bDm', NULL, NULL, 69, NULL, NULL),
(87, 'ayesharimi296@gmail.com', '$2b$10$i4EZEk8wlqNYWy4n4nn0ne7dnZiUr4dxIgZjHL6.pxUgMwpVw.Ehe', NULL, NULL, 72, NULL, NULL),
(88, 'zahid.hasan6@gmail.com', '$2b$10$vhr1Lzjq2dxk3VI7JO3cweArkbNKm1WjgnSKClBHuFGFNm2pROcJu', NULL, NULL, 73, NULL, NULL),
(89, 'armanhossainshuvo25@gmail.com', '$2b$10$AXOXeYVeAof1Snass/Vf2./JlSQHSUo5T853npn1eK622QjnDkK32', NULL, NULL, 74, NULL, NULL),
(90, 'lazyhacker0977@gmail.com', '$2b$10$QWtlvectOBFldUPkhcR54eSCYu23/D/DMWHFu0TzJv4bfHWih8hwG', NULL, NULL, 75, NULL, NULL),
(91, 'niloystudent870@gmail.com', '$2b$10$3uUVk6M5SWzAFhdbUrZTwuzyQ8tYqg/7f8XW3lMkCF.wbuFKzk.j2', NULL, NULL, 76, NULL, NULL),
(93, 'rafi122283pro@gmail.com', '$2b$10$1PBT5SHipP/UH2dFwIG2xuW5E7ormPu6BoN2Sj3WzHeQOPck0obK2', NULL, NULL, 77, NULL, NULL),
(96, 'jarintasnuva88di@gmail.com', '$2b$10$KA4FldOjSKS/SgPU0Mj.kOclP2y6P.QOl89jmNMnHeevfDdpCZuuO', NULL, NULL, 79, NULL, NULL),
(97, 'salimbd.tsu@gmail.com', '$2b$10$GcQjNKHrQWyncAiuVMlKkeKbsYQOTh87uiDoG/1NdAO/9/p0.5LzO', NULL, NULL, 80, NULL, NULL),
(98, 'thundermahir08@gmail.com', '$2b$10$fam6ciJE8xZQviU1lXgIB.vXGP/CCRuVMN7PLptfWwxhxMN5T7CkO', NULL, NULL, 81, NULL, NULL),
(100, 'navilhchowdhury@gmail.com', '$2b$10$.YgSm2LGyd7lqWbL72buYuCIFZkddiJYc8YW/ExQSdU1VzxLM2PJO', NULL, NULL, 82, NULL, NULL),
(102, 'shakibsahab10@gmail.com', '$2b$10$ONEg6XT72sM90Ujlb3V9uOx0QUzNi6kUeZyQU89YmxP3w4V9tGAYq', NULL, NULL, 84, NULL, NULL),
(105, 'alishahmaria01@gmail.com', '$2b$10$UgDJ3QeK7pMilNxkIN/op.g0ZS5n1AAmPa7.v8MK/UjNqmHhrVT9q', NULL, NULL, 86, NULL, NULL),
(106, 'hi@habibullah.dev', '$2b$10$SrDrxcqeSdZ44L8ebvwbTeFf3eqWM34oaji5VjL1NeqFFtOrPxH5C', NULL, NULL, 87, NULL, NULL),
(107, 'hello@habibullah.dev', '$2b$10$NFMqlvFXX0O8270UvV06nuxVp72WbnIZfUK926djgnQG0F/MD7Doq', NULL, NULL, 88, NULL, NULL),
(109, 'warn@habibullah.dev', '$2b$10$bwk1VPydtj/dg9XEAlOqhe2hDyNor/nPIjRF9qh3f8u7a2sVwXtgW', NULL, NULL, 89, NULL, NULL),
(110, 'sadman.hasan.t@gmail.com', '$2b$10$mH.J5rV0gYnlpJXstGrfAumwlagHRc66uzwA1TBcObpxNmpOZ7jkK', NULL, NULL, 90, NULL, NULL),
(111, 'sakibulhassan.shovon@gmail.com', '$2b$10$NoS/JxRAIm9oQUv/W3vM0OZjoP5iX5Vk6pdveHIdV9RhKbD8IukzS', NULL, NULL, 91, NULL, NULL),
(112, 'ayonburg@gmail.com', '$2b$10$hfJEZACvIXevFYx01kgQD.mxE4a6mkHDhNatdQM2WVXBpklfGSBw2', NULL, NULL, 92, NULL, NULL),
(113, 'irafsan2020@gmail.com', '$2b$10$hgrcmDLAWxxduIl8w2FOMeHjx3U1VHunSKFZW/wbJOBxDtjnRNDbG', NULL, NULL, 93, NULL, NULL),
(114, 'kishorpaul1594@gmail.com', '$2b$10$gAzZCn6Vzo2Ca0ttJbU5aOgeNVLLoCwhzr9kiFkfZ6DFMfl6tZx6a', NULL, NULL, 94, NULL, NULL),
(115, 'ifra3stu@gmail.com', '$2b$10$nO1x5oN9LgYPdH38xj/R..uHL6Sxb5oNfyH5aMeBtc7KRfbOHpNUO', NULL, NULL, 95, NULL, NULL),
(117, 'swapnil35@student.sust.edu', '$2b$10$9Ln7jBw.cIXsqTcRmk8dhuQrniucvxBrwOJqIw5m9iH/5bapkMxkK', NULL, NULL, 96, NULL, NULL),
(118, 'ehsan.eab@gmail.com', '$2b$10$QnneaqCTwZror5.pFEOlReV9RKfA7PpINfaZcRiqFevlJGHKbxmJy', NULL, NULL, 97, NULL, NULL),
(119, 'mujahidulislamadib@gmail.com', '$2b$10$aKnBHVvmilk9PmlVRk2/d.cy6JaFRr5cvE/wdL1kGEnAKaowNgvX2', NULL, NULL, 98, NULL, NULL),
(120, 'rabeyabintealishorovi@gmail.com', '$2b$10$bXtLuwX8XgcVspo44nVH9.9INgQ6KClEA/7h5E28MzgXr2aST0hr2', NULL, NULL, 99, NULL, NULL),
(121, 'moshiour.sarker792@gmail.com', '$2b$10$uAGs5hy7UQrprxhu6ujrT.Qwhup2/5zD3a.lN2xzpev5fBjDXLrMG', NULL, NULL, 101, NULL, NULL),
(122, 'mdshakil6565a@gmail.com', '$2b$10$IAlI8ROqcjcqbKAxcq8MFOQ9TM0hQEkbjOE3Cr5K1pRhQaKkY7pyu', NULL, NULL, 102, NULL, NULL),
(124, 'm.a.kowsar@gmail.com', '$2b$10$C/fiGQrPvq7moZOu5l6n5uoJcSvs5vXRZStMrKbqeEvAo.OGGEhV2', NULL, NULL, 104, NULL, NULL),
(126, 'tarabin567891010@gmail.com', '$2b$10$R/mejmwWX3Yg66bmFQddXO37M718FoiSbqLvNHq45riIKVM10ZRE2', NULL, NULL, 105, NULL, NULL),
(128, 'shafin.mahamud@g.bracu.ac.bd', '$2b$10$virCX/YpVtI9OvlyuLRf9.6CRP7/2rChwQseltApxFCTUP/XQTwwa', NULL, NULL, 106, NULL, NULL),
(129, 'fareyahossain835@gmail.com', '$2b$10$0o6STM0q3lvDsXk88v5ituYj2NkwRj.yTWw6wXAIXrlaQQOdGlwTu', NULL, NULL, 107, NULL, NULL),
(130, 'tasinmahi00@gmail.com', '$2b$10$D9bZrkYLztqtu9OFPhWIE.ICYAH7246Gw/dddzZeVJlZPFCOunUN2', NULL, NULL, 108, NULL, NULL),
(131, 'ehsanul.haque.ome@gmail.com', '$2b$10$nJDhB7VzAt2zqM32DuqdmOjGOpbBZdBJ/Nu2.B8JwlfkxoqQ100yi', NULL, NULL, 109, NULL, NULL),
(132, 'choyondhorshuvo@gmail.com', '$2b$10$TrDyRBaraFshhyEYBwoKC.YKf9Wsg9bOfunDE2vnszMxbh5vyyN0q', NULL, NULL, 110, NULL, NULL),
(133, 'rhymerayyan39@gmail.com', '$2b$10$qWsyTT4kQ2msD3VMPhGvFe5L6gshMiNIyHflhRms6UEa0zFOKnF6i', NULL, NULL, 111, NULL, NULL),
(134, 'rakat.ashraf.holocast@gmail.com', '$2b$10$HSUD9WoROheNEjKe.hU65eqXE1EINrr4Isilly6xhpxESc7ykcgNS', NULL, NULL, 112, NULL, NULL),
(136, 'mehedihasansarkar1899@gmail.com', '$2b$10$Mq56Gy3UJsFJHPDs0xW0Uu/g6u.BomGwe3HhU2tk205DgtfVp9aZG', NULL, NULL, 113, NULL, NULL),
(137, 'md.seyam1468@gmail.com', '$2b$10$mNQh4w1qIYEbvQKes2d0o.kPdH9CcJ3r410qfQC48akF2tecOGTiS', NULL, NULL, 114, NULL, NULL),
(139, 'iztihad.bankai@gmail.com', '$2b$10$yxgfXk6zOaJ8nRrloV/PGuiuhCCJ8HwZ3zcu9B98ZhEhT2HIL8vxu', NULL, NULL, 115, NULL, NULL),
(140, 'sabihaakternib@gmail.com', '$2b$10$3H2YfxSVDtlQp7xQBlK1fOTT/oM.6iaZQfXdu6WWCFH.FomLAEgYS', NULL, NULL, 116, NULL, NULL),
(141, 'shafqatnawazchy@gmail.com', '$2b$10$bp.Bm6O7CG5uy/44aIp.be2BA2ujV.AQlE/osQXlMozGUYlkxrXN.', NULL, NULL, 117, NULL, NULL),
(142, 'info@noorhikmah.com', '$2b$10$WQQ.bmC9NmV40vDb08m6Te9CCrCDfUEyN9V9Y4UJ7mrVg1pQOLwrK', NULL, NULL, 118, NULL, NULL),
(143, 'kawsermahamudjunyed@gmail.com', '$2b$10$qOeEzRZSP9NyddVyHh4vnemdtIps.18o67zWXSh1u7/NS8n3gljTG', NULL, NULL, 120, NULL, NULL),
(144, 'rahathasan405020@gmail.com', '$2b$10$FY1ep6Kaivuh02Mr5HxxveUv2ik34Gh50RcaQr9jYndQ1j8z9LFcq', NULL, NULL, 121, NULL, NULL),
(145, 'mccollam@gmail.com', '$2b$10$LJNtULImNTKKYnwzl.3NlOmZsyo4Ipa7Js.0sxvegadWtdMC8448C', NULL, NULL, 122, NULL, NULL),
(146, 'millionxbangladesh.unguided555@passinbox.com', '$2b$10$qBUTtM9QUErYMhDkJVx6hur7MTlZ95WixUnPJ771aZJaC3fjBuXvq', NULL, NULL, 123, NULL, NULL),
(147, 'shahriarsajid123@gmail.com', '$2b$10$2lugqGkomSpQPLWsL0AHO.DrZt5ybN6HgyC/AMRfBkxI76kdDYZqS', NULL, NULL, 125, NULL, NULL),
(148, 'jhishandeb10@gmail.com', '$2b$10$4HsBr2c7TUZm4x90BI1g0eueHY4PoNSqAgsXPlPoShjaGadvpI70W', NULL, NULL, 126, NULL, NULL),
(149, 'zubayermayaz@gmail.com', '$2b$10$2Y9hAK0g1W1/HUWtGXtk/uoHsJVqd6sNcQzwDYPAZ8UTd06l/6GIK', NULL, NULL, 127, NULL, NULL),
(150, 'andalibrashidper@gmail.com', '$2b$10$T8nuf4mTom/lO.D5aGvTLOgOT.pHCYiMQeN8Ef1P9e7ldxpYTvWTu', NULL, NULL, 128, NULL, NULL),
(151, 'farabi.shrabon.132@gmail.com', '$2b$10$ORBmXwN6E3OdPB6m1TR0X.mi4ynPxVXW9KO0IWScQBjvGxL18LVvm', NULL, NULL, 129, NULL, NULL),
(152, 'dolandhruboray@gmail.com', '$2b$10$tS2blOjrr/YimHAX3zAp9.bU1G9H/MbcDQ2MIhQfJZAepjLfjcbFK', NULL, NULL, 130, NULL, NULL),
(153, 'marina.vucse@gmail.com', '$2b$10$VNtFGfwRgfvklJwT4Tp3MuuJ8qSNvpQscvXZ0pFjOuO32uiter8V6', NULL, NULL, 131, NULL, NULL),
(154, 'muntasirraiyan5555@gmail.com', '$2b$10$c6DkDE53cQhyFTDkRg6jUu6gTzO2wNQAC0hbJ4Qp7qbgurYxhzowm', NULL, NULL, 132, NULL, NULL),
(155, 'sakeef02@gmail.com', '$2b$10$j.CTFywVAYBILQNulRqULO337yKLgBXBo8rCTxax1hRlL8IdZOv4.', NULL, NULL, 133, NULL, NULL),
(156, 'alfirahman@gmail.com', '$2b$10$SWYc7EQ.7fX9x1HDEpz4fOO2MVC2..39vF/7B/w41XeBjDFvuX812', NULL, NULL, 134, NULL, NULL),
(157, 'sayedhridoy100@gmail.com', '$2b$10$Rq219Q0CA/QRWUUBYt12luV74U93DKouX.AnNQDAxs3RNliUf2GtO', NULL, NULL, 135, NULL, NULL),
(158, 'kausarahmed2nd@gmail.com', '$2b$10$ylVasXjEifqyDnkmaQbl1uhTnQTWybYAXO/pOIlKqRA4ziaVIfkVa', NULL, NULL, 136, NULL, NULL),
(159, 'ialif3299@gmail.com', '$2b$10$ceOCmqrJs2zegG31umgdIu.jDly3isgOW.mEdDsSq81d9RUepN0U6', NULL, NULL, 137, NULL, NULL),
(160, 'saadmansakib21@iut-dhaka.edu', '$2b$10$g.uh.Z.yfdeklIuEFrD5lOsFZt5sX0nZBe/FmpyuLsTE4YYRaGkQW', NULL, NULL, 138, NULL, NULL),
(161, 'theadnansami@gmail.com', '$2b$10$YaphAeXEPRYsDvjCC7Z8tu77aXOku9LxSCXOxc01wSdbe4y6dIA.S', NULL, NULL, 139, NULL, NULL),
(163, 'u2102047@student.cuet.ac.bd', '$2b$10$merV2SpoLOR7Mc4MnOXFbeKXJt01uXmu6XkzxfCu0nodlL2Tdbiyq', NULL, NULL, 140, NULL, NULL),
(165, 'ragibyasar11314@gmail.com', '$2b$10$Ru.qrCEomrwWoLS3rcj25uHEMmJu.aSnkgL5xYk6Li3OqL94TuszO', NULL, NULL, 142, NULL, NULL),
(167, 'farhantanvir277@gmail.com', '$2b$10$qvjYeIBnEZDyT3Ypzv0NVu9xdcI7zNZnlGiQWpfbN7wqDe.gMBcAS', NULL, NULL, 143, NULL, NULL),
(168, 'hasib.9437.hu@gmail.com', '$2b$10$tzLJWC1B5v9sBS4GlQmgvO9zbZI163AZXB3xxuxMYs0pqYsJAMzUu', NULL, NULL, 144, NULL, NULL),
(169, 'apurbo.awm@gmail.com', '$2b$10$A1k9HEdx2ClcItSjLBvoyeM9UjZGcY/x7t8rfrCfNdnmGGJ9/slzq', NULL, NULL, 145, NULL, NULL),
(170, 'sadiahossain.cse.114@gmail.com', '$2b$10$mwoQVZXCO.QCutz9RdudVuRvHlUGmz0x/wZizPPSEFFt0tnp0rjsq', NULL, NULL, 146, NULL, NULL),
(172, 'rifatrizviofficial001@gmail.com', '$2b$10$f/pJxkkjb1GfTkaz8aKyCebobmRiXQaZAd9ZK1E0HOATZA.Oa4ffq', NULL, NULL, 147, NULL, NULL),
(173, 'badhonngc@gmail.com', '$2b$10$YaxXh04ecJy3BaeMxox8t.L5PojrGPHfITzDH0TAEpnAL1Y3PqiZW', NULL, NULL, 149, NULL, NULL),
(175, 'leyakataliliton@gmail.com', '$2b$10$d2bYpJx3FKtZYtOXXjDZBuN25Y4kXmLCxHjBFrt.DlfESrKu49IF.', NULL, NULL, 150, NULL, NULL),
(177, 'pythonicshariful@gmail.com', '$2b$10$gJBNfma/DFQGP4Frxs9ouOnelKewObfHIOJPzztwZZpxOKM99L09a', NULL, NULL, 151, NULL, NULL),
(179, 'mdhabibullahmahmudncs13@gmail.com', '$2b$10$l7dZyTyuqPM.ADblGAreou51.Rsy0AKfY.DAX2ZeGiBIntizKYZ6S', NULL, NULL, 152, NULL, NULL),
(180, 'robiul.cse.jstu@gmail.com', '$2b$10$p5/nswQ8mn3.k.qmq9GpDuXT3SGghd5jJkO4VHDHDsIzShIApo34W', NULL, NULL, 153, NULL, NULL),
(181, 'tanveermofficial@gmail.com', '$2b$10$8nAUu5EApahA9Nws4afRnOXyFbSn6c33JM54xWo7LRyUD.dPJQuje', NULL, NULL, 154, NULL, NULL),
(182, 'irfanmd.im97@gmail.com', '$2b$10$Yxuserbe067KGEjmjlxp4u.EbqUpI4Qkr6yt7krSuCC8G19LbG9XO', NULL, NULL, 155, NULL, NULL),
(184, 'tohidul07890@gmail.com', '$2b$10$VcBNlWACSEidwwqTQrAhVegK.D92I4P02p8qqAMRBaluIIw9rt5hS', NULL, NULL, 156, NULL, NULL),
(185, 'mdtuhinislam4200@gmail.com', '$2b$10$LnoYSk15PL/HxfVnX7kJ3eLlLbN5bO863wJPe0g.r9BvUvzovT2.q', NULL, NULL, 159, NULL, NULL),
(186, 'aieng.abdullah.arif@gmail.com', '$2b$10$QNBJvTpQsqJ6agmdgiQmq.13Jjnx4Ae4fYEhpBJZk/vaCUnh3SKga', NULL, NULL, 160, NULL, NULL),
(187, 'anikasadia2723@gmail.com', '$2b$10$AvFyJg62MMNIvzo8px.1vOse/.R3WU3gxQigvObN1TCMBFMb2RneG', NULL, NULL, 161, NULL, NULL),
(188, 'shahriarjubair27@gmail.com', '$2b$10$EatWedAID9tx90WHhimsMeJB6aU2Cb9dHHAWFy2bVPydcwSjhQ/3e', NULL, NULL, 162, NULL, NULL),
(189, 'taqiismail10@gmail.com', '$2b$10$YJBZSstZVVG80xQLptqzfu7l3TuqaTSRR3KjYNOSetLFcdeYEGylW', NULL, NULL, 163, NULL, NULL),
(190, 'juairiaapsara@gmail.com', '$2b$10$vizvoE3EkzNHwTy8Jmczb.6nprIvU.eo2TaO1MAjRgFKOKED690Km', NULL, NULL, 164, NULL, NULL),
(191, 'akrammiru@gmail.com', '$2b$10$j6YThcUw0nh8jKWRAyC.nOaShNXn88Ho7adgoZGURxXp4pUiCHQDW', NULL, NULL, 165, NULL, NULL),
(192, 'sumaiyaislam3015@gmail.com', '$2b$10$.JG6WqpwV.2w/ehJS8hXWesJwP85Ui/b1mfDRqdDzO4ypGzK49c3y', NULL, NULL, 166, NULL, NULL),
(193, 'mdimranulhaqueniloy@gmail.com', '$2b$10$xTKK7Ok/78pj0MEDhgeMae3li8UBdfOozs4EPX3SyfqOLqHZXBt3m', NULL, NULL, 167, NULL, NULL),
(194, 'mahreenzaman@iut-dhaka.edu', '$2b$10$IbyefvjYt16GtJihN7Q1y.ME1nqVRtDXK7rIMT.QzS1MdmMC8eBs2', NULL, NULL, 168, NULL, NULL),
(195, 'abs@gmail.com', '$2b$10$YdNVncEfyA7LGFl0OndwbOClIcNDvtWvgMR8zleH5n1bT3ihvtBRC', NULL, NULL, 169, NULL, NULL),
(196, 'mukaddimulmunna@gmail.com', '$2b$10$26iZWwRcnaDsGUs1QyyeQOfWc5GEcZDaJnpkWPBCuJQrPDfXU5Lgy', NULL, NULL, 170, NULL, NULL),
(198, 'soumik.hasan.smk@gmail.com', '$2b$10$gOCYv/agP1c5LrYU8JesPenaU25nqUQU/PKJwHhiXAPXUAfYBCo7W', NULL, NULL, 171, NULL, NULL),
(199, 'tasfia.zaman@g.bracu.ac.bd', '$2b$10$q0sC9wx.QioiXkrPKXn.lu9WOh0RcNGBR69wWHr6uN.TsCtRYuGpS', NULL, NULL, 172, NULL, NULL),
(200, 'bappasahacse0@gmail.com', '$2b$10$FdCiFxwpgQMKlQlHkXSKeOB8RSQ5WYhl68t1DQBOWB0JkagWNG3gq', NULL, NULL, 173, NULL, NULL),
(201, 'muhammedalif2004@gmail.com', '$2b$10$9bRSgr6UVsWeTGcoHwi3eOFPHhiipJeYy30UqjRiBHXvU1TNPixQe', NULL, NULL, 174, NULL, NULL),
(203, 'nafis.imtiaz.fuad@g.bracu.ac.bd', '$2b$10$BKqF14V/mAxKREj7Atjv9u2DWrh/o9Z6V4k1Ij0TYvwVv8QWMjA32', NULL, NULL, 175, NULL, NULL),
(204, 'talhatiu567210@gmail.com', '$2b$10$K.hGZjP6I4bW1ZLaKaggReoL4cyoy1pwzhvUOeD6r.E3ka29kcJRS', NULL, NULL, 177, NULL, NULL),
(205, 'bsse1641@iit.du.ac.bd', '$2b$10$nIMiV0r.Zxxy7k58MAzsXOdU70NNQp/Wu0rIZ.uLTX/dzzjyNqCmu', NULL, NULL, 178, NULL, NULL),
(206, 'razibr246@gmail.com', '$2b$10$frzlerKO7wNdKTM7HCKjHu.5bGVxN2ZuQ3aP/OJKM7nyEg3hwEEGS', NULL, NULL, 179, NULL, NULL),
(207, 'tahmidworksinworkstation@gmail.com', '$2b$10$ZT5NKrnxiF9Gd0K8.4fep.lvvoKLW1jyy5vbvt0nvFHiZM2QlTaiG', NULL, NULL, 181, NULL, NULL),
(208, 'arifshahriarrabby123@gmail.com', '$2b$10$BsfU1yeJDxB266Xr.fn.xe6PRujEr9V7zY6r0CIlGyUjjDMvn4Lz.', NULL, NULL, 182, NULL, NULL),
(209, 'farhanaahmad2000@gmail.com', '$2b$10$wk7Appc4LRFi1Zw/iQWzSOsUuMFgCaAMWI8w/Cu7IdvlcqQuAAVW6', NULL, NULL, 183, NULL, NULL),
(210, 'bsse1524@iit.du.ac.bd', '$2b$10$iFSqRBBfO/7xsniFDXPXwun17gv9fzyzQJrHARAF9zxmAKeSdIqZS', NULL, NULL, 184, NULL, NULL),
(211, 'abir045@gmail.com', '$2b$10$GyGzel8BwGj1mFioaCLjcewdxJ6svrXasxouNNKkVNZcWRyXmVEm6', NULL, NULL, 185, NULL, NULL),
(212, 'asirabrar789@gmail.com', '$2b$10$LUB7p4r7gBeYP/ljjLPmIOwdhtWv4XjI0lTmJKcW8EQJbNoGKvKc6', NULL, NULL, 186, NULL, NULL),
(213, 'smnahin1111@gmail.com', '$2b$10$GxUk2f3jVN6oW3S.Qgu10uZ2k6eGCedXt7EwsXqt/8MQmKDTqGxgq', NULL, NULL, 187, NULL, NULL),
(214, 'zihadul.zihad.253@northsouth.edu', '$2b$10$ZBHIV3g/DLL9RatHjHgSWORQOr1uMX.BiWsnpEVTIvmufq9nd7Bv.', NULL, NULL, 188, NULL, NULL),
(215, 'rifatasniah@gmail.com', '$2b$10$hWhYbUk05kgWMHATdLDxUu1VYNL7sLwVPTr98fe.4qDcThTRZQBNK', NULL, NULL, 189, NULL, NULL),
(216, 'nafiz.shahriar.sami@g.bracu.ac.bd', '$2b$10$CHqfAAKtPUM1XIGl7.9ATOvhQ8Ysj10wNNlcuHEc5M9XSX/k08/pm', NULL, NULL, 190, NULL, NULL),
(217, 'farhanibnerofiq@gmail.com', '$2b$10$mKJ.hV3TGlKilcLRmy4I..5f0h4rl5gI4tzuSyxYYSVK/.tk/AnsK', NULL, NULL, 191, NULL, NULL),
(218, 'sumaiya.akhtar@g.bracu.ac.bd', '$2b$10$acIAGhM1Wb2dEWKduexKve6bZBxFK3vL128IScMGAbShda//k8Hna', NULL, NULL, 192, NULL, NULL),
(219, 'tahsin446271@gmail.com', '$2b$10$cW9wp44u0JcrpSJiMUrR2Od/dx/WTJINmqnEWPeP9p8U7SGrkkvoi', NULL, NULL, 193, NULL, NULL),
(220, 'fyazrayat@gmail.com', '$2b$10$amrQCdrVcbtBoBhGsrt5DOo5f77REgAWX9Kifib4Y5L98hCf5h6Q6', NULL, NULL, 194, NULL, NULL),
(221, 'nusratoli2002@gmail.com', '$2b$10$dEaSu/dEHl2Gm4w3kuQTme5phCZ/xENT3g9yyfAToKL1/FbMNBkLW', NULL, NULL, 195, NULL, NULL),
(223, 'rafiuzzaman.bluedot@gmail.com', '$2b$10$BAyCn9wnj0ZC65er35c/nu7RN5vTPFsgpZiMBbB/xF6vkv7v5SyFO', NULL, NULL, 196, NULL, NULL),
(224, 'azim.rahik757@gmail.com', '$2b$10$sLNZFwG1fj9zncl8wxBzRenx45w1C3UEzlUXLEQFsyyzcmxFf7qZa', NULL, NULL, 197, NULL, NULL),
(225, 'joya0001@std.uftb.ac.bd', '$2b$10$JuNRN6tE745Zl/G8RYqUMel0Cwftm3GFdmP2eHEkl86kuvPB4wmGi', NULL, NULL, 198, NULL, NULL),
(226, '2304020@student.ruet.ac.bd', '$2b$10$THW9e0haxxxN/mHYdJKHu.vHspIW1Sj4W7HEn0JrHNwBlooPpekLO', NULL, NULL, 199, NULL, NULL),
(227, 'anshulasikder2004@gmail.com', '$2b$10$KVVxnps3NXZ0GYHOw8qvUuxOBu.AA1IRZFpQU4AdsflqLEOuBFltG', NULL, NULL, 200, NULL, NULL),
(228, 'themathaypoka@gmail.com', '$2b$10$tmy38bEBbeXWHqkVQvnazu9gjJXgBeLeT8NoJhOibRH0rFvcddI7i', NULL, NULL, 201, NULL, NULL),
(229, 'sakibimtiaaz@gmail.com', '$2b$10$J0wWpaq0pouBSjXJWqkmKePN0qpaOrVRNAFveMiiOsaDpg1g3gJCS', NULL, NULL, 202, NULL, NULL),
(230, 'omarfaruqfahim007@gmail.com', '$2b$10$PMh4fcDLTBl.JD8VdYxZIua1ogMnYa.MB1LJ9A1FSYeI7GVDZRBle', NULL, NULL, 203, NULL, NULL),
(231, 'robinglhs5@gmail.com', '$2b$10$HkMXS36qJJmVOmPowTX8p.D9BgHx/hGOXAi7MeTomnL4PogoQH0ZO', NULL, NULL, 204, NULL, NULL),
(232, 'adnansami21@iut-dhaka.edu', '$2b$10$c5CTdDH5E7QJwVmAtiSRSeteGulEcapqtlrnxcmfk2sZfyHwIa026', NULL, NULL, 205, NULL, NULL),
(233, 'parvejshahlabib007@gmail.com', '$2b$10$VrMgFWEBXzavnePmOqHKZOk8EPw4ztU9USxuwF0ZR3DC0wgq7jbgu', NULL, NULL, 207, NULL, NULL),
(234, 'mgrabbani2003@gmail.com', '$2b$10$4eAGj6B066tXX/CTzL.RA.SOW.TS3LyQ2SlgZ1i6uz98VeEK6yNui', NULL, NULL, 208, NULL, NULL),
(237, 'zulkar29@gmail.com', '$2b$10$X9NpSUHCAtxBmdQDq7DFDeo2Ui2mnuR90Q88WVFeYdREvTUciBUI2', NULL, NULL, 209, NULL, NULL),
(238, '223311068.cse.vu@gmail.com', '$2b$10$ZMDv84zoGCmMjIQ9kU.tFexw3s9zNg4AqiTw.rzclWib7blCNqI2W', NULL, NULL, 210, NULL, NULL),
(239, 'tube12youiam@gmail.com', '$2b$10$xz6MjM6AjwTEYur3tQxpAe2HyWF1QFrQzXh5/sAS3kijyPZEEZzKy', NULL, NULL, 211, NULL, NULL),
(240, 'robiroy585@gmail.com', '$2b$10$m3I7Ol3Vi9PpJnlaAjkw/OWPoO2YtSTKEMGvLGqlBcn7b4AbJBODG', NULL, NULL, 212, NULL, NULL),
(241, 'arafat17469@gmail.com', '$2b$10$qygQvIopVC0lDnNFtgA.SOgzfndd5W20V82g/6Nm45KC1w57RvwJW', NULL, NULL, 213, NULL, NULL),
(242, 'nawrizaturjo03@gmail.com', '$2b$10$DsAHJ2BcdzpJRoLfiUixYeirkzOR901X98Ye.FmwSO4mapAk7KZ4O', NULL, NULL, 214, NULL, NULL),
(243, 'fahimabdullah45456@gmail.com', '$2b$10$LRsMsjyiS/wUm.5eNR9h0Ozh3TgGSe6uxqtIISltV708M5Y.fGKqe', NULL, NULL, 215, NULL, NULL),
(244, 'qureshsamir145@gmail.com', '$2b$10$UB3GqLn0ISrSoEAjSn6e.eMxnYBIO7MM9Fmm53TvJkCOYwr/u2.a2', NULL, NULL, 216, NULL, NULL),
(245, 'kingshuk2018@gmail.com', '$2b$10$DBhE.ktZsp2hTQqVWZaeoezTfbsDJEOmeHV7f/A3t7/ndvbfPgvOy', NULL, NULL, 217, NULL, NULL),
(246, 'asiftalukdar21@gmail.com', '$2b$10$M/kLochXfd0rlrT8yxN4ee8w0mk2yzdMfjlHwmgkPPVIMi5hkUMJu', NULL, NULL, 218, NULL, NULL),
(247, 'anikd1452@gmail.com', '$2b$10$fuz/20bARagTiZKNCeMQc.Pm9CLDXhZSCCtJh5D1v3JabqBDMp5JG', NULL, NULL, 219, NULL, NULL),
(248, 'nokibulofficial18@gmail.com', '$2b$10$mshrMf7A0ZwXOgj22xi.QODei8VKwng5CPtw2hG3tfkYrlWnbUHIC', NULL, NULL, 220, NULL, NULL),
(249, '06nurahmed@gmail.com', '$2b$10$iK2jjEm/v6MkJ/pjXxBATOShKzoWSDQL8DwVzJV8LhnRnncWnCiwu', NULL, NULL, 222, NULL, NULL),
(250, 'muhammadbinhafiz24@gmail.com', '$2b$10$gJCMggPDpw/0wY/ZQkmVs.eRTOyvvWBhJLBZfszj6.OHkYnEBlqE.', NULL, NULL, 223, NULL, NULL),
(251, 'farhanrahman1985@gmail.com', '$2b$10$R8OoyvZFJJeJ6DCKG.4xgOANd3hPMzAxfO7UMM2vAVLHMnPHJm6mO', NULL, NULL, 224, NULL, NULL),
(252, 'binabdulaziz4983@gmail.com', '$2b$10$f//aGusbdhdcyZJ3Q1EQp.5PFYBuuoG63rJCz/G5/o429eJxRcX9.', NULL, NULL, 225, NULL, NULL),
(253, 'tajshuvo75@gmail.com', '$2b$10$K6evzlts.vCIScDKYWrKy.57xoDtW0D4rdnuLoW9zxYQksxQgqJpG', NULL, NULL, 226, NULL, NULL),
(254, 'imtiazsakib883@gmail.com', '$2b$10$e72R0K1.pCl2drkoHRxweuhyhy8hkqOrOoEhUIXiv91pvAUF1GSs6', NULL, NULL, 227, NULL, NULL),
(255, 'samirakarimsara135@gmail.com', '$2b$10$ZgHQRGLep04koJYKIc/CteJ4.tfoewyFeadZlrHh2/9j24YLxOrAS', NULL, NULL, 228, NULL, NULL),
(256, 'tanvirislam0203@gmail.com', '$2b$10$1RudX44cevJaOwl9Frk4SeTDoOIA.lsR6qGFUB7OtDGVc3wIJfulq', NULL, NULL, 229, NULL, NULL),
(257, 'hse.shafiqul@gmail.com', '$2b$10$Xk7.AXh7fw58OT0hvkJoGeHi0kJynb4WzEbM0y/vaNlNb/ilpJ8eG', NULL, NULL, 230, NULL, NULL),
(258, 'nayebqureshi4@gmail.com', '$2b$10$Fwl6NFxRTI8lNGAAUE3QrO9u30d72RBVnQdYnjv.d28ZyTAPsdoOy', NULL, NULL, 231, NULL, NULL),
(259, 'rashikraihan8@gmail.com', '$2b$10$.q7hNnocR7m5RksoWyOHv.jwd5Cl9J4nocKCY0W68r4JqZekN5etC', NULL, NULL, 232, NULL, NULL),
(260, 'mominulislamlavlu@gamil.com', '$2b$10$Foc2PikR/oEZUEjybb14de2IVaqtv9esvwDFKNfz1cKuSvWt09s96', NULL, NULL, 233, NULL, NULL),
(261, 'mominulislam.mainpurpose@gmail.com', '$2b$10$Resqzv3UdDNiLQ4xn.U4HeBBe53KlHndUGDKWAimHGYTR8rmUfNqu', NULL, NULL, 234, NULL, NULL),
(262, 'ce22016@mbstu.ac.bd', '$2b$10$g4TJd.q6b.U9/oZTSXbGaugIIS6up2NxDVSNNRAGgaYnGFSPHcpk6', NULL, NULL, 235, NULL, NULL),
(263, '6209tanvir@gmail.com', '$2b$10$XanTpAqlYG/PjmXVf012p.oKwTJqNsq2gG22RYf1rqo6cZzmgECru', NULL, NULL, 236, NULL, NULL),
(264, 'abirbenjamanofficial@gmail.com', '$2b$10$s.hFZ6e98sXz.D5oMpB96.AUYwbgEB282XXSTRPFSfPOyGDyGpj.K', NULL, NULL, 237, NULL, NULL),
(265, 'atix.algo@gmail.com', '$2b$10$AZ4IRbxXbEngmaH0hiJEV.VR/sDbqN76GbotFlPx2eil/zZ.GLCJ2', NULL, NULL, 238, NULL, NULL),
(266, 'mglajim@gmail.com', '$2b$10$FmASJGhhlsmMuOIqqoPyBOA68/gplA8rx6havxPRf5e1U8LRYMzty', NULL, NULL, 243, NULL, NULL),
(268, 'tuhindatta100000@gmail.com', '$2b$10$NH29qJx.Wd7rpk1fXmRx6eUVd./20xWM2MZMAgUIqLgXBn3evfEMe', NULL, NULL, 244, NULL, NULL),
(269, 'bsse1330@iit.du.ac.bd', '$2b$10$SbQY7tyxdsUbUAqPWwgVKOHTZvyY3rZUzw3I/zqIgQ5iB4fXDpMXe', NULL, NULL, 245, NULL, NULL),
(270, 'nabid.hasan773@gmail.com', '$2b$10$t6MjWgutUevQBZ24R8hIoeKhfs3lkVgHSlRzumxJHDTN/DqTR3A9.', NULL, NULL, 246, NULL, NULL),
(271, 'malihafiroz@gmail.com', '$2b$10$fc4TuHXHon4kQ4UC2Uv69eVq2D2ugg.YHbadmM9g.0y2Ow4RBsU5.', NULL, NULL, 247, NULL, NULL),
(274, 'udoy.ire@gmail.com', '$2b$10$bwZkrDsJXaXHY3eS0fDAm..NgYdfaHHGSqFctysuE6g9MiWq6NTm6', NULL, NULL, 248, NULL, NULL),
(275, 'afhamadianbk01@gmail.com', '$2b$10$WfmjCuMszYkyuEAA7DDmhu/.z90CdgA3DOQBqEVc6L7D4gltbtoPq', NULL, NULL, 249, NULL, NULL),
(276, 'shseam01@gmail.com', '$2b$10$fWQjIu4oMTFbUfEebxJsHeH9UbnP7xvxU3PWoYWv8DZA4OoYeyVIK', NULL, NULL, 250, NULL, NULL),
(277, 'chryblosssom@gmail.com', '$2b$10$WWjyzYXj7s7LAMuNjTm8au6.0T5TBvR1195M6qwiq/3zOwdPIvvMK', NULL, NULL, 251, NULL, NULL),
(278, 'abubakar-2022515922@cs.du.ac.bd', '$2b$10$l9XAE8ZRz.DdGfdhXuk2kuP0IwLNONEReXbW1n87vwtp1JAgFAOm2', NULL, NULL, 252, NULL, NULL),
(279, 'mohammodsajjadhossain@gmail.com', '$2b$10$ZgdIMU92Rr.BMZNQmb9HYuCS1lff4BFo1DtGM0z57vOoTy/1IMqQW', NULL, NULL, 253, NULL, NULL),
(280, 'saima0001@std.uftb.ac.bd', '$2b$10$jU5JrJkd/lrltTBYnIHTS.OkDrDHf3mz/QhFGZ2MogflvGekY8hzC', NULL, NULL, 255, NULL, NULL),
(281, 'mrb.taseen.2003@gmail.com', '$2b$10$3tSjtRup/i1SVqNxVbVWMevYKwuAbfLHx1WstaDyvlrbKjwe48SHO', NULL, NULL, 257, NULL, NULL),
(282, 'sarker.bipul@gmail.com', '$2b$10$n.HhQ6pn.jjoR53qY8s72OH2zXpdgQ.AFloh2AwqE7ccTFmOmnRGq', NULL, NULL, 258, NULL, NULL),
(283, 'codewithsifat4@gmail.com', '$2b$10$mzZJpZ21uJ0/h5otvAw0HuGNjYyr1A38hfXxnuO4frONtDiNZDQ56', NULL, NULL, 259, NULL, NULL),
(284, 'jahan27112002@gmail.com', '$2b$10$nlXENKdHHJXnBmeMAe1xfub04KrKImh/65Zh7f2GANjZKAMXtGj32', NULL, NULL, 260, NULL, NULL),
(285, 'rayanalamsiam2000@gmail.com', '$2b$10$OehNhKOr6vz9GBVliCiCsuPNcdXtqkQwYBu5WX/.i63qDMVHxEEzm', NULL, NULL, 261, NULL, NULL),
(287, '08muradhasan@gmail.com', '$2b$10$nvnYLutx3vc4whc50LRTbuh6LJg.oYMZxcTve0Bw/4/qozJ2yiC3O', NULL, NULL, 262, NULL, NULL),
(288, 'anikdasad5@gmail.com', '$2b$10$MKaBEDTCkcbNbf4Oe/tobuNds4JuPOT.VjG7DHEw0X.22YqQtISpu', NULL, NULL, 263, NULL, NULL),
(289, 'imran.cy362@gmail.com', '$2b$10$3g4q1qQmGrN.lLKarWlRhO/3SCk7syVDoQyNKn6.YYkWn.NeaWGey', NULL, NULL, 264, NULL, NULL),
(290, 'suhaib@fakibaz.app', '$2b$10$oI9UzCr0Ibw7QX.rgtTAb.83aHbAr62tzz1Sgs/qJCmman5g/Pr3G', NULL, NULL, 265, NULL, NULL),
(291, 'contact.mohammadsajidhossain@gmail.com', '$2b$10$W4XJ0aYFrXtCKItXuwmEeu5lXLxWT1Aah5epUvtrmxStlGWpOBVvK', NULL, NULL, 268, NULL, NULL),
(293, 'rahmatullahkhanayman@gmail.com', '$2b$10$9dQjbvAzWd1iuAMkQBW5MOv/ED8c6zxpn8Nhqb9PAOCS8Kvpxa.IK', NULL, NULL, 269, NULL, NULL),
(294, 'rhamatullahkhanayman@gmail.com', '$2b$10$hvJ6DwtINIbYNKWCTdF4/O2UGZl7nJJgznvuHE8Y2zv9bFWJqHPZS', NULL, NULL, 270, NULL, NULL),
(296, 'jubayer.at.03@gmail.com', '$2b$10$LOMsGokIDs7FCNkP1p.vGeChq.FGGPtROz0ui6BbCC1SaJ/mK4MwW', NULL, NULL, 272, NULL, NULL),
(297, 'llabib220@gmail.com', '$2b$10$SS62JNnRDcMUm1jTcrdE9uuuUGncWzWLHA7Qp.R9X1aX7yN8/VyfW', NULL, NULL, 273, NULL, NULL),
(298, 'paulpritomuni@gmail.com', '$2b$10$8LD5XQ2OSqjQK2UOAjzEfOW/E0Ct92dq.g/ex0vG92rz2F48Y6Pwa', NULL, NULL, 274, NULL, NULL),
(299, 'yhk.akib12@gmail.com', '$2b$10$YDSPE.3obawfleEmUuRxAu609HQuvjtbGkLqrTxmtoLOSNxlJh7sa', NULL, NULL, 276, NULL, NULL),
(300, 'simpleatmad@gmail.com', '$2b$10$dCJT1lahL3aGoEJ0fKNtMux3kSMQDZmLqCW0kx1BANCgAnsm2drWe', NULL, NULL, 277, NULL, NULL),
(301, 'ovishekh@proton.me', '$2b$10$HSwbvMLCYpgziX713AgFXejw/3k9lLOgH4dafF1JWFMQBEfJpkkbC', NULL, NULL, 278, NULL, NULL),
(302, 'bojackabs@gmail.com', '$2b$10$nUn764pR/cxtkFQTG/uIguGk/ve3ihy6vojC.2K5.4X95rSG5STl.', NULL, NULL, 279, NULL, NULL),
(303, 'fatema@iut-dhaka.edu', '$2b$10$M2T.kUWi/cZUJ5I3ehp5g.8tONADTI5YBG4McbceMh6Yc1KlcXGsi', NULL, NULL, 280, NULL, NULL),
(304, 'dev@basis.org.bd', '$2y$12$kmuF3SanoxyF8yyR6eByEeDvjLcmL1XBlwr6VwxF44kIWcVB89Jxm', NULL, NULL, 848, '2025-12-16 08:05:51', '2025-12-16 08:05:51'),
(305, 'fisohan7@gmail.com', '$2y$12$D9pmJeC/b/nGy99M9VkNiOimcf1xCsWvEVKxZ9sfzw3sKHIwBchm2', NULL, NULL, 849, '2025-12-16 08:31:35', '2025-12-16 08:31:35'),
(306, 'dev1@basis.org.bd', '$2y$12$9f41oa/Sz55XTGFI1Jj8xuwYWb8d/oe7J6.QWScANoWrpCBxPyaWW', NULL, NULL, 850, '2025-12-17 03:58:27', '2025-12-17 03:58:27');

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
('dev@basis.org.bd', '$2y$12$EsBbnPYDNUxyNssMlb0wleI6/W3TJJRpYvcmdZ01z.qaQKPS8iocW', '2025-10-02 21:48:49'),
('mhjarjis@gmail.com', '$2y$12$YDF1kQHug4AKfR59VAzhY.DpLk6rKDXtROxClpHg5U91QfyeGm5Xa', '2025-10-02 22:10:37'),
('mahmudrana.dev@gmail.com', '$2y$12$uwOy66XHS.B8TJk3GFuBS.64zuvP/yfugTYCF/kx5WYTuKF9WfYeu', '2025-12-16 06:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `route`, `parent_id`) VALUES
(1, 'ContentController', NULL, NULL),
(2, 'show', 'content.show', 1),
(3, 'create', 'content.create', 1),
(4, 'file', 'content.file', 1),
(5, 'store', 'content.store', 1),
(6, 'storeFile', 'content.storeFile', 1),
(7, 'destroy', 'content.destroy', 1),
(8, 'ModuleController', NULL, NULL),
(9, 'create', 'module.create', 8),
(10, 'ActivityLogController', NULL, NULL),
(11, 'index', 'activityLog.index', 10),
(12, 'show', 'activityLog.show', 10),
(13, 'allRead', 'activityLog.allRead', 10),
(14, 'destroy', 'activityLog.destroy', 10),
(15, 'RoleController', NULL, NULL),
(16, 'index', 'role.index', 15),
(17, 'create', 'role.create', 15),
(18, 'store', 'role.store', 15),
(19, 'show', 'role.show', 15),
(20, 'edit', 'role.edit', 15),
(21, 'update', 'role.update', 15),
(22, 'destroy', 'role.destroy', 15),
(23, 'MenuController', NULL, NULL),
(24, 'index', 'menu.index', 23),
(25, 'create', 'menu.create', 23),
(26, 'store', 'menu.store', 23),
(27, 'show', 'menu.show', 23),
(28, 'edit', 'menu.edit', 23),
(29, 'update', 'menu.update', 23),
(30, 'destroy', 'menu.destroy', 23),
(31, 'SiteSettingController', NULL, NULL),
(32, 'index', 'siteSetting.index', 31),
(33, 'create', 'siteSetting.create', 31),
(34, 'store', 'siteSetting.store', 31),
(35, 'show', 'siteSetting.show', 31),
(36, 'edit', 'siteSetting.edit', 31),
(37, 'update', 'siteSetting.update', 31),
(38, 'destroy', 'siteSetting.destroy', 31),
(39, 'AdminController', NULL, NULL),
(40, 'index', 'admin.index', 39),
(41, 'create', 'admin.create', 39),
(42, 'store', 'admin.store', 39),
(43, 'show', 'admin.show', 39),
(44, 'edit', 'admin.edit', 39),
(45, 'update', 'admin.update', 39),
(46, 'destroy', 'admin.destroy', 39),
(47, 'AlbumController', NULL, NULL),
(48, 'index', 'album.index', 47),
(49, 'create', 'album.create', 47),
(50, 'store', 'album.store', 47),
(51, 'show', 'album.show', 47),
(52, 'edit', 'album.edit', 47),
(53, 'update', 'album.update', 47),
(54, 'destroy', 'album.destroy', 47),
(55, 'PhotoController', NULL, NULL),
(56, 'index', 'photo.index', 55),
(57, 'create', 'photo.create', 55),
(58, 'store', 'photo.store', 55),
(59, 'show', 'photo.show', 55),
(60, 'edit', 'photo.edit', 55),
(61, 'update', 'photo.update', 55),
(62, 'destroy', 'photo.destroy', 55),
(63, 'VideoController', NULL, NULL),
(64, 'index', 'video.index', 63),
(65, 'create', 'video.create', 63),
(66, 'store', 'video.store', 63),
(67, 'show', 'video.show', 63),
(68, 'edit', 'video.edit', 63),
(69, 'update', 'video.update', 63),
(70, 'destroy', 'video.destroy', 63),
(71, 'SliderController', NULL, NULL),
(72, 'index', 'slider.index', 71),
(73, 'create', 'slider.create', 71),
(74, 'store', 'slider.store', 71),
(75, 'show', 'slider.show', 71),
(76, 'edit', 'slider.edit', 71),
(77, 'update', 'slider.update', 71),
(78, 'destroy', 'slider.destroy', 71),
(79, 'FrontMenuController', NULL, NULL),
(80, 'index', 'frontMenu.index', 79),
(81, 'create', 'frontMenu.create', 79),
(82, 'store', 'frontMenu.store', 79),
(83, 'show', 'frontMenu.show', 79),
(84, 'edit', 'frontMenu.edit', 79),
(85, 'update', 'frontMenu.update', 79),
(86, 'destroy', 'frontMenu.destroy', 79),
(87, 'NewsController', NULL, NULL),
(88, 'index', 'news.index', 87),
(89, 'create', 'news.create', 87),
(90, 'store', 'news.store', 87),
(91, 'show', 'news.show', 87),
(92, 'edit', 'news.edit', 87),
(93, 'update', 'news.update', 87),
(94, 'destroy', 'news.destroy', 87),
(95, 'AchievementController', NULL, NULL),
(96, 'index', 'achievement.index', 95),
(97, 'create', 'achievement.create', 95),
(98, 'store', 'achievement.store', 95),
(99, 'show', 'achievement.show', 95),
(100, 'edit', 'achievement.edit', 95),
(101, 'update', 'achievement.update', 95),
(102, 'destroy', 'achievement.destroy', 95),
(103, 'OrganizerController', NULL, NULL),
(104, 'index', 'organizer.index', 103),
(105, 'create', 'organizer.create', 103),
(106, 'store', 'organizer.store', 103),
(107, 'show', 'organizer.show', 103),
(108, 'edit', 'organizer.edit', 103),
(109, 'update', 'organizer.update', 103),
(110, 'destroy', 'organizer.destroy', 103),
(111, 'PressCoverageController', NULL, NULL),
(112, 'index', 'pressCoverage.index', 111),
(113, 'create', 'pressCoverage.create', 111),
(114, 'store', 'pressCoverage.store', 111),
(115, 'show', 'pressCoverage.show', 111),
(116, 'edit', 'pressCoverage.edit', 111),
(117, 'update', 'pressCoverage.update', 111),
(118, 'destroy', 'pressCoverage.destroy', 111),
(119, 'FaqController', NULL, NULL),
(120, 'index', 'faq.index', 119),
(121, 'create', 'faq.create', 119),
(122, 'store', 'faq.store', 119),
(123, 'show', 'faq.show', 119),
(124, 'edit', 'faq.edit', 119),
(125, 'update', 'faq.update', 119),
(126, 'destroy', 'faq.destroy', 119),
(127, 'PartnerController', NULL, NULL),
(128, 'index', 'partner.index', 127),
(129, 'create', 'partner.create', 127),
(130, 'store', 'partner.store', 127),
(131, 'show', 'partner.show', 127),
(132, 'edit', 'partner.edit', 127),
(133, 'update', 'partner.update', 127),
(134, 'destroy', 'partner.destroy', 127),
(135, 'RegistrationInfoController', NULL, NULL),
(136, 'index', 'registrationInfo.index', 135),
(137, 'create', 'registrationInfo.create', 135),
(138, 'store', 'registrationInfo.store', 135),
(139, 'show', 'registrationInfo.show', 135),
(140, 'edit', 'registrationInfo.edit', 135),
(141, 'update', 'registrationInfo.update', 135),
(142, 'destroy', 'registrationInfo.destroy', 135),
(143, 'ResourceDocumentController', NULL, NULL),
(144, 'index', 'resourceDocument.index', 143),
(145, 'create', 'resourceDocument.create', 143),
(146, 'store', 'resourceDocument.store', 143),
(147, 'show', 'resourceDocument.show', 143),
(148, 'edit', 'resourceDocument.edit', 143),
(149, 'update', 'resourceDocument.update', 143),
(150, 'destroy', 'resourceDocument.destroy', 143),
(151, 'LocalWinnerController', NULL, NULL),
(152, 'index', 'localWinner.index', 151),
(153, 'create', 'localWinner.create', 151),
(154, 'store', 'localWinner.store', 151),
(155, 'show', 'localWinner.show', 151),
(156, 'edit', 'localWinner.edit', 151),
(157, 'update', 'localWinner.update', 151),
(158, 'destroy', 'localWinner.destroy', 151),
(159, 'FinalistNomineeController', NULL, NULL),
(160, 'index', 'finalistNominee.index', 159),
(161, 'create', 'finalistNominee.create', 159),
(162, 'store', 'finalistNominee.store', 159),
(163, 'show', 'finalistNominee.show', 159),
(164, 'edit', 'finalistNominee.edit', 159),
(165, 'update', 'finalistNominee.update', 159),
(166, 'destroy', 'finalistNominee.destroy', 159),
(167, 'ProgramScheduleController', NULL, NULL),
(168, 'index', 'programSchedule.index', 167),
(169, 'create', 'programSchedule.create', 167),
(170, 'store', 'programSchedule.store', 167),
(171, 'show', 'programSchedule.show', 167),
(172, 'edit', 'programSchedule.edit', 167),
(173, 'update', 'programSchedule.update', 167),
(174, 'destroy', 'programSchedule.destroy', 167),
(175, 'AppChallengeInfoController', NULL, NULL),
(176, 'index', 'appChallengeInfo.index', 175),
(177, 'create', 'appChallengeInfo.create', 175),
(178, 'store', 'appChallengeInfo.store', 175),
(179, 'show', 'appChallengeInfo.show', 175),
(180, 'edit', 'appChallengeInfo.edit', 175),
(181, 'update', 'appChallengeInfo.update', 175),
(182, 'destroy', 'appChallengeInfo.destroy', 175),
(183, 'AppChallengeCategoryController', NULL, NULL),
(184, 'index', 'appChallengeCategory.index', 183),
(185, 'create', 'appChallengeCategory.create', 183),
(186, 'store', 'appChallengeCategory.store', 183),
(187, 'show', 'appChallengeCategory.show', 183),
(188, 'edit', 'appChallengeCategory.edit', 183),
(189, 'update', 'appChallengeCategory.update', 183),
(190, 'destroy', 'appChallengeCategory.destroy', 183),
(191, 'RegistrationController', NULL, NULL),
(192, 'index', 'registration.index', 191),
(193, 'show', 'registration.show', 191),
(194, 'editContent', 'content.editContent', 1),
(195, 'ZoneController', NULL, NULL),
(196, 'index', 'zone.index', 195),
(197, 'create', 'zone.create', 195),
(198, 'store', 'zone.store', 195),
(199, 'show', 'zone.show', 195),
(200, 'edit', 'zone.edit', 195),
(201, 'update', 'zone.update', 195),
(202, 'destroy', 'zone.destroy', 195),
(203, 'ContactController', NULL, NULL),
(204, 'index', 'contact.index', 203),
(205, 'show', 'contact.show', 203),
(206, 'NewsLetterController', NULL, NULL),
(207, 'index', 'newsletter.index', 206),
(208, 'show', 'newsletter.show', 206),
(209, 'create', 'registration.create', 191),
(210, 'store', 'registration.store', 191),
(211, 'edit', 'registration.edit', 191),
(212, 'update', 'registration.update', 191),
(213, 'destroy', 'registration.destroy', 191);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint UNSIGNED NOT NULL,
  `album_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `is_featured` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `album_id`, `title`, `images`, `sorting`, `is_featured`, `created_at`, `updated_at`) VALUES
(41, 17, 'NASA Space Apps Challenge 2018', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2018\\/resize_800X800\\/220830102430-3844.jpeg\"}', 2, 'yes', NULL, NULL),
(44, 18, 'NASA Space Apps Challenge 2019', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2019\\/resize_800X800\\/220830103018-3094.jpeg\"}', 3, 'yes', NULL, NULL),
(45, 18, 'NASA Space Apps Challenge 2019', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2019\\/resize_800X800\\/220830103036-5439.jpeg\"}', 4, 'yes', NULL, NULL),
(46, 19, 'NASA Space Apps Challenge 2020', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2020\\/resize_800X800\\/220830103149-5979.jpeg\"}', 5, 'yes', NULL, NULL),
(47, 19, 'NASA Space Apps Challenge 2020', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2020\\/resize_800X800\\/220830103202-1969.jpeg\"}', 6, 'yes', NULL, NULL),
(48, 19, 'NASA Space Apps Challenge 2020', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2020\\/resize_800X800\\/220830103227-7620.jpeg\"}', 7, 'yes', NULL, NULL),
(49, 19, 'NASA Space Apps Challenge 2020', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2020\\/resize_800X800\\/220830103237-7963.jpeg\"}', 8, 'yes', NULL, NULL),
(50, 17, 'NASA Space Apps Challenge 2018', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2018\\/resize_800X800\\/220903072910-8787.jpeg\"}', 9, 'no', NULL, NULL),
(51, 17, 'NASA Space Apps Challenge 2018', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2018\\/resize_800X800\\/220903073027-5376.jpeg\"}', 10, 'yes', NULL, NULL),
(52, 17, 'NASA Space Apps Challenge 2018', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2018\\/resize_800X800\\/220903073040-8989.jpeg\"}', 11, 'yes', NULL, NULL),
(53, 17, 'NASA Space Apps Challenge 2018', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2018\\/resize_800X800\\/220903073056-9689.jpeg\"}', 12, 'yes', NULL, NULL),
(54, 18, 'NASA Space Apps Challenge 2019', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2019\\/resize_800X800\\/220903073232-8169.jpeg\"}', 13, 'yes', NULL, NULL),
(55, 18, 'NASA Space Apps Challenge 2019', '{\"resize0\":\"upload\\/photos\\/NASA Space Apps Challenge 2019\\/resize_800X800\\/220903073249-8391.jpeg\"}', 14, 'yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_room`
--

CREATE TABLE `project_room` (
  `id` bigint UNSIGNED NOT NULL,
  `registrations_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_room`
--

INSERT INTO `project_room` (`id`, `registrations_id`, `room_id`, `created_at`, `updated_at`) VALUES
(4, 848, 2, '2025-12-16 09:27:59', '2025-12-16 09:27:59'),
(5, 1, 2, '2025-12-17 04:54:29', '2025-12-17 04:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sub_category_id` bigint UNSIGNED DEFAULT NULL,
  `zone_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_challenge_id` int NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videolink` text COLLATE utf8mb4_unicode_ci,
  `file_link` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `project_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitDate` timestamp NULL DEFAULT NULL,
  `termsAccepted` tinyint DEFAULT NULL,
  `final_score` decimal(5,2) DEFAULT NULL,
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university_id` bigint UNSIGNED DEFAULT NULL,
  `team_member` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('SHORTLIST','LOCAL','GLOBAL','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_position` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_global` tinyint NOT NULL DEFAULT '0',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_type` enum('VIRTUAL','PHYSICAL') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `slug`, `category_id`, `sub_category_id`, `zone_id`, `registration_no`, `session`, `reg_id`, `app_challenge_id`, `project_name`, `videolink`, `file_link`, `description`, `project_link`, `submitDate`, `termsAccepted`, `final_score`, `team_name`, `team_type`, `university_id`, `team_member`, `team_leader_name`, `team_leader_mobile`, `team_leader_email`, `level`, `position`, `global_position`, `is_global`, `image`, `approve_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'team-z', 3, 19, 'DHK', 'MillionX-2025-0001', '2025', '0001', 1, 'test project 3', NULL, NULL, 'dccdcdcdddc', NULL, NULL, NULL, 7.53, 'team z', 'individual', 9, '1', 'ikkty rahman', '+8801910910616', '2120016@iub.edu.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-11-30 14:21:22', '2025-12-17 04:57:10'),
(2, NULL, 1, NULL, 'DHK', 'MillionX-2025-0002', '2025', '0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BD25', 'individual', 13, '1', 'Md. Habibul Bashar', '+8801568832750', 'habibulbashar412@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 06:10:51', '2025-12-17 04:57:10'),
(3, NULL, 4, NULL, 'BAR', 'MillionX-2025-0003', '2025', '0003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rising Talent ', 'individual', 19, '1', 'Md Arif  bILLAH', '+88017794402397', 'emran.alarif8@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 06:12:56', '2025-12-17 04:57:10'),
(4, NULL, 3, NULL, 'CHT', 'MillionX-2025-0004', '2025', '0004', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'slytherin', 'individual', 31, '1', 'Ashabul Yamin Tuhin', '+8801860915225', 'ashabulyamintuhin@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 06:33:14', '2025-12-17 04:57:10'),
(5, NULL, 1, NULL, 'DHK', 'MillionX-2025-0005', '2025', '0005', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Binary ', 'team', 31, '2', 'Mohammad Nafis Fuad', '+8801967517101', 'nafisfuad2024@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 07:00:09', '2025-12-17 04:57:10'),
(6, NULL, 3, NULL, 'BAR', 'MillionX-2025-0006', '2025', '0006', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CF_TechLab', 'team', 27, '5', 'Hridoy Chandra  Sarker', '+8801642948324', 'ug2102019@cse.pstu.ac.bd', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-6/403d9863-f107-46f0-90fb-b24ccec49c08?_a=BAMAABQA0', NULL, 'active', '2025-12-02 07:26:48', '2025-12-17 04:57:10'),
(7, NULL, 1, NULL, 'DHK', 'MillionX-2025-0007', '2025', '0007', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Singularity', 'individual', 11, '1', 'Hasibul Hasan  Rahim', '+8801577025652', 'hasibul.hasan.rahimm@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 07:32:39', '2025-12-17 04:57:10'),
(8, NULL, 1, NULL, 'DHK', 'MillionX-2025-0008', '2025', '0008', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dragonfistcricket01 ', 'individual', 31, '1', 'Abdullah  Ibrahim ', '+8801306440428', 'abdullahibrahimmahi001@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 07:45:37', '2025-12-17 04:57:10'),
(9, NULL, 2, NULL, 'DHK', 'MillionX-2025-0009', '2025', '0009', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Atlas', 'team', 16, '3', 'Jannatul Ferdous', '+8801713933941', 'codeblacklive@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 08:14:22', '2025-12-17 04:57:10'),
(10, NULL, 1, NULL, 'RAN', 'MillionX-2025-0010', '2025', '0010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ai_titans', 'individual', 11, '1', 'MD Wahid', '+8801879439753', 'wahid55100@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 08:14:37', '2025-12-17 04:57:10'),
(11, NULL, 3, NULL, 'DHK', 'MillionX-2025-0011', '2025', '0011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Duoguard', 'team', 11, '2', 'MD Sajid  Hossain ', '+8801602387483', '252-16-046@diu.edu.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 08:22:44', '2025-12-17 04:57:10'),
(12, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0012', '2025', '0012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team_High_Voltage', 'individual', 31, '1', 'MD. AKTARUZZAMAN', '+8801307431405', 'sagorhs329@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 08:32:04', '2025-12-17 04:57:10'),
(13, NULL, 1, NULL, 'KHU', 'MillionX-2025-0013', '2025', '0013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Batman', 'individual', 26, '1', 'Anisur Rahman', '+8801616414541', 'anisurerahaman06@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 09:59:50', '2025-12-17 04:57:10'),
(14, NULL, 1, NULL, 'MYM', 'MillionX-2025-0014', '2025', '0014', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TEAM_NEWBIES', 'team', 31, '2', 'samin yasar sunny Yasar ', '+8801865239302', 'sunnysaminyasar@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 10:45:43', '2025-12-17 04:57:10'),
(15, NULL, 4, NULL, 'DHK', 'MillionX-2025-0015', '2025', '0015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AsuX builders', 'team', 31, '6', 'Abdul Owadud Islam   Raton', '+8801318175391', 'imranraton599@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 10:53:39', '2025-12-17 04:57:10'),
(16, NULL, 1, NULL, 'MYM', 'MillionX-2025-0016', '2025', '0016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TEAM_NEWBIES', 'team', 31, '4', 'Samin Yasar', '+8801865239302', 'saminyasarsunny@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-16/84169d1a-3669-498a-9d29-941bae162eb6?_a=BAMAABQA0', NULL, 'active', '2025-12-02 10:55:38', '2025-12-17 04:57:10'),
(17, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0017', '2025', '0017', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Brainware', 'team', 31, '2', 'Md. Musfique Anam Ananto', '+8801403068708', 'musfique.contact@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 11:02:38', '2025-12-17 04:57:10'),
(18, NULL, 3, NULL, 'DHK', 'MillionX-2025-0018', '2025', '0018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MetaFlux Innovators', 'team', 31, '5', 'Turjo  Saha', '+8801610751504', 'turjojps@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 11:16:19', '2025-12-17 04:57:10'),
(19, NULL, 1, NULL, 'SYL', 'MillionX-2025-0019', '2025', '0019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fakibazz', 'team', 3, '5', 'Nahid Hasan', '+8801755373931', 'nahid1719abd@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 11:22:11', '2025-12-17 04:57:10'),
(20, NULL, 3, NULL, 'DHK', 'MillionX-2025-0020', '2025', '0020', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Mad titan', 'team', 11, '3', 'MD.Nadim Rahman', '+8801306761213', 'nadim153rahman@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 20:19:28', '2025-12-17 04:57:10'),
(21, NULL, 3, NULL, 'DHK', 'MillionX-2025-0021', '2025', '0021', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Irishi', 'team', 3, '2', 'Zubair Ahmed Rafi', '+8801759139913', 'rafify139913@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-02 23:22:48', '2025-12-17 04:57:10'),
(22, NULL, 3, NULL, 'CHT', 'MillionX-2025-0022', '2025', '0022', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AI Avengers ', 'team', 7, '6', 'Anindya Majumder', '+8801646821386', '357anindya@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 01:47:17', '2025-12-17 04:57:10'),
(23, NULL, 3, NULL, 'BAR', 'MillionX-2025-0023', '2025', '0023', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team_Cybetron', 'individual', 27, '1', 'Jubayer  Ahmed ', '+8801785720927', 'jubayer17@cse.pstu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 02:53:25', '2025-12-17 04:57:10'),
(24, NULL, 1, NULL, 'DHK', 'MillionX-2025-0024', '2025', '0024', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Jibon Kumar ', 'individual', 31, '1', 'Jibon  Kumar', '+8801316104533', 'jibonkumarcse@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 04:25:02', '2025-12-17 04:57:10'),
(25, NULL, 3, NULL, 'CHT', 'MillionX-2025-0025', '2025', '0025', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Depolarized Souls', 'team', 7, '3', 'Shahriar Saikat', '+8801640703128', 'shahriarsaikat24@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 07:59:46', '2025-12-17 04:57:10'),
(26, NULL, 2, NULL, 'BAR', 'MillionX-2025-0026', '2025', '0026', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Polaris ', 'team', 31, '6', 'Md. Mehedi Hasan', '+8801403005254', 'meetmehedi1@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 08:43:37', '2025-12-17 04:57:10'),
(27, NULL, 4, NULL, 'DHK', 'MillionX-2025-0027', '2025', '0027', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nazmul hasan', 'individual', 31, '1', 'Nazmul Hasan', '+8801842754421', 'n47712338@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-03 10:57:22', '2025-12-17 04:57:10'),
(28, NULL, 1, NULL, 'DHK', 'MillionX-2025-0028', '2025', '0028', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Singularity', 'team', 11, '3', 'Hasibul Hasan Rahim', '+8801577025652', 'mr.rahim.5231@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-28/7100b691-aace-4950-9795-173022c14007?_a=BAMAABQA0', NULL, 'active', '2025-12-03 21:38:50', '2025-12-17 04:57:10'),
(29, NULL, 4, NULL, 'DHK', 'MillionX-2025-0029', '2025', '0029', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tipu Kumar Gupta ', 'individual', 22, '1', 'Tipu Kumar Gupta', '+8801791777027', 'tipuagarwal68@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-04 00:53:41', '2025-12-17 04:57:10'),
(30, NULL, 5, NULL, 'DHK', 'MillionX-2025-0030', '2025', '0030', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CashWave', 'individual', 24, '1', 'Gulsaba Fiha', '+8801980659577', 'sabafiha111@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-04 02:14:41', '2025-12-17 04:57:10'),
(31, NULL, 2, NULL, NULL, 'MillionX-2025-0031', '2025', '0031', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Moricha', 'team', 2, '2', 'Afia Adiba  Hafsa', '+8801868467782', 'afiaadibahafsa@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-31/b0ff4fea-77f6-4ac2-95a1-ac7da5199b9b?_a=BAMAABQA0', NULL, 'active', '2025-12-04 05:08:57', '2025-12-17 04:57:10'),
(32, NULL, 3, NULL, 'DHK', 'MillionX-2025-0032', '2025', '0032', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Neuron ', 'team', 21, '2', 'SAFIUL ALAM', '+8801734712357', 'mrsalamsiam94@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-04 05:21:10', '2025-12-17 04:57:10'),
(33, NULL, 4, NULL, 'RAN', 'MillionX-2025-0033', '2025', '0033', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xc', 'team', 31, '2', 'asdcas scasc', '+880', 'cascascac@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-04 09:21:48', '2025-12-17 04:57:10'),
(34, NULL, 2, NULL, 'KHU', 'MillionX-2025-0034', '2025', '0034', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIKitty', 'individual', 31, '1', 'Rafiull Bari', '+8801875733571', 'barirafiull@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-04 23:43:41', '2025-12-17 04:57:10'),
(35, NULL, 3, NULL, 'DHK', 'MillionX-2025-0035', '2025', '0035', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team 404', 'team', 1, '3', 'Md Tanvir Rahman', '+8801786614353', 'tanvir.rahman.contact@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 07:00:21', '2025-12-17 04:57:10'),
(36, NULL, 3, NULL, 'DHK', 'MillionX-2025-0036', '2025', '0036', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Light Seekers', 'team', 14, '6', 'Md Sadique Hossain', '+8801787978661', 'sadique21.hossain@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 10:57:31', '2025-12-17 04:57:10'),
(37, NULL, 3, NULL, 'DHK', 'MillionX-2025-0037', '2025', '0037', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IUB_GitGud', 'team', 9, '2', 'Afzal Alif', '+8801773666439', 'afzalhossainalif@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 11:33:54', '2025-12-17 04:57:10'),
(38, NULL, 1, NULL, 'DHK', 'MillionX-2025-0038', '2025', '0038', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quintessence Minus Infinity ', 'team', 31, '4', 'Sabbir  Ahmed ', '+8801521782413', 'sabbirahmed12546@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 11:49:33', '2025-12-17 04:57:10'),
(39, NULL, 3, NULL, 'CHT', 'MillionX-2025-0039', '2025', '0039', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ARM', 'team', 31, '3', 'Asif Zaman', '+8801670415337', 'zasif855@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 13:41:01', '2025-12-17 04:57:10'),
(40, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0040', '2025', '0040', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ন্যানোগ্রো', 'team', 31, '3', 'Md Rakibul Haque  Sardar', '+8801571205499', 'rakibullhaques@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-05 15:04:26', '2025-12-17 04:57:10'),
(41, NULL, 5, NULL, 'DHK', 'MillionX-2025-0041', '2025', '0041', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Codebreakers', 'individual', 1, '1', 'Nayeemul Islam', '+8801760335921', 'inayeemul909@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 01:09:00', '2025-12-17 04:57:10'),
(42, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0042', '2025', '0042', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aura', 'individual', 31, '1', 'Mst.Fahmida Akter', '+8801742116778', 'fahmida30dec2@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 04:08:58', '2025-12-17 04:57:10'),
(43, NULL, 1, NULL, 'CHT', 'MillionX-2025-0043', '2025', '0043', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Dim', 'individual', 31, '1', 'Md. Tanjil Sarwar Lazim', '+8801856862260', 'tanjilsarwar30@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 04:44:07', '2025-12-17 04:57:10'),
(44, NULL, 4, NULL, 'DHK', 'MillionX-2025-0044', '2025', '0044', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LLM Ninja', 'individual', 32, '1', 'Abdullah  Al Mamun', '+8801971038644', 'abdullah.azonedev@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 05:21:50', '2025-12-17 04:57:10'),
(45, NULL, 3, NULL, 'DHK', 'MillionX-2025-0045', '2025', '0045', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Appibrium', 'individual', 11, '1', 'Ratul Hasan Ruhan', '+8801789536985', 'ratulhasan1644@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 05:22:57', '2025-12-17 04:57:10'),
(47, NULL, 1, NULL, 'MYM', 'MillionX-2025-0047', '2025', '0047', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NASIF HOQUE ABIR', 'individual', 31, '1', 'NASIF HOQUE ABIR NASIF HOQUE ABIR', '+8801310260531', 'nhabir1904@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 05:26:20', '2025-12-17 04:57:10'),
(52, NULL, 4, NULL, 'DHK', 'MillionX-2025-0052', '2025', '0052', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LoneWolf', 'individual', 11, '1', 'Shahriar Ahmed Shovon', '+8801780974765', 'shovonshahriar01@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 05:35:15', '2025-12-17 04:57:10'),
(53, NULL, 2, NULL, 'DHK', 'MillionX-2025-0053', '2025', '0053', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quintessence Minus Infinity', 'team', 31, '2', 'Sanjid Talukder', '+8801889876289', 'sanjidtalukder02@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 05:50:18', '2025-12-17 04:57:10'),
(54, NULL, 3, NULL, NULL, 'MillionX-2025-0054', '2025', '0054', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Giga Thinkers', 'individual', 5, '1', 'Najiba Wajiha Mahboob', '+8801610888535', 'najiba005@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 07:09:09', '2025-12-17 04:57:10'),
(55, NULL, 3, NULL, NULL, 'MillionX-2025-0055', '2025', '0055', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ai Assemble ', 'individual', 1, '1', 'Rupam Debnath', '+8801307521491', 'ropamdebnath6@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 08:57:54', '2025-12-17 04:57:10'),
(56, NULL, 4, NULL, 'DHK', 'MillionX-2025-0056', '2025', '0056', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bb', 'team', 7, '2', 'adfa fd', '+8801647593123', 'irfanshazd814@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 09:33:29', '2025-12-17 04:57:10'),
(58, NULL, 1, NULL, 'SYL', 'MillionX-2025-0058', '2025', '0058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Xploreto ', 'individual', 3, '1', 'Khandokar  Rifat Muhtasim', '+8801814297793', 'k.rifat.muhtasim@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 10:47:22', '2025-12-17 04:57:10'),
(59, NULL, 1, NULL, 'DHK', 'MillionX-2025-0059', '2025', '0059', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AlphaMatrix', 'team', 13, '5', 'MD. Rahmatullah ASHIK', '+8801996482707', 'nilantoashik@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 11:02:58', '2025-12-17 04:57:10'),
(60, NULL, 1, NULL, 'BAR', 'MillionX-2025-0060', '2025', '0060', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SoftVance', 'individual', 31, '1', 'Md Shahriar Nabil', '+8801319439789', 'hellonabil30@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 12:15:19', '2025-12-17 04:57:10'),
(61, NULL, 5, NULL, 'SYL', 'MillionX-2025-0061', '2025', '0061', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Md Golam Mubasshir Rafi ', 'individual', 31, '1', 'Md Golam Mubasshir  Rafi', '+8801300560126', 'gmrafi365@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 12:15:30', '2025-12-17 04:57:10'),
(63, NULL, 3, NULL, 'DHK', 'MillionX-2025-0063', '2025', '0063', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Marjana Sultana Aurthee ', 'individual', 31, '1', 'Marjana Sultana  Aurthee ', '+8801857340157', 'msa050861@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 12:28:32', '2025-12-17 04:57:10'),
(64, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0064', '2025', '0064', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Coconut Crew', 'team', 10, '2', 'Mahir Daiyan Safwaan', '+8801880830398', 'msafwaan30@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 12:40:20', '2025-12-17 04:57:10'),
(65, NULL, 1, NULL, 'SYL', 'MillionX-2025-0065', '2025', '0065', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Xploreto ', 'individual', 3, '1', 'Khandokar  Rifat Muhtasim ', '+8801814297793', 'md.rifat.muhtasim@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 13:39:02', '2025-12-17 04:57:10'),
(66, NULL, 2, NULL, NULL, 'MillionX-2025-0066', '2025', '0066', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fine Fly', 'individual', 13, '1', 'MD MOHIMINOL  ISLAM', '+8801674903939', 'mislam9095@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 19:19:56', '2025-12-17 04:57:10'),
(67, NULL, 3, NULL, 'DHK', 'MillionX-2025-0067', '2025', '0067', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Classifiers ', 'team', 14, '2', 'Md Rifat Ahasan  Pulock', '+8801568544903', 'rifatahsan39@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 22:09:50', '2025-12-17 04:57:10'),
(68, NULL, 1, NULL, 'DHK', 'MillionX-2025-0068', '2025', '0068', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XtraDrill', 'team', 2, '3', 'Taki Tajwaruzzaman Khan', '+8801716126988', 'tajwaruzzaman@iut-dhaka.edu', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-61/e5e454ae-0b85-4e7a-ba14-36de4dc09aa4?_a=BAMAABQA0', NULL, 'active', '2025-12-06 22:15:08', '2025-12-17 04:57:10'),
(69, NULL, 1, NULL, 'KHU', 'MillionX-2025-0069', '2025', '0069', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dragon Flame', 'team', 20, '4', 'Zisan Ul Haque', '+8801787015981', 'mdzisanulhaque989@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-06 22:42:24', '2025-12-17 04:57:10'),
(72, NULL, 3, NULL, NULL, 'MillionX-2025-0072', '2025', '0072', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aura', 'team', 31, '4', 'Ayesha Akter Rimi', '+8801748616881', 'ayesharimi296@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 03:00:11', '2025-12-17 04:57:10'),
(73, NULL, 4, NULL, 'DHK', 'MillionX-2025-0073', '2025', '0073', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Spam Guard', 'individual', 24, '1', 'Zahid Hasan', '+8801717240715', 'zahid.hasan6@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 04:03:43', '2025-12-17 04:57:10'),
(74, NULL, 5, NULL, 'DHK', 'MillionX-2025-0074', '2025', '0074', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'adad', 'individual', 30, '1', 'adas asdad', '+8801577266343', 'armanhossainshuvo25@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 07:31:46', '2025-12-17 04:57:10'),
(75, NULL, 1, NULL, 'DHK', 'MillionX-2025-0075', '2025', '0075', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IronShell Protocol', 'team', 12, '2', 'Arman Shuvo', '+8801577266342', 'lazyhacker0977@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 07:38:59', '2025-12-17 04:57:10'),
(76, NULL, 5, NULL, 'DHK', 'MillionX-2025-0076', '2025', '0076', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Auauauthon', 'team', 12, '5', 'Niloy Faiaz', '+8801757300284', 'niloystudent870@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-68/94e6e58d-7cc0-4c5c-a601-d186f306b75b?_a=BAMAABQA0', NULL, 'active', '2025-12-07 08:34:27', '2025-12-17 04:57:10'),
(77, NULL, 1, NULL, 'MYM', 'MillionX-2025-0077', '2025', '0077', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Md. Tanvir Ahmed', 'individual', 31, '1', 'Md. Tanvir Ahmed', '+8801750346022', 'rafi122283pro@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:20:05', '2025-12-17 04:57:10'),
(79, NULL, 3, NULL, 'CUM', 'MillionX-2025-0079', '2025', '0079', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fixora.ai', 'individual', 8, '1', 'Jarin Tasnuva Radi', '+8801558800801', 'jarintasnuva88di@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:30:54', '2025-12-17 04:57:10'),
(80, NULL, 3, NULL, 'RAJ', 'MillionX-2025-0080', '2025', '0080', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Salim Ahmad ', 'individual', 31, '1', 'Salim  Ahmad ', '+8801917536750', 'salimbd.tsu@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:33:36', '2025-12-17 04:57:10'),
(81, NULL, 3, NULL, 'KHU', 'MillionX-2025-0081', '2025', '0081', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1250 VA', 'individual', 32, '1', 'Kazi Mahir Adeeb', '+8801860695891', 'thundermahir08@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:33:50', '2025-12-17 04:57:10'),
(82, NULL, 5, NULL, 'DHK', 'MillionX-2025-0082', '2025', '0082', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Clowns', 'team', 16, '5', 'Navil Chowdhury', '+88019990364458', 'navilhchowdhury@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:40:22', '2025-12-17 04:57:10'),
(84, NULL, 3, NULL, 'CHT', 'MillionX-2025-0084', '2025', '0084', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The_Solo_Developer', 'individual', 31, '1', 'Shakib Sahab', '+8801841632640', 'shakibsahab10@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 09:43:06', '2025-12-17 04:57:10'),
(86, NULL, 1, NULL, NULL, 'MillionX-2025-0086', '2025', '0086', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Binary Builders', 'individual', 24, '1', 'Alishah  Maria', '+8801976160745', 'alishahmaria01@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 10:08:52', '2025-12-17 04:57:10'),
(87, NULL, 3, NULL, 'DHK', 'MillionX-2025-0087', '2025', '0087', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dreams of X', 'team', 31, '2', 'HABIBULLAH SHARIF', '+8801329876070', 'hi@habibullah.dev', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 10:14:18', '2025-12-17 04:57:10'),
(88, NULL, 3, NULL, 'DHK', 'MillionX-2025-0088', '2025', '0088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dreams of X', 'team', 31, '5', 'Habibullah Sharif', '+8801329876070', 'hello@habibullah.dev', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 10:27:48', '2025-12-17 04:57:10'),
(89, NULL, 3, NULL, 'DHK', 'MillionX-2025-0089', '2025', '0089', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dreams of X', 'team', 31, '5', 'HABIBULLAH SHARIF', '+8801329876070', 'warn@habibullah.dev', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 10:48:48', '2025-12-17 04:57:10'),
(90, NULL, 3, NULL, 'DHK', 'MillionX-2025-0090', '2025', '0090', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hustler', 'individual', 2, '1', 'Md. Sadman Hasan Talukder', '+8801622591777', 'sadman.hasan.t@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 11:01:50', '2025-12-17 04:57:10'),
(91, NULL, 2, NULL, 'DHK', 'MillionX-2025-0091', '2025', '0091', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TestCase_Titans', 'team', 4, '4', 'Sakibul Hassan Shovon', '+8801687330245', 'sakibulhassan.shovon@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 11:54:45', '2025-12-17 04:57:10'),
(92, NULL, 1, NULL, 'DHK', 'MillionX-2025-0092', '2025', '0092', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Audacity', 'team', 31, '2', 'Farhan Tanvir Ayon', '+8801747555154', 'ayonburg@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 12:25:34', '2025-12-17 04:57:10'),
(93, NULL, 5, NULL, 'DHK', 'MillionX-2025-0093', '2025', '0093', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BUET_DakPakhi', 'team', 12, '6', 'Rafsan Jani Bin Islam', '+8801926878712', 'irafsan2020@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 12:25:53', '2025-12-17 04:57:10'),
(94, NULL, 3, NULL, NULL, 'MillionX-2025-0094', '2025', '0094', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'micro', 'team', 31, '3', 'kishor paul', '+8801707345615', 'kishorpaul1594@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 12:36:36', '2025-12-17 04:57:10'),
(95, NULL, 1, NULL, NULL, 'MillionX-2025-0095', '2025', '0095', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'StudyX', 'individual', 31, '1', 'Mohammad Iftekhar Rahman Bhuiyan', '+8801893861035', 'ifra3stu@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 12:47:45', '2025-12-17 04:57:10'),
(96, NULL, 3, NULL, 'SYL', 'MillionX-2025-0096', '2025', '0096', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Additiya', 'team', 3, '5', 'Swapnil  Barua', '+8801533815596', 'swapnil35@student.sust.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 14:00:44', '2025-12-17 04:57:10'),
(97, NULL, 5, NULL, 'DHK', 'MillionX-2025-0097', '2025', '0097', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team MavereqX', 'individual', 32, '1', 'Ehsan Al Baqui', '+8801730357973', 'ehsan.eab@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 15:04:52', '2025-12-17 04:57:10'),
(98, NULL, 1, NULL, 'DHK', 'MillionX-2025-0098', '2025', '0098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aspire', 'individual', 28, '1', 'MD Mujahidul Islam  ADIB', '+8801627813480', 'mujahidulislamadib@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 15:11:04', '2025-12-17 04:57:10'),
(99, NULL, 5, NULL, 'DHK', 'MillionX-2025-0099', '2025', '0099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IDK', 'individual', 21, '1', 'Rabeya Binte Ali Shorovi', '+8801981588213', 'rabeyabintealishorovi@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 20:08:57', '2025-12-17 04:57:10'),
(101, NULL, 4, NULL, 'MYM', 'MillionX-2025-0101', '2025', '0101', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NextGen Commerce Intelligence (NGCI)', 'team', 32, '2', 'Moshiour Rahman  Sarker ', '+8801999769608', 'moshiour.sarker792@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-96/faef33a6-c513-4115-90b9-54014e0952a0?_a=BAMAABQA0', NULL, 'active', '2025-12-07 22:09:33', '2025-12-17 04:57:10'),
(102, NULL, 3, NULL, 'BAR', 'MillionX-2025-0102', '2025', '0102', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team HealthTech AI', 'individual', 32, '1', 'Md Shakil Hossain', '+8801728178063', 'mdshakil6565a@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 22:13:48', '2025-12-17 04:57:10'),
(104, NULL, 1, NULL, 'CHT', 'MillionX-2025-0104', '2025', '0104', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangla AI', 'individual', 2, '1', 'Abu Kowsar', '+8801710278760', 'm.a.kowsar@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 22:55:04', '2025-12-17 04:57:10'),
(105, NULL, 1, NULL, NULL, 'MillionX-2025-0105', '2025', '0105', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The solar voyage ', 'individual', 16, '1', 'Tarabin Surzo', '+8801782488888', 'tarabin567891010@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 23:05:14', '2025-12-17 04:57:10'),
(106, NULL, 2, NULL, 'DHK', 'MillionX-2025-0106', '2025', '0106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bracu Tenacious', 'team', 16, '4', 'Shafin Mahamud', '+8801533764560', 'shafin.mahamud@g.bracu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 23:26:59', '2025-12-17 04:57:10'),
(107, NULL, 3, NULL, 'DHK', 'MillionX-2025-0107', '2025', '0107', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fareya Hossain ', 'individual', 16, '1', 'Fareya  Hossain ', '+8801908074133', 'fareyahossain835@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 23:28:04', '2025-12-17 04:57:10'),
(108, NULL, 1, NULL, NULL, 'MillionX-2025-0108', '2025', '0108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Noob_Tasin', 'individual', 16, '1', 'Moinuddin Tasin', '+8801881389133', 'tasinmahi00@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-07 23:39:59', '2025-12-17 04:57:10'),
(109, NULL, 1, NULL, NULL, 'MillionX-2025-0109', '2025', '0109', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Void47', 'individual', 16, '1', 'Ehsan Ome', '+8801953605361', 'ehsanul.haque.ome@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 00:09:21', '2025-12-17 04:57:10'),
(110, NULL, 3, NULL, 'SYL', 'MillionX-2025-0110', '2025', '0110', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Learner_MU', 'team', 31, '2', 'Choyon  Dhor', '+8801824849109', 'choyondhorshuvo@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 00:32:26', '2025-12-17 04:57:10'),
(111, NULL, 1, NULL, 'RAN', 'MillionX-2025-0111', '2025', '0111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ad Astra', 'team', 31, '3', 'Rhyme Rayyan', '+8801886210186', 'rhymerayyan39@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 00:35:37', '2025-12-17 04:57:10'),
(112, NULL, 3, NULL, 'RAJ', 'MillionX-2025-0112', '2025', '0112', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lupus Chronicles', 'team', 31, '3', 'Rakat Ashraf', '+8801856066755', 'rakat.ashraf.holocast@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 00:47:19', '2025-12-17 04:57:10'),
(113, NULL, 3, NULL, 'DHK', 'MillionX-2025-0113', '2025', '0113', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sarkar AI Studio', 'individual', 16, '1', 'MD Mehedi Hasan Sarkar', '+8801688929193', 'mehedihasansarkar1899@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 01:03:40', '2025-12-17 04:57:10'),
(114, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0114', '2025', '0114', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FUTURISTIC MINDS', 'individual', 31, '1', 'MD  SEYAM HASAN', '+8801728635554', 'md.seyam1468@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 02:02:11', '2025-12-17 04:57:10'),
(115, NULL, 1, NULL, NULL, 'MillionX-2025-0115', '2025', '0115', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Zangetsu', 'individual', 16, '1', 'Iztihad Mustakim', '+8801790500798', 'iztihad.bankai@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 02:46:45', '2025-12-17 04:57:10'),
(116, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0116', '2025', '0116', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Learnify', 'team', 31, '2', 'Sabiha Akter Nib', '+8801727308957', 'sabihaakternib@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 03:07:52', '2025-12-17 04:57:10'),
(117, NULL, 2, NULL, 'CHT', 'MillionX-2025-0117', '2025', '0117', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mongolchari', 'team', 7, '3', 'Shafqat Nawaz', '+8801531801651', 'shafqatnawazchy@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 04:28:20', '2025-12-17 04:57:10'),
(118, NULL, 5, NULL, 'DHK', 'MillionX-2025-0118', '2025', '0118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Noor Hikmah', 'individual', 32, '1', 'Md Riadul Islam', '+8801303887508', 'info@noorhikmah.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 04:44:41', '2025-12-17 04:57:10'),
(120, NULL, 2, NULL, 'DHK', 'MillionX-2025-0120', '2025', '0120', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Agrithm', 'individual', 31, '1', 'Kawser Mahamud Junyed', '+8801948343845', 'kawsermahamudjunyed@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 05:09:19', '2025-12-17 04:57:10'),
(121, NULL, 5, NULL, 'RAJ', 'MillionX-2025-0121', '2025', '0121', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Clover_crew', 'individual', 10, '1', 'Md Rahat hasan', '+8801976433754', 'rahathasan405020@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-115/558249bb-34e5-4040-b7dd-5263c7cceca5?_a=BAMAABQA0', NULL, 'active', '2025-12-08 05:56:34', '2025-12-17 04:57:10'),
(122, NULL, 1, NULL, 'KHU', 'MillionX-2025-0122', '2025', '0122', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team McCollam', 'team', 32, '3', 'John McCollam', '+8801234567890', 'mccollam@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 06:17:10', '2025-12-17 04:57:10'),
(123, NULL, 1, NULL, 'KHU', 'MillionX-2025-0123', '2025', '0123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team McCollam', 'team', 32, '3', 'John McCollam', '+8801234567890', 'millionxbangladesh.unguided555@passinbox.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 06:17:55', '2025-12-17 04:57:10'),
(125, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0125', '2025', '0125', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ginger', 'team', 10, '2', 'Sajid Shahriar Islam', '+8801788040850', 'shahriarsajid123@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 07:06:12', '2025-12-17 04:57:10'),
(126, NULL, 1, NULL, 'DHK', 'MillionX-2025-0126', '2025', '0126', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Tomatoes', 'team', 16, '2', 'JHISHAN DEB', '+8801517114823', 'jhishandeb10@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 07:16:03', '2025-12-17 04:57:10'),
(127, NULL, 2, NULL, 'DHK', 'MillionX-2025-0127', '2025', '0127', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AI-Biotics', 'team', 31, '2', 'Talukder  Talha Zubair', '+8801964348383', 'zubayermayaz@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-120/742e16be-235b-42ac-9901-ca3ec0a0207b?_a=BAMAABQA0', NULL, 'active', '2025-12-08 07:45:50', '2025-12-17 04:57:10'),
(128, NULL, 3, NULL, 'DHK', 'MillionX-2025-0128', '2025', '0128', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'none', 'individual', 32, '1', 'Andalib Rashid', '+8801304402260', 'andalibrashidper@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 23:03:41', '2025-12-17 04:57:10'),
(129, NULL, 2, NULL, 'DHK', 'MillionX-2025-0129', '2025', '0129', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KrishiCare', 'team', 8, '2', 'Md Farabi Rahman', '+8801962068507', 'farabi.shrabon.132@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-08 23:49:15', '2025-12-17 04:57:11'),
(130, NULL, 1, NULL, 'DHK', 'MillionX-2025-0130', '2025', '0130', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mind Havoc', 'team', 31, '3', 'Dolan Dhrubo  Ray', '+8801721561087', 'dolandhruboray@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 00:13:26', '2025-12-17 04:57:11'),
(131, NULL, 3, NULL, 'RAJ', 'MillionX-2025-0131', '2025', '0131', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kizuki', 'team', 31, '6', 'Mst. Marina Akhter', '+8801575438108', 'marina.vucse@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 00:56:53', '2025-12-17 04:57:11'),
(132, NULL, 1, NULL, 'RAN', 'MillionX-2025-0132', '2025', '0132', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aerogenius ', 'team', 31, '3', 'Md.Muntasir Raiyan', '+8801859014774', 'muntasirraiyan5555@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 01:11:34', '2025-12-17 04:57:11'),
(133, NULL, 3, NULL, 'DHK', 'MillionX-2025-0133', '2025', '0133', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Red Ferrari ', 'team', 2, '5', 'Sakeef Hossain', '+8801306789053', 'sakeef02@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 01:34:33', '2025-12-17 04:57:11'),
(134, NULL, 1, NULL, 'SYL', 'MillionX-2025-0134', '2025', '0134', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nobanno', 'team', 3, '2', 'Alfi Rahman', '+8801725369066', 'alfirahman@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 01:44:44', '2025-12-17 04:57:11'),
(135, NULL, 2, NULL, 'KHU', 'MillionX-2025-0135', '2025', '0135', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RootX', 'team', 31, '5', 'Sayed Hridoy', '+8801324856383', 'sayedhridoy100@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 01:53:32', '2025-12-17 04:57:11'),
(136, NULL, 5, NULL, NULL, 'MillionX-2025-0136', '2025', '0136', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LillBliss', 'team', 31, '2', 'Kausar Ahmed', '+8801521763694', 'kausarahmed2nd@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 02:14:55', '2025-12-17 04:57:11'),
(137, NULL, 2, NULL, 'MYM', 'MillionX-2025-0137', '2025', '0137', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AI-Powered Crop Disease & Pest Detection System', 'team', 31, '3', 'Sadikuzzahan Sadik', '+8801400867827', 'ialif3299@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 02:39:42', '2025-12-17 04:57:11'),
(138, NULL, 2, NULL, 'MYM', 'MillionX-2025-0138', '2025', '0138', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Farmconnect', 'team', 2, '3', 'Saadman Sakib ', '+88019283132626', 'saadmansakib21@iut-dhaka.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 02:42:41', '2025-12-17 04:57:11'),
(139, NULL, 5, NULL, NULL, 'MillionX-2025-0139', '2025', '0139', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mind Benders', 'team', 2, '2', 'MD. Adnan Sami', '+8801580272476', 'theadnansami@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 02:58:59', '2025-12-17 04:57:11'),
(140, NULL, 2, NULL, 'CHT', 'MillionX-2025-0140', '2025', '0140', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MetaMorph Minds', 'team', 7, '5', 'Kazi Nabila Raisa', '+8801737994009', 'u2102047@student.cuet.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 03:04:35', '2025-12-17 04:57:11'),
(142, NULL, 5, NULL, 'DHK', 'MillionX-2025-0142', '2025', '0142', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pecunia Labs BD', 'team', 32, '3', 'Ragib Yasar Rahman', '+8801718613791', 'ragibyasar11314@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-136/3fae3fbd-6bf0-46f9-b88a-2dd4ca9ee3d3?_a=BAMAABQA0', NULL, 'active', '2025-12-09 04:06:36', '2025-12-17 04:57:11'),
(143, NULL, 3, NULL, 'DHK', 'MillionX-2025-0143', '2025', '0143', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kernel_bustrers', 'team', 16, '6', 'M. Farhan Tanvir', '+8801686093702', 'farhantanvir277@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 04:48:09', '2025-12-17 04:57:11'),
(144, NULL, 4, NULL, 'DHK', 'MillionX-2025-0144', '2025', '0144', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Creative', 'individual', 24, '1', 'Md. Hasibuzzaman', '+8801738356180', 'hasib.9437.hu@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 04:52:57', '2025-12-17 04:57:11'),
(145, NULL, 4, NULL, 'DHK', 'MillionX-2025-0145', '2025', '0145', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'deadline_exceeded', 'team', 16, '5', 'Saiful Islam', '+8801888799153', 'apurbo.awm@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 05:54:37', '2025-12-17 04:57:11'),
(146, NULL, 1, NULL, 'KHU', 'MillionX-2025-0146', '2025', '0146', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sigma', 'team', 31, '4', 'Sadia Hossain', '+8801402518854', 'sadiahossain.cse.114@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 06:10:44', '2025-12-17 04:57:11'),
(147, NULL, 3, NULL, 'DHK', 'MillionX-2025-0147', '2025', '0147', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Syntax_samuraise', 'team', 26, '6', 'Md. Rifat Islam Rizvi', '+8801305612767', 'rifatrizviofficial001@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 06:27:32', '2025-12-17 04:57:11'),
(149, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0149', '2025', '0149', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ByteOgen', 'individual', 11, '1', 'Md. Rafiul  Ramjan', '+8801742987258', 'badhonngc@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 06:41:18', '2025-12-17 04:57:11'),
(150, NULL, 3, NULL, 'DHK', 'MillionX-2025-0150', '2025', '0150', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Overfitter', 'team', 31, '3', 'Leyakat Ali Patwary', '+8801813850559', 'leyakataliliton@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 06:51:31', '2025-12-17 04:57:11'),
(151, NULL, 4, NULL, NULL, 'MillionX-2025-0151', '2025', '0151', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PixelProgrammers', 'team', 31, '3', 'Shariful Islam', '+8801889106084', 'pythonicshariful@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 07:13:49', '2025-12-17 04:57:11'),
(152, NULL, 1, NULL, 'DHK', 'MillionX-2025-0152', '2025', '0152', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'niter_Xenovariant', 'team', 31, '5', 'MD Habibullah Mahmud', '+8801329433091', 'mdhabibullahmahmudncs13@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 08:13:49', '2025-12-17 04:57:11'),
(153, NULL, 4, NULL, 'MYM', 'MillionX-2025-0153', '2025', '0153', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JSTU_Unique ', 'team', 31, '6', 'Md Robiul Islam', '+8801744386289', 'robiul.cse.jstu@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 08:30:31', '2025-12-17 04:57:11'),
(154, NULL, 4, NULL, 'DHK', 'MillionX-2025-0154', '2025', '0154', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Event_Horizon', 'team', 2, '4', 'Tanveer  Mahmood', '+8801312523264', 'tanveermofficial@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 08:34:39', '2025-12-17 04:57:11'),
(155, NULL, 1, NULL, 'DHK', 'MillionX-2025-0155', '2025', '0155', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChronoStrider', 'team', 31, '4', 'Mohammad Irfan', '+8801400748802', 'irfanmd.im97@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 08:35:06', '2025-12-17 04:57:11'),
(156, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0156', '2025', '0156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Skill Stars_3N', 'team', 31, '3', 'Md.Tohidul Islam  Nahid', '+8801878408808', 'tohidul07890@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 08:42:18', '2025-12-17 04:57:11'),
(159, NULL, 2, NULL, 'DHK', 'MillionX-2025-0159', '2025', '0159', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team_BUBT', 'team', 31, '2', 'Kamrul  Islam', '+8801798174478', 'mdtuhinislam4200@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 10:11:34', '2025-12-17 04:57:11'),
(160, NULL, 3, NULL, 'SYL', 'MillionX-2025-0160', '2025', '0160', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Abdullah Al Arif ', 'individual', 31, '1', 'Abdullah Al Arif', '+8801717099335', 'aieng.abdullah.arif@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 10:33:41', '2025-12-17 04:57:11'),
(161, NULL, 2, NULL, NULL, 'MillionX-2025-0161', '2025', '0161', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Impossible ', 'individual', 1, '1', 'Sadia Afrin  Anika', '+8801913870987', 'anikasadia2723@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 10:34:44', '2025-12-17 04:57:11'),
(162, NULL, 1, NULL, 'DHK', 'MillionX-2025-0162', '2025', '0162', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ask-Anything', 'team', 31, '4', 'Shahriar Jubair', '+8801839997329', 'shahriarjubair27@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 10:44:47', '2025-12-17 04:57:11'),
(163, NULL, 3, NULL, 'CHT', 'MillionX-2025-0163', '2025', '0163', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NextWave', 'team', 29, '5', 'Taqi Ismail Mohammad', '+8801605779618', 'taqiismail10@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 11:03:17', '2025-12-17 04:57:11'),
(164, NULL, 4, NULL, NULL, 'MillionX-2025-0164', '2025', '0164', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Synthex', 'team', 31, '4', 'Juairia  Apsara', '+8801344996989', 'juairiaapsara@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 11:40:08', '2025-12-17 04:57:11'),
(165, NULL, 1, NULL, 'DHK', 'MillionX-2025-0165', '2025', '0165', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SmartIDE', 'individual', 31, '1', 'Akram Khan', '+8801705031246', 'akrammiru@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 11:57:01', '2025-12-17 04:57:11'),
(166, NULL, 4, NULL, 'DHK', 'MillionX-2025-0166', '2025', '0166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S-AI Nexus', 'individual', 13, '1', 'Sumaiya  Islam ', '+8801746723015', 'sumaiyaislam3015@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 12:04:03', '2025-12-17 04:57:11'),
(167, NULL, 5, NULL, 'BAR', 'MillionX-2025-0167', '2025', '0167', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Ingenuity', 'team', 31, '6', 'Md. Imranul Haque Niloy', '+8801907980177', 'mdimranulhaqueniloy@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 12:15:26', '2025-12-17 04:57:11'),
(168, NULL, 3, NULL, NULL, 'MillionX-2025-0168', '2025', '0168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'valkyrie', 'individual', 2, '1', 'Mahreen Zaman', '+8801712814813', 'mahreenzaman@iut-dhaka.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 12:25:14', '2025-12-17 04:57:11'),
(169, NULL, 4, NULL, 'CHT', 'MillionX-2025-0169', '2025', '0169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 's', 'team', 16, '2', 'sd dda', '+8801906449802', 'abs@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 12:31:05', '2025-12-17 04:57:11'),
(170, NULL, 3, NULL, 'DHK', 'MillionX-2025-0170', '2025', '0170', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gayer Daktar', 'team', 31, '5', 'MD.Mukaddimul Haque Muneem', '+8801876343423', 'mukaddimulmunna@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 13:04:59', '2025-12-17 04:57:11'),
(171, NULL, 2, NULL, 'RAN', 'MillionX-2025-0171', '2025', '0171', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SegmentationFault', 'team', 31, '4', 'Md. Soumik Hasan', '+8801716101715', 'soumik.hasan.smk@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-166/90ac3736-dcff-4833-8f12-215f8fda5f28?_a=BAMAABQA0', NULL, 'active', '2025-12-09 13:56:55', '2025-12-17 04:57:11'),
(172, NULL, 1, NULL, 'DHK', 'MillionX-2025-0172', '2025', '0172', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Therapese', 'team', 16, '4', 'Tasfia Zaman', '+8801521735832', 'tasfia.zaman@g.bracu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 14:01:32', '2025-12-17 04:57:11'),
(173, NULL, 1, NULL, 'DHK', 'MillionX-2025-0173', '2025', '0173', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HyperLogic Collective', 'team', 31, '5', 'Bappa  Saha', '+8801719369990', 'bappasahacse0@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-168/2dec7c9f-4b90-471e-806a-73532df9b718?_a=BAMAABQA0', NULL, 'active', '2025-12-09 14:05:54', '2025-12-17 04:57:11'),
(174, NULL, 1, NULL, 'DHK', 'MillionX-2025-0174', '2025', '0174', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Study Buddy', 'individual', 31, '1', 'Shahjada Alif', '+8801854638472', 'muhammedalif2004@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 14:41:39', '2025-12-17 04:57:11'),
(175, NULL, 5, NULL, 'DHK', 'MillionX-2025-0175', '2025', '0175', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WrongCha', 'individual', 16, '1', 'Nafis Imtiaz Fuad', '+8801880254097', 'nafis.imtiaz.fuad@g.bracu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 15:57:28', '2025-12-17 04:57:11'),
(177, NULL, 2, NULL, NULL, 'MillionX-2025-0177', '2025', '0177', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Luminous Tech', 'individual', 31, '1', 'Md Abu  Talha', '+819033965202', 'talhatiu567210@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 18:51:08', '2025-12-17 04:57:11');
INSERT INTO `registrations` (`id`, `slug`, `category_id`, `sub_category_id`, `zone_id`, `registration_no`, `session`, `reg_id`, `app_challenge_id`, `project_name`, `videolink`, `file_link`, `description`, `project_link`, `submitDate`, `termsAccepted`, `final_score`, `team_name`, `team_type`, `university_id`, `team_member`, `team_leader_name`, `team_leader_mobile`, `team_leader_email`, `level`, `position`, `global_position`, `is_global`, `image`, `approve_type`, `status`, `created_at`, `updated_at`) VALUES
(178, NULL, 3, NULL, 'DHK', 'MillionX-2025-0178', '2025', '0178', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pusti-Tusti', 'team', 8, '5', 'Darun Nayeem', '+8801748474949', 'bsse1641@iit.du.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 18:54:58', '2025-12-17 04:57:11'),
(179, NULL, 1, NULL, 'DHK', 'MillionX-2025-0179', '2025', '0179', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PowerPuffs', 'individual', 11, '1', 'Razib Miah', '+8801927228826', 'razibr246@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 19:42:07', '2025-12-17 04:57:11'),
(181, NULL, 1, NULL, 'DHK', 'MillionX-2025-0181', '2025', '0181', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kryptonite ', 'team', 5, '2', 'Muhammad Tahmidur  Rahman', '+8801826737046', 'tahmidworksinworkstation@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 21:22:16', '2025-12-17 04:57:11'),
(182, NULL, 2, NULL, NULL, 'MillionX-2025-0182', '2025', '0182', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Girgiti', 'team', 11, '3', 'Md. Arif Shahriar', '+8801842672865', 'arifshahriarrabby123@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 21:53:01', '2025-12-17 04:57:11'),
(183, NULL, 5, NULL, 'CHT', 'MillionX-2025-0183', '2025', '0183', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A_Team_Has_No_Name', 'team', 31, '3', 'Farhana Ahmed Ahmed', '+60142793433', 'farhanaahmad2000@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 22:54:49', '2025-12-17 04:57:11'),
(184, NULL, 5, NULL, 'DHK', 'MillionX-2025-0184', '2025', '0184', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IIT_calmpeople ', 'team', 8, '2', 'Mrinmoy Poit', '+8801751285949', 'bsse1524@iit.du.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-09 23:58:55', '2025-12-17 04:57:11'),
(185, NULL, 3, NULL, 'DHK', 'MillionX-2025-0185', '2025', '0185', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The Dark Horse', 'team', 4, '3', 'Salekin Imran', '+8801300663239', 'abir045@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 00:10:16', '2025-12-17 04:57:11'),
(186, NULL, 3, NULL, NULL, 'MillionX-2025-0186', '2025', '0186', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TeamONE', 'team', 16, '6', 'Asir Abrar', '+8801920213268', 'asirabrar789@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 00:14:59', '2025-12-17 04:57:11'),
(187, NULL, 3, NULL, 'DHK', 'MillionX-2025-0187', '2025', '0187', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Automedic', 'team', 11, '2', 'SADI MAHMUD NAHIN', '+8801712041690', 'smnahin1111@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 00:22:22', '2025-12-17 04:57:11'),
(188, NULL, 5, NULL, 'DHK', 'MillionX-2025-0188', '2025', '0188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nested  loop', 'individual', 5, '1', 'MD Zihadul Islam Zihad', '+8801835957663', 'zihadul.zihad.253@northsouth.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 01:01:30', '2025-12-17 04:57:11'),
(189, NULL, 5, NULL, NULL, 'MillionX-2025-0189', '2025', '0189', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Luminous', 'team', 16, '4', 'Rifa Tasnia Hridi', '+8801619615704', 'rifatasniah@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 01:06:41', '2025-12-17 04:57:11'),
(190, NULL, 3, NULL, 'DHK', 'MillionX-2025-0190', '2025', '0190', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pillar Men', 'team', 16, '3', 'Nafiz Shahriar', '+880132402196', 'nafiz.shahriar.sami@g.bracu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 01:09:28', '2025-12-17 04:57:11'),
(191, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0191', '2025', '0191', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team BioLoop', 'team', 31, '4', 'Farhan Ibne Rofiq Sihab', '+8801721272901', 'farhanibnerofiq@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 01:09:53', '2025-12-17 04:57:11'),
(192, NULL, 5, NULL, NULL, 'MillionX-2025-0192', '2025', '0192', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TeamX', 'team', 16, '5', 'Sumaiya Akhtar', '+8801401494526', 'sumaiya.akhtar@g.bracu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 02:23:20', '2025-12-17 04:57:11'),
(193, NULL, 3, NULL, 'DHK', 'MillionX-2025-0193', '2025', '0193', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Zukato', 'individual', 31, '1', 'Tahsin  Azad Turan', '+8801964434629', 'tahsin446271@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 03:29:29', '2025-12-17 04:57:11'),
(194, NULL, 1, NULL, 'DHK', 'MillionX-2025-0194', '2025', '0194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Porua AI', 'individual', 11, '1', 'Fyaz Rayat Ahmed', '+8801795824072', 'fyazrayat@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 03:30:48', '2025-12-17 04:57:11'),
(195, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0195', '2025', '0195', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Solvexa Cortex', 'team', 31, '3', ' Nusrat Jahan Olia', '+8801601461958', 'nusratoli2002@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 04:37:23', '2025-12-17 04:57:11'),
(196, NULL, 2, NULL, 'DHK', 'MillionX-2025-0196', '2025', '0196', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BlueDot', 'team', 31, '6', 'Md. Rafiuzzaman Rafi', '+8801722227809', 'rafiuzzaman.bluedot@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-189/4547cd7c-455b-44d2-91b4-66a64af4563e?_a=BAMAABQA0', NULL, 'active', '2025-12-10 05:08:04', '2025-12-17 04:57:11'),
(197, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0197', '2025', '0197', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AuraXFarming ', 'team', 10, '6', 'Raduan Azim Rahik', '+8801708588577', 'azim.rahik757@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 05:33:31', '2025-12-17 04:57:11'),
(198, NULL, 3, NULL, 'DHK', 'MillionX-2025-0198', '2025', '0198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Joya Rani Saha', 'team', 31, '2', 'Joya Rani Saha Joya Rani Saha', '+8801992433516', 'joya0001@std.uftb.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 05:44:29', '2025-12-17 04:57:11'),
(199, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0199', '2025', '0199', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AuraXFarming', 'team', 10, '6', 'Raduan Azim Rahik', '+8801708588577', '2304020@student.ruet.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 05:47:20', '2025-12-17 04:57:11'),
(200, NULL, 1, NULL, NULL, 'MillionX-2025-0200', '2025', '0200', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lost child', 'individual', 16, '1', 'Anshula  Sikder', '+8801620820430', 'anshulasikder2004@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 05:55:06', '2025-12-17 04:57:11'),
(201, NULL, 1, NULL, 'KHU', 'MillionX-2025-0201', '2025', '0201', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sajid Ali', 'individual', 11, '1', 'Sajid Ali', '+8801711368603', 'themathaypoka@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-194/dfe901f5-9dd4-4589-b7ba-f1b813b6ebed?_a=BAMAABQA0', NULL, 'active', '2025-12-10 06:29:31', '2025-12-17 04:57:11'),
(202, NULL, 1, NULL, 'KHU', 'MillionX-2025-0202', '2025', '0202', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kaizen', 'individual', 26, '1', 'Sakib Imtiaz', '+8801303080763', 'sakibimtiaaz@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 06:58:34', '2025-12-17 04:57:11'),
(203, NULL, 3, NULL, 'DHK', 'MillionX-2025-0203', '2025', '0203', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BUBT ByteForge', 'team', 31, '6', 'Omar Faruk Fahim', '+8801924091881', 'omarfaruqfahim007@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 07:06:48', '2025-12-17 04:57:11'),
(204, NULL, 2, NULL, 'DHK', 'MillionX-2025-0204', '2025', '0204', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Edge Krishi', 'team', 12, '5', 'Niloy Das', '+8801318449064', 'robinglhs5@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 07:24:30', '2025-12-17 04:57:11'),
(205, NULL, 5, NULL, NULL, 'MillionX-2025-0205', '2025', '0205', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mind Benders ', 'team', 2, '6', 'MD. Adnan Sami', '+8801580272476', 'adnansami21@iut-dhaka.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 07:25:14', '2025-12-17 04:57:11'),
(207, NULL, 4, NULL, 'DHK', 'MillionX-2025-0207', '2025', '0207', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BizFlow ', 'team', 8, '5', 'Parvej Shah', '+8801516538025', 'parvejshahlabib007@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:03:58', '2025-12-17 04:57:11'),
(208, NULL, 1, NULL, NULL, 'MillionX-2025-0208', '2025', '0208', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Hustlers', 'team', 8, '3', 'Md. Golam Rabbani Jim', '+8801625477847', 'mgrabbani2003@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:04:34', '2025-12-17 04:57:11'),
(209, NULL, 1, NULL, 'DHK', 'MillionX-2025-0209', '2025', '0209', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninja', 'individual', 31, '1', 'Zulkar Nayin', '+8801521318602', 'zulkar29@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:13:39', '2025-12-17 04:57:11'),
(210, NULL, 2, NULL, 'RAJ', 'MillionX-2025-0210', '2025', '0210', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TOTO', 'team', 31, '5', 'Md. Saiduzzaman', '+8801767270092', '223311068.cse.vu@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:23:58', '2025-12-17 04:57:11'),
(211, NULL, 3, NULL, 'DHK', 'MillionX-2025-0211', '2025', '0211', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XYZ', 'team', 31, '2', 'Nirjona Zaman', '+8801829015996', 'tube12youiam@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:24:40', '2025-12-17 04:57:11'),
(212, NULL, 3, NULL, 'DHK', 'MillionX-2025-0212', '2025', '0212', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team BornoBuddy', 'team', 31, '6', 'Robi Roy', '+8801912320797', 'robiroy585@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:36:08', '2025-12-17 04:57:11'),
(213, NULL, 3, NULL, 'RAJ', 'MillionX-2025-0213', '2025', '0213', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Arafat Rahman ', 'individual', 31, '1', 'Arafat Rahman', '+8801726847950', 'arafat17469@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 08:55:34', '2025-12-17 04:57:11'),
(214, NULL, 4, NULL, 'DHK', 'MillionX-2025-0214', '2025', '0214', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Trio Leveling', 'team', 12, '4', 'Nawriz Turjo', '+8801569179967', 'nawrizaturjo03@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:10:27', '2025-12-17 04:57:11'),
(215, NULL, 3, NULL, 'RAJ', 'MillionX-2025-0215', '2025', '0215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NextGenX', 'team', 31, '4', 'Fahim Abdullah', '+8801772178675', 'fahimabdullah45456@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:12:10', '2025-12-17 04:57:11'),
(216, NULL, 3, NULL, 'SYL', 'MillionX-2025-0216', '2025', '0216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Samir Qureshi', 'individual', 31, '1', 'Samir Qureshi', '+8801725198663', 'qureshsamir145@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:12:47', '2025-12-17 04:57:11'),
(217, NULL, 1, NULL, 'CHT', 'MillionX-2025-0217', '2025', '0217', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team-K', 'individual', 31, '1', 'Kingshuk Dhar', '+8801719294157', 'kingshuk2018@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:22:51', '2025-12-17 04:57:11'),
(218, NULL, 3, NULL, 'DHK', 'MillionX-2025-0218', '2025', '0218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Medix', 'individual', 32, '1', 'Asif Talukdar', '+8801796406979', 'asiftalukdar21@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:31:03', '2025-12-17 04:57:11'),
(219, NULL, 4, NULL, 'SYL', 'MillionX-2025-0219', '2025', '0219', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Travelogic', 'team', 31, '2', 'Anik  Dey', '+8801792184574', 'anikd1452@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 09:44:43', '2025-12-17 04:57:11'),
(220, NULL, 3, NULL, 'DHK', 'MillionX-2025-0220', '2025', '0220', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ground Breakers', 'team', 26, '5', 'Nokibul Hasan Mojumder  Tasir', '+8801975725361', 'nokibulofficial18@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:04:53', '2025-12-17 04:57:11'),
(222, NULL, 5, NULL, 'RAJ', 'MillionX-2025-0222', '2025', '0222', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ollups', 'team', 31, '5', 'Md Nur Ahmad', '+8801575056952', '06nurahmed@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:19:39', '2025-12-17 04:57:11'),
(223, NULL, 2, NULL, 'DHK', 'MillionX-2025-0223', '2025', '0223', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TriSOZ', 'team', 21, '2', 'Muhammad Bin Hafiz', '+8801641969845', 'muhammadbinhafiz24@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:37:02', '2025-12-17 04:57:11'),
(224, NULL, 3, NULL, 'KHU', 'MillionX-2025-0224', '2025', '0224', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IU_CSE', 'team', 31, '5', 'Farhan Rahman', '+8801813102490', 'farhanrahman1985@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:39:20', '2025-12-17 04:57:11'),
(225, NULL, 1, NULL, 'DHK', 'MillionX-2025-0225', '2025', '0225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'বৃহস্পতিবার অফিস থাকে ইভেন্ট শনিবার দিলে ভালো হয়', 'team', 11, '4', 'Md Abdul Aziz Zisan', '+8801754399662', 'binabdulaziz4983@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:45:56', '2025-12-17 04:57:11'),
(226, NULL, 5, NULL, 'RAJ', 'MillionX-2025-0226', '2025', '0226', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NOISE2DATA', 'team', 10, '5', 'Md Tajbir Hasan Shuvo', '+8801316334800', 'tajshuvo75@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 10:48:11', '2025-12-17 04:57:11'),
(227, NULL, 1, NULL, 'KHU', 'MillionX-2025-0227', '2025', '0227', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Skynet', 'team', 26, '4', 'Sakib Imtiaz ', '+8801303080763', 'imtiazsakib883@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:07:26', '2025-12-17 04:57:11'),
(228, NULL, 2, NULL, 'DHK', 'MillionX-2025-0228', '2025', '0228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TriSOZ', 'team', 21, '6', 'Samira Karim', '+8801875893659', 'samirakarimsara135@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:12:19', '2025-12-17 04:57:11'),
(229, NULL, 5, NULL, 'RAJ', 'MillionX-2025-0229', '2025', '0229', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Aaashan', 'team', 31, '2', 'MD. TANVIR ISLAM SOURAV', '+8801798488256', 'tanvirislam0203@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:30:52', '2025-12-17 04:57:11'),
(230, NULL, 1, NULL, NULL, 'MillionX-2025-0230', '2025', '0230', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aspire', 'team', 31, '3', 'Aayan Fardin', '+8801713039576', 'hse.shafiqul@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:33:36', '2025-12-17 04:57:11'),
(231, NULL, 3, NULL, 'SYL', 'MillionX-2025-0231', '2025', '0231', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DaktarAi', 'team', 31, '2', 'Nayeb Ahmed  Qureshi', '+8801837705287', 'nayebqureshi4@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:42:50', '2025-12-17 04:57:11'),
(232, NULL, 1, NULL, 'DHK', 'MillionX-2025-0232', '2025', '0232', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MRP', 'team', 8, '4', 'Rashik Raihan', '+8801909160775', 'rashikraihan8@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:47:50', '2025-12-17 04:57:11'),
(233, NULL, 1, NULL, 'DHK', 'MillionX-2025-0233', '2025', '0233', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EnovationX', 'team', 31, '6', 'Mominul Islam', '+8801728195337', 'mominulislamlavlu@gamil.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:56:07', '2025-12-17 04:57:11'),
(234, NULL, 1, NULL, 'DHK', 'MillionX-2025-0234', '2025', '0234', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MBSTUX', 'team', 31, '2', 'Mominul islam', '+8801728195337', 'mominulislam.mainpurpose@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 11:59:49', '2025-12-17 04:57:11'),
(235, NULL, 1, NULL, 'DHK', 'MillionX-2025-0235', '2025', '0235', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EnovationX', 'team', 31, '6', 'Mominul  Islam', '+8801308231417', 'ce22016@mbstu.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 12:11:31', '2025-12-17 04:57:11'),
(236, NULL, 1, NULL, 'CHT', 'MillionX-2025-0236', '2025', '0236', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gilfoyle ', 'individual', 9, '1', 'Tanvir Mahmud', '+8801641108874', '6209tanvir@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 12:18:52', '2025-12-17 04:57:11'),
(237, NULL, 2, NULL, 'DHK', 'MillionX-2025-0237', '2025', '0237', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TEAM HEROX', 'team', 31, '3', 'Abir  ben jaman', '+8801600204257', 'abirbenjamanofficial@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 12:31:51', '2025-12-17 04:57:11'),
(238, NULL, 5, NULL, 'DHK', 'MillionX-2025-0238', '2025', '0238', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NeuralX', 'team', 16, '4', 'MD. Atik Shahriar', '+8801816809126', 'atix.algo@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 13:43:24', '2025-12-17 04:57:11'),
(243, NULL, 3, NULL, 'DHK', 'MillionX-2025-0243', '2025', '0243', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'the Neb', 'team', 15, '5', 'Abrar Khatib Lajim', '+8801742092337', 'mglajim@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 17:16:30', '2025-12-17 04:57:11'),
(244, NULL, 1, NULL, 'KHU', 'MillionX-2025-0244', '2025', '0244', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team TJS-TA', 'team', 26, '5', 'Tuhin Datta', '+8801845628989', 'tuhindatta100000@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-10 23:34:45', '2025-12-17 04:57:11'),
(245, NULL, 1, NULL, 'DHK', 'MillionX-2025-0245', '2025', '0245', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team_Jacche_Tai', 'team', 8, '3', 'Ibne Bin Rafid', '+8801521784660', 'bsse1330@iit.du.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 01:58:46', '2025-12-17 04:57:11'),
(246, NULL, 5, NULL, 'DHK', 'MillionX-2025-0246', '2025', '0246', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Shakawat Hossain', 'individual', 16, '1', 'Shakawat Hossain', '+8801858019602', 'nabid.hasan773@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 03:39:44', '2025-12-17 04:57:11'),
(247, NULL, 2, NULL, 'DHK', 'MillionX-2025-0247', '2025', '0247', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vedars ', 'team', 31, '4', 'Maliha  Firoz', '+8801885988948', 'malihafiroz@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 05:26:47', '2025-12-17 04:57:11'),
(248, NULL, 2, NULL, 'DHK', 'MillionX-2025-0248', '2025', '0248', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ahmed Shahariar Udoy', 'team', 31, '2', 'Ahmed Shahariar Udoy', '+8801766228175', 'udoy.ire@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 06:54:30', '2025-12-17 04:57:11'),
(249, NULL, 5, NULL, 'MYM', 'MillionX-2025-0249', '2025', '0249', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bitwiz2.0', 'team', 12, '6', 'Afham  Adian', '+8801319014062', 'afhamadianbk01@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 08:17:29', '2025-12-17 04:57:11'),
(250, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0250', '2025', '0250', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mind Matrix', 'individual', 31, '1', 'MD Seam', '+8801792433083', 'shseam01@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 08:27:46', '2025-12-17 04:57:11'),
(251, NULL, 3, NULL, 'KHU', 'MillionX-2025-0251', '2025', '0251', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mind arch Innovaters ', 'individual', 31, '1', 'Moumita Ehasan  Usha', '+8801342911128', 'chryblosssom@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-238/7bae2076-67c8-4beb-93dc-2b1d64df940c?_a=BAMAABQA0', NULL, 'active', '2025-12-11 09:10:38', '2025-12-17 04:57:11'),
(252, NULL, 5, NULL, 'DHK', 'MillionX-2025-0252', '2025', '0252', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SUST_BYTE', 'individual', 3, '1', 'Samia Sultana', '+8801682027561', 'abubakar-2022515922@cs.du.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 10:13:44', '2025-12-17 04:57:11'),
(253, NULL, 4, NULL, 'DHK', 'MillionX-2025-0253', '2025', '0253', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SamFusion', 'individual', 31, '1', 'Md. Sajjad  Hossain Sagor', '+8801988832440', 'mohammodsajjadhossain@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 12:25:28', '2025-12-17 04:57:11'),
(255, NULL, 4, NULL, 'DHK', 'MillionX-2025-0255', '2025', '0255', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ctrl Z', 'team', 31, '5', 'Saima Ahmed', '+8801913623547', 'saima0001@std.uftb.ac.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 12:40:16', '2025-12-17 04:57:11'),
(257, NULL, 1, NULL, 'RAJ', 'MillionX-2025-0257', '2025', '0257', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NexternAI', 'team', 28, '3', 'M R B Taseen', '+8801735332277', 'mrb.taseen.2003@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-242/0b494bbf-1e1b-44a2-8221-dae6a9f14620?_a=BAMAABQA0', NULL, 'active', '2025-12-11 14:47:18', '2025-12-17 04:57:11'),
(258, NULL, 1, NULL, 'RAN', 'MillionX-2025-0258', '2025', '0258', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team XPower BD', 'individual', 31, '1', 'Dhrubo Sarker  Avroo ', '+8801717676292', 'sarker.bipul@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 20:15:38', '2025-12-17 04:57:11'),
(259, NULL, 4, NULL, 'DHK', 'MillionX-2025-0259', '2025', '0259', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ogro Projukti', 'team', 14, '6', 'Md sifat bin jibon', '+8801762746646', 'codewithsifat4@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-11 22:17:32', '2025-12-17 04:57:11'),
(260, NULL, 3, NULL, 'DHK', 'MillionX-2025-0260', '2025', '0260', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Zero', 'team', 21, '6', 'Saida Jahan', '+8801581506240', 'jahan27112002@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-12 00:53:32', '2025-12-17 04:57:11'),
(261, NULL, 2, NULL, 'DHK', 'MillionX-2025-0261', '2025', '0261', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FieldWings AI: Every Crop Counted, Every Farm Optimized', 'team', 1, '3', 'Rayan Alam', '+8801754538883', 'rayanalamsiam2000@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-12 11:26:35', '2025-12-17 04:57:11'),
(262, NULL, 3, NULL, 'DHK', 'MillionX-2025-0262', '2025', '0262', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MegaMind', 'team', 31, '4', 'Md. Murad Hasan', '+8801831448204', '08muradhasan@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-12 15:29:53', '2025-12-17 04:57:11'),
(263, NULL, 3, NULL, 'DHK', 'MillionX-2025-0263', '2025', '0263', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Vein', 'team', 31, '2', 'Anik Kumar Das', '+8801724700072', 'anikdasad5@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-12 20:53:17', '2025-12-17 04:57:11'),
(264, NULL, 4, NULL, 'SYL', 'MillionX-2025-0264', '2025', '0264', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Imran Choudhury ', 'individual', 11, '1', 'Imran Choudhury', '+8801622781263', 'imran.cy362@gmail.com', NULL, NULL, NULL, 0, 'https://res.cloudinary.com/deb9i8yqw/image/upload/v1/millionminds/profiles/team-249/56745ed6-537f-4ae2-bdc7-c3582b525c05?_a=BAMAABQA0', NULL, 'active', '2025-12-12 23:56:11', '2025-12-17 04:57:11'),
(265, NULL, 1, NULL, 'DHK', 'MillionX-2025-0265', '2025', '0265', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Fakibaz', 'team', 32, '3', 'Suhaib Muntasir Rahman', '+8801779689683', 'suhaib@fakibaz.app', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 01:16:41', '2025-12-17 04:57:11'),
(268, NULL, 3, NULL, 'DHK', 'MillionX-2025-0268', '2025', '0268', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MD SAJID HOSSAIN', 'team', 11, '2', 'MD SAJID Hossain', '+880602387483', 'contact.mohammadsajidhossain@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 02:36:02', '2025-12-17 04:57:11'),
(269, NULL, 1, NULL, 'DHK', 'MillionX-2025-0269', '2025', '0269', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Alokbortika', 'individual', 31, '1', 'Rahmatullah Khan  Ayman', '+8801747611903', 'rahmatullahkhanayman@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 06:35:49', '2025-12-17 04:57:11'),
(270, NULL, 1, NULL, 'DHK', 'MillionX-2025-0270', '2025', '0270', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team Alokbortika', 'individual', 31, '1', 'Rahmatullah Khan Ayman', '+880174761903', 'rhamatullahkhanayman@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 07:22:13', '2025-12-17 04:57:11'),
(272, NULL, 3, NULL, 'SYL', 'MillionX-2025-0272', '2025', '0272', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Neural_Nodes', 'team', 31, '2', 'Jubayer Rahman   Chowdhury', '+8801745431843', 'jubayer.at.03@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 11:03:46', '2025-12-17 04:57:11'),
(273, NULL, 1, NULL, NULL, 'MillionX-2025-0273', '2025', '0273', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Team black squad ', 'team', 28, '6', 'Musfiqur hosen', '+8801826205124', 'llabib220@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 11:50:26', '2025-12-17 04:57:11'),
(274, NULL, 1, NULL, 'SYL', 'MillionX-2025-0274', '2025', '0274', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZERO', 'team', 31, '3', 'Pritom Paul', '+8801323587346', 'paulpritomuni@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 13:07:07', '2025-12-17 04:57:11'),
(276, NULL, 3, NULL, 'DHK', 'MillionX-2025-0276', '2025', '0276', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vitruvian 3', 'team', 16, '3', 'Yeanul Haque Khan Akib', '+8801757404362', 'yhk.akib12@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 14:21:57', '2025-12-17 04:57:11'),
(277, NULL, 1, NULL, 'DHK', 'MillionX-2025-0277', '2025', '0277', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Abeed Mahmood', 'individual', 31, '1', 'Abeed Mahmood', '+8801615366060', 'simpleatmad@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 14:22:44', '2025-12-17 04:57:11'),
(278, NULL, 1, NULL, 'DHK', 'MillionX-2025-0278', '2025', '0278', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Alpha01', 'individual', 11, '1', 'Ovi Shekh', '+8801799184448', 'ovishekh@proton.me', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 23:27:54', '2025-12-17 04:57:11'),
(279, NULL, 5, NULL, 'DHK', 'MillionX-2025-0279', '2025', '0279', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DU_GenMorphix', 'team', 8, '5', 'MD. Abu Bakar Siddique', '+8801631172611', 'bojackabs@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-13 23:57:58', '2025-12-17 04:57:11'),
(280, NULL, 3, NULL, 'DHK', 'MillionX-2025-0280', '2025', '0280', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'team Titan', 'team', 2, '3', 'Fatema Tuz Zohora Moon', '+8801711446553', 'fatema@iut-dhaka.edu', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-14 04:00:51', '2025-12-17 04:57:11'),
(848, 'harper-neal', 1, 9, 'DHK', 'MillionX-2025-0281', '2025', '0281', 1, 'MarsNest - 1', NULL, 'https://github.com/FISohan/embiggen_your_eyes', 'xxssxxsxsxsxs', NULL, NULL, 1, 8.92, 'Harper Neal', 'individual', 13, '1', 'Ava Burks', '01764388484', 'dev@basis.org.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-16 08:05:50', '2025-12-17 04:57:11'),
(849, 'test-team-1', NULL, NULL, 'DHK', 'MillionX-2025-0282', '2025', '0282', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test team 1', 'individual', 18, '1', 'Ava Burks', '01764388484', 'fisohan7@gmail.com', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-16 08:31:35', '2025-12-17 04:57:11'),
(850, 'harper-neal-2', NULL, NULL, 'DHK', 'MillionX-2025-0283', '2025', '0283', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Harper Neal 2', 'individual', 14, '1', 'Ava Burks', '01764388484', 'dev1@basis.org.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', '2025-12-17 03:58:26', '2025-12-17 04:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'active', '2022-07-19 05:06:39', '2022-07-19 05:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(1, 197),
(1, 198),
(1, 199),
(1, 200),
(1, 201),
(1, 202),
(1, 203),
(1, 204),
(1, 205),
(1, 206),
(1, 207),
(1, 208),
(1, 209),
(1, 210),
(1, 211),
(1, 212),
(1, 213);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Room 1', 'active', '2025-10-02 18:30:36', '2025-10-02 18:30:36'),
(3, 'Room 2', 'active', '2025-10-02 18:32:56', '2025-10-02 18:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `room_user`
--

CREATE TABLE `room_user` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` enum('judge','volunteer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_user`
--

INSERT INTO `room_user` (`id`, `room_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(4, 2, 6, 'volunteer', '2025-10-02 18:32:25', '2025-10-02 18:32:25'),
(5, 2, 5, 'judge', '2025-10-02 18:32:25', '2025-10-02 18:32:25'),
(6, 2, 7, 'judge', '2025-10-02 18:32:25', '2025-10-02 18:32:25'),
(7, 2, 8, 'judge', '2025-10-02 18:32:25', '2025-10-02 18:32:25'),
(8, 3, 6, 'volunteer', '2025-10-02 18:32:56', '2025-10-02 18:32:56'),
(9, 3, 5, 'judge', '2025-10-02 18:32:56', '2025-10-02 18:32:56'),
(10, 3, 7, 'judge', '2025-10-02 18:32:56', '2025-10-02 18:32:56'),
(11, 3, 8, 'judge', '2025-10-02 18:32:56', '2025-10-02 18:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0y1SEU4rXykgF8OS6AkmxXbIuprgwmi3KA95dtde', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT25BaXdBTFJYZWYzVlB0M1VHaGd0blJ0ajNYYktmbTZVcEpWSUhGcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965052),
('149rwdcjmqLMMFNzwJ7jn1wcwAV0Xa5xtbBArU61', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVhTYmxrTjV4VVVod2dhZ2JuYk54ekpQQWRlbTlac3JDa0Joa0dsOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969328),
('1pxiRn8xemfYyHBAPxstQiyOrpiHYASaNX80Rj2y', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHdjR0c1T1FreVVJd1pZeWQzUjZCT1RJeVd1YmxNTGcwc2RnZjYyMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964445),
('2f7uOb7jM7RZxuWOr3qvGpQt07SxpFwWBestDovZ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQndlZHpPcmpwNWc5UGFEemZtVmlwaXphN3lGb21zVjBoMkE3WE1CNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963439),
('4cKmB5fVyc4Z5TFbxQ73vxwLJEd4m4KdsycE85G1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXpQQlY3QVhLdmFscElVVlVxTkFyWjBLVmt5RmUwRlRGWmpXUVBmMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969325),
('4zG1tQynGA0G6zln46mFeFTld1avjuMeVtms1JwF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialZLWEs0ajNsNjE4SkZIWnBvUFJDUlZQYk1HaHowdnd5eG12ZmVydiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964492),
('567r17zwACnDLXXtbgSyyaTIr0FYFLjnYZgYHfSF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1NTSXpLZUxzdVFmc1p1U2J0QUVRUkoxRnhuY29tZDA0WmRWNHVXcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965019),
('6eDvqLvTWJbZsWs2NuPzyqoJ8UVTjF2U677Ihclz', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXpCeHJmVkZ6S1F4RTFTbkhWeTlYZGhwSWt5QUNPQTZWNVV0cmNpNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964573),
('6j31zuylnjyoMNSj3wNsYDGQ095gyW40iT2U1Zb7', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1BqdGtSZXczb28xb29MdjFkNUZSMHBKamhTVlJrQ0FGc01pRVNmUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964780),
('6oHjrv5vswPYeBfhhpFfC2Z13rBr6M0vsBI2HlJi', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXN5U1JXTGpjOFRtYWFsb2V1MWtIbGJBQkFKTkVTdmFlR0E5UjlJVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969633),
('7fvk71PxjbjGBe0vZGqGixoJsbVSFCnEBqZGznkA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjlTdzlVaVZjTERsQ1ptSFZxM2tBYXdZR0NheGNVcTlFRXhMdW85WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964533),
('7PmyOKw7CIfdpDMDgZBDadN5HY53xNCYzlsaWjAV', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJMYXkybkJLVm00VE9XZTJRRDBVVTJGQ0NoYnFSckVLT1l0b3V3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964723),
('7vFKJFiezr5ZnKwdR2YSn2GaiRo1KY2cVbXV6rB1', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0hCeHk3WFdMS1hpaTZkY3F0S25oWldPSWFwVFZnNmVlclBrekRvYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964807),
('8arnw2w8X2niFvW5zTpuzywq0qMnMRj6fAkjD6Ba', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0RlQ2VtTlRWeXVIVXZ1WElZY3NIdW1HSTlIbGhERG5HS2JGYTdCRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963571),
('8RWldHfUq1quEe24b0guUXe9o7ACzOvVmzUuRIR7', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTllsV0QwNGUzMGx2MXdQandsT2NOSXpSOVg2Zkx0bE1iZzNnVEQ5ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQvanVkZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6MTE6InN1bW1hcnlZZWFyIjtzOjQ6IjIwMjUiO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1765970217),
('8S9LNqrnhoESQC7g1ZcSuouiksQi1RDrrVvNVKQL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmVzYzA0dFRGdXZ3TFd0SGM1RjhmSnhIalhiZWRTTlljR211akxwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968836),
('8SyXN4s0wu4Nq2q7x0HGjdcoI2NXEjQ2zeWtmEtJ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaElJRUE1Vmt2ZUVueW1aMHVLYmVrRU9xTzllb00wNDdEM0FnMTRtQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964434),
('8wBKnRDRDkheNADFvra8OvJzut0BXsAgmkngndjj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk5qUXp5VmRObVh2VnpXNGVuSEZwYXA0eEhrQ2xZbmlpYmk2UGJKVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969120),
('ADYlyonJtU9yFmeil1LcOaqmMrSity4S6PQWhFk8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGx2UHprZjhseFpYWHRtdm1aNnV3czFJVmc0WWRhTlYwcTR2MlEyRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968773),
('B2RfI8UNSHEc6pPfCm29AdJwIwGn3EHLLyGvmnFo', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm1nRUZqejJGVm5kbnc0SjlmOGY1eEwxc1dMTUJtTVlJQ2FNM3hxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964653),
('BeDqYYA3TWkYs5v2FjhyL2AX7keK1604msQK3C4A', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmQyOXRwdTk3cjZxam1HM0NXdnllcjUzS3dZRkJlOG9oUGV3UzJ0MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965437),
('bRzcQSaAx5yFhGbOMl3gpTCw4ifzT88kattzzuaY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1ZDM1NPVzBURzFWZktTZW83YktKaFJVa080QWlhY1Y2V0Z6ZHJCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969334),
('bUtLIyTockG0tnlePntsSflhUuOxcLhJF8WVkxfC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUsyOTMwRTJBVWNBVUpoT3R5Y21TdU9RS2c0S0g0R1d5ckZQaExuVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969501),
('CDavG2LLgPXvCGVAXZ7VQZw1ZQYfVqlZ4DAjWbzP', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFhnNkp4MmNOTXdjOHo5cW1zdkxCUk1INUN0Q3ljdDRYdENFd3ZSTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964525),
('CEe7GV03U7wYHSLQJU2ZmlFBZ6x2HM9hYsoNKDUP', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEs4YTJkNzB1UWRNbjJ2SXo1Q3lseVNUMHcxU0dncTRaNk9lS3JZTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964590),
('dEgWZ7blTGccjdCRIdOCcNkyck5prMPbesVtJnQE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3NrNm8yVDZuM1dEakpzOVQ3ZmRDUzZwblp4RXFqaW40V2t0QnRzUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968782),
('dMpff6qfOML6ICHOweeQRcdrwuXXaVwuf72O9CVr', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU1YVFY2Wk1Ib3dEaURrbjJBRnU1azdaT1JMVmpFenVKMHR0YzN6NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964810),
('ESjsLPeZ3lrg36qcpe2siD8XCNtsvnQ7rHQVysla', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0Q2V3A3WndvclBHQVNiZzRlajdBM244aXAxR2MzaFd3d254ZDk5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965015),
('eW3Ipm7JLezWJhQcPFndftkcLIdb1KHIVHfBHEoa', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1VKQW5EUFNYelY4SlRjUlg0UVdVemNRS0REeXViallWTzlRZGxMdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963476),
('F9xm1naEuzH6HDlen4DeFqBwBC41TXf577qZmiwq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkxpbEV6Zmd2YVVDeDJLaEgybUlMZnRlN0Y0Y1FmSllOdDZIZU0zTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964554),
('FINfusIgJi5NunWovusWdMdr5BrEekno714cwzd8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGlwUHZnSktnUmp1OHltVlU1TGNsbzdieWd3MGJSbUI0RTV2WldNYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964750),
('FzXailM15WgYJsX5XZ2wgbmDp4FrK9j64U2JzXqU', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHBicTE3ekNRa3diUkdEa25iendqTWN1bVZnSTVpMGE3NHpRMlFmdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969627),
('G61szUFxN14Ew4iu9n0euScY6r9i15dZuMDs5UBt', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXJqSEw4TXJ5REJweGYyZVo4NWN1Y3BWSkhrMmZBcWFzMXMyVHZXbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964621),
('GEUjBfzTHbMCtYcA7HgTA2GcL2MSPowRsTdedBbx', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1RXS1pUc3FaVzh6Y1dESVhLR0g5MjVqUmsyTmxBQk1LRVBOcEd2bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968807),
('HAADykTuHxJOTOmnq1GbCw60966A0fsBlfowvCR3', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWURESE1YUWVRdEpwVXR1NmZaNDl4Qkk3Zm5PTEJQTHVXN3VkVzJlQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964834),
('HnbP8Conu1eN4OfoweV5fz0lIdhxTF3w2QrH7HXE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzd0YUx5VWRJajdFRExBUFdOakxaVDNCQmVXUmxHYkRSS2tyNHAxTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964783),
('I3I1eT89aKw90y3dHUKMy5zbZQ4eTmJ8jK32126t', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEl3anowYkVvMVNOOWhoSE9xQUllMmljSng4cnFHcXA0aWZuSll5MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969090),
('Ijh5E5NNwQ3Ah7OCF1XTf1OGzs8DpJBSTFvkhfVB', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUhGMFVXZlNHVGlHTmJqUEVGMTZsYm13eFR1T3BzWXlDTHp3eXgwQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964437),
('iVzneixAFCT20TRWBPldeIyOm9OoUSke87OFynIE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0IxS2loN2NsTkJkVDg3djZiYlNlUllHMmwwMHVPeTJIMDU0R3J0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963578),
('j4DdHy4jpPyXkb7gm9MtMEGUCAPEMiLnZ5PeNtik', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVhKUVZmS01hVWRmQ0ZXdDdvcmRYeHA1WG5PZHl2c3FHVVViYUZoWCI7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YToxOntzOjI2OiIwMUtDTlcyUFFOOFpCRVI4UDE4QTVZVzk1RCI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765965651),
('J7VZJpMvTO3MIOIzilKYuUBsQ9K3g5GhqleGJiLI', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzM5UTlzVkFHS2t1VHdxRW5xNGEyY3NOakhZUHFWTVpBdzIzSDFHSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964820),
('Kgx4gOn3Qq32v7hQkxpmx4nvF8scrPbmvOkDxUaf', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHpIT1hEemNWc2Z1aGswaHRFcnhMTUxyQkNpeGVrR2d5OGo3TDVXSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965054),
('KlrM5fjq0034fmXVcwJe2eJQIYOxDLyKoz8wD8FA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1Nmam83S3NMV0poeDVIcG5mWXYzN0I1VExYYzFONmxySGpPNzR0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964648),
('kUh11WoGcOqJ6v5JUp3ViOhcEegmVY8cYVdhTFxa', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFZXbnE2a2R0ZlFqeTlXeFRqVHBHb2o4MEE2VTZjZkplUTFLaVR1VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964529),
('KUImG0tmhp8DGs5NLmnrLvH9Cm1t9Ti0CF8nsMKr', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT29yUUFnU1UyaDdXWG9Oc3dsOFlHVDlvVGZtc0pkdHlxT1BLaldlbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969504),
('kwzGXFGuNOcuBxY85ujk81HqDRTkVfIiV5zdkZ7J', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGRkYk9rbTcxSlI5TklHMUlhdTN4c0Yxcnl5dHczWlkyV1VieDNhNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964740),
('lgYMCwSePUy4w8Kc5zseG82Ss4VKkLRrDKB21zg6', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid001WUtHc2EyeWtUQW96bHZMYU1JY25KTFNzTktzakNXQWJzOFJDMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964831),
('LRNm9h7kiisIB4YWJTDEY6P2AeC8GAXS0YC95YJg', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjBFNEd5RklTSVY3NnB4MkR1NmMzdUs3TGNIMDZIeEtIQUFJRDhlSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963460),
('LY9JJu1GlEb19ihxzFLNJrtMuBzzW4qHq4SDS2hS', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3VyZ1lKWUtwWjR4akpabmZFUlJmSUgzTGdnWGdjRXJzZUtDN0J1USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964689),
('MBY0D3El9AKsU846ArCJntZW8ijQmduGNNsSlNme', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienJGbVJ5VDhqVHoySllCMnJ0bEx0QmMwNGZJSmtxYWVQQ1FJNjRQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969806),
('mipcQR1IjEJeizRW0G6gkDPLImlrluewz4VHKLXu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3R4UWZua0xCMm1XUlRUWXh4THpaVG5BTzU2N2dkbjI5YTJnaU5uVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968792),
('mOn1mxQwzA2ifdpzPCNQYpqOIc3bu3KkghjKYvT4', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHlwdmpmTHFBcFNZWnNGTjRRd0lDN3dhZFhGYk1iT1ZtaTlrY0dtVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963521),
('nNwcCNsgCrouPHqjT1mK1MV56Gn2pUhCHNkgdjX0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmlQcDVlQzUwdk1ab0d1dDhiY2JyVEpta1pPNTU0RXRlVUN1QlF4ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964624),
('NV85Rn8KG2ykNEirHz4gAXHHjlXxrlHbjLYkRwwr', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjdjTEZVZDN0S3YxQWZuS3UybVZSZVVIeUd4ajRVY1lneFdESU9INCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963596),
('NWP8OtUcJ6NOjOvJZ9IufpW9yKtuaseZCf9VoQvc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHZQdG5hWXNxTEpXbG9zeml5S1ZFVWxOYjJEMFA3M090bnoybkgxTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969094),
('O0L2JYbv6OYn4s5ARHkHa89c5cnliCckiX8hjReM', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnhYTW50YjJtYU1JeUhBSmVMZjY2UkRYNjdzaE1Sd3hxTnFHbUtsRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969163),
('o5X85akf4B9xU0Pr9RP3YcyPKroaL584YDiA9Gb6', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTW1NODBGdThxZm9NVmJLcW9FS0pSOEVQWnI4bkZ2c3k0Z1FXSEloQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968820),
('ofgwmF3xxduvUNGnv5YThz3whqyUOlBNuBnZJhff', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0I5d3BFbzRwZHZmS2U0NzVaTzFtejA5Q2VVcXU2bENOYkFWTWRxTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964599),
('OtAgAkOUDyID6B84ipWyOMINE7ZCodBEyOIcC3Xp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXdra2U5dUVCQWtkZE1DMmtkQ0dhMGtDTjAzRDA2NElwS0FhZkZVZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964794),
('pjx9Z9KDPmUlv0fYD1JWhTai77QERTjSI4ZbIxQY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0tsWjRQTWswY0lkc2t4bVRPYWYzanBJU3RDeVNDTVF4NXJHQklnNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965012),
('POevORpRgMCOrf48qjCzF2CDBUBJGfnQh9U1VHpn', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEdUSXZIbFdFWXhQZUJKSG1hbDBGNXdGVXc0bENaTTNjYW9jUnZNWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968800),
('PSwR7nxDQA0j5mYeUiKe9VLXTfcbbxC4BqPApWml', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0V4WEVldkRnaVN1N01aaDhTcFhybXhUbFlMdzVwdExud0d4SldVYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964671),
('PYo955qxZ63h0tTt64uK0lMiIkqYLFVS9vFCBadc', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFhDcEVrM29Yc2FEZzZKaGRqd0Q0T2xlQ2FubEVOTHBSSGk4emlWcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969508),
('qNTMHB6bRPWLOt3tPAG0Gh411ZirqyO5Q5yXoqeA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0VwOEYxTFQzbWNpS3dmR01jdTNrMUpYbHJ5YzEwSjZjbVhiMTd0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964984),
('qQIVsk0EMZLBcTHk5oSjJq2frn3g8tuRwlr2TxPM', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1Rzb1JLT3kzRm52NmpPZUFFWUpzODZBcWNlM0J2OWdXV0xiaWVGMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963601),
('qR5Co5LMTU6Qxar5fVBBc5c2gazB5HJ5AJ0FuVvd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmlnWENsalhIRHdSUTh6N1lWb1VWNzJBYmxRM1FlVWQwZzZLc0RBZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964837),
('QV949WptF4CrNCqp2rw57aEaUk7BRf6cFmguMgBF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm5IdnM5NzBCa1ljdFhHVTh1bGpZMENXcjNZbE1PZ3pxeVdCMGNZVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964800),
('rAqoHaHxoBhjKFYxYo5AeZYkd2Sp2MYPVDLMM4BS', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnMzaDBzcExLNWRNMWREMkZuZ1RMWW1TNGRXWE8xWG1nUHlvV0l0SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968778),
('RAwf294Ewcd5Qyb5nFMgHjMNsvUyyFiFH6N7s0yB', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkNhV211VUtlbjNwbkdBZnBGUTNZdWFtSlJlZmo2THlhUzh2SlV5WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963498),
('rDE3VhNBssYLORLjwx1oFOluzPffYRUnGnkC5tuL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkFUNEFRR1p6M1BWcFZsdjc0SnYzQjFnRjVmbnp2UDViYlJxbTFuQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969612),
('TL2mqz8JHJoItWy5WElGSvx2XGFPTsMybh7ICQG3', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnpVWjI4NWpWSzRERlhXQld3Z3lhWTRlcks4bFRNdGVsaDJUZFlVZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965045),
('TnTfx2o7uFFjphNJy0akqxpQzQZLYU0xL1nd0zBF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXN5SWtLMjJpTzJNSkZRSmZodDNtYkJNSGZCRTVsSE1HMXBnYWsxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968827),
('Tr0wHBkwYt0ibYmrDNm6EfrpST0HOQncxKDDZbhD', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE1hazdRTk1QWVBtOXh6amZmTFZVbFA1TFBaek9pbnRmcFVzc09rTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969512),
('U2gRQQIPnSKYLKyc1Fh5O7epvJUNmdOl3e4R6zmu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1rSkhBam1uNVVKaUZ4b0xhRmVtckNNNVJZeDFCNGlkdFhGWFpXeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969489),
('UEdtG31SHmm23nFrG01zh30RbMwz09ywlb7OFsJq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWNCNkFtamhEZVJMM09kRExZZjl5a1FRN3ZDcEdieGJtY0ZNZDlENiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968784),
('UeYQdyNZ8emNWSkdRmmoQzn1gosFEmgVBAThoQIW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlGaHpBc2pRMFlnQ3NpdTFSb0d2N2NsbzliYU4yS2ZPZmpIVkY2RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964719),
('UQVgitAX5l69Lwteh2BqFDzoJAaZnKMQwXCwBsmo', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3Z3MTNuczJmb2VtRXRxWk1Pdlh2dkdqdHA0Z1BLOGE4dEh1eGVWcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969156),
('Uu7BwqYLnwOTiUUeKvFpcRlqVfP0LygPBOJDrtOu', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHF0TTVTRVlwbjNkQzk4dDRIeWRLT3VKZjA5ampTbTdsRzl1WjB2TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968743),
('vb8vytADA8H5IrTd2B2bml4ARikUD4W5wemIFT9S', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0J3MWRWOUxSWU9hWUEzdDc1YWR1bFRxTUR5UlNJcldnOTFxMGFjUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969770),
('VjrSK0wdSbVPOLn35ElnQB3zJZ3DmkHoOMY1PlkG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXR0VGdrVU9aQ0FOdDZjSnlldGowS0tad2hSTGpWZ2dSbmxVenhOdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968842),
('VnCDtCCfaUvymS4nnspUkP8nrO7DG9MoTZuOZYGZ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielVpNTdvQTVwWXFyWERoelJIeTRpc2NSSFptTlhpZlgzVlVnVkQ4SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964684),
('vZ3laXfkFji2k02hFItXMbdPGLnQLLyyqmdxtwhq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEU1bERmOWk2d1FIWDBSZGVUY0ZVWTQxdjRSeE9jcnZ5SERDU2NGUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765970221),
('w2NSbxbnw75oOuCumjl5AJ3sCg8MymtZmfrk36wd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEZ6S3NlNFNsV0tIZEVwS3E0emhPR2ZMU0VpbWxwdHI0WmpsWmExeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765970218),
('WcbOZcIFFs2oX1RbHtytviXfWNklG4w02i5qiKRD', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUVlYUNWdWl4SEhFWXpoTmRLejE1dER1N0NrZWQ0YlNkRTB1b3J2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964469),
('WgcaHGlJoZwpNVwI8QajAWTXcWoVhIA3nLIKVBfi', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2FNR2Zrd3AwaEUwQmppTGVhOFRRNFlGZUgwRWtXYlc3b2V3T2puTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963436),
('wQe7RBP1Dxsrf0VTb3Rk2pqTYwvEikqnGBvvaqO9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1puNTliWGltQjcya2w4OUp2S3FwOFFpZFBMR0VNRm9BcXZLNkFQRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964581),
('X6LxKt6GXcFyV9R4qxgmj0TmlXn2CMcDb6J9QzRf', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibm04YlpLNXp0aFV0RDVsdW9UOGp6QVBTREFWZmZCZ21XNk1YcnJ3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963463),
('XSpOFhm89W7sizpaIATZTdaQtdL6jSnQofl1ecSr', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlU3dFBINFd1QjhDdGtlSWN6Q2xtMk1zNzRkUFV2U2o1WE5xSXJyViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765965042),
('yERsumHY1SVBGWXc9eaWyp37PMszW7z8JV4m5Y4Z', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0E2T21ZOWs0QWw4TVhKbUYwUmlBd3V6cVpIc0xXRTRWR2dRSnBtSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964803),
('ymgYrknpcTkGouSlbxhhGsRaHdXzn9NbbZ4sj2ap', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicklUQ21xRjBZUnoxUURhbmxnTERuYXRrcnNDdTlwTXhHR2xabTFVNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964643),
('Yno1xUMbT77Xw53cDkGxfPDdnAuLK6dCwfrA8mOd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTFpc29FSGJybnExdjlPRjdDbm0yRjhNRGZKMFlrT0pMOVJuT0dhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964495),
('yXkj8vbzPLBkYbeq16ouhqDau3thDUT3OxAAHOPw', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWRJTUt0blFHbnNZWUFZNEY5N0Z3WmRTVUlpeXY3WVd3d2J5aEhoOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765969761),
('Z4ml0M6Jee9SDboomhKku2DmxfuBCifLBNeJnSQJ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSjlTQVNKckhNSXp1NW9wVm5icFR1WjlpSmhBU2lEU1Z1N0dNUG1JaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQvcmVzdWx0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1ODoibG9naW5fcGFydGljaXBhbnRfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozMDQ7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjExOiJzdW1tYXJ5WWVhciI7czo0OiIyMDI1IjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319', 1765970238),
('z7BBkN7BukmGEQRyq4jtLcY7aoF4eRSqfLzN0Y83', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzRJYVVvQVNZcjhwd29ud1ZXbFpWU3hPemdoRk1BeHJyaXNMOG9OZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765963801),
('Z8KAOOulF88F6tbtFNehvG4YpYj6OulcJrp6iUam', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU1SZG1JSkUweGgzUXZMTVhvUE9mMHk0RzRRNWo5UkdmYjhNMWhWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964699),
('za6eke8aYja9a6w3WUP200XDoH1EcEKXjfbto9ss', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjJTQnUwUzRDb2o1Zk83Y24xOWppY3ZDYk5VVGk3VUdjeTVGdXBoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964577),
('ZaaeyOyHVhnVTA97LOrwbMveK2u7i5ULBsccifaU', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUVrVlBVS20zMjdLaXhBSXY2YzYzVjdJdVQ3blk2MHdvNlZtcFJTRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964596),
('zBj6elsnVdC1EO6rS5tU5Hdljs2ISRCLjYxYB6c6', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDljM0Nxcm1LUFhMbmR4ZlJCdHFJR1Z3Y3hpRlFMTHd1WlA4MGhsWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964462),
('ZgZORuT3prbpEr654yQ8g0NJKhc55AJExjwLpVmb', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEtVbjl1TWljbzhpR3BVc3NWdlNLelU2VmFhcmVlTzY4MjhtdzVxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765964696),
('zTj1BYJhAyxBTfHLYbKiDFHBPbHmqQoTWnXILpNd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXZ5OWNPNFI3eThtcUNMbWtSZFR4NVJ1TkVqbjB5dzZKWlJVV1c0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765968817);

-- --------------------------------------------------------

--
-- Table structure for table `site_configs`
--

CREATE TABLE `site_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_ig` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `video30sstart_date` datetime DEFAULT NULL,
  `video30send_date` datetime DEFAULT NULL,
  `video240sstart_date` datetime DEFAULT NULL,
  `video240send_date` datetime DEFAULT NULL,
  `projectlinkstart_date` datetime DEFAULT NULL,
  `projectlinkend_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_configs`
--

INSERT INTO `site_configs` (`id`, `title`, `short_title`, `web`, `logo`, `favicon`, `address`, `venue`, `email`, `mobile`, `maps`, `social_fb`, `social_ig`, `social_linkedin`, `social_youtube`, `social_twitter`, `copyright`, `deadline`, `start_date`, `video30sstart_date`, `video30send_date`, `video240sstart_date`, `video240send_date`, `projectlinkstart_date`, `projectlinkend_date`, `created_at`, `updated_at`) VALUES
(1, 'NASA Space Apps Challenge 2025', 'NSAC', 'www.nsac.basis.org.bd', 'logo.png', 'favicon.png', 'BDBL Bhaban (5th Floor), 12 Karwan Bazar, Dhaka - 1215', 'American International University-Bangladesh (AIUB)', 'bsf@basis.org.bd', '16488', 'https://maps.app.goo.gl/NqMS53n7XKRUnmX27', 'https://www.facebook.com/SpaceAppsChallengeBangladesh/', '....', 'https://www.linkedin.com/company/basis-bd/', 'https://www.youtube.com/user/BASISChannel', 'https://twitter.com/BASIS_BD', '© NASA All Rights Reserved.', NULL, NULL, NULL, '2025-12-31 14:20:24', '2025-12-31 14:20:24', '2025-12-31 14:20:24', NULL, '2025-12-31 14:20:24', '2023-07-03 23:53:36', '2025-10-01 23:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint UNSIGNED NOT NULL,
  `registration_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `registration_id`, `name`, `email`, `mobile`, `created_at`, `updated_at`) VALUES
(426, 5, 'Amrito Toppo', 'nafisfuad2024@gmail.com', '+880 1972-103304', NULL, NULL),
(427, 6, 'Yasin Arafat', 'ug2102030@cse.pstu.ac.bd', '01921067682', NULL, NULL),
(428, 6, 'Noushad Bhuiyan', 'ug2102038@cse.pstu.ac.bd', '01794607051', NULL, NULL),
(429, 6, ' Hadibuzzaman  Hadi', 'ug2102060@cse.pstu.ac.bd', '01516589499', NULL, NULL),
(430, 6, 'Durjoy Das', 'ug2102019@cse.pstu.ac.bd', '01934014039', NULL, NULL),
(431, 9, 'Jannatul  Ferdous Fabin', 'codeblacklive@gmail.com', '+8801713933941', NULL, NULL),
(432, 9, 'Nusrat Zahan Sinha', 'codeblacklive@gmail.com', '+880 1332-770153', NULL, NULL),
(433, 11, 'Samara  Habib ', '252-16-047@diu.edu.bd', '01602387483', NULL, NULL),
(434, 14, 'Samin Yasar', 'saminyasarsunny@gmail.com', '01865239302', NULL, NULL),
(435, 15, 'Hassin Raihan', 'amiohossain234@gmail.com', '01518476167', NULL, NULL),
(436, 15, 'Golam Mostafa  Rabbi', 'gmrabbi91221@gmail.com', '+880 1753-547782', NULL, NULL),
(437, 15, 'Md Parvez  Hasan', 'phparvez71@gmail.com', '01304622164', NULL, NULL),
(438, 15, 'Apu Chandra  Das', 'apudas.info.contact@gmail.com', '01955200566', NULL, NULL),
(439, 15, 'Yeasir Arafat Dipu', 'arafathowlader19400@gmail.com', '01735989339', NULL, NULL),
(440, 16, 'samin yasar', 'saminyasarsunny@gmail.com', '01865239302', NULL, NULL),
(441, 16, 'rahiatul jannat', 'rahiatuljannat8134@gmail.com', '01310039521', NULL, NULL),
(442, 16, 'mazharul islam', 'saminyasarsunny@gmail.com', '01601166500', NULL, NULL),
(443, 17, 'Md Feroz Ahmed', 'ferozahmedafm@gmail.com', '01794525185', NULL, NULL),
(444, 18, 'Kazi Shoaib  Rahman', 'shoaib.mujib@gmail.com', '01614701661', NULL, NULL),
(445, 18, 'Mohammad Mehedi  Hasan', 'mahedi0983@gmail.com', '01922412105', NULL, NULL),
(446, 18, 'Turjo Saha', 'turjojps@gmail.com', '01610751504', NULL, NULL),
(447, 18, 'Yeasin  Arafath', 'yarafath2004@gmail.com', '01627024327', NULL, NULL),
(448, 19, 'Rayed Bin  Razzak', 'rayed.razzak36@gmail.com', '+880 1521-582447', NULL, NULL),
(449, 19, 'Saleh Sabit', 'salehsabitsylhet11@gmail.com', '+880 1850-470976', NULL, NULL),
(450, 19, 'Fatiha Tasnim Upoma', 'upoma2201@gmail.com', '+880 1835-348127', NULL, NULL),
(451, 19, 'Ankit Chowdhury', 'chowdhouryankit74@gmail.com', '+880 1946-740958', NULL, NULL),
(452, 20, 'Rizvi  Sarker', 'sarker2305341382@diu.edu.bd', '+880 1315-595679', NULL, NULL),
(453, 20, 'Abu Zafor', 'abuzafor2002@gmail.com', '+880 1723-391561', NULL, NULL),
(454, 21, 'Tarashankar Deb', 'tsdtarashankar@gmail.com', '01775096135', NULL, NULL),
(455, 22, 'Anindya Majumder', '357anindya@gmail.com', '01646821386', NULL, NULL),
(456, 22, 'Ahmed Abrar Zayad', 'ahmedabrarzayad@gmail.com', '01768531042', NULL, NULL),
(457, 22, 'Md Shahneous Ali', 'snasohag9@gmail.com', '01846188130', NULL, NULL),
(458, 22, 'Mohammad Sakib Hasan', 'alifsakib1@gmail.com', '01572612446', NULL, NULL),
(459, 22, 'Arka  Dutta', 'arkadutta49@gmail.com', '01820557116', NULL, NULL),
(460, 25, 'Samiul Alam', 'u2211010@student.cuet.ac.bd', '01765195142', NULL, NULL),
(461, 25, 'Habibullah  Galib', 'galibhabibullah786@gmail.com', '01749-617689', NULL, NULL),
(462, 26, 'Md. Asraful Molla', 'armdasraful@gmail.com', '+880 1889-262042', NULL, NULL),
(463, 26, 'Rasheduzzaman  Rakib', 'rasheduzzamanrakib3@gmail.com', '+880 1646-516884', NULL, NULL),
(464, 26, 'Tohidul Isla Rupok', 'tohidrupok@gmail.com', '+8801622151055', NULL, NULL),
(465, 26, 'Marjanah Afrose ', 'marjanahrafa03@gmail.com', '+8801556-401501', NULL, NULL),
(466, 26, 'Md. Mehedi Hasan', 'meetmehedi1@gmail.com', '+8801403005251', NULL, NULL),
(467, 28, 'Samior Molla Sami', 'samiormollasami@gamil.com', '01511583780', NULL, NULL),
(468, 28, 'Ibrahim Bin Sultan', 'ibrahimsultan938@gmail.com', '01617454708', NULL, NULL),
(469, 31, 'Taskin Tahira Ridma', 'taskintahira@iut-dhaka.edu', '+8801912636252', NULL, NULL),
(470, 32, 'Xyz Try', 'rianrg@gmail.com', '01700000662', NULL, NULL),
(471, 33, 'd33d 3d3d', 'whbsjh@gmail.com', '3d3d23d3d3d', NULL, NULL),
(472, 35, 'Md Tanvir Rahman', 'tanvir.rahman.contact@gmail.com', '01786614353', NULL, NULL),
(473, 35, 'Sadman Sahat   Majumder Asif', 'sadmansahatasif@gmail.com', '01601949251', NULL, NULL),
(474, 36, 'Md Sadique Hossain', 'sadique21.hossain@gmail.com', '01787978661', NULL, NULL),
(475, 36, 'Md. Najmul Hossain Nur', 'mnajmulhossainnur@gmail.com', '01743094595', NULL, NULL),
(476, 36, 'Tamjid Alam Taj', 'tamjidalamtaj96@gmail.com', '01537291068', NULL, NULL),
(477, 36, 'Md Farhan Sadik Shafin', 'sadikshafin@gmail.com', '01717523783', NULL, NULL),
(478, 36, 'Md Tanjil Hassan Sawan', 'nirjhorislam07@gmail.com', '01537189823', NULL, NULL),
(479, 37, 'Zaman Mantaka', 'mantaka35@gmail.com', '01778961590', NULL, NULL),
(480, 38, 'Md. Sanjid  Talukder', 'sanjidtalukder02@gmail.com', '01889876289', NULL, NULL),
(481, 38, 'Mst Romana  Khanom', 'romanakhanom.02@gmail.com', '0 1751328398', NULL, NULL),
(482, 38, 'Yasin  Arafat', 'yasinarafat90250@gmail.com', '01602090250', NULL, NULL),
(483, 39, 'Asif  Zaman', 'zasif855@gmail.com', '01670415337', NULL, NULL),
(484, 39, 'Robiul Hasan Jisan', 'robiulhasanjisan88@gmail.com', '01887569963', NULL, NULL),
(485, 40, 'Zannatun Nayem', 'zannatun.nayem@g.bracu.ac.bd', '01314663932', NULL, NULL),
(486, 40, ' Sadman  Islam', 'nafizahamed0464@gamil.com', '01735944963', NULL, NULL),
(487, 53, 'Sanjid Talukder', 'sanjidtalukder02@gmail.com', '01889876289', NULL, NULL),
(488, 56, 'sfsd fdsfsdf', 'masum@gmail.com', '0154354353454', NULL, NULL),
(489, 59, 'MD. Rahmatullah Ashik', 'nilantoashik@gmail.com', '01996482707', NULL, NULL),
(490, 59, 'Md. Abdullah Al Numan', 'nomansheikh2664@gmail.com', '01627272664', NULL, NULL),
(491, 59, 'Tahsin Rahman Orpon', 'orponwolf10@gmail.com', '01620615394', NULL, NULL),
(492, 59, 'Homaira Khanom Sara', 'homairasara9@gmail.com', '01810522380', NULL, NULL),
(493, 64, 'Samiya Mehedi Kazi', 'samiyamehedi01@gmail.com', '01941066898', NULL, NULL),
(494, 67, 'Redowan Tanvir  Shifat', 'redowantanvirshifat@gmail.com', '+880 1522-140865', NULL, NULL),
(495, 68, 'Ahabab Imtiaz Risat', 'ahababimtiaz@iut-dhaka.edu', '+8801840141094', NULL, NULL),
(496, 68, 'Tasnim Ashraf', 'tasnimashraf@iut-dhaka.edu', '+8801608873666', NULL, NULL),
(497, 69, 'Zisan Ul Haque', 'mdzisanulhaque989@gmail.com', '01787015981', NULL, NULL),
(498, 69, 'Ashikur  Rahman', 'ashikurrahman3060@gmail.com', '0 1771-501254', NULL, NULL),
(499, 69, 'Fahim  Foysal', '210143.cse@student.just.edu.bd', '01928541335', NULL, NULL),
(500, 72, 'Ayesha Akter Rimi', 'ayesharimi296@gmail.com', '01748616881', NULL, NULL),
(501, 72, 'Rizwanul  Kafi', 'rizwanulkafi2003@gmail.com', '01710265574', NULL, NULL),
(502, 72, 'Md. Sai Mon  Hasan Emon', 'saimonemon46@gmail.com', '01622015799', NULL, NULL),
(503, 75, 'Arman Shuvo', 'armanhossainshuvo25@gmail.com', '01577266342', NULL, NULL),
(504, 76, 'Md. Kaisarul Islam Estey', 'shahesteyislam999@gmail.com', '01798401617', NULL, NULL),
(505, 76, 'Tahmid Khan', 'tahmidkhan249@gmail.com', '01712689995', NULL, NULL),
(506, 76, 'Md. Atiqur Rahman', 'rahmanatikofc@gmail.com', '01304641457', NULL, NULL),
(507, 76, 'Fahim Faiaz Adib', 'fahimfaiazadib@gmail.com', '01537679319', NULL, NULL),
(508, 82, 'Navil   Hossain Chowdhury', 'navilhchowdhury@gmail.com', '01990364458', NULL, NULL),
(509, 82, 'Nafis Kamal Zisan', 'nafis.kamal.zisan@g.bracu.ac.bd', '01303634392', NULL, NULL),
(510, 82, 'Md. Shafiul  Basher', 'md.shafiul.basher@g.bracu.ac.bd', '01747214009', NULL, NULL),
(511, 82, 'Israt Jahan Esha', 'israt.jahan.esha@g.bracu.ac.bd', '01309549099', NULL, NULL),
(512, 87, 'MAHDIN MUKIM', 'mahdinmukim575@gmail.com', '01682403336', NULL, NULL),
(513, 88, 'Habibullah Sharif', 'bye@habibullah.dev', '01329876070', NULL, NULL),
(514, 88, 'Yousuf  Abdullah', 'yousufabdullah0001@gmail.com', '01301794054', NULL, NULL),
(515, 88, 'Riazul Rocky', 'riazulrocky@gmail.com', '01726438566', NULL, NULL),
(516, 88, 'Mahadin Rocky', 'mahdinmukim575@gmail.com', '01682403336', NULL, NULL),
(517, 89, 'HABIBULLAH SHARIF', 'hi@habibullah.dev', '+8801329876070', NULL, NULL),
(518, 89, 'MAHDIN MUKIM', 'mahdinmukim575@gmail.com', '+8801682403336', NULL, NULL),
(519, 89, 'Yousuf  Abdullah', 'yousufabdullah0001@gmail.com', '+8801301794054', NULL, NULL),
(520, 89, 'Rezaul Rocky', 'riazulrocky@gmail.com', '+8801726438566', NULL, NULL),
(521, 91, 'Sakibul Hassan Shovon', 'sakibulhassan.shovon@gmail.com', '01687330245', NULL, NULL),
(522, 91, 'Pabak Dev', 'dev.pabak@gmail.com', '01618116916', NULL, NULL),
(523, 91, 'Md Iftekhar  Zawad', 'md.iftekharzawad@gmail.com', '01318474162', NULL, NULL),
(524, 92, 'Farhan Tanvir  Ayon', 'ayonburg@gmail.com', '01747555154', NULL, NULL),
(525, 93, 'Rafsan Jani Bin Islam', 'irafsan2020@gmail.com', '01926878712', NULL, NULL),
(526, 93, 'Md. Sium', 'mdsium2004@gmail.com', '01953609265', NULL, NULL),
(527, 93, 'Abdullah Siham Rahman', 'abdullahsiham31602@gmail.com', '01998079515', NULL, NULL),
(528, 93, 'Md. Abdullah Al Mamun Tanvir', 'tanvirmamun82@gmail.com', '01577088591', NULL, NULL),
(529, 93, 'Md. Farhan Sadik', 'farhansadik71883@gmail.com', '01706520645', NULL, NULL),
(530, 94, 'kishor paul', 'kishorpaul1594@gmail.com', '01707345615', NULL, NULL),
(531, 94, 'Adnan Osman  Aournub', 'adnanosman137m@gmail.com', '01602658753', NULL, NULL),
(532, 96, 'Munirah Bintee Mijan', 'munirahmi76@gmail.com', '+880 1846-773353', NULL, NULL),
(533, 96, 'Nusrat  Jahan', 'nusraturmi335@gmail.com', '+880 1613-521336', NULL, NULL),
(534, 96, 'Abid Hasan', 'abidhasan7116@gmail.com', '01710024924', NULL, NULL),
(535, 96, 'Jarin Tasnim', 'jarintasnim1060@gmail.com', '01726943322', NULL, NULL),
(536, 101, 'Md Fahim', 'shakib37767.0@gmail.com', '01923882021', NULL, NULL),
(537, 106, 'Shafin Mahamud', 'shafin.mahamud.95@gmail.com', '+8801533764560', NULL, NULL),
(538, 106, 'Mayen Shahriar  Kabir', 'mayen.shahriar.kabir@g.bracu.ac.bd', '0199916204', NULL, NULL),
(539, 106, 'Eshtiak Ahmed Badhon', 'eshtiak.ahmad.badhon@g.bracu.ac.bd', '01737796821', NULL, NULL),
(540, 110, 'Choyon  Dhor', 'choyondhorshuvo@gmail.com', '01824849109', NULL, NULL),
(541, 111, 'Rhyme Rayyan', 'rhymerayyan39@gmail.com', '01886210186', NULL, NULL),
(542, 111, 'Istiak Nafil', 'rhymerayyan39@gmail.com', '01886210186', NULL, NULL),
(543, 112, 'Md Shamimul Haque Haque', 'shamimulhp@gmail.com', '+880 1714-202023', NULL, NULL),
(544, 112, 'Shaikh  Mobashshira', 'shaikhmobashshira@gmail.com', '+880 1885-683876', NULL, NULL),
(545, 116, 'Saffat Jahan Soron', 'shamsuddinpk828@gmail.com', '+8801749976181', NULL, NULL),
(546, 117, 'Shafqat Nawaz Chowdhury', 'shafqatnawazchy@gmail.com', '01531801651', NULL, NULL),
(547, 117, 'Md. Atiqur  Rahman', 'mdatiqurrahman.1010@gmail.com', '01846967264', NULL, NULL),
(548, 122, 'Rubayet Hossain', 'rubayet123@gmail.com', '01234567890', NULL, NULL),
(549, 122, 'Ishrat Jahan', 'ishrat123@gmail.com', '01234567890', NULL, NULL),
(550, 123, 'Rubayet Hossain', 'rubayet123@gmail.com', '01234567890', NULL, NULL),
(551, 123, 'Ishrat Jahan', 'ishrat123@gmail.com', '01234567890', NULL, NULL),
(552, 125, 'Mahjabin Mahi Prapty', 'mahjabinmahi5m@gmail.com', '01302149558', NULL, NULL),
(553, 126, 'Shaker Islam', 'shaker.islam@g.bracu.ac.bd', '01715880257', NULL, NULL),
(554, 127, 'Sezan Mahfuj  Rigan', 'talhamayaz@gmail.com', '01874039889', NULL, NULL),
(555, 129, 'Anika Rahman Astha', 'aniakaastha@gmail.com', '+880 13 0339 8873', NULL, NULL),
(556, 130, 'Dibakor  Pramanik ', 'dibakorpramanik007@gmail.com', '01872770113', NULL, NULL),
(557, 130, 'Md. Johir Khan Tonmoy ', 'johirjj7415@gmail.com', '01709425428', NULL, NULL),
(558, 131, 'Mst. Marina  Akhter', 'marina.vucse@gmail.com', '01575438108', NULL, NULL),
(559, 131, 'Reefat Tarannum', 'aunimatalukder68@gmail.com', '01796944533', NULL, NULL),
(560, 131, 'Prethvi Hasan', 'preetthees@gmail.com', '01318643563', NULL, NULL),
(561, 131, 'MST. Sohely', 'sohely106@gmail.com', '01311957106', NULL, NULL),
(562, 131, 'Md Nazmul Huda Hridoy ', 'hridoyn75@gmail.com', '01790789674', NULL, NULL),
(563, 132, 'Md.Muntasir  Raiyan', 'muntasirraiyan5555@gmail.com', '01859014774', NULL, NULL),
(564, 132, 'Soumik Roy  Kabbo', 'masud71rana@gmail.com', '01540587436', NULL, NULL),
(565, 133, 'Ankon Ahamed', 'ankonahamed@iut-dhaka.edu', '01315206061', NULL, NULL),
(566, 133, 'Mohammed Taimum', 'taimum@iut-dhaka.edu', '01846194118', NULL, NULL),
(567, 133, 'Faheem Rahman', 'fahimrahman@iut-dhaka.edu', '01612038229', NULL, NULL),
(568, 133, 'Jobayar  Rahman Rafy', 'jobayarrahman@iut-dhaka.edu', '01818664754', NULL, NULL),
(569, 134, 'Abir Shan', 'alfirahman@gmail.com', '01736990652', NULL, NULL),
(570, 135, 'Hasibur Rahaman Molla', 'hrm25cse@gmail.com', '01909519862', NULL, NULL),
(571, 135, 'MD  Sajedur Rahman', 'mdsajedurrahman9820@gmail.com', '01778019820', NULL, NULL),
(572, 135, 'Safi Al Sadi Chowdhury ', 'sadisafi480@gmail.com', '01603105189 ', NULL, NULL),
(573, 135, 'Md.  Sazed Ahammed', 'sazedahammed5@gmail.com', '01316870568', NULL, NULL),
(574, 136, 'Kausar Ahmed', 'kausarahmed2nd@gmail.com', '01521763694', NULL, NULL),
(575, 137, 'Md sadikuzzahan  Sadik', 'ialif3299@gmail.com', '01400867827', NULL, NULL),
(576, 137, 'Md Jawadur Rahman ', 'sadikuzzahansadik@gmail.com', '+880 1328-903031', NULL, NULL),
(577, 138, 'Roufur Rahim  Hanjala', 'roufurrahim@iut-dhaka.edu', '01973303483', NULL, NULL),
(578, 138, 'Mir Mushfiq Rahman Ramim', 'mushfiqramim@iut-dhaka.edu', '+880 1550-522770', NULL, NULL),
(579, 139, 'MD. Adnan Sami', 'theadnansami@gmail.com', '01580272476', NULL, NULL),
(580, 140, 'Md. Saidul  Islam', 'u2102037@student.cuet.ac.bd', '01770175883', NULL, NULL),
(581, 140, 'Debarati Chakraborty', 'u2102003@student.cuet.ac.bd', '+880 1875-647791', NULL, NULL),
(582, 140, 'Samin  Yeasar', 'u2102073@student.cuet.ac.bd', '+880 1646-175892', NULL, NULL),
(583, 140, 'Parthasarathi Goswami', 'u2102078@student.cuet.ac.bd', '01832640029', NULL, NULL),
(584, 142, 'S.M. Abtahi Noor', 'smabtahinoor@gmail.com', '01408719628', NULL, NULL),
(585, 142, 'Farhan Ishmam', 'ishmamf09@gmail.com', '01715913513', NULL, NULL),
(586, 143, 'M. Farhan Tanvir', 'farhantanvir277@gmail.com', '01686093702', NULL, NULL),
(587, 143, 'Ahnaf  Zakaria', 'ahnafzakaria88@gmail.com', '01741482281', NULL, NULL),
(588, 143, 'Mujtahidul Hasan Sami', 'mujtahidulhasansami@gmail.com', '01933021307', NULL, NULL),
(589, 143, 'Anindya Debnath Ani', 'anindyadebnathani@gmail.com', '01740866707', NULL, NULL),
(590, 143, 'Farhan Sadeque', 'farhansad84@gmail.com', '01307726701', NULL, NULL),
(591, 145, 'Priom Halder', 'priomhalder1470@gmail.com', '01728167993', NULL, NULL),
(592, 145, 'Ariyan  Hossain ', 'ariyan.hossain1@g.bracu.ac.bd', '01631451833', NULL, NULL),
(593, 145, 'Fatir  Ahmed ', 'fatir.ahmed.bhuiyan@g.bracu.ac.bd', '01868991533', NULL, NULL),
(594, 145, 'Irtifa Raad', 'iiraad341@gmail.com', '01559203981', NULL, NULL),
(595, 146, 'Sadia  Hossain', 'sadiahossain.cse.114@gmail.com', '01402518854', NULL, NULL),
(596, 146, 'Nasir  Khan', 'nk059486@gmail.com', '01968059486', NULL, NULL),
(597, 146, 'Sk. Md.  Shiam', 'smshiam128@gmail.com', '01883523160', NULL, NULL),
(598, 147, 'Md. Nahid Hossain', 'nahidhossianofficial14@gmail.com', '01859232959', NULL, NULL),
(599, 147, 'Munira Khondoker ', 'munirakhondokar018@gmail.com', '+8801876541001', NULL, NULL),
(600, 147, 'Sanjid Hasan  Jisan', 'shzisun123@gmail.com', '+880 1537-284797', NULL, NULL),
(601, 147, 'Anisur Rahman', 'anisurerahaman06@gmail.com', '+8801616414541', NULL, NULL),
(602, 147, 'Anisur Rahman', 'anisurerahaman06@gmail.com', '+8801616414541', NULL, NULL),
(603, 150, 'Leyakat Ali Patwary', 'leyakataliliton@gmail.com', '01813850559', NULL, NULL),
(604, 150, 'Farzana Akter Mily', 'farzanamily272@gmail.com', '01584013938', NULL, NULL),
(605, 151, 'Md Mahbub-Ur-Rashid', 'mash12mahbub@gmail.com', '01568194404', NULL, NULL),
(606, 151, 'Fahim Hasan', 'hasanfahim0101@gmail.com', '01775104089', NULL, NULL),
(607, 152, 'Marjana Sultana   Aurthee', 'msa050861@gmail.com', '01540574962', NULL, NULL),
(608, 152, 'Sadik Ahmed  Talukdar', 'sadik.ahmed.talukdar.1@gmail.com', '01533562991', NULL, NULL),
(609, 152, 'Protiva   Datta', 'protiva471@gmail.com', '01880779133', NULL, NULL),
(610, 152, 'Minhajul Islam    Rifat', 'minhajulislamrifat43@gmail.com', '01988935650', NULL, NULL),
(611, 153, 'Md Robiul  Islam', 'robiul.cse.jstu@gmail.com', '01744386289', NULL, NULL),
(612, 153, 'Debbroto Kumar Karmokar', 'debkk10@gmail.com', '01745532992', NULL, NULL),
(613, 153, 'Md Akash  Mia', 'khoakash3@gmail.com', '01317960630', NULL, NULL),
(614, 153, 'Himel Sarder', 'info.himelcse@gmail.com', '01911884114', NULL, NULL),
(615, 153, 'Md Jobayer  Hossen', 'jobayer147030@gmail.com', '01315221050', NULL, NULL),
(616, 154, 'Tanveer  Mahmood', 'tanveermofficial@gmail.com', '01312523264', NULL, NULL),
(617, 154, 'Refat Ahmed', 'refatahmed@iut-dhaka.edu', '01742546849', NULL, NULL),
(618, 154, 'Mashrufa Mehnaz', 'mashrufamehnaz@gmail.com', '01552804601', NULL, NULL),
(619, 155, 'Mohammad Irfan', 'irfanmd.im97@gmail.com', '01400748802', NULL, NULL),
(620, 155, 'Abdur Rahman Fahad', 'fahadar021@gmail.com', '01966570914', NULL, NULL),
(621, 155, 'Maria Nusrat', 'marianusrat.tonu34@gmail.com', '01317894732', NULL, NULL),
(622, 156, 'Md.Tohidul  Islam', 'touhid0503@gmail.com', '01840760926', NULL, NULL),
(623, 156, 'Most Fahmida Rahman', 'fahmidarahman5423@gmail.com', '01636281176', NULL, NULL),
(624, 159, 'Kamrul  Islam', 'mdtuhinislam4200@gmail.com', '01798174478', NULL, NULL),
(625, 162, 'Md. Shahriar Jubair Mahim', 'shahriarjubair27@gmail.com', '01839997329', NULL, NULL),
(626, 162, 'Princh Mahmud Rifat', 'ce22018@mbstu.ac.bd', '01779442942', NULL, NULL),
(627, 162, 'Shaiekh Zayed Bin Hasan', 'zayed7h2@gmail.com', '01521747946', NULL, NULL),
(628, 163, 'Taqi Ismail Mohammad', 'taqiismail10@gmail.com', '01605779618', NULL, NULL),
(629, 163, 'Aong Cho Thing Marma', 'aongcho880@gmail.com', '01876660187', NULL, NULL),
(630, 163, 'Samia Mahbub', 'samiamahbub638@gmail.com', '01758287235', NULL, NULL),
(631, 163, 'Imtiaj  Bin Aoual', 'imtiajbinaoual@gmail.com', '01624604980', NULL, NULL),
(632, 164, 'Juairia  Apsara', 'juairiaapsara@gmail.com', '+8801344996989', NULL, NULL),
(633, 164, 'Md Wahiduzzaman Leon', 'wahiduzzamanleonmd@gmail.com', '+8801762829705', NULL, NULL),
(634, 164, 'Md Ashikur Rahman', 'ashikur.ayon190@gmail.com', '+880 1753-612707', NULL, NULL),
(635, 167, 'Md. Imranul Haque Niloy', 'mdimranulhaqueniloy@gmail.com', '01907980177', NULL, NULL),
(636, 167, 'Fahima Kabir', 'fahimakabir320@gmail.com', '01608002658', NULL, NULL),
(637, 167, 'Md. Ibrahim Shake Siam', 'ssiam169@gmail.com', '01318695524', NULL, NULL),
(638, 167, 'Sabiha Sultana Nowrin', 'sabihanowrin104@gmail.com', '01934616586', NULL, NULL),
(639, 167, 'Sadia Sikder', 'sadiasikder108@gmail.com', '01970360146', NULL, NULL),
(640, 169, 'aaaa aaa', 'aa@gmail.com', '01647249242', NULL, NULL),
(641, 170, 'MD.Mukaddimul Haque Muneem', 'mukaddimulmunna@gmail.com', '01876343423', NULL, NULL),
(642, 170, 'Maliha  Tarannum', 'tarannummaliha732@gmail.com', '01718008423', NULL, NULL),
(643, 170, 'S. M. Hasinur  Rahman', 'hasinurrahman.me@gmail.com', '01518914773', NULL, NULL),
(644, 170, 'Md Abir Hosen  Joy', 'abir.hosen19.4ahj@gmail.com', '01301449900', NULL, NULL),
(645, 171, 'Shihab Shariar', 'shihabshahriar543@gmail.com', '01744915011', NULL, NULL),
(646, 171, 'Fahad Akash', 'fahad12345ff8@gmail.com', '01988310215', NULL, NULL),
(647, 171, 'Shariar  Bin Sajjad ', 'sbsalvi500@gmail.com', '01745434138', NULL, NULL),
(648, 172, 'Syed Naveed Mahmood', 'syed.naveed.mahmood@g.bracu.ac.bd', '01811287880', NULL, NULL),
(649, 172, 'Md. Sameer Sakib', 'Md.Sameer.Sakib@g.bracu.ac.bd', '01611726337', NULL, NULL),
(650, 172, 'Md. Sameer Sakib', 'Md.Sameer.Sakib@g.bracu.ac.bd', '01611726337', NULL, NULL),
(651, 173, 'Bappa  Saha', 'bappasahacse0@gmail.com', '01719369990', NULL, NULL),
(652, 173, 'Krishna Sinha', 'ksinhaanan1@gmail.com', '01322971595', NULL, NULL),
(653, 173, 'Tuli  Madhu', 'tulimadhu16@gmail.com', '01645946205', NULL, NULL),
(654, 173, 'Tusar  Ghosh', 'tusar.sidd@gmail.com', '01713797188', NULL, NULL),
(655, 178, 'Darun Nayeem', 'bsse1641@iit.du.ac.bd', '+8801748474949', NULL, NULL),
(656, 178, 'MD. Tamim Hossen', 'bsse1650@iit.du.ac.bd', '+8801572914245', NULL, NULL),
(657, 178, 'MD. Ibrahim Al Riad', 'mdibrahim-2023616910@infs.du.ac.bd', '+8801600930935', NULL, NULL),
(658, 178, 'Khaza Asif Karim', 'shromi3.14@gmail.com', '+8801521782765', NULL, NULL),
(659, 181, 'Mohosina Islam  Disha', 'mohosina5958@gmail.com', '+8801853165583', NULL, NULL),
(660, 182, 'Md. Arif Shahriar', '252-15-470@diu.edu.bd', '01842672865', NULL, NULL),
(661, 182, 'Md Al Zaber Shohan', '252-15-820@gmail.com', '01620420506', NULL, NULL),
(662, 183, 'Farhana  Ahmed', 'farhanaahmad2000@gmail.com', '01868962261', NULL, NULL),
(663, 183, 'Rishat bin Iqbal', 'rishatbiniqbal26@gmail.com', '01868962261', NULL, NULL),
(664, 184, 'Turya Biswas ', 'bsse1507@iit.du.ac.bd', '01751285949', NULL, NULL),
(665, 185, 'Salekin Imran', 'abir045@gmail.com', '01300663239', NULL, NULL),
(666, 185, 'Rashedul  Huq', 'techbabu@gmail.com', '01670072752', NULL, NULL),
(667, 186, 'Suprava Saha  Dibya', 'suprava.dibya@gmail.com', '01869743080', NULL, NULL),
(668, 186, 'Asir Abrar Tonish', 'asirabrar789@gmail.com', '01920213268', NULL, NULL),
(669, 186, 'Abdulla Al  Noman', 'abdulla.al.noman.2025@gmail.com', '01721556113', NULL, NULL),
(670, 186, 'MD Shahriar  Hossain ', 'shafim1638@gmail.com', '01906127394', NULL, NULL),
(671, 186, 'Naimur Islam  Navid', 'Naimurislam707@gmail.com', '01712188292', NULL, NULL),
(672, 187, 'SADI MAHMUD NAHIN', 'smnahin1111@gmail.com', '01712041690', NULL, NULL),
(673, 189, 'Rakat-E-Jannat Raka', 'rjannat1311@gmail.com', '01704872124', NULL, NULL),
(674, 189, 'Tanvir  Ahmed', 'tanvir090100@gmail.com', '01796-963621', NULL, NULL),
(675, 189, 'Hasib Hossain Abir', 'abir4dev@gmail.com', '01819525640', NULL, NULL),
(676, 190, 'Ibsan hossain Ansari', 'Ibsan.hossain.ansari@g.bracu.ac.bd', '01929980461', NULL, NULL),
(677, 190, 'Jawadul Arham', 'jawadul.arham@g.bracu.ac.bd', '01872181761', NULL, NULL),
(678, 191, 'Mst. Rubaia Raihan', 'rubaia2003@gmail.com', '01863496168', NULL, NULL),
(679, 191, 'Md Jakirul Islam Jakir', 'farhanibnerofiq02@gmail.com', '01874648472', NULL, NULL),
(680, 191, 'Md. Yeasir Arafat', 'ya1952427@gmail.com', '01731099287', NULL, NULL),
(681, 192, 'Sumaiya  Akhtar', 'sumaiya.akhtar@g.bracu.ac.bd', '01401494526', NULL, NULL),
(682, 192, 'Arwa Ahsan', 'sk.arwa.ahsan@bracu.ac.bd', '01762351139', NULL, NULL),
(683, 192, 'Nabilah Nawsheen Nafi ', 'nabilah.nawsheen.nafi@bracu.ac.bd', '01845-841254', NULL, NULL),
(684, 192, 'Syeda Fabiayee Jahan', 'syeda.fabiayee.jahan@bracu.ac.bd', '01736-985866', NULL, NULL),
(685, 195, 'Md. Shahin Akhtar Rupom', 'web.rupom@gmail.com', '+8801521553030', NULL, NULL),
(686, 195, 'Farhan Ahmed', 'farhanahmed2103.bd@gmail.com', '+8801849315117', NULL, NULL),
(687, 196, 'Nishan Das', 'nishandas655@gmail.com', '01867568689', NULL, NULL),
(688, 196, 'S.M Mohaimenul  Islam', 'mohaimenul.bluedot@gmail.com', '01788269537', NULL, NULL),
(689, 196, 'Avijit Mondal', 'avijit2019mondal@gmail.com', '01855512502', NULL, NULL),
(690, 196, 'Mohatamin Haque', 'mohatamimhaque@outlook.com', '01518749114', NULL, NULL),
(691, 196, 'Md. Siam  Shaek', 'siamduetstudent@gmail.com', '01770459588', NULL, NULL),
(692, 197, 'Raduan Azim Rahik', 'azim.rahik757@gmail.com', '01708588577', NULL, NULL),
(693, 197, 'Fayem Muktadir  Rahman', 'fayem13424drmc@gmail.com', '01750173883', NULL, NULL),
(694, 197, 'Mihsan Bin  Maksud', 'mdmihsanbinmaksud@gmail.com', '+880 1818-791345', NULL, NULL),
(695, 197, 'Nusrat Hasan', 'nusrat042019@gmail.com', ' 01886645736 ', NULL, NULL),
(696, 197, 'Arnab  Ghosh', 'arnabghosh0258@gmail.com', ' 01858377670', NULL, NULL),
(697, 198, 'Takia Yasmin', 'takia0001@std.bdu.ac.bd', '01992433516', NULL, NULL),
(698, 199, 'Raduan Azim Rahik', 'azim.rahik757@gmail.com', '01708588577', NULL, NULL),
(699, 199, 'Fayem Muktadir Rahman', 'fayem13424drmc@gmail.com', '01750173883', NULL, NULL),
(700, 199, 'Mohammad Mihsan Bin Maksud', 'mdmihsanbinmaksud@gmail.com', '+880 1818-791345', NULL, NULL),
(701, 199, 'Nusrat  Hasan', 'nusrat042019@gmail.com', ' 01886645736 ', NULL, NULL),
(702, 199, 'Arnab   Ghosh', 'arnabghosh0258@gmail.com', ' 01858377670', NULL, NULL),
(703, 203, 'Omar Faruk Fahim', 'omarfaruqfahim007@gmail.com', '01924091881', NULL, NULL),
(704, 203, 'Minhazur Rahman Maruf', 'maruf.1.minhaz@gmail.com', '01840475296', NULL, NULL),
(705, 203, 'Sultan Ahmmed', 'sultanahmmed.cs@gmail.com', '01771785451', NULL, NULL),
(706, 203, 'Muhammad Nazmus Sakib', 'muhammadnazmussakib.bd@gmail.com', '01785929003', NULL, NULL),
(707, 203, 'Fazla Rabbi', 'contact.fazla@gmail.com', '01715784403', NULL, NULL),
(708, 204, 'Shams  Simanto ', 'shams.hossain.simanto@gmail.com', '01689590738', NULL, NULL),
(709, 204, 'Mosharaf Hossain Apurbo', 'mosharaf.apurbo57@gmail.com', '+8801711127583', NULL, NULL),
(710, 204, 'Niloy Kumar Mondal', 'nkm2105044@gmail.com', '01792023909', NULL, NULL),
(711, 204, 'Jonayed  Mohiuddin', 'jonayedmohiuddin@gmail.com', '01838380474', NULL, NULL),
(712, 205, 'MD. Adnan Sami', 'adnansami21@iut-dhaka.edu', '01580272476', NULL, NULL),
(713, 205, 'Ishtiaq Ahmed Zamal', 'ishtiaqahmed21@iut-dhaka.edu', '01856082052', NULL, NULL),
(714, 205, 'Tahmid Kawser Washee', 'tahmidkawser@iut-dhaka.edu', '01866440311', NULL, NULL),
(715, 205, 'Tanvir  Kabir', 'tanvirkabirrahib2@gmail.com', '01840063689', NULL, NULL),
(716, 205, 'Mohammad Soad Chowdhury', 'soadmd2003@gmail.com', '01537758404', NULL, NULL),
(717, 207, 'Parvej Shah', 'parvejshahlabib007@gmail.com', '01516538025', NULL, NULL),
(718, 207, 'Saikat Islam', 'bsse1629@iit.du.ac.bd', '01521771653', NULL, NULL),
(719, 207, 'Md. Omur Faruque Talukder', 'omurfaruquetalukder9@gmail.com', '+880 1581-452083', NULL, NULL),
(720, 207, 'Afif Hassan', 'bsse1615@iit.du.ac.bd', '01522141158', NULL, NULL),
(721, 208, 'Ishmam Tasdik  Zihad', 'ishmamtasdik315@gmail.com', '01625477847', NULL, NULL),
(722, 208, 'Shahil Mahmud Roktim', 'shahilroktim@gmail.com', '01625477847', NULL, NULL),
(723, 210, 'Md. Saiduzzaman', '223311068.cse.vu@gmail.com', '01767270092', NULL, NULL),
(724, 210, 'Mst. Rotna Khatun', 'rotna1104@gmail.com', '01908483991', NULL, NULL),
(725, 210, 'Fe Innal Jannati Iqra', 'iqra200204@gmail.com', '01792694655', NULL, NULL),
(726, 210, 'Asifa Afrin Api', 'a.a.aupi03@gmail.com', '01715319371', NULL, NULL),
(727, 211, 'Md Abu Talha', 'talhatiu567210@gmail.com', '01336910988', NULL, NULL),
(728, 212, 'Robi Hossen', 'robiroy585@gmail.com', '01912320797', NULL, NULL),
(729, 212, 'Baker Hossen', 'mdbaker243@gmail.com', '+880 1981-231963', NULL, NULL),
(730, 212, 'Sanzida Tazin Arafa', 'sanzidatazinarafa@gmail.com', '+880 1403-894542', NULL, NULL),
(731, 212, 'Ananna Rayhan', 'ananna017122@gmail.com', '01981231963', NULL, NULL),
(732, 212, 'Raziur Alam', 'muhammad.razi.x11@gmail.com', '+880 1304-189251', NULL, NULL),
(733, 214, 'Nawriz Turjo', 'nawrizaturjo03@gmail.com', '01569179967', NULL, NULL),
(734, 214, 'Sayjad Rahman', 'sayjadrahman@gmail.com', '01928912679', NULL, NULL),
(735, 214, 'Sajid Hasan', 'ahmedsajidhashan@gmail.com', '01400077552', NULL, NULL),
(736, 215, 'Fahim Abdullah', 'fahimabdullah45456@gmail.com', '01772178675', NULL, NULL),
(737, 215, 'Tamzid Enam', '242311278@vu.edu.bd', '01610076825', NULL, NULL),
(738, 215, 'Sabbir Ahmed', '242311270@vu.edu.bd', '01797919500', NULL, NULL),
(739, 219, 'Anik  dey', 'anikd1452@gmail.com', '01792184574', NULL, NULL),
(740, 220, 'Nokibul Hasan Mojumder Tasir', 'nokibulofficial18@gmail.com', '+8801975725361', NULL, NULL),
(741, 220, 'Md. Hasibul Haque', 'imhasib777@gmail.com', '+8801400202667', NULL, NULL),
(742, 220, 'Ruhin Arman Omi', 'ruhinarmanomi@gmail.com', '+8801939426952', NULL, NULL),
(743, 220, 'Shahriar Khan Sakib', 'sakibshahriarkhan.88@gmail.com', '+8801971172746', NULL, NULL),
(744, 222, 'Nadim Shahriar Apurbo', 'nadimshahriarapurbo@gmail.com', '01716909892', NULL, NULL),
(745, 222, 'Md Nur Ahmad', '06nurahmed@gmail.com', '01575056952', NULL, NULL),
(746, 222, 'Sabbir Ahmed Shameem', 'adibrayhan1122@gmail.com', '01886772094', NULL, NULL),
(747, 222, 'Mst. Soniya  Akter ', 'aalillsadik6@gmail.com', '01571337059', NULL, NULL),
(748, 223, 'Samira  Karim', 'samirakarim24@gmail.com', '01939459281', NULL, NULL),
(749, 224, 'Farhan Rahman', 'farhanrahman1985@gmail.com', '01813102490', NULL, NULL),
(750, 224, ' S. M.  Fayez Ahmed', 'fayezah1010@gmail.com', '01784437381', NULL, NULL),
(751, 224, 'Samiya  Akhand', 'samia12921@gmail.com', '01540219805', NULL, NULL),
(752, 224, 'Nayem Hasan  BIjoy', 'fayezahmed7075@gmail.com', '01516533307', NULL, NULL),
(753, 225, 'Abir Kolin', 'knkolin9@gmail.com', '01518603740', NULL, NULL),
(754, 225, 'Md Soroar Jahan', 'soroarjahan17@gmail.com', '01755855082', NULL, NULL),
(755, 225, 'Farhan Mahmud', 'mahmudkhanfarhan2001@gmail.com', '01856406497', NULL, NULL),
(756, 226, 'Abir  Chandra das', 'abird8398@gmail.com', '01715225314', NULL, NULL),
(757, 226, 'Jobayer Mansur Mufti', 'jmmufti2001@gmail.com', '01317873994', NULL, NULL),
(758, 226, 'Md. Rashedul   Islam', 'rashedul16801@gmail.com', '01876808963', NULL, NULL),
(759, 226, 'Fazle Rabby', 'rabbyfazle101234@gmail.com', '01584093516', NULL, NULL),
(760, 227, 'SOROAR AZMIR ALIF', 'soroarazmiralif@gmail.com', '01839397131', NULL, NULL),
(761, 227, 'Ebtehaj Ahmed Ratul', 'ratulea500@gmail.com', '01722818829', NULL, NULL),
(762, 227, 'Md Fahim Gazi', 'gazifahim78@gmail.com', '01683860579', NULL, NULL),
(763, 228, 'Muhammad  Bin Hafiz', 'muhammadbinhafiz24@gmail.com', '01641969845', NULL, NULL),
(764, 228, 'Samira Karim', 'samirakarimsara135@gmail.com', '01875893659', NULL, NULL),
(765, 228, 'Sajid Sarkar', 'md.sajid.sarkar.34@gmail.com', '01618877370', NULL, NULL),
(766, 228, 'MD. ABU JOR', 'hemonto2005@gmail.com', '01646903740', NULL, NULL),
(767, 228, 'Abid Faysal', 'abidfaysal048@gmail.com', '01947344540', NULL, NULL),
(768, 229, 'MD. TANVIR ISLAM SOURAV', 'tanvirislam0203@gmail.com', '01798488256', NULL, NULL),
(769, 230, 'Aayan Fardin', 'hse.shafiqul@gmail.com', '01713039576', NULL, NULL),
(770, 230, 'Afeef Masood', 'hse.shafiqul@gmail.com', '01713039576', NULL, NULL),
(771, 231, 'Koron  Chowdhury ', 'koron105mu@gmail.com', '+880 1753-916614', NULL, NULL),
(772, 232, 'Rashik Raihan', 'rashikraihan8@gmail.com', '01909160775', NULL, NULL),
(773, 232, 'Prottoy Paul', 'bsse1613@iit.du.ac.bd', '01817889286', NULL, NULL),
(774, 232, 'Mithila Paul', 'bsse1633@iit.du.ac.bd', '01715840989', NULL, NULL),
(775, 233, 'Mominul Islam', 'mominulislamlavlu@gamil.com', '01728195337', NULL, NULL),
(776, 233, 'Md. Uzzal', 'uzzalhasan7878@gmail.com', '01612822325', NULL, NULL),
(777, 233, 'Kamaruzzaman  Maruf', 'kamaruzzamanmaruf109@gmail.com', '01329543754', NULL, NULL),
(778, 233, 'Md.Talha  Taseen', 'talhataseen444@gmail.com', '01707654995', NULL, NULL),
(779, 233, 'Israt Ara  Eva', 'evaisrat2003@gmail.com', '+8801958374799', NULL, NULL),
(780, 234, 'Uzzal ahommed', 'mominulislamlavlu@gamil.com', '01728195337', NULL, NULL),
(781, 235, 'Mominul Islam', 'ce22016@mbstu.ac.bd', '01308232417', NULL, NULL),
(782, 235, 'Md.Talha  Taseen', 'ce22036@mbstu.ac.bd', '01707654995', NULL, NULL),
(783, 235, 'Kamaruzzaman  Maruf', 'kamaruzzamanmaruf109@gmail.com', '01329543754', NULL, NULL),
(784, 235, 'Md. Uzzal', 'uzzalhasan7878@gmail.com', '01612822325', NULL, NULL),
(785, 235, 'Israt Ara  Eva', 'evaisrat2003@gmail.com', '+8801958374799', NULL, NULL),
(786, 237, 'Abir  Ben Jaman ', 'abirbenjamanofficial@gmail.com', '01600204257', NULL, NULL),
(787, 237, 'Nirob  Patowary', 'khelabalok420@gmail.com', '01610253133', NULL, NULL),
(788, 238, 'N/A N/A', 'N/A', 'N/A', NULL, NULL),
(789, 238, 'MD. Shafiur  Rahman', 'shafiurshuvo329@gmail.com', '01832255775', NULL, NULL),
(790, 238, 'Imtiaz Ahmed', 'imtiazahm21@gmail.com', '01872062931', NULL, NULL),
(791, 243, 'Abrar Khatib Lajim', 'mglajim@gmail.com', '01742092337', NULL, NULL),
(792, 243, 'Mohua Akter', 'freeloader103@gmail.com', '01647336661', NULL, NULL),
(793, 243, 'Umme Muqaddisa', 'muqaddisaumme@gmail.com', '01828905965', NULL, NULL),
(794, 243, 'Saiful Islam', 'saifislamofficial@gmail.com', '01839228924', NULL, NULL),
(795, 244, 'Jagannath  Biswas', 'jagannathb258@gmail.com', '01560020958', NULL, NULL),
(796, 244, 'MD. Mehedi  Hasan', 'mehedisami2005@gmail.com', '01780723714', NULL, NULL),
(797, 244, 'Tasmim  Jahan', 'tj.liya.684@gmail.com', '01823389570', NULL, NULL),
(798, 244, 'Ayesha  Akter', 'ayesha23cse23@gmail.com', '01701977505', NULL, NULL),
(799, 245, 'Mahir Faisal', 'bsse1316@iit.du.ac.bd', '01822233168', NULL, NULL),
(800, 245, 'Khandakar Mehedi Hasan', 'bsse1326@iit.du.ac.bd', '01314824297', NULL, NULL),
(801, 247, 'Maliha  Firoz', 'malihafiroz@gmail.com', '01885988948', NULL, NULL),
(802, 247, 'Reyana  Zim', 'imriyanajasmine@gmail.com', '01757151944', NULL, NULL),
(803, 247, 'Samia Rahman', 'samiarahman2502@gmail.com', '01784486642', NULL, NULL),
(804, 248, 'Ahmed  Shahariar Udoy', 'udoy.ire@gmail.com', '01766228175', NULL, NULL),
(805, 249, 'Arafat Rahman', 'arafatrian881@gmail.com', '01319014061', NULL, NULL),
(806, 249, 'Abdullah Al  Mahmud', '2105120@ugrad.cse.buet.ac.bd', '01319014063', NULL, NULL),
(807, 249, 'Tahmidul Islam Omi', '2105115@ugrad.cse.buet.ac.bd', '01319014067', NULL, NULL),
(808, 249, 'Sijon   Chishty', '2105110@ugrad.cse.buet.ac.bd', '01319014064', NULL, NULL),
(809, 249, 'Afham Adian', 'afhamadianbk01@gmail.com', '01319014062', NULL, NULL),
(810, 255, 'Mosammat Saima Ahmed', 'saima0001@std.uftb.ac.bd', '01913623547', NULL, NULL),
(811, 255, 'Aar Raisatunnesa Hridika', 'raisa0001@std.uftb.ac.bd', '01919271193', NULL, NULL),
(812, 255, 'Nafisa Nawal Khan Treena', 'nafisa0002@std.uftb.ac.bd', '01887114445', NULL, NULL),
(813, 255, 'Mahafuza Akter Mim', 'mahafuza0001@std.uftb.ac.bd', '01531775221', NULL, NULL),
(814, 257, 'Omar Faruk', 'ukomarkhan16800@gmail.com', '01826101160', NULL, NULL),
(815, 257, 'Ar-rafy Sherazy', 'arrrafyshirazy@gmail.com', '01318693971', NULL, NULL),
(816, 259, 'Md Sifat Bin Jibon', 'codewithsifat4@gmail.com', '01762746646', NULL, NULL),
(817, 259, 'Md Fatin Shadab Turja', 'fatinshadab123@gmail.com', '01610101500', NULL, NULL),
(818, 259, 'Md. Mahmudul  Hasan', 'mhasan222021@bscse.uiu.ac.bd', '01736499178', NULL, NULL),
(819, 259, 'Kazi  Abdullah  Al Hosain', 'khosain221160@bba.uiu.ac.bd', '01817115822', NULL, NULL),
(820, 259, 'Md. Towhidul  Islam Khan', 'towhid.ik.rimel@gmail.com', '01778522749', NULL, NULL),
(821, 260, 'Jaki Ul Alam Khan', 'jakiualam4601@gmail.com', '01775744604', NULL, NULL),
(822, 260, 'Samihah Era', 'erae52153@gmail.com', '01946294302', NULL, NULL),
(823, 260, 'Md. Nazmus Sakib Siam', 'nazmus524@gmail.com', '01842195810', NULL, NULL),
(824, 260, 'Tahsin  Abrar', 'abrartahsin19@gmail.com', '01740784788', NULL, NULL),
(825, 260, 'Saida Jahan', 'jahan27112002@gmail.com', '01581506240', NULL, NULL),
(826, 261, 'Tahira Taposhi', 'tahiratapo@gmail.com', '01715400565', NULL, NULL),
(827, 261, 'Hasibul  Hasan', 'hhasibul544@gmail.com', '01632020627', NULL, NULL),
(828, 262, 'Md. Murad Hasan', '08muradhasan@gmail.com', '01831448204', NULL, NULL),
(829, 262, 'Mohammad Sefat Khan', 'mohammadsefatkhan25@gmail.com', '01537354547', NULL, NULL),
(830, 262, 'Sheikh Sulaiman Sony', '1802018@icte.uftb.ac.bd', '01402150671', NULL, NULL),
(831, 263, 'Md Rahat  Rahman', 'rahmanrahat97@gmail.com', '01924-475906', NULL, NULL),
(832, 265, 'Ashfaq Ahmed  Sunny', 'sunny@fakibaz.app', '+8801314666041', NULL, NULL),
(833, 265, 'Akif Rayan', 'akif@fakibaz.app', '+8801729985412', NULL, NULL),
(834, 268, 'Samara  Habib ', 'work.sajidhossain@gmail.com', '01325123480', NULL, NULL),
(835, 272, 'Aitijya Sarker Atibo ', 'aitijyasarker@gmail.com', '01716464970', NULL, NULL),
(836, 273, 'Md. Musfiqur hosen sharkar  Labib', 'llabib220@gmail.com', '01826205124', NULL, NULL),
(837, 273, 'Tanjiur Rahman  Tuha', 'labibinc03@gmail.com', '01312948693', NULL, NULL),
(838, 273, 'Md. Jawadur  Rahman ', 'jawad56@gmail.com', '01826532658', NULL, NULL),
(839, 273, 'Sifat Hossain ', 'sifat45@gmail.com', '01826235826', NULL, NULL),
(840, 273, 'Abid Chowdhury ', 'abid4678@gmail.com', '01563258426', NULL, NULL),
(841, 274, 'Ratul Saha  Roy ', 'ratulroy8863@gmail.com', '01795908863', NULL, NULL),
(842, 274, 'Banidipa  Chakraborty', 'banidipa.1159@gmail.com', '01746741157', NULL, NULL),
(843, 276, 'Al Faridul  Karim', 'al.faridul.karim@g.bracu.ac.bd', '+8801552418041', NULL, NULL),
(844, 276, 'KH. Toha Ibne  Nazim', 'toha.ibne.nazim@g.bracu.ac.bd', '+8801540193686', NULL, NULL),
(845, 279, 'Sumaiya Rahman Soma', 'rahmansoma2003@gmail.com', '01886447982', NULL, NULL),
(846, 279, 'H.M. Mehedi Hasan', 'hasanmehedi26696@gmail.com', '01540201438', NULL, NULL),
(847, 279, 'Chowdhury Shafahid Rahman', 'shafahid666@gmail.com', '01712928212', NULL, NULL),
(848, 279, 'MD Abu Bakar Siddique', 'bojackabs@gmail.com', '01631172611', NULL, NULL),
(849, 280, 'Saibul Haque Jessan', 'saibuljessan@iut-dhaka.edu', '01756847949', NULL, NULL),
(850, 280, 'Abrar Mahmud Hasan Abrar', 'abrarhasan2003@gmail.com', '01793241773', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `code`, `address`, `city`, `country`, `logo_url`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'American International University-Bangladesh', 'AIUB', 'Kuratoli, Dhaka-1229', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(2, 'Islamic University of Technology', 'IUT', 'Board Bazar, Gazipur-1704', 'Gazipur', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(3, 'Shahjalal University of Science and Technology', 'SUST', 'Kumargaon, Sylhet-3114', 'Sylhet', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(4, 'Ahsanullah University of Science and Technology', 'AUST', '141-142 Love Road, Tejgaon, Dhaka-1208', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(5, 'North South University', 'NSU', 'Bashundhara, Dhaka-1229', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(6, 'Khulna University of Engineering and Technology', 'KUET', 'Fulbarigate, Khulna-9203', 'Khulna', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(7, 'Chittagong University of Engineering and Technology', 'CUET', 'Raozan, Chittagong-4349', 'Chittagong', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(8, 'University of Dhaka', 'DU', 'Dhaka-1000', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(9, 'Independent University, Bangladesh', 'IUB', 'Bashundhara, Dhaka-1229', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(10, 'Rajshahi University of Engineering and Technology', 'RUET', 'Kazla, Rajshahi-6204', 'Rajshahi', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(11, 'Daffodil International University', 'DIU', 'Daffodil Smart City, Ashulia, Dhaka-1341', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(12, 'Bangladesh University of Engineering and Technology', 'BUET', 'Palashi, Dhaka-1000', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(13, 'University of Information Technology and Sciences', 'UITS', 'Baridhara, Dhaka-1212', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(14, 'United International University', 'UIU', 'United City, Madani Avenue, Dhaka-1212', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(15, 'East West University', 'EWU', 'Aftabnagar, Dhaka-1212', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(16, 'BRAC University', 'BRAC', '66 Mohakhali, Dhaka-1212', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(17, 'University of Asia Pacific', 'UAP', '74/A Green Road, Dhaka-1205', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(18, 'Stamford University Bangladesh', 'STAMFORD', 'Siddeswari, Dhaka-1217', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(19, 'Green University of Bangladesh', 'GUB', '220/D Begum Rokeya Sarani, Dhaka-1207', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(20, 'Jashore University of Science and Technology', 'JUST', 'Jashore-7408', 'Jashore', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(21, 'Bangladesh University of Professionals', 'BUP', 'Mirpur Cantonment, Dhaka-1216', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(22, 'Pabna University of Science and Technology', 'PUST', 'Pabna-6600', 'Pabna', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(23, 'Hajee Mohammad Danesh Science and Technology University', 'HSTU', 'Dinajpur-5200', 'Dinajpur', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(24, 'Jahangirnagar University', 'JU', 'Savar, Dhaka-1342', 'Savar', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(25, 'Military Institute of Science and Technology', 'MIST', 'Mirpur Cantonment, Dhaka-1216', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(26, 'Bangabandhu Sheikh Mujibur Rahman Science and Technology University', 'BSMRSTU', 'Gopalganj-8100', 'Gopalganj', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(27, 'Patuakhali Science and Technology University', 'PSTU', 'Dumki, Patuakhali-8602', 'Patuakhali', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(28, 'University of Rajshahi', 'RU', 'Rajshahi-6205', 'Rajshahi', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(29, 'University of Chittagong', 'CU', 'Chittagong-4331', 'Chittagong', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(30, 'Jagannath University', 'JNU', '9-10 Chittaranjan Avenue, Dhaka-1100', 'Dhaka', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(31, 'Other University', 'OTHER', 'Various locations', 'Various', 'Bangladesh', NULL, 1, '2025-11-30 12:36:59', '2025-11-30 12:36:59', NULL),
(32, 'Company or Institute', 'CI', NULL, NULL, 'Bangladesh', NULL, 1, '2025-12-03 11:19:02', '2025-12-03 11:19:02', NULL),
(33, 'Sylhet Metropolitan University ', 'SMU', NULL, 'Sylhet', 'Bangladesh', NULL, 1, '2025-12-13 13:10:02', '2025-12-13 13:10:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL DEFAULT '2',
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `role_name`, `status`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'dev@basis.org.bd', NULL, '$2y$12$a7gJTp/8lrnmZinUyk1aiuIdPdsrem/5URxUokXZDdbhagkvd75q2', 1, NULL, 'active', '64a137f5dc13d7.19648633_user.png', NULL, '2023-07-02 03:40:09', '2025-12-15 14:35:14'),
(2, 'BSC', 'bsf@basis.org.bd', NULL, '$2y$12$U8l7ID0K0r54A1D7hCL1UO6tf.DR8o4emOivvIwDShHpkFZAXkJh.', 2, NULL, 'active', NULL, NULL, NULL, NULL),
(3, 'Nsac', 'nsac@basis.org.bd', NULL, '$2y$12$U8l7ID0K0r54A1D7hCL1UO6tf.DR8o4emOivvIwDShHpkFZAXkJh.', 1, NULL, 'active', NULL, NULL, NULL, NULL),
(5, 'Test Judge 1', 'test@gmail.com', NULL, '$2y$12$BFt0lJ897QbzF9XViDSIzuT/l/ZSeoxOeRbB45t.x6cbmnFRUpRDG', 4, 'judge', 'active', NULL, NULL, '2025-10-02 18:29:27', '2025-12-17 03:54:26'),
(6, 'Test Volunteer', 'test2@gmail.com', NULL, '$2y$12$Huu/ebXuDkY3qijfDm0WUudQVZRh9EEKeE.tLBzKhtV4DpnIOhtxq', 3, 'volunteer', 'active', NULL, NULL, '2025-10-02 18:30:00', '2025-12-16 09:49:33'),
(7, 'Test Judge 2', 'test3@gmail.com', NULL, '$2y$12$6vUXrK6ef9hmvIuvi1HTqexwhyWMjv46AuB1DMJxE6F8Zau3Q/97y', 4, 'judge', 'active', NULL, NULL, '2025-10-02 18:31:40', '2025-10-02 18:31:40'),
(8, 'Test Judge 3', 'test5@gmail.com', NULL, '$2y$12$h00WnrU8XB3nV/VNDY6aueKb14nGWS/2cEPzGm94mX6Z30acWyHSK', 4, 'judge', 'active', NULL, NULL, '2025-10-02 18:31:59', '2025-12-16 09:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `title`, `code`, `url`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'DHK', 'https://en.wikipedia.org/wiki/Dhaka', 1, 'active', '2022-08-06 21:36:11', '2022-08-06 21:38:40'),
(2, 'Rajshahi', 'RAJ', 'https://2022.spaceappschallenge.org/locations/rajshahi/', 2, 'active', '2022-08-06 21:36:22', '2022-09-13 03:28:00'),
(3, 'Rangpur', 'RAN', 'https://2022.spaceappschallenge.org/locations/rangpur/', 3, 'active', '2022-08-06 21:39:54', '2022-09-13 03:27:42'),
(4, 'Sylhet', 'SYL', 'https://2022.spaceappschallenge.org/locations/sylhet/', 4, 'active', '2022-08-06 21:41:07', '2022-09-13 03:27:24'),
(5, 'Mymensingh', 'MYM', 'https://2022.spaceappschallenge.org/locations/mymensingh/', 5, 'active', '2022-08-06 21:41:27', '2022-09-13 03:27:07'),
(6, 'Khulna', 'KHU', 'https://2022.spaceappschallenge.org/locations/khulna/', 6, 'active', '2022-08-06 21:41:44', '2022-09-13 03:26:51'),
(7, 'Chittagong', 'CHI', 'https://2022.spaceappschallenge.org/locations/chattogram/', 7, 'active', '2022-08-06 21:42:01', '2022-09-13 03:25:43'),
(8, 'Barisal', 'BAR', 'https://2022.spaceappschallenge.org/locations/barisal/', 8, 'active', '2022-08-06 21:42:19', '2022-09-13 03:25:01'),
(9, 'Cumilla', 'CUM', 'https://2022.spaceappschallenge.org/locations/cumilla/', 9, 'active', '2022-08-16 22:52:33', '2022-09-13 03:24:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_role_id_index` (`role_id`);

--
-- Indexes for table `app_challenge_categories`
--
ALTER TABLE `app_challenge_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_challenge_infos`
--
ALTER TABLE `app_challenge_infos`
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
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_files`
--
ALTER TABLE `content_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_files_content_id_foreign` (`content_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finalist_nominees`
--
ALTER TABLE `finalist_nominees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_menus`
--
ALTER TABLE `front_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_merits`
--
ALTER TABLE `global_merits`
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
-- Indexes for table `local_winners`
--
ALTER TABLE `local_winners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local_winner_participants`
--
ALTER TABLE `local_winner_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marks_user_id_registration_id_unique` (`user_id`,`registration_id`),
  ADD KEY `marks_registration_id_foreign` (`registration_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `participants_email_unique` (`email`),
  ADD KEY `participants_registration_id_foreign` (`registration_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_album_id_foreign` (`album_id`);

--
-- Indexes for table `project_room`
--
ALTER TABLE `project_room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_room_registrations_id_room_id_unique` (`registrations_id`,`room_id`),
  ADD KEY `project_room_room_id_foreign` (`room_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`zone_id`,`registration_no`,`reg_id`,`app_challenge_id`,`level`,`position`,`global_position`,`is_global`,`approve_type`,`status`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_user`
--
ALTER TABLE `room_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_user_room_id_foreign` (`room_id`),
  ADD KEY `room_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_configs`
--
ALTER TABLE `site_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_date` (`start_date`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `universities_code_unique` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_code_unique` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_challenge_categories`
--
ALTER TABLE `app_challenge_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `app_challenge_infos`
--
ALTER TABLE `app_challenge_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `content_files`
--
ALTER TABLE `content_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finalist_nominees`
--
ALTER TABLE `finalist_nominees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_menus`
--
ALTER TABLE `front_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `global_merits`
--
ALTER TABLE `global_merits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_winners`
--
ALTER TABLE `local_winners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `local_winner_participants`
--
ALTER TABLE `local_winner_participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `project_room`
--
ALTER TABLE `project_room`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_user`
--
ALTER TABLE `room_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `site_configs`
--
ALTER TABLE `site_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=866;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_files`
--
ALTER TABLE `content_files`
  ADD CONSTRAINT `content_files_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `marks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);

--
-- Constraints for table `project_room`
--
ALTER TABLE `project_room`
  ADD CONSTRAINT `project_room_registrations_id_foreign` FOREIGN KEY (`registrations_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_room_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_user`
--
ALTER TABLE `room_user`
  ADD CONSTRAINT `room_user_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
