-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2025 at 05:06 PM
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
-- Database: `millionx`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `slug`, `description`, `position`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'NASA Space Apps Challenge 2025', 'nasa-space-apps-challenge-2025-2829', '<span id=\"docs-internal-guid-dae6a1dd-7fff-ea42-8477-793bb0ece904\"><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">Embark on an extraordinary journey with the NASA International Space Apps Challenge. As an international hackathon led by the Earth Science Division, Science Mission Directorate at NASA Headquarters in Washington, D.C., Space Apps unites the brightest minds from around the globe. The challenge brings together&nbsp; – coders, scientists, designers, storytellers, makers, builders, technologists, innovators – all take part to address real-world problems. National Aeronautics and Space Administration (NASA) and its esteemed Space Agency Partners provide free open data for them to use. Working together, these brilliant minds create innovative solutions to tackle the monumental challenges we face on Earth and beyond.</span></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><br></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">Since its inception in 2012, NASA International Space Apps Challenge has ignited curiosity and driven the ambition of over 220,000 forward-thinking individuals from more than 185 countries and territories.&nbsp; BASIS, as the long-standing custodian of this event, has upheld its commitment for ten consecutive years in Bangladesh. Collaborating with NASA and the in-house BASIS Students\' Forum (BSF), BASIS has created a platform for participants from nine local events across Bangladesh to engage in this prestigious international challenge. Whether hailing from Dhaka, Chattogram, Sylhet, Rajshahi, Rangpur, Barisal, Khulna, Cumilla, or Mymensingh, participants receive the opportunity to soar to great heights. Projects of all kinds – hardware, software, mobile applications, games, prototypes – based on the challenges given by NASA each year, come together to show the limitless potential of innovation. Participants use their talents and ideas to make solutions that inspire and spark ambition to redefine what is possible.</span></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><br></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">Over the years, Bangladeshi teams have soared to astounding heights, achieving remarkable milestones. In 2018, they secured the 3</span><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\"><span style=\"vertical-align: super;\">rd</span></span><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">&nbsp;and 5</span><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\"><span style=\"vertical-align: super;\">th</span></span><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">&nbsp;place finishes, while in 2019, they reached the pinnacle of success, claiming the coveted championship title for the first time, bringing immense pride to the nation. <b>\"Team Olik\"&nbsp;</b>from Shahjalal University of Science and Technology (SUST) emerged as champions in \"Best Use of Data\" category, mesmerizing the world with their lunar virtual reality (VR) application, which transported users to the historic Apollo 11 landing site in a breathtaking virtual-reality experience, crafted within a 48-hour hackathon sprint. Bangladesh once again claimed the title of Global Winner at the NASA International Space Apps Challenge in 2021, with&nbsp;<span style=\"font-weight: 700;\">\"Team Mohakash\"</span>&nbsp; securing the victory in the \"Best Mission Concept\" Category. In the following year, 2022, amidst intense global competition involving more than 5,300 teams from around the world,&nbsp;<span style=\"font-weight: 700;\">\"Team Diamonds\"</span>&nbsp;emerged victorious, clinching the prestigious \'Most Inspirational\' category at the coveted world championship.&nbsp;</span></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><br></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">In 2023, building on this momentum, Bangladesh continued its legacy of excellence. Four Bangladeshi teams earned their places among the top 40 global finalists, competing against over 57,900 participants from 152 countries.&nbsp;<span style=\"font-weight: 700;\">\"Team Voyagers\"</span>, in particular, made history by winning the world championship in the \"Best Storytelling Category,\" marking a third consecutive world championship for Bangladesh.</span></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.2; padding: 0pt 0pt 4pt;\"><br></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 0pt; line-height: 1.38; text-align: justify;\"><span id=\"docs-internal-guid-f768ce56-7fff-af5d-3c88-4759fbceeb45\"></span></p><p dir=\"ltr\" style=\"margin-top: 0pt; margin-bottom: 4pt; line-height: 1.2;\"><span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; vertical-align: baseline;\">Join us and prepare to launch your brilliance at the NASA Space Apps Challenge 2025.</span></p></span>', '1', '67b577f90108c9.45685118_NASA 2023 LOGO Blank-03.jpg', NULL, '2023-07-10 23:46:16', '2025-02-19 17:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `total_participants` int NOT NULL,
  `total_marits` int NOT NULL,
  `champion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `highlight_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `achievement_img_one` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement_img_two` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achievement_img_three` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
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
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Deactive',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `mobile`, `profile`, `address`, `block`, `status`, `remember_token`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nasa', 'Nasa', 'dev@basis.org.bd', '$2y$10$XUetWk3WeVsYvVlJ464L7.meeuSk4k1oWGtvJoaxEUm2PhdA/4NBG', '01883847733', '', NULL, 0, 'active', '2JizJSfKXODCcQioMlEE0OpGs2fcKFlvrIRbhjqQzMrh6pH1xiNtFXY5bm8v', NULL, NULL, NULL, NULL, '2022-07-19 05:06:39', '2022-08-14 02:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `app_challenge_categories`
--

CREATE TABLE `app_challenge_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_challenge_categories`
--

INSERT INTO `app_challenge_categories` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(4, 'BUILD A SPACE BIOLOGY SUPERHERO', NULL, 'deactive', '2022-08-16 22:35:23', '2025-10-01 05:45:42'),
(5, 'CALLING ALL RADIO ENTHUSIASTS!', NULL, 'deactive', '2022-08-16 22:35:50', '2025-10-01 05:45:42'),
(6, 'CAN AI PRESERVE OUR SCIENCE LEGACY?', NULL, 'deactive', '2022-08-16 22:36:02', '2025-10-01 05:45:42'),
(7, 'CAPACITY BUILDING RESOURCES GATEWAY', NULL, 'deactive', '2022-08-16 22:38:11', '2025-10-01 05:45:42'),
(8, 'CREATIVE DATA DISPLAY WITH THE PARKER SOLAR PROBE', NULL, 'deactive', '2022-08-16 22:39:50', '2025-10-01 05:45:42'),
(9, 'EARTH DATA ANALYSIS DEVELOPERS WANTED!', NULL, 'deactive', '2022-08-16 22:40:03', '2025-10-01 05:45:42'),
(10, 'EXPLORING VENUS TOGETHER', NULL, 'deactive', '2022-08-16 22:40:10', '2025-10-01 05:45:42'),
(11, 'HOW DOES CLIMATE CHANGE AFFECT YOU?', NULL, 'deactive', '2022-08-16 22:40:22', '2025-10-01 05:45:42'),
(12, 'INSAR CHANGE DETECTIVES!', NULL, 'deactive', '2022-08-16 22:40:33', '2025-10-01 05:45:42'),
(13, 'LEARNING THROUGH THE LOOKING GLASS', NULL, 'deactive', '2022-08-16 22:40:42', '2025-10-01 05:45:42'),
(14, 'MAKE A MOONQUAKE MAP!', NULL, 'deactive', '2022-08-16 22:40:50', '2025-10-01 05:45:42'),
(15, 'MEASURING OPEN SCIENCE', NULL, 'deactive', '2022-08-16 22:41:10', '2025-10-01 05:45:42'),
(16, 'NIMBUS TO NOW: THE HISTORY OF NASA’S EARTH-OBSERVING MISSIONS', NULL, 'deactive', '2022-08-16 22:41:28', '2025-10-01 05:45:42'),
(17, 'ON THE WAY TO THE SUN', NULL, 'deactive', '2022-08-16 22:41:46', '2025-10-01 05:45:42'),
(18, 'OUTFITTING A MARS HABITAT: A 3D PRINT CHALLENGE', NULL, 'deactive', '2022-08-16 22:42:07', '2025-10-01 05:45:42'),
(19, 'SAVE THE EARTH FROM ANOTHER CARRINGTON EVENT!', NULL, 'deactive', '2022-08-16 22:42:36', '2025-10-01 05:45:42'),
(20, 'TAKE FLIGHT: MAKING THE MOST OF NASA’S AIRBORNE DATA', NULL, 'deactive', '2022-08-16 22:43:00', '2025-10-01 05:45:42'),
(21, 'THE ART IN OUR WORLDS', NULL, 'deactive', '2022-08-16 22:43:27', '2025-10-01 05:45:42'),
(22, 'TRACK THE SPACE STATION IN 3D', NULL, 'deactive', '2022-08-16 22:43:47', '2025-10-01 05:45:42'),
(23, 'TURNING STEM INTO STEAM', NULL, 'deactive', '2022-08-16 22:44:32', '2025-10-01 05:45:42'),
(24, 'TWINKLE, TWINKLE, LITTLE STAR', NULL, 'deactive', '2022-08-16 22:45:11', '2025-10-01 05:45:42'),
(25, 'VISUALIZING THE JOVIAN SYSTEM LIKE NEVER BEFORE', NULL, 'deactive', '2022-08-16 22:45:31', '2025-10-01 05:45:42'),
(26, 'CREATE YOUR OWN CHALLENGE', NULL, 'deactive', '2022-08-16 22:46:04', '2025-10-01 05:45:42'),
(27, 'Animation Celebration of Terra Data!', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(28, 'A World Away: Hunting for Exoplanets with AI', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(29, 'BloomWatch: An Earth Observation Application for Global Flowering Phenology', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(30, 'Build a Space Biology Knowledge Engine', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(31, 'Commercializing Low Earth Orbit(LEO)', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(32, 'Data Pathways to Healthy Cities and Human Settlements', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(33, 'Deep Dive: Immersive Data Stories from Ocean to Sky', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(34, 'Embiggen Your Eyes!', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(35, 'From Earthdata to Action: Cloud Computing with Earth Observation Data for Predicting Cleaner, Safer Skies', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(36, 'International Space Station 25th anniversary Apps', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(37, 'Meteor Madness', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(38, 'NASA Farm Navigators: Using NASA Data Exploration in Agriculture', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(39, 'Sharks from Space', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(40, 'SpaceTrash Hack: Revolutionizing Recycling on Mars', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(41, 'Stellar Stories: Space Weather Through the Eyes of Earthlings', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(42, 'Through the Radar Looking Glass: Revealing Earth Processes with SAR', NULL, 'active', '2025-10-01 05:45:42', '2025-10-01 05:45:42'),
(43, 'Will It Rain On My Parade?', NULL, 'active', '2025-10-01 05:45:43', '2025-10-01 05:45:43'),
(44, 'Your Home in Space: The Habitat Layout Creator', NULL, 'active', '2025-10-01 05:45:43', '2025-10-01 05:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `app_challenge_infos`
--

CREATE TABLE `app_challenge_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `local_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_challenge_infos`
--

INSERT INTO `app_challenge_infos` (`id`, `title`, `slug`, `session`, `start_date`, `end_date`, `cover`, `local_cover`, `description`, `about`, `local_description`, `status`, `created_at`, `updated_at`) VALUES
(12, '2023-07-18NASA Space Apps Challenge Bangladesh 2018', 'nasa-space-apps-challenge-bangladesh-2018', '2018', '2018-10-21', '2018-10-22', '2018_global.jpg', '2018_local.jpeg', NULL, NULL, '      <p class=\"align-justify\">Top eight projects from Bangladesh were nominated to participate in the international phase during the prize giving ceremony of the fourth NASA Space Apps Challenge held at the auditorium of Independent University of Bangladesh.</p>\n\n                            <p class=\"align-justify\">Team Game Changer was the champion from Dhaka while Team Planet Kit took the runners-up position. From Chittagong, Team Queue became the champion and Team Matra was the runners-up. Team Photon was selected as the champion from Comilla and the runners-up position went to Team MetaCoders. The champions from Rangpur and Sylhet were Team HSTU Matroid and Team Olik respectively.</p>\n\n                            <p class=\"align-justify\">2000 participants submitted their projects to win this year’s NASA Space Apps Challenge 2018. Out of them top 40 teams were selected to participate in the 36 hour-long Hack-a-Thon which was organized by Bangladesh Association of Software and Information Services (BASIS) and BASIS Student’s Forum.</p>\n                    ', 'deactive', NULL, NULL),
(13, 'NASA Space Apps Challenge Bangladesh 2022', 'nasa-space-apps-challenge-bangladesh-2022', '2022', '2022-07-05', '2022-09-21', '2022_global.jpg', '2022_local.jpg', ' This is the second time in a row Bangladesh has earned the first place in a category in NASA\n                            Space Apps Challenge. Last year, Team \'Mohakash\' won Global Finalists in the category \'Best\n                            Mission Concept\' for their project \'<strong>Advanced Regolith Sampler System (ARSS)</strong>\' - a\n                            battery-powered motor tool to collect space fragments called regoliths.  In 2022, Team\n                            Diamond won thanks to their interactive space learning app called \'Diamond in the sky\',\n                            which aims to teach children about space science. Developed for kids from 10 to 12 years of\n                            age, this learning material allows children to learn how the cosmic entities in the night\n                            sky move, as well as how stars can come in different patterns, colours and brightness.', NULL, ' <p class=\"align-justify\">\n                                For the eighth consecutive time, Bangladesh Association of Software and Information\n                                Services-BASIS has organized NASA Space Apps Challenge 2022 in collaboration with BASIS\n                                Students Forum. This Hack-a-Thon will run continuously for 36 hours starting from Sep 30\n                                to Oct 01, 2022.\n                            </p>\n                            <p class=\"align-justify\">\n                                The US National Aeronautics and Space Administration-NASA is implementing this project\n                                internationally in 313 cities around the world, while BASIS has organized it in 9 cities\n                                in Bangladesh (Dhaka, Chittagong Sylhet, Rajshahi, Khulna, Barisal, Rangpur, Mymensingh\n                                and Comilla). In addition to engaging 1 crore students through social media, the NASA\n                                Space Apps Challenge is planning to engage 2 lakh students directly and through\n                                competitions.More than 2,000 contestants from nine cities in Bangladesh participated in\n                                the event. After scrapping the incomplete projects, representatives from 125 projects\n                                participated in the 48-hour hackathon, and the best 27 projects were nominated by NASA\n                                from Bangladesh.\n                            </p>', 'deactive', '2022-08-17 03:20:42', '2022-09-20 22:55:36'),
(15, 'NASA Space Apps Challenge Bangladesh 2021', 'nasa-space-apps-challenge-bangladesh-2021', '2021', '2020-10-02', '2020-10-03', '2021_global.jpg', '2021_local.jpg', '  In 2021, Bangladesh once again claimed the title of world champion at the NASA Space Apps\n                            Challenge, with \"<strong>Team Mohakash</strong>\" from Khulna securing the top position in\n                            the \"Best Mission Concept\" Category, triumphing over 4,534 teams from 162 countries. \"Team\n                            Mohakash\" emerged as the champions of the Khulna Regional Division in the NASA Space Apps\n                            Challenge 2021 National Hack-a-Thon.', NULL, '   <p class=\"align-justify\">\n                                The Bangladesh Association of Software and Information Services (BASIS) has launched the\n                                Nasa Space Apps Challenge 2021. The hackathon, organised in collaboration with the BASIS\n                                Students Forum for the eighth consecutive time, will run continuously for 36 hours\n                                starting\n                                from October 2-3, 2021.\n                            </p>\n                            <p class=\"align-justify\">\n                                More than 2,000 contestants from nine cities in Bangladesh participated in the event.\n                                After\n                                scrapping the incomplete projects, representatives from 125 projects participated in the\n                                48-hour hackathon, and the best 27 projects were nominated by NASA from Bangladesh.\n                            </p>', 'deactive', '2022-08-28 03:26:13', '2022-08-29 22:22:20'),
(17, 'NASA Space Apps Challenge Bangladesh 2020', 'nasa-space-apps-challenge-bangladesh-2020', '2020', '2020-10-01', '2020-10-10', '2020_global.jpg', '2020_local.jpg', NULL, NULL, NULL, 'deactive', '2022-08-28 06:10:07', '2022-08-30 20:42:18'),
(19, 'NASA Space Apps Challenge Bangladesh 2023', 'nasa-space-apps-challenge-bangladesh-2023', '2023', '2023-09-22', '2023-09-30', '2023_global.jpg', '2023_global.webp', NULL, NULL, NULL, 'deactive', NULL, NULL),
(20, 'NASA Space Apps Challenge Bangladesh 2024', 'nasa-space-apps-challenge-bangladesh-2024', '2024', '2024-06-04', '2024-08-01', '2021_global.jpg', '2024_local.jpg', NULL, '  This is the Preliminary Registration process. You are requested to fill up the\n                                information with Correct\n                                &amp; Real statements. By this application, you will be nominated for the second step.\n                                You\n                                can apply with your team only. Please follow the instructions properly when you are\n                                going to\n                                fill up the form. NASA Space Apps Challenge is an international mass collaboration\n                                focused\n                                on space exploration that takes place over 48 hours in cities around the world. NASA is\n                                going to organize this global event with the Bangladesh Association of Software and\n                                Information Services (BASIS) as the local organizer for the event in Bangladesh. This\n                                mega\n                                event will be solely supported by BASIS Student’s Forum. BASIS is the core organizer of\n                                the\n                                International Space Apps Challenge 2024 across Bangladesh where Dhaka,\n                                Chattogram, Sylhet,\n                                Rajshahi, Rangpur, Barisal, Khulna, Cumilla &amp; Mymensingh will be the participating\n                                cities.\n                                <br><strong>What Your Project Should Highlight: </strong>\n                                <a href=\"https://www.spaceappschallenge.org/\">www.spaceappschallenge.org</a><br>\n                                <strong>What Type of Projects:</strong>\n                                1. Beginner/Youth\n                                2. Intermediate\n                                3. Advanced\n                                4. Arts\n                                5. Astrophysics\n                                6. Climate\n                                7. Diversity & Equity\n                                8. Earth\n                                9. Games\n                                10. Hardware\n                                11. Open Science\n                                12. Planets & Moons\n                                13. Software\n                                14. Space Exploration and\n                                15. Sun<br>\n                                <strong>If Your Age is Below 18, Complete This Form: <a\n                                    href=\"https://forms.gle/TjmEhXDcJgBD8Enf8\" target=\"_blank\">https://forms.gle/TjmEhXDcJgBD8Enf8</a></strong>', NULL, 'deactive', NULL, NULL),
(21, 'NASA Space Apps Challenge Bangladesh 2025', 'nasa-space-apps-challenge-bangladesh-2025', '2025', '2025-06-04', '2025-08-01', NULL, NULL, '', '  This is the Preliminary Registration process. You are requested to fill up the\r\n                                information with Correct\r\n                                &amp; Real statements. By this application, you will be nominated for the second step.\r\n                                You\r\n                                can apply with your team only. Please follow the instructions properly when you are\r\n                                going to\r\n                                fill up the form. NASA Space Apps Challenge is an international mass collaboration\r\n                                focused\r\n                                on space exploration that takes place over 48 hours in cities around the world. NASA is\r\n                                going to organize this global event with the Bangladesh Association of Software and\r\n                                Information Services (BASIS) as the local organizer for the event in Bangladesh. This\r\n                                mega\r\n                                event will be solely supported by BASIS Student’s Forum. BASIS is the core organizer of\r\n                                the\r\n                                International Space Apps Challenge 2025 across Bangladesh where Dhaka,\r\n                                Chattogram, Sylhet,\r\n                                Rajshahi, Rangpur, Barisal, Khulna, Cumilla &amp; Mymensingh will be the participating\r\n                                cities.\r\n                                <br><strong>What Your Project Should Highlight: </strong>\r\n                                <a href=\"https://www.spaceappschallenge.org/\">www.spaceappschallenge.org</a><br>\r\n                                <strong>What Type of Projects:</strong>\r\n                                1. Beginner/Youth\r\n                                2. Intermediate\r\n                                3. Advanced\r\n                                4. Arts\r\n                                5. Astrophysics\r\n                                6. Climate\r\n                                7. Diversity & Equity\r\n                                8. Earth\r\n                                9. Games\r\n                                10. Hardware\r\n                                11. Open Science\r\n                                12. Planets & Moons\r\n                                13. Software\r\n                                14. Space Exploration and\r\n                                15. Sun<br>\r\n                                <strong>If Your Age is Below 18, Complete This Form: <a\r\n                                    href=\"https://forms.gle/TjmEhXDcJgBD8Enf8\" target=\"_blank\">https://forms.gle/TjmEhXDcJgBD8Enf8</a></strong>', NULL, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('categories', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:18:{i:0;O:8:\"stdClass\":5:{s:2:\"id\";i:27;s:5:\"title\";s:36:\"Animation Celebration of Terra Data!\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:1;O:8:\"stdClass\":5:{s:2:\"id\";i:28;s:5:\"title\";s:44:\"A World Away: Hunting for Exoplanets with AI\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:2;O:8:\"stdClass\":5:{s:2:\"id\";i:29;s:5:\"title\";s:75:\"BloomWatch: An Earth Observation Application for Global Flowering Phenology\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:3;O:8:\"stdClass\":5:{s:2:\"id\";i:30;s:5:\"title\";s:38:\"Build a Space Biology Knowledge Engine\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:4;O:8:\"stdClass\":5:{s:2:\"id\";i:31;s:5:\"title\";s:36:\"Commercializing Low Earth Orbit(LEO)\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:5;O:8:\"stdClass\":5:{s:2:\"id\";i:32;s:5:\"title\";s:53:\"Data Pathways to Healthy Cities and Human Settlements\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:6;O:8:\"stdClass\":5:{s:2:\"id\";i:33;s:5:\"title\";s:51:\"Deep Dive: Immersive Data Stories from Ocean to Sky\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:7;O:8:\"stdClass\":5:{s:2:\"id\";i:34;s:5:\"title\";s:19:\"Embiggen Your Eyes!\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:8;O:8:\"stdClass\":5:{s:2:\"id\";i:35;s:5:\"title\";s:105:\"From Earthdata to Action: Cloud Computing with Earth Observation Data for Predicting Cleaner, Safer Skies\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:9;O:8:\"stdClass\":5:{s:2:\"id\";i:36;s:5:\"title\";s:49:\"International Space Station 25th anniversary Apps\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:10;O:8:\"stdClass\":5:{s:2:\"id\";i:37;s:5:\"title\";s:14:\"Meteor Madness\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:11;O:8:\"stdClass\":5:{s:2:\"id\";i:38;s:5:\"title\";s:64:\"NASA Farm Navigators: Using NASA Data Exploration in Agriculture\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:12;O:8:\"stdClass\":5:{s:2:\"id\";i:39;s:5:\"title\";s:17:\"Sharks from Space\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:13;O:8:\"stdClass\":5:{s:2:\"id\";i:40;s:5:\"title\";s:50:\"SpaceTrash Hack: Revolutionizing Recycling on Mars\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:14;O:8:\"stdClass\":5:{s:2:\"id\";i:41;s:5:\"title\";s:61:\"Stellar Stories: Space Weather Through the Eyes of Earthlings\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:15;O:8:\"stdClass\":5:{s:2:\"id\";i:42;s:5:\"title\";s:67:\"Through the Radar Looking Glass: Revealing Earth Processes with SAR\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:42\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:42\";}i:16;O:8:\"stdClass\":5:{s:2:\"id\";i:43;s:5:\"title\";s:26:\"Will It Rain On My Parade?\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:43\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:43\";}i:17;O:8:\"stdClass\":5:{s:2:\"id\";i:44;s:5:\"title\";s:46:\"Your Home in Space: The Habitat Layout Creator\";s:6:\"status\";s:6:\"active\";s:10:\"created_at\";s:19:\"2025-10-01 11:45:43\";s:10:\"updated_at\";s:19:\"2025-10-01 11:45:43\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 2080656226);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_meta` tinyint NOT NULL DEFAULT '0',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finalist_nominees`
--

CREATE TABLE `finalist_nominees` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
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
  `merit_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `merit_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `vanue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
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
  `merit_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(60, '2025_09_29_221947_add_some_fild_to_registrations_table', 31),
(61, '2025_09_29_234039_add_some_fild_to_site_configs_table', 31),
(62, '2025_09_30_103940_create_marks_table', 31),
(63, '2025_10_02_114419_add_more_fild_to_registrations_table', 32);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `registration_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `email`, `password`, `remember_token`, `email_verified_at`, `registration_id`, `created_at`, `updated_at`) VALUES
(5, 'dev@basis.org.bd', '$2y$12$ZPR5UdjYErkfoWGmqiIT6eUMxypAxy4zlZZsAYoKX.CstR3NSObte', NULL, NULL, 831, '2025-10-01 05:50:44', '2025-10-01 05:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('dev@basis.org.bd', '$2y$12$RYmdU7ckAlRRF.N9RKWN9uyOIHa9dwEKNVWxjo7wL.lewF/indJpm', '2025-10-02 05:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `zone_id` int NOT NULL,
  `registration_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_challenge_id` int NOT NULL,
  `project_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `videolink` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nasa_data_use` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video30s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video240s` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_female_members` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `female_members` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nasa_global_team_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_work_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_experience_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_nasa_data_usage_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_challenge_category_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_project_link_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_nasa_global_team_url_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_score` decimal(5,2) DEFAULT NULL,
  `team_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_member` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_leader_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('SHORTLIST','LOCAL','GLOBAL','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_global` tinyint NOT NULL DEFAULT '0',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_type` enum('VIRTUAL','PHYSICAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `nasa_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `slug`, `category_id`, `zone_id`, `registration_no`, `session`, `reg_id`, `app_challenge_id`, `project_name`, `videolink`, `description`, `nasa_data_use`, `video30s`, `video240s`, `project_link`, `is_female_members`, `female_members`, `nasa_global_team_url`, `team_work_score`, `user_experience_score`, `is_nasa_data_usage_score`, `is_challenge_category_score`, `id_project_link_score`, `is_nasa_global_team_url_score`, `final_score`, `team_name`, `team_member`, `team_leader_name`, `team_leader_mobile`, `team_leader_email`, `level`, `position`, `global_position`, `is_global`, `image`, `approve_type`, `status`, `nasa_link`, `created_at`, `updated_at`) VALUES
(831, 'test-team-1', 36, 4, 'NASA-2025-0010', '2025', '0010', 21, 'MarsNest - 1', 'https://www.beautiful.ai/player/change', 'This project explores the possible effects of dark matter and dark energy on Mars. Using data analysis and visualization, we aim to uncover hidden patterns in Mars’ gravity, atmosphere, and motion. Our goal is to better understand how these cosmic forces interact with planetary bodies.', 'test', 'https://www.youtube.com/watch?v=g2AVVXfQ-S4', NULL, NULL, NULL, NULL, 'https://www.beautiful.ai/player/-O4_nJoW-FBEA45NE-iT', '5', '5', '', '', '1', '1', NULL, 'Test team 1', '1', 'Rana', '01764388484', 'dev@basis.org.bd', NULL, NULL, NULL, 0, NULL, NULL, 'active', NULL, '2025-10-01 05:50:44', '2025-10-03 20:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Dhaka', 'active', '2025-12-09 11:12:38', '2025-12-09 11:12:38'),
(4, 'CTG', 'active', '2025-12-09 11:13:39', '2025-12-09 11:13:39'),
(5, 'Raj', 'active', '2025-12-09 11:15:29', '2025-12-09 11:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `room_user`
--

CREATE TABLE `room_user` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` enum('judge','volunteer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0lnb8a90sF7EFCVLDFs1q7b9eDUg76oa9UtFIo07', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hxbXB4N0p3bTBNOTZpV244WHJCS1g5YWFUdkthaTIyRmdzUnZ1UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472100),
('1Q9p1qSxmDPdyHp7q9ak50KycHVlhwFLBDvK7iDN', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkRLQVByNzJEdFZhRzVuWHZzcG5RcFVpSUdsdUh2bW03Rk42RGJvTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470667),
('2SxzRhXviCXigumL0Bf8ZZFgf53IjrpUNSX29Ir9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEkydXRLcXl6ajJpTDZPcDk1WGFNeDRkOUF5ZTdRa1BPVkZFQWFhNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472783),
('4K1ho8tFHLOsMFHckQBDMKJkhD5FMZeWtdV1TtmR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFFXc0VVUG1McmR5NnkyY012WXJkeFJJN3NESW13emxUbU1YejBjOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472394),
('4O8kKm7lh2x4djoPfutXV07AL5Egkplavxoyjzdj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnlUNXhRSUJsMEd5RnEwZWdxdWJZb2syZlg1VldiQmE5dGtueUs2eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471942),
('5FplTS5eG3BLpOm3qbW3P6jfDEPViMAy2rFF1vHh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzRWMjhCUkZNWDNoakIwMUdPR3pjT0VYUm50ZEJ4dWkzcDN6SzZ2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472682),
('61Fn4BwUgO1XUnepbSQ2abwiuHfoCQJpmHURm8om', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkF6RXAxVEUwTWJzeUV5MnlKNGl1dTdsdkhid3dzU2JZMzFqTVV1cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470392),
('7f5T9HXLly3LekewNIO874KrnyYWbiVyGB3BF8Rn', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUo3dXJ1bTJkeWU2d0xCSUxSb1dxWDZzWmFPaXZzMFBFclAzU1NTbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471937),
('92KpgKW9DO8l8Ffnx8qQOi5UkcGPNZoxjaWrFFzD', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGdnblJOQ1QxTUtzU3daOXZGRkVjZ3VOMERjcmhxdkFaVEF0bmV1TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470672),
('97hTBSn1oe6H5WXeRn3FlZiW8QxERBZPVR7VLRBR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaER6NUZWUTl6cUg3N01yUFdmT0FmaTNDNlNheXpmQTlUUVByT2hlSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470645),
('a4ZeDe5ZClTirkBe9ns2CZpuFp4PN2kUovCw5y2s', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2F4emszckdiWGI0VFVaS0ZWWjdNZmhhRnNiZ1hKSFRxdWZUOWZibiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471969),
('bFukAf4n9nwS3dFNpLHWj2fC3P4CPMg5gNwRCH1t', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUV3eHE0OXh4NW1meDZPRXZSakVMYndYN2dEODRBVzhERlNMNTY3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472469),
('C29DxLpuJWZO0HC5U6crQ228DCCR2SOPgBSx8IiL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUFpbkVrNDQzZUFpSThrTzVHdHZPa1JhVnBtdlZwTUNLZDJhWURtQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765468854),
('cJuCM255eyGgWyzaU0NFYhIoPJCFsHJ7PPLCuTS9', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmdEODd3REFFTTVSSEhzMnhEeUpxR1gxNVdkVjJ2aUZRU1hlNTdzYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470622),
('DfcOmYxWURHJqZ4vJJihzXKRc568xwRcQlLLIeS8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnRlS0VJaGZZanhzSUZIeElLNDlDZEg3UllRVmR6anVjYk1qdzQ0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472443),
('ECnEMGLHAFbKh89vAz54b62bY5q1aQDzzX91RICp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ05wTWJmWDFZdTlWeXdjdTc1UGJtNG9kcWI5czFHZzQ2eFpjd1lGOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472048),
('eM81OMgMJ41T3Bian8243y3e8B5jXizOJ8EIgMJ8', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlBmaE1CbHZvM2cybWtaUlk5cHQ3bnhDWjRQWkFyYkE5eDhVdXF3MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471681),
('EtVarMDlX5TBFlEPiVvioTx9RQssuxq9gGnVGyfM', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXc3elpsb0NjbDBzYVBNYlZqSGdiV0syUHlZRTdTQllWek9hVlpDVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472408),
('FJ3nqAL6TdYcSclTLb0y8yTCnVtcEP3YrSWWKNdR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFRaRHhITzZqVFFsWkZZVXZ6VUZmVWVYRWwyWFNCNUN6MW9GRlhTMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472419),
('hTCudDQkLKz1MJEPKLwCeGtanAxSyMaQw4OI3pK5', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0YxNUYyaE5POWlOSWdhdEV5eGlKa1RUNHBmZzNleW1lRmhJVWtTdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471951),
('HvL7UsMi9YpC2xDLTPqQyRFkWt3moju5yvaMwb5g', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianRnaWs3NVRmNUFZOTZxNG9rcVU1V0N0am9McXUzRTBIVE1xS3hDSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472043),
('I98tDWsBZ4HPCbpWETshtT0epnNenpsnwFJRL4eI', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUndJVjNxRldKdHdNdktIU05mbVVDUUx2UEx1aWZwUHhuN1dYb3BVMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471947),
('JkdAKm7DRbUQDV8vTfp4YWVc7IpPwccy9iDWeA64', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnpMVk1IY3A4enlJbVJmOG10TnhjRG5HcjQxRHp5azF1am1hbjB4TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472686),
('klDmsZudpyTBYnSL3cIW98gXSoPubjN8KoJOAyVm', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1ByM3NmTXNqd3M4M0N6MENJNk9xSlNVeG04c2NZVUIwVzdLR1lQbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765469187),
('n5wWJuRyygXbbygCiOTh6TBEYG3YwwDxKzu2YAcD', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHF6NEJ0WUwxbkZXZW1lVENyZUZCUTFPNzlNZzh3ZjhzTUlsSVdtOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472417),
('NgSvpx6IpaTpER1AGGL7BCtd4HsCXbkDALLrOa7I', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWm1NSHB6S0ZNUlNmSnM2OTU0UE83R0dJRFFhOUV3R2xuSW9MTG8zaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQvdXNlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTE6InN1bW1hcnlZZWFyIjtzOjQ6IjIwMjUiO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1765471718),
('oPi5GpATcyXmUOPevwBsDH0Xl0THQ0PBWnyJmFYD', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1BUb3hvZk5VcUdRaGltM2xWV3J0Wkk5c3VpR25QY040M0ZhZjZHMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470446),
('PiR8iap3ac0VzaDAItnWoPRTT6BMCLl4OeAIYOWC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTNCbUVQNUN1NXcxZ2czb3lyTkR0MUp1UG5jVzJsNVNFZEM2OFd5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472778),
('RdaK9IjrI6ku4u6KX7F0WPLHx5teliCwwq48rClM', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXlkN0kxYTBWQTdETlF5bDFud3RYT0lMMTA2RU03R1d5RFRubWIyQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472405),
('rJ7zhgpspWhcLabYaoNySOT3mi4GwhinWQZP20Fp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakc1OW9xbng1cTZzT0xhZDIwTVRxRWtGbmgyWFBoYzlSS2EwVUwxYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472051),
('RmEljzoYS7EQte0wrtDy1eXWnKveV8hrmPsDSgi6', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXhZTGFVNklPQ1FHTVhpN210WVFKZU1idkdETk1MZGtGV1ZMa0Q1ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472425),
('T5xe59PdG2koZU304mtUy00O6bwu4P6ArY4ecsxd', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1lUTUo3SmptMUZtQVZrbTVVMjBSZDNhZ0d5TDQwUERTb2o2a2dtYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471974),
('Vvdl19bbsAIq2bM0Yq9Pr7fKAYHaNKyVqUWUB7Vh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmNNM2FqMnZ3WGtVdlp5aVoyY3ZqWFFGYzhxMmNQME5jUmI4ODMySyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472062),
('vwpPlAni7q6bX68SmR204XBoHcuC2UzLqEfgaSdj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFU3TzFMdnNMU2xXWHYwaXMzMjc2bU50QWowSjA3SzdRazJ3U1RmbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472392),
('wdYFoSWLksIGBqWMM68gVtUM19eGp5H6zJ97Bxem', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkxwbVB1ZEluSUJvZDF1bGhMeHdIMXI3WmxkOUh0dFJuWHBxZXVJZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472040),
('WoCQIXBvf8s8oiebPCW9pPB3jWkD3kgId5dG51tY', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHlZMXkxa2hpenlDdTF3YXlpZHl3OUZSd3hpS2FLaU5YbmlpNWc4YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765471978),
('wV1MumcUlR8gCtKorPwMULIXyABZ9qromrz8trqG', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVFSN3VtdTRSY1dmNUNWUFFDWW9Bb2RGRUZweWdnR3VTWHdVVnQwZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472428),
('x1Zc8tMryWBuvfzOVvhp7RYprqwyx4Nlw9UXAx9T', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHpTbUVDMnJIZXNYbTJ2b1BKQmlvWVZLVWN1THpPeUI5U0ljOHZZZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765470615),
('Ylyzgp6vWZO9in4E8P0yDs3QamzszQ3akxUsSeAl', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGxqUWhHMXc0eTczcnc1aHhWdlowZDFHYlFkWlZPWU5NRGFEVlZ2RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472432),
('zgLSm87mMZVHR5CQOVE28vAm7TbtYkNFbsgbNmqQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUhsdHpIaldRUk9JVWdYSXEybmNjendZb0drNk5YcUhGMlhtVVZmcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765472072);

-- --------------------------------------------------------

--
-- Table structure for table `site_configs`
--

CREATE TABLE `site_configs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_ig` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'NASA Space Apps Challenge 2025', 'NSAC', 'www.nsac.basis.org.bd', 'logo.png', 'favicon.png', 'BDBL Bhaban (5th Floor), 12 Karwan Bazar, Dhaka - 1215', 'American International University-Bangladesh (AIUB)', 'bsf@basis.org.bd', '16488', 'https://maps.app.goo.gl/NqMS53n7XKRUnmX27', 'https://www.facebook.com/SpaceAppsChallengeBangladesh/', '....', 'https://www.linkedin.com/company/basis-bd/', 'https://www.youtube.com/user/BASISChannel', 'https://twitter.com/BASIS_BD', '© NASA All Rights Reserved.', NULL, NULL, NULL, '2025-10-04 15:53:47', NULL, '2025-10-04 15:53:43', NULL, '2025-10-04 15:53:39', '2023-07-03 23:53:36', '2025-10-01 06:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint UNSIGNED NOT NULL,
  `registration_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL DEFAULT '2',
  `role_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','terminated') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `role_name`, `image`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'dev@basis.org.bd', NULL, '$2y$12$1vaM1ZFTD27i3MxUADUv6ePr3tZIbHAE.PLuFQ.vVwXeizO5nG.66', 1, 'suber_admin', '64a137f5dc13d7.19648633_user.png', NULL, 'active', '2023-07-01 21:40:09', '2025-12-09 09:43:16'),
(2, 'BSC', 'bsf@basis.org.bd', NULL, '$2y$12$U8l7ID0K0r54A1D7hCL1UO6tf.DR8o4emOivvIwDShHpkFZAXkJh.', 2, 'normal_user', NULL, NULL, 'active', NULL, NULL),
(3, 'Nsac', 'nsac@basis.org.bd', NULL, '$2y$12$U8l7ID0K0r54A1D7hCL1UO6tf.DR8o4emOivvIwDShHpkFZAXkJh.', 1, 'suber_admin', NULL, NULL, 'active', NULL, NULL),
(5, 'Test Judge', 'it@basis.org.bd', NULL, '$2y$12$GFdNOjo2Nbzfw/g0nN3hkuHT6J.hiaCbzdm.7Acqa08hI4.1LuuvW', 4, 'judge', NULL, NULL, 'active', '2025-09-23 21:07:01', '2025-12-09 11:19:09'),
(6, 'Query Manager', 'dev1@basis.org.bd', NULL, '$2y$12$ZPR5UdjYErkfoWGmqiIT6eUMxypAxy4zlZZsAYoKX.CstR3NSObte', 4, 'judge', NULL, NULL, 'active', '2025-09-23 22:16:40', '2025-09-23 22:16:40'),
(7, 'Test Volunteer', 'it2@basis.org.bd', NULL, '$2y$12$ZPR5UdjYErkfoWGmqiIT6eUMxypAxy4zlZZsAYoKX.CstR3NSObte', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:56:35', '2025-09-27 18:56:35'),
(8, 'Cardio', 'dev3@basis.org.bd', NULL, '$2y$12$.uy529zs0vC.gkvbkFSVOert1Wzhj2REeSMhhW/xG8rXC56JPA7Da', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:17', '2025-09-27 18:57:17'),
(9, 'Query Manager', 'it4@basis.org.bd', NULL, '$2y$12$ETp.MkrZXQqkckIkVEV9KeP9wsFZ/RP5x.lbuusqlAGjN3QeIos/.', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:28', '2025-09-27 18:57:28'),
(10, 'Cardio', 'it12@basis.org.bd', NULL, '$2y$12$2QBgVDb0pOytbVEJ3vkmtOPl2pUwhi3VrnmuRKvDPYwGgfVEKbCLe', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:56:35', '2025-09-27 18:56:35'),
(11, 'Cardio', 'dev31@basis.org.bd', NULL, '$2y$12$.uy529zs0vC.gkvbkFSVOert1Wzhj2REeSMhhW/xG8rXC56JPA7Da', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:17', '2025-09-27 18:57:17'),
(12, 'Query Manager', 'it41@basis.org.bd', NULL, '$2y$12$ETp.MkrZXQqkckIkVEV9KeP9wsFZ/RP5x.lbuusqlAGjN3QeIos/.', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:28', '2025-09-27 18:57:28'),
(13, 'Cardio', 'it27@basis.org.bd', NULL, '$2y$12$2QBgVDb0pOytbVEJ3vkmtOPl2pUwhi3VrnmuRKvDPYwGgfVEKbCLe', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:56:35', '2025-09-27 18:56:35'),
(14, 'Cardio', 'dev37@basis.org.bd', NULL, '$2y$12$.uy529zs0vC.gkvbkFSVOert1Wzhj2REeSMhhW/xG8rXC56JPA7Da', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:17', '2025-09-27 18:57:17'),
(15, 'Query Manager', 'it47@basis.org.bd', NULL, '$2y$12$ETp.MkrZXQqkckIkVEV9KeP9wsFZ/RP5x.lbuusqlAGjN3QeIos/.', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:28', '2025-09-27 18:57:28'),
(16, 'Cardio', 'it127@basis.org.bd', NULL, '$2y$12$2QBgVDb0pOytbVEJ3vkmtOPl2pUwhi3VrnmuRKvDPYwGgfVEKbCLe', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:56:35', '2025-09-27 18:56:35'),
(17, 'Cardio', 'dev317@basis.org.bd', NULL, '$2y$12$.uy529zs0vC.gkvbkFSVOert1Wzhj2REeSMhhW/xG8rXC56JPA7Da', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:17', '2025-09-27 18:57:17'),
(18, 'Query Manager', 'it471@basis.org.bd', NULL, '$2y$12$ETp.MkrZXQqkckIkVEV9KeP9wsFZ/RP5x.lbuusqlAGjN3QeIos/.', 3, 'volunteer', NULL, NULL, 'active', '2025-09-27 18:57:28', '2025-09-27 18:57:28'),
(19, 'Cardio', 'dev22@basis.org.bd', NULL, '$2y$12$iODuQefzCmKNTqJeMtwx7u28dp0.xSWXE8fuLG2gyco7/UAesdP/6', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:10', '2025-09-27 19:11:10'),
(20, 'Cardio', 'it222@basis.org.bd', NULL, '$2y$12$Ge7vgSiUW7uokSBNZwyPIOMZeo.lOloOidRc4bC/VZdjNFzzffRc2', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:19', '2025-09-27 19:11:19'),
(21, 'Cardio', '2a@a.com', NULL, '$2y$12$.zQh0kGwPaBlA1ekeGjSP.MLK.ljeqgwmfMe75ZEEgp6dOk/J8hBa', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:30', '2025-09-27 19:11:30'),
(22, 'Cardio', 'dev223@basis.org.bd', NULL, '$2y$12$iODuQefzCmKNTqJeMtwx7u28dp0.xSWXE8fuLG2gyco7/UAesdP/6', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:10', '2025-09-27 19:11:10'),
(23, 'Cardio', 'it2223@basis.org.bd', NULL, '$2y$12$Ge7vgSiUW7uokSBNZwyPIOMZeo.lOloOidRc4bC/VZdjNFzzffRc2', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:19', '2025-09-27 19:11:19'),
(24, 'Cardio', '2a3@a.com', NULL, '$2y$12$.zQh0kGwPaBlA1ekeGjSP.MLK.ljeqgwmfMe75ZEEgp6dOk/J8hBa', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:30', '2025-09-27 19:11:30'),
(31, 'Cardio', 'dev2332@basis.org.bd', NULL, '$2y$12$iODuQefzCmKNTqJeMtwx7u28dp0.xSWXE8fuLG2gyco7/UAesdP/6', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:10', '2025-09-27 19:11:10'),
(32, 'Cardio', 'it3222@basis.org.bd', NULL, '$2y$12$Ge7vgSiUW7uokSBNZwyPIOMZeo.lOloOidRc4bC/VZdjNFzzffRc2', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:19', '2025-09-27 19:11:19'),
(33, 'Cardio', '2a3223@a.com', NULL, '$2y$12$.zQh0kGwPaBlA1ekeGjSP.MLK.ljeqgwmfMe75ZEEgp6dOk/J8hBa', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:30', '2025-09-27 19:11:30'),
(34, 'Cardio', 'dev2323@basis.org.bd', NULL, '$2y$12$iODuQefzCmKNTqJeMtwx7u28dp0.xSWXE8fuLG2gyco7/UAesdP/6', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:10', '2025-09-27 19:11:10'),
(35, 'Cardio', 'it22323@basis.org.bd', NULL, '$2y$12$Ge7vgSiUW7uokSBNZwyPIOMZeo.lOloOidRc4bC/VZdjNFzzffRc2', 4, 'judge', NULL, NULL, 'active', '2025-09-27 19:11:19', '2025-09-27 19:11:19'),
(36, 'Cardio', '2a33@a.com', NULL, '$2y$12$.zQh0kGwPaBlA1ekeGjSP.MLK.ljeqgwmfMe75ZEEgp6dOk/J8hBa', 4, 'judge', NULL, NULL, 'inactive', '2025-09-27 19:11:30', '2025-09-29 20:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `title`, `url`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'https://en.wikipedia.org/wiki/Dhaka', 1, 'active', '2022-08-06 21:36:11', '2022-08-06 21:38:40'),
(2, 'Rajshahi', 'https://2022.spaceappschallenge.org/locations/rajshahi/', 2, 'active', '2022-08-06 21:36:22', '2022-09-13 03:28:00'),
(3, 'Rangpur', 'https://2022.spaceappschallenge.org/locations/rangpur/', 3, 'active', '2022-08-06 21:39:54', '2022-09-13 03:27:42'),
(4, 'Sylhet', 'https://2022.spaceappschallenge.org/locations/sylhet/', 4, 'active', '2022-08-06 21:41:07', '2022-09-13 03:27:24'),
(5, 'Mymensingh', 'https://2022.spaceappschallenge.org/locations/mymensingh/', 5, 'active', '2022-08-06 21:41:27', '2022-09-13 03:27:07'),
(6, 'Khulna', 'https://2022.spaceappschallenge.org/locations/khulna/', 6, 'active', '2022-08-06 21:41:44', '2022-09-13 03:26:51'),
(7, 'Chittagong', 'https://2022.spaceappschallenge.org/locations/chattogram/', 7, 'active', '2022-08-06 21:42:01', '2022-09-13 03:25:43'),
(8, 'Barisal', 'https://2022.spaceappschallenge.org/locations/barisal/', 8, 'active', '2022-08-06 21:42:19', '2022-09-13 03:25:01'),
(9, 'Cumilla', 'https://2022.spaceappschallenge.org/locations/cumilla/', 9, 'active', '2022-08-16 22:52:33', '2022-09-13 03:24:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `project_room`
--
ALTER TABLE `project_room`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room_user`
--
ALTER TABLE `room_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `site_configs`
--
ALTER TABLE `site_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3576;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
