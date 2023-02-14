-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 10.212.168.19:3306
-- Generation Time: Jan 16, 2023 at 01:46 PM
-- Server version: 10.4.12-MariaDB-1:10.4.12+maria~bionic
-- PHP Version: 8.0.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysql_db`
--
CREATE DATABASE IF NOT EXISTS `mysql_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mysql_db`;

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
CREATE TABLE IF NOT EXISTS `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `connection_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `next_id` (`next_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `name`, `description`, `max_attempts`, `value`, `category`, `type`, `state`, `requirements`, `connection_info`, `next_id`) VALUES
(13, 'Broken Card', 'Santa sent me a greeting card but I can\'t access it. Can you?\r\n\r\nFlag format: julectf2022{...}', 0, 449, 'Forensics', 'dynamic', 'visible', NULL, NULL, NULL),
(14, 'Catch Me ', 'The key got lost in the crowd. Can you find it!\r\n\r\nFlag format:julectf2022{...}\r\n', 0, 218, 'Miscellaneous', 'dynamic', 'visible', NULL, NULL, NULL),
(15, 'Christmas shop', 'The elves opened a christmas shop to get everyone ready themselves for christmas! Buy yourself some nice christmas cookies, sweaters and potentially flags as well!\r\n\r\nFlag format: julectf2022{...}', 0, 500, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3334/', NULL),
(16, 'Coal as presents', 'I have been nice the whole year, but all i got was this tiny picture\r\n\r\nFlag format: julectf2022{...}', 0, 490, 'Miscellaneous', 'dynamic', 'visible', NULL, NULL, NULL),
(21, 'Entanglement', 'Tony Stark\'s suit has crashed, and needs to be rebooted so he can deal with Ultron. However, time is running out, and he can\'t remember his password. Can you help him?\r\n\r\nFlag format: julectf{...}', 0, 375, 'Reverse', 'dynamic', 'visible', NULL, NULL, NULL),
(22, 'Exclusively Secure String', '<p>The flag is encrypted using XOR with a linear congruential generator.</p>\r\n<p>There is NO way for you to crack my flag.</p>\r\n<p>You can even have my source code if you want.</p>\r\n\r\nFlag format: julectf2022{...}', 0, 490, 'Crypto', 'dynamic', 'visible', NULL, 'nc challenges.ncr-playground.no 3340', NULL),
(24, 'Flappy Santa', '<p>Can you beat my highscore?</p>\r\n<p>Flag is lower case \"julectf2022{}\" with capital letters and numbers inside the curly brackets </p>\r\n\r\nFlag format: julectf2022{...}', 0, 408, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3243/', NULL),
(25, 'Flushed away', 'I named the challenge after the film `flushed away`. Not related to the challenge at all.\r\n\r\nFlag format: julectf2022{...}', 0, 477, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3000/', NULL),
(28, 'Gifts', '<p>The christmas elves had mixed up and forgotten to place the colored gift packages in their correct placements.</p>\r\n<p>Since the correct order of colored gift packages do matter for Santa, help the elves organize the gift packages correctly.</p>\r\n<p>The Flag is enclosed in \"julectf2022{}\" and has a random hash value inside the curly brackets</p>\r\n\r\nFlag format: julectf2022{...}', 0, 498, 'Reverse', 'dynamic', 'visible', NULL, 'http://challenges.ncr-playground.no:3333/', NULL),
(29, 'Gingerbread baking', '<p>The elves were baking gingerbread cookies for the christmas and did succesfully bake an amazing cookie for the Santa.</p>\r\n<p>The problem, however, is that they had forgotten to write down the exact ingredients used to bake that cookie!</p>\r\n<p>Try to reproduce the steps taken when baking that cookie, and help the elves figure out how Santa\'s cookie was made!</p>\r\n<p>The Flag is enclosed in \"julectf2022{}\" and has a random hash value inside the curly brackets</p>\r\n<p>MD5 checksum for flag: <code>180a718338c92bd964b981cb15ca73e1</code></p>\r\n\r\nFlag format: julectf2022{...}\r\n				', 0, 495, 'Reverse', 'dynamic', 'visible', NULL, NULL, NULL),
(33, 'Infected Blog', '<p>We recently had to fire an employee for gross misconduct against our business. We disabled his access to our file servers immediately, but he\'s now sending us blackmail. He claims that he has discovered a vulnerability in our website and can use it to access all of our company data. Fortunately for us, we managed to obtain a packet capture of the supposed incident. Can you see if he\'s managed to steal anything of value?</p>\r\n\r\nAttachements: \r\nhttps://github.com/ncr-no/JuleCTF/tree/master/infected_blog\r\n\r\nFlag format: julectf2022{...}', 0, 495, 'Forensics', 'dynamic', 'visible', NULL, NULL, NULL),
(35, 'JWTF', '<p>I wrote this made cool website that lets you generate and verify JSON Web Tokens!</p>\r\n\r\nFlag format: julectf2022{...}', 0, 500, 'Crypto', 'dynamic', 'visible', NULL, 'http://challenges.ncr-playground.no:3307/', 37),
(37, 'JWTF 2: Elliptic Boogaloo', '<p>RSA turns out to be a dangerous footgun, so I rewrote my app to use elliptic curves instead!</p>\r\n<p>Unlike RS256, with ES256, I don\'t need to do any paramter selction when generating the keypair!</p>\r\n\r\nFlag format: julectf2022{...}', 0, 500, 'Crypto', 'dynamic', 'visible', NULL, 'http://challenges.ncr-playground.no:3313/', NULL),
(38, 'Lekkasje', 'En av kundene våre ble i slutten av november utsatt for et hackerangrep, der vi mistenker at sensitiv data ble stjålet. Heldigvis har vi loggført all trafikken mot tjenesten. Kan du finne ut hva hackerne fikk tak i?\r\n\r\nOne of our clients were subject of a hacker attack at the end of November, where we suspect sensitive data have been stolen. Fortunately, we have logged all traffic to the service. Can you figure out what the hackers managed to get?\r\n\r\nAttachments:\r\nhttps://github.com/ncr-no/JuleCTF/tree/master/Lekkasje\r\n\r\nFlag format: julectf2022{...}', 0, 498, 'Forensics', 'dynamic', 'visible', NULL, NULL, NULL),
(42, 'Notater', 'For å holde orden i alle notatene mine lagde jeg min første webapplikasjon, der du kan samle alt du trenger. For å spare plass på tjeneren har jeg valgt å legge alle notatene kryptert i informasjonskapselen.\r\n\r\n\r\n// In order to keep all my notes organized I decided to make my first web application, where you can store everything you need. To save space on the server I have decided to store all my notes encrypted in the cookie.\r\n\r\nFlag format: julectf2022{...}', 0, 500, 'Crypto', 'dynamic', 'visible', NULL, 'http://challenges.ncr-playground.no:3217/', NULL),
(44, 'Santa\'s list', '<p>Santa has been writing down a list containing the favourite gifts of all the kids for this year, and as the elves have been wishing for the flag as much as you do, they believe that the flag is in that list as well.</p>\r\n        <p>For safety measures, the list containing the gifts are stored in a web based safe written in React and Typescript, which should be type safe.</p>\r\n        <p>Do you think that you can retrieve the flag before christmas?</p>\r\n				\r\nFlag format: julectf2022{...}\r\n', 0, 484, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3335/', NULL),
(45, 'Sidewinder', '<p>A venomous snake with the flag you\'re looking for was found lurking in our family\'s Christmas tree.</p>\r\n        <p>I heard that it\'s blazingly fast now that it is 11 years. There is no way you\'re catching that.</p>\r\n        <br/>\r\n        <p>The Flag is enclosed in \"julectf2022{}\" and has a random hash value inside the curly brackets</p>\r\n        <p>MD5 checksum for flag: <code>d9ea1d40a7e77aeba01b1117085705c6</code></p>\r\n				\r\nFlag format: julectf2022{...}\r\n', 0, 500, 'Reverse', 'dynamic', 'visible', NULL, NULL, NULL),
(46, 'Tålmodig', 'Den nye nettsiden vår ble nylig angrepet! Heldigvis fikk vi fanget opp den relevante trafikken fra angriperne. Kan du finne ut hva de stjal?\r\n\r\n// Our new website was recently attacked! Luckily we captured the relevant traffic from the attackers. Can you find out what they stole?\r\n\r\nAttachments:\r\nhttps://github.com/ncr-no/JuleCTF/tree/master/T%C3%A5lmodig\r\n\r\nFlag format: julectf2022{...}\r\n', 0, 490, 'Forensics', 'dynamic', 'visible', NULL, NULL, NULL),
(47, 'Tic Tac Mistletoe', '<p>The christmas elves have opened up a platform where you can play against them in a game of TicTacToe for christmas.</p>\r\n        <p>They are willing to give you the flag if you are able to win at least once. We all believe in you!</p>\r\n				\r\nFlag format: julectf2022{...}\r\n', 0, 500, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3336/', NULL),
(49, 'Wishlist', 'Santa has seen discord and found it more valuable than sending postcards. He wanted some students to develop a bot to save some wishes.\r\nHowever, we suspect the underdeveloped version of the bot is vulnerable. Are you able to exploit it?\r\n\r\nDiscord link: https://discord.gg/3bFdGG9YBz\r\nCommand to invoke bot: `!julectf`\r\n\r\nFlag format: julectf2022{...}\r\n', 0, 469, 'Miscellaneous', 'dynamic', 'visible', NULL, NULL, NULL),
(50, 'Drone 1', 'A car was checked at the border, and they found a drone. We have included two clips. Can you tell us where the first part is taken?\r\n\r\nAttachments:\r\nhttps://github.com/ncr-no/JuleCTF/tree/master/Drone\r\n\r\nFlag format: julectf2022{...}', 0, 436, 'OSINT', 'dynamic', 'visible', NULL, NULL, 51),
(51, 'Drone 2', 'What company is related to the 2nd photo?\r\nWe know the drone to be of type Parrot ANAFI AI and that 9 minutes and 20 seconds of video footage is missing between the clips.\r\nNOTE: Cannot be solved without solving Drone 1 first.\r\n\r\nAttachments:\r\nhttps://github.com/ncr-no/JuleCTF/tree/master/Drone%202\r\n\r\nFlag format: julectf2022{...}\r\n', 0, 500, 'OSINT', 'dynamic', 'visible', NULL, NULL, NULL),
(52, 'God Jul', 'Complete the questionaire to get the flag!', 0, 100, 'Miscellaneous', 'standard', 'visible', NULL, 'https://nettskjema.no/a/julectf2022', NULL),
(53, 'Moving button', 'Solve the issue and find the flag!\r\n\r\nFlagformat: julectf2022{...}', 0, 100, 'Web', 'dynamic', 'hidden', NULL, 'http://challenges.ncr-playground.no:3444/', NULL),
(54, 'The Food', 'We have intel that the thai shed just outside of the image on the right side is involved with drug trafficing. Can you tell us what company this is so we can take appropiate action?\r\n\r\nThe flag is case sensitive, make sure you write it exactly as it appears.\r\n\r\nAttachments:\r\nhttps://github.com/ncr-no/JuleCTF/tree/master/thaifood\r\n\r\nFlag format: julectf2022{...}', 0, 495, 'OSINT', 'dynamic', 'visible', NULL, NULL, NULL),
(55, 'Challenge 1', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 498, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(56, 'Challenge 2', '	The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 495, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(57, 'Challenge 3', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 500, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(58, 'Challenge 4', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 500, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(59, 'Challenge 5', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 500, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(60, 'Challenge 6', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 498, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(61, 'Challenge 7', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 500, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL),
(62, 'Challenge 8', 'The infrastructure contains services from the following network addressess:\r\n\r\n\r\n\r\n  1. 10.10.10.10/24\r\n\r\n  2. 10.11.10.10/24\r\n\r\n  3. 10.12.10.10/24\r\n\r\n\r\n\r\nuse your skill to exploit the existing vulnerabilties on within those mentioned network addresses and find the flag from the system.\r\n\r\n\r\n\r\nFlag format: <code>julectf2022{..}</code>', 0, 500, 'Penetration', 'dynamic', 'hidden', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_challenge`
--

DROP TABLE IF EXISTS `dynamic_challenge`;
CREATE TABLE IF NOT EXISTS `dynamic_challenge` (
  `id` int(11) NOT NULL,
  `initial` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `decay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dynamic_challenge`
--

INSERT INTO `dynamic_challenge` (`id`, `initial`, `minimum`, `decay`) VALUES
(13, 500, 100, 25),
(14, 500, 100, 25),
(15, 500, 100, 25),
(16, 500, 100, 25),
(21, 500, 100, 25),
(22, 500, 100, 25),
(24, 500, 100, 25),
(25, 500, 100, 25),
(28, 500, 100, 25),
(29, 500, 100, 25),
(33, 500, 100, 25),
(35, 500, 100, 25),
(37, 500, 100, 25),
(38, 500, 100, 25),
(42, 500, 100, 25),
(44, 500, 100, 25),
(45, 500, 100, 25),
(46, 500, 100, 25),
(47, 500, 100, 25),
(49, 500, 100, 25),
(50, 500, 100, 25),
(51, 500, 100, 25),
(53, 500, 100, 25),
(54, 500, 100, 25),
(55, 500, 100, 25),
(56, 500, 100, 25),
(57, 500, 100, 25),
(58, 500, 100, 25),
(59, 500, 100, 25),
(60, 500, 100, 25),
(61, 500, 100, 25),
(62, 500, 100, 25);

-- --------------------------------------------------------

--
-- Table structure for table `solves`
--

DROP TABLE IF EXISTS `solves`;
CREATE TABLE IF NOT EXISTS `solves` (
  `id` int(11) NOT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`,`team_id`),
  UNIQUE KEY `challenge_id_2` (`challenge_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `solves`
--

INSERT INTO `solves` (`id`, `challenge_id`, `user_id`, `team_id`) VALUES
(132, 14, 58, NULL),
(133, 21, 49, NULL),
(134, 21, 58, NULL),
(135, 14, 54, NULL),
(141, 14, 53, NULL),
(142, 16, 54, NULL),
(143, 21, 54, NULL),
(144, 13, 49, NULL),
(145, 14, 18, NULL),
(146, 50, 49, NULL),
(149, 50, 26, NULL),
(154, 14, 26, NULL),
(155, 50, 60, NULL),
(160, 14, 60, NULL),
(174, 29, 54, NULL),
(176, 45, 54, NULL),
(182, 50, 6, NULL),
(207, 54, 6, NULL),
(208, 14, 6, NULL),
(209, 49, 6, NULL),
(219, 52, 6, NULL),
(220, 21, 6, NULL),
(224, 53, 6, NULL),
(225, 22, 54, NULL),
(226, 49, 54, NULL),
(227, 52, 54, NULL),
(228, 13, 54, NULL),
(229, 53, 66, NULL),
(230, 53, 68, NULL),
(231, 52, 69, NULL),
(232, 53, 69, NULL),
(233, 53, 49, NULL),
(234, 52, 49, NULL),
(235, 14, 49, NULL),
(241, 53, 17, NULL),
(242, 50, 38, NULL),
(243, 53, 54, NULL),
(245, 24, 54, NULL),
(248, 50, 40, NULL),
(249, 50, 61, NULL),
(250, 52, 61, NULL),
(251, 52, 40, NULL),
(252, 22, 20, NULL),
(253, 14, 20, NULL),
(254, 49, 20, NULL),
(255, 53, 72, NULL),
(256, 53, 20, NULL),
(258, 24, 20, NULL),
(259, 25, 20, NULL),
(260, 44, 20, NULL),
(261, 25, 72, NULL),
(262, 14, 38, NULL),
(263, 28, 54, NULL),
(264, 13, 20, NULL),
(270, 21, 20, NULL),
(272, 24, 38, NULL),
(273, 53, 38, NULL),
(274, 21, 38, NULL),
(275, 25, 38, NULL),
(276, 37, 20, NULL),
(277, 35, 20, NULL),
(278, 29, 20, NULL),
(279, 44, 38, NULL),
(280, 50, 29, NULL),
(281, 13, 47, NULL),
(282, 53, 47, NULL),
(284, 24, 47, NULL),
(287, 52, 47, NULL),
(288, 14, 47, NULL),
(289, 52, 56, NULL),
(290, 53, 56, NULL),
(291, 14, 56, NULL),
(292, 53, 75, NULL),
(293, 53, 77, NULL),
(294, 21, 47, NULL),
(295, 24, 75, NULL),
(298, 52, 76, NULL),
(299, 24, 77, NULL),
(300, 25, 77, NULL),
(301, 46, 47, NULL),
(302, 53, 78, NULL),
(303, 14, 79, NULL),
(305, 16, 79, NULL),
(306, 13, 79, NULL),
(307, 44, 77, NULL),
(308, 53, 76, NULL),
(309, 21, 77, NULL),
(310, 14, 77, NULL),
(311, 13, 77, NULL),
(312, 21, 80, NULL),
(313, 44, 6, NULL),
(314, 53, 10, NULL),
(315, 24, 10, NULL),
(316, 52, 7, NULL),
(317, 53, 18, NULL),
(318, 14, 7, NULL),
(319, 49, 7, NULL),
(320, 52, 80, NULL),
(323, 14, 80, NULL),
(325, 49, 80, NULL),
(326, 53, 7, NULL),
(327, 52, 10, NULL),
(328, 14, 10, NULL),
(330, 24, 7, NULL),
(331, 49, 10, NULL),
(332, 52, 38, NULL),
(333, 50, 10, NULL),
(335, 16, 56, NULL),
(336, 46, 10, NULL),
(337, 53, 82, NULL),
(338, 21, 83, NULL),
(340, 14, 82, NULL),
(346, 24, 82, NULL),
(347, 25, 82, NULL),
(348, 52, 20, NULL),
(350, 13, 56, NULL),
(351, 21, 82, NULL),
(352, 53, 80, NULL),
(353, 46, 79, NULL),
(356, 28, 83, NULL),
(358, 50, 84, NULL),
(364, 54, 84, NULL),
(365, 53, 84, NULL),
(366, 21, 7, NULL),
(367, 53, 85, NULL),
(368, 14, 85, NULL),
(369, 52, 77, NULL),
(370, 52, 85, NULL),
(374, 38, 79, NULL),
(375, 49, 79, NULL),
(376, 52, 79, NULL),
(377, 33, 79, NULL),
(378, 29, 83, NULL),
(379, 53, 83, NULL),
(381, 24, 83, NULL),
(382, 25, 83, NULL),
(384, 44, 83, NULL),
(386, 52, 83, NULL),
(387, 14, 83, NULL),
(388, 49, 83, NULL),
(389, 52, 53, NULL),
(390, 13, 83, NULL),
(391, 53, 86, NULL),
(395, 46, 54, NULL),
(396, 14, 84, NULL),
(397, 33, 54, NULL),
(406, 24, 49, NULL),
(408, 53, 26, NULL),
(419, 53, 42, NULL),
(421, 56, 38, NULL),
(425, 58, 38, NULL),
(426, 21, 42, NULL),
(427, 52, 42, NULL),
(429, 53, 79, NULL),
(430, 38, 54, NULL),
(441, 33, 83, NULL),
(445, 46, 77, NULL),
(446, 25, 10, NULL),
(447, 21, 10, NULL),
(448, 55, 38, NULL),
(450, 29, 10, NULL),
(452, 56, 83, NULL),
(453, 35, 10, NULL),
(454, 37, 10, NULL),
(456, 54, 10, NULL),
(457, 22, 83, NULL),
(458, 22, 10, NULL),
(459, 13, 10, NULL),
(460, 44, 10, NULL),
(462, 16, 10, NULL),
(464, 62, 38, NULL),
(465, 52, 29, NULL),
(467, 60, 38, NULL),
(471, 58, 10, NULL),
(472, 28, 10, NULL),
(473, 47, 10, NULL),
(474, 33, 10, NULL),
(476, 59, 38, NULL),
(484, 55, 10, NULL),
(490, 16, 83, NULL),
(494, 60, 85, NULL),
(495, 53, 91, NULL),
(500, 24, 91, NULL),
(506, 62, 10, NULL),
(508, 60, 10, NULL),
(511, 59, 10, NULL),
(529, 56, 10, NULL),
(530, 22, 94, NULL),
(531, 53, 94, NULL),
(532, 53, 96, NULL),
(533, 38, 10, NULL),
(534, 53, 97, NULL),
(540, 24, 97, NULL),
(541, 50, 96, NULL),
(542, 54, 96, NULL),
(543, 52, 96, NULL),
(544, 21, 97, NULL),
(545, 14, 97, NULL),
(546, 13, 97, NULL),
(547, 55, 20, NULL),
(548, 56, 20, NULL),
(549, 15, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bracket` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `captain_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_captain_id` (`captain_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bracket` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_id` (`team_id`)
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_id`, `name`, `password`, `email`, `type`, `secret`, `website`, `affiliation`, `country`, `bracket`, `hidden`, `banned`, `verified`, `team_id`, `created`) VALUES
(1, NULL, 'ncr-admin', '$bcrypt-sha256$v=2,t=2b,r=12$tWHoEKpGqJkzS8qc5Av/gu$gkldNjOemhrgGx7yBotk68PwR/k6S3S', 'md.m.i.peal@ntnu.no', 'admin', NULL, NULL, 'Norwegian Cyber Range', 'NO', NULL, 1, 0, 1, NULL, '2022-10-10 07:40:50'),
(2, NULL, 'xeqtr', '$bcrypt-sha256$v=2,t=2b,r=12$RdV1jbN0qXmZogXlBo7Fiu$6IxLD9YT1wgHUTgmVjqqrxmUAj4NFtm', 'krifager@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-19 15:16:09'),
(3, NULL, 'Sithis', '$bcrypt-sha256$v=2,t=2b,r=12$bwS4kNtC8QJeVT9PZs6LUu$bqdzmI6xr2q7HGOJZwaDhNTFZenewwG', '517h15@protonmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-19 17:23:54'),
(4, NULL, 'pettejor', '$bcrypt-sha256$v=2,t=2b,r=12$2hCSag68nO5NViwwLlMfBO$Un7vf32AgAjlorhreZ11DaPqbjkm/gi', 'pettejor@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-19 17:28:02'),
(5, NULL, 'AAAAAAAAA', '$bcrypt-sha256$v=2,t=2b,r=12$YJrivLkkpHkoErWamz1XD.$/OXMQbT48z/5G/H1X6XZ4eazyvTssOC', 'vejo@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-19 18:57:02'),
(6, NULL, 'Kihle', '$bcrypt-sha256$v=2,t=2b,r=12$BgcPWX9fQZU5DahPhw62mO$2URpm4xAqOWoBdPBlBsKkdKeeubaZBS', 'frederick.kihle@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-19 22:21:30'),
(7, NULL, 'sdushantha', '$bcrypt-sha256$v=2,t=2b,r=12$DvH5pkb.Gq6cNGu4vIIMS.$i/UjFYOHwCpiSpXUnsJrn.12CgEEICC', 'siddharth.dushantha@gmail.com', 'user', NULL, 'https://github.com/sdushantha', NULL, 'NO', NULL, 0, 0, 1, NULL, '2022-10-20 05:36:27'),
(8, NULL, 'nordbo', '$bcrypt-sha256$v=2,t=2b,r=12$uLg51ITV1GL3wf1WOmbTAO$9i0MjKgke9jXseuSXqwkZVmfysp2Qp6', 'julectf@nord.bo', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-21 07:34:47'),
(9, NULL, 'henrielt', '$bcrypt-sha256$v=2,t=2b,r=12$d5jcvCsVSd6agyxUpC8QpO$xWmBSsOpQWYcyz3m9IO9aPKj14Vpr22', 'henriettem_e@hotmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-21 20:13:04'),
(10, NULL, 'marti201', '$bcrypt-sha256$v=2,t=2b,r=12$SLqL7/IylgY0BsOJ5vPae.$lBeeWjjNy36k09w6922FZoKm07.FaBO', 'martiml@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-10-22 20:45:10'),
(11, NULL, 'shirajuki', '$bcrypt-sha256$v=2,t=2b,r=12$EuTHKNa8Yn3X52ogc1mDn.$oBfnDY7QNsqj13p81yLCN9sXvTPCGTC', 'shirajuki@duck.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-03 22:58:41'),
(12, NULL, '[EFFERA] KAGO', '$bcrypt-sha256$v=2,t=2b,r=12$w8SUPrOfl10BbL2Bosm.Iu$g4gIEV7DaF8dD5R9PKRTR9bS.OddJd6', 'andkago@gmail.com', 'user', NULL, NULL, NULL, 'NO', NULL, 0, 0, 1, NULL, '2022-11-21 13:58:21'),
(13, NULL, 'IApologise', '$bcrypt-sha256$v=2,t=2b,r=12$32Bo6GVsu/TT8wvakppm5e$TBaLgwshylDl821l8sIdS5/D8gnwoHm', 'justasim54@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-24 08:30:18'),
(14, NULL, 'ragev', '$bcrypt-sha256$v=2,t=2b,r=12$vOfOi.iJpLx3EUE42zVEAu$f9x6wgHLA2VW5YIc9roiYH0Nf2CvQHG', 'master.vegar@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-24 18:07:38'),
(15, NULL, 'warhead', '$bcrypt-sha256$v=2,t=2b,r=12$nnRlyAliuOFvOrC5kybUOu$IDM.zdfpvPhkD5Q8tyb9M8bLCriPKoi', 'codewarhead@gmail.com', 'admin', NULL, NULL, NULL, 'BD', NULL, 1, 0, 1, NULL, '2022-11-30 15:40:47'),
(16, NULL, 'Majid97', '$bcrypt-sha256$v=2,t=2b,r=12$gSVXpz1p2fk8phCDk8Tpru$xmf4gYcpoPAw9VkXImQAbE2bhTKZ9mW', 'abdelmajid.benabdallah@ntnu.no', 'admin', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, '2022-11-30 16:03:41'),
(17, NULL, 'Mad', '$bcrypt-sha256$v=2,t=2b,r=12$8GjMBNZcGsepcu/fCXHEpu$19t9cKePilXEmtS0JqC0EDxFF20GtKO', 'ctf.mad@gmail.com', 'user', NULL, NULL, NULL, 'NO', NULL, 0, 0, 1, NULL, '2022-11-30 16:43:09'),
(18, NULL, 'th05m45', '$bcrypt-sha256$v=2,t=2b,r=12$uzhxcwoy9p8gPgZk.wTWSO$JG/DU0qXRvhRy8b.PdoDeCoVWliq2v2', 'thomasfinv@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-30 16:43:24'),
(19, NULL, 'Cx', '$bcrypt-sha256$v=2,t=2b,r=12$5yA6GSiwTXRXeTFqp6iHV.$VTrZ6yQoRdU96F/gXk56dIvVffu4H42', 'cx@nord.bo', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-30 17:47:48'),
(20, NULL, 'SimenBai', '$bcrypt-sha256$v=2,t=2b,r=12$SpSl7EKyuh1h/kzZ863TTO$EWEhQRNUBlMwVhwpg/iZOSqgUD8WEwO', 'julectf@simenbai.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-30 18:04:44'),
(21, NULL, 'Ph0s4', '$bcrypt-sha256$v=2,t=2b,r=12$OQP7mwjXJpo8zyYrKDM8Ze$YyXNYMCsCzMOUhG45kzp7HcQXKZLp.C', 'ctf.phos4@gmail.com', 'user', NULL, NULL, NULL, 'NO', NULL, 0, 0, 1, NULL, '2022-11-30 18:09:43'),
(22, NULL, 'klarz', '$bcrypt-sha256$v=2,t=2b,r=12$tbws6mUp4TgzMeNruwO2.O$eZSPMypKUAUH/o1DVMEYWSTP34GGnza', 'mklarz@protonmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-11-30 23:21:54'),
(23, NULL, 'user', '$bcrypt-sha256$v=2,t=2b,r=12$5FiJIBFYVJrVa6N2IUMAgO$R/NVfgjDfod4QB17dHxKE91DOFa3s1u', 'ctf@sebastianpc.me', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-01 09:08:52'),
(24, NULL, 'ikkjeamélie', '$bcrypt-sha256$v=2,t=2b,r=12$rIeaoSd8ZvGPvgx6YNgfbu$zOYuj1qSRZmRdEClSYj2W1Y6rBXfEw6', 'amelie.wigum@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-02 13:50:34'),
(25, NULL, 'ulanege', '$bcrypt-sha256$v=2,t=2b,r=12$s0PAQxwQzIDfbs0Inse5C.$kD0slc9b5AtcTFF953ZArMGHB8sFoEy', 'kalkisimege@gmail.com', 'user', NULL, NULL, NULL, 'TR', NULL, 0, 0, 1, NULL, '2022-12-04 13:13:44'),
(26, NULL, 'Goldy', '$bcrypt-sha256$v=2,t=2b,r=12$jQhsGOjBlpQCOKSsdFCxOO$mRXfkZbdbFp4lIRyVX7wzS0UtxOq.d6', 'susheelji20@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-06 13:49:49'),
(27, NULL, '4nsick', '$bcrypt-sha256$v=2,t=2b,r=12$pAm/mdr/o8dHMw/oyUW61u$/FfFaLOs90EXSn9Lfz51N69z1tUFooq', 'simennorstebo@hotmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-08 18:06:03'),
(28, NULL, 'bjornmorten', '$bcrypt-sha256$v=2,t=2b,r=12$FInzTrT7mrlD4fMUBzKgnO$AgcduRrYxXd/yYyO5TPUxXQVdU/dBuG', 'bjornmoa@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-08 20:58:26'),
(29, NULL, 'noor', '$bcrypt-sha256$v=2,t=2b,r=12$NX5W2nno1sMOAzlgdJDev.$rqfNd0dZliV35ofAes3LoYp4H2bAhRO', 'areebanoorch@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 11:01:36'),
(30, NULL, 'Carixo', '$bcrypt-sha256$v=2,t=2b,r=12$lSPCdCYWxDkA7jYlSVD34e$8C8fJy1eRqCg94T6kLF70kJ33rQ8wg2', 'shayan.alinejad@protonmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 11:08:29'),
(31, NULL, 'test', '$bcrypt-sha256$v=2,t=2b,r=12$vmswCrm47dHN2w6rc7/lAO$Sb6zubS6X/KKiYSQ4GCgHn0jZHqj7cW', 'test@nord.bo', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 11:53:05'),
(32, NULL, 'Waow', '$bcrypt-sha256$v=2,t=2b,r=12$3.FehD1BmTBkyGrO/69cCO$i84.2O5xDjM/.ymM0uzG74jiosqRMua', 'mystic.sheik@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 12:07:52'),
(33, NULL, 'danzi', '$bcrypt-sha256$v=2,t=2b,r=12$yPklvQqVi4vMcaGQ5FyY9O$O/U1m3pPxiqSKS3IZbtZQnitmjw/d/S', 'ralos.raal+ctf@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 12:41:05'),
(34, NULL, 'username', '$bcrypt-sha256$v=2,t=2b,r=12$opiHsKQkjRN4HAJ4eyXI8O$ABhYUpAEdnmreghDtu006kTXsWaK0Sy', 'username@pm.me', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '2022-12-09 13:22:02'),
(35, NULL, 'Anibanan1', '$bcrypt-sha256$v=2,t=2b,r=12$vKWgQ8Z3s4B9tnrbE76D4u$LKK1OC8LDUwB2hmiyH3/tn3xfT6ROw2', 'ane_emilie@hotmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-09 16:56:41'),
(36, NULL, 'cyberwick', '$bcrypt-sha256$v=2,t=2b,r=12$dClZcDBWMsCwiHLZU2Xc2O$aeBtxXVA2.vpkdJS0HgncT18Ss0XFfK', 'noohaniammar@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-10 05:46:55'),
(37, NULL, 'tbwiik', '$bcrypt-sha256$v=2,t=2b,r=12$lyR4BZyB13sNStFyCer9HO$.3oQhsV1R5L7dmLyREPAwwi7wNSYhRi', 'torwii@outlook.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-10 12:28:49'),
(38, NULL, 'Freez', '$bcrypt-sha256$v=2,t=2b,r=12$ksvL1aSb8w.CnA9SN9Djj.$H0sgvAjwLJ5ODdKrnXCrVZsRCrVdpFu', 'robert.zakariassen@lyse.net', 'user', NULL, NULL, 'ikke elev', NULL, NULL, 0, 0, 1, NULL, '2022-12-10 12:35:42'),
(39, NULL, 'sh❄️', '$bcrypt-sha256$v=2,t=2b,r=12$6VHJVPcBi4wCWvSH4Pe9He$ZcOV/epOXRlvyyWrMKNIZeb53bomr2S', 'shirajuki@corax.team', 'user', NULL, NULL, NULL, 'AQ', NULL, 0, 0, 1, NULL, '2022-12-10 21:29:41'),
(40, NULL, '0nyx', '$bcrypt-sha256$v=2,t=2b,r=12$hKyRId.Kge2fAhM4GC7d1O$6Y3O2dfvvPYWk4K6IAIEVPS/WVj6Kr.', 'rihab0694@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-11 16:29:40'),
(41, NULL, 'Ananas', '$bcrypt-sha256$v=2,t=2b,r=12$wFSMOCKDg1PQVeQo8urcqu$mv8iR9j0RD.4k7pF6V5qlF1OqxZhCuS', 'vpboztyoyauftirksb@tmmbt.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-11 16:38:15'),
(42, NULL, 'ezkill', '$bcrypt-sha256$v=2,t=2b,r=12$YElajEfYGLSIiZqcSvjfgO$MFVrzLoOHA2ZbGMWeRHhoZepSJNmfPq', 'eskillr@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-12 12:20:27'),
(43, NULL, 'ananas2', '$bcrypt-sha256$v=2,t=2b,r=12$BMkhLbgprd4yJz712.0ukO$lFCtbwYuLHCFS72hlJN6Ma/VL.H2Bv6', 'awrqrtfvznnrclisvc@tmmcv.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-12 21:05:38'),
(44, NULL, 'nivia', '$bcrypt-sha256$v=2,t=2b,r=12$dLz6V4qFqD8klu0Je07X4O$I0GVoK3KR0tIxUoEvUAfekY1LXLCs5C', '3029403086@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-13 01:02:30'),
(45, NULL, 'ylz', '$bcrypt-sha256$v=2,t=2b,r=12$xcApqc7qjXGH1gG6ab3fee$TWUv5a9BUzqo37mtEW7R30A7LzNGWHi', '75665915@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-13 01:54:52'),
(46, NULL, 'magnus', '$bcrypt-sha256$v=2,t=2b,r=12$f56RQANhEdZl69AuupQlIe$0Tp0HraAPpoeNgXL1DMUH42O1diCcV2', 'magnus@5h.no', 'user', NULL, 'https://www.linkedin.com/in/magnus-nymo/', NULL, 'NO', NULL, 0, 0, 1, NULL, '2022-12-13 13:01:43'),
(47, NULL, 'fzhshzh', '$bcrypt-sha256$v=2,t=2b,r=12$sBo.mhCEx7zSNVSg.vshUu$yUsLGSPJobtEFpDJuyZeWapcix8ePoe', '27585452@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-14 01:07:34'),
(48, NULL, 'ukoum', '$bcrypt-sha256$v=2,t=2b,r=12$wQkxdtO4O5lZXBONEXxYRO$tuNma4XARDNPXHAiYwHftrRX3ticlR6', 'zzyyrrdyx@163.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-14 10:49:12'),
(49, NULL, 'Oluf', '$bcrypt-sha256$v=2,t=2b,r=12$bE/N2pnVDNRBn33b8H36le$CWeL7DvUK9KroQ4gnYzYX4uyoxMeNEG', 'janosto@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-14 16:23:57'),
(50, NULL, 'laserskip', '$bcrypt-sha256$v=2,t=2b,r=12$1NkCXoyXwx95P3bdfOVGkO$pDIhWSKdQ6RuKBNSE6rxCTV4eZvmnDK', 'pedersen.larserik@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-14 21:09:54'),
(51, NULL, 'zc', '$bcrypt-sha256$v=2,t=2b,r=12$Rqq7gibLG9q3KOZViT1VG.$fx2WnX11tfB.YHwxF.F/Xlkl6DPnIi6', 'jack791150@163.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-15 01:56:16'),
(52, NULL, 'Artone', '$bcrypt-sha256$v=2,t=2b,r=12$Aa57MKmHxic4dpvJLRjvUO$zwb1bpGNQUnwQaMIuwsyyL47LD4HHv6', '1973163796@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-15 07:09:31'),
(53, NULL, 'myth_726', '$bcrypt-sha256$v=2,t=2b,r=12$oOZTcxGXqcm7tk.yerca/.$fCP11a4Z9XlbvgqjsS4qo4qqDHkRaJW', 'myth820726@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-15 12:09:55'),
(54, NULL, 'stone', '$bcrypt-sha256$v=2,t=2b,r=12$lECPKNQtObHhTO4FqLc4RO$.gAa0EmrOw1w6lbI3/NvJe6RLj/2G.S', '527504188@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 00:58:20'),
(55, NULL, 'Keraon', '$bcrypt-sha256$v=2,t=2b,r=12$chAWq5yGsC.UAqBkT3Otze$Z7sS1DwxuW1mkOgexmy3He0c4WPViR6', 'konghr@protonmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 04:34:38'),
(56, NULL, 'EDISEC', '$bcrypt-sha256$v=2,t=2b,r=12$Q6VAQwwxLrEKr/pWZnQ2V.$lJOqtPtnpEXsZ2H6Fbcn1UEq8k4T56.', '2275400665@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 10:18:42'),
(57, NULL, 'espen.torseth', '$bcrypt-sha256$v=2,t=2b,r=12$hfzGKNGOL9f2pxBrUpimtO$v1tY9BnncWC0A0706jM/aFOZgVXPnjG', 'espen.torseth@ntnu.no', 'admin', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, '2022-12-16 10:22:15'),
(58, NULL, 'Azzy', '$bcrypt-sha256$v=2,t=2b,r=12$sElztPTeHb4zNDRFOlce4u$oKCQbBdnuYsy1rxoZUwM193kGd.iXJm', 'vegardvatn@hotmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 10:58:13'),
(59, NULL, 'eirikhanasand', '$bcrypt-sha256$v=2,t=2b,r=12$3x637SxfqdVzrVPRJpg8Ku$jRIrWsmCodw7uKKArVokVun7bjpNDbm', 'eirimhan@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 13:06:53'),
(60, NULL, '3dd404', '$bcrypt-sha256$v=2,t=2b,r=12$TG2olzPNAOx5VCm0zrAPMu$kh9gKQObvpAHGqliumHMUXzDi04j48.', 'edmonbosco@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 13:32:38'),
(61, NULL, 'stubbe', '$bcrypt-sha256$v=2,t=2b,r=12$3FUFePrU.gsl4T9a2vHvhu$AYzHSR3v7q76YhaBK59OImsYh2aoqCW', 'sebba00@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 13:50:12'),
(62, NULL, 'Limbo', '$bcrypt-sha256$v=2,t=2b,r=12$TQILPG6einxdwnO4W7m4Ou$I0b/UQrBiT.ZHptskf9ocN9vsY4w92y', 'skarbovic@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 13:59:21'),
(63, NULL, 'FullchainDeveloper', '$bcrypt-sha256$v=2,t=2b,r=12$7I0QV9Gy3ZQnC872DmKo/.$Vdq72ZGlhMYBlWvEEZqOvpDR6fala.G', 'vogiji1843@randrai.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-16 14:41:44'),
(64, NULL, 'gentlemen', '$bcrypt-sha256$v=2,t=2b,r=12$BOEZXRODkEiPC6X3YDrQ.e$PG5TiIeSWoJqHpCFY9zyg65zR02JxvO', 'gentlemen.official.2022@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 01:46:28'),
(65, NULL, 'grandpas_pig', '$bcrypt-sha256$v=2,t=2b,r=12$uXd4l6.mlWW60IO89g7ZlO$mPGChsRNB9LLo3nROd3VhfF7XUisfqW', '663579520@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 02:52:25'),
(66, NULL, 'crunchm', '$bcrypt-sha256$v=2,t=2b,r=12$/e/ETLhSdsEpcDLHCYi5aO$hnztZGEBdDMu5gFo03o2Kb4aURbS1x.', 'crunchhym@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 08:33:59'),
(67, NULL, 'andreasnyber', '$bcrypt-sha256$v=2,t=2b,r=12$WUHrSIbxi/R6DsVyxAkS0u$beQP9a4a21FQVNbj1cbKBAWozCGeiPW', 'andreasnyberget9@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 08:35:10'),
(68, NULL, 'gakki', '$bcrypt-sha256$v=2,t=2b,r=12$YU7ByWCW4SUV1h.pB3wu8u$qo.sJRx0FlZSxaLX0xiYInmag8z1GH2', 'czheisenberg@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 08:44:57'),
(69, NULL, 'w_Ing', '$bcrypt-sha256$v=2,t=2b,r=12$TLKbwccZAO4aOpO3hnzl2O$ZcuF8h/LEGoGZe897g0ASO8RIbpBqYG', '2977929433@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 08:49:42'),
(70, NULL, 'bonk', '$bcrypt-sha256$v=2,t=2b,r=12$ElR48JtZWVfm3X5tY2J4Ve$XrJJPpfV/rgtRxdyo8vs6ELPjV/cKru', 'evasaxlund@hotmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 12:56:36'),
(71, NULL, 'waaaow', '$bcrypt-sha256$v=2,t=2b,r=12$Ca3jk5LVIjOfZrswp.OV9O$zYuw0o0IVBgRefVdyWdDbyVbUdFQG/u', 'hxz50098@cdfaq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '2022-12-17 16:26:06'),
(72, NULL, 'huajia', '$bcrypt-sha256$v=2,t=2b,r=12$AWqzyD.CcCUdDLcEkE1qK.$cEV2w3XCawV0Id7fGE7TLMtOuLB96yq', '1606231834@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-17 18:00:05'),
(73, NULL, 't1', '$bcrypt-sha256$v=2,t=2b,r=12$kggVhuxJBxnVHuvroItSQO$J5J1wCG0A62edhMUuW4vjpWMx5xS0Ua', 'rakdfscgaicvhcoamo@tmmwj.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-18 03:55:05'),
(74, NULL, 'mie3', '$bcrypt-sha256$v=2,t=2b,r=12$gbhDcymZowoZUH6mF4n/qe$eXwdszQrmoM9iAI1vEQ2xDAdPbO7ig.', 'marymargd@outlook.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-18 12:19:20'),
(75, NULL, 'laiqn', '$bcrypt-sha256$v=2,t=2b,r=12$wWu3ZMkFZOibaaOUYIv4G.$nvTjjcdUfIUw1P.nV2sRq8HR5KIT0/a', 'laiqn@126.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 01:36:30'),
(76, NULL, 'clancy', '$bcrypt-sha256$v=2,t=2b,r=12$E1s6C4h277m8JhMmNpS5Du$vERHMdUTlHbtJdiDG6uLvJyoWa9oveW', '1016648264@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 02:22:00'),
(77, NULL, 'mogic', '$bcrypt-sha256$v=2,t=2b,r=12$FbPeU.Fcf3nWMPtvDEN7yO$Hl5OpnCbMWzTWgqUkhjw6OJao/pVdvO', '1045233988@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 02:24:32'),
(78, NULL, 'ksks76', '$bcrypt-sha256$v=2,t=2b,r=12$vTzv.NEuEoll/cyepHYURO$10tc8bTq2D5HbpeMY0nbpHCunlnoKme', '2856881051@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 05:57:41'),
(79, NULL, 'zysgmzb', '$bcrypt-sha256$v=2,t=2b,r=12$w/3k5kWuutIjFdu77VjIU.$D2IXNeRcxqSfTQh5avSx.V/1vJvt8XC', '1633422641@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 06:18:41'),
(80, NULL, '雪月三十', '$bcrypt-sha256$v=2,t=2b,r=12$jIRyEk3ct4dg0CkoVwGEtu$ZHc73/BMbs4/mhLhQVYv3wqMDqaxx7a', '1069586863@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 09:16:56'),
(81, NULL, 'teevik', '$bcrypt-sha256$v=2,t=2b,r=12$ix58NnB/DcXpLHu3i5jRrO$LF8H.tZlVGKWwpmJzbSvu2j8Ywz6GkW', 'teemujv@stud.ntnu.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 10:13:37'),
(82, NULL, 'Briyney', '$bcrypt-sha256$v=2,t=2b,r=12$LywUs2G2m.Joek/yExhBJO$O1SP.o/sf502MuMJus/wpBtdb4J0N4a', 'rookiectf@outlook.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 11:44:34'),
(83, NULL, 'imLZH1', '$bcrypt-sha256$v=2,t=2b,r=12$Hr/3gIJiDHin6gSqkh5ble$nlc6pdNxVhDY0aHJVf9G6xudoz8EaxO', 'qingwachong@qq.com', 'user', NULL, NULL, NULL, 'CN', NULL, 0, 0, 1, NULL, '2022-12-19 11:52:20'),
(84, NULL, 'AKS', '$bcrypt-sha256$v=2,t=2b,r=12$DBGGu7syDGQK96fdm0.4w.$93tfR6Oqe6p22FyqcrGw4rXDDev.UaG', 'arneskg@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-19 13:50:41'),
(85, NULL, 'Racine', '$bcrypt-sha256$v=2,t=2b,r=12$4HFKtT8dj7YWSA0a9O6Vju$bYj2qZw6U0WC/xipbnpxeuAbOVprBWa', '591517555@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-20 00:38:33'),
(86, NULL, 'tinmin', '$bcrypt-sha256$v=2,t=2b,r=12$i1SJ3xqYnpZwWrOFI4D9b.$RYF.MHyGql7AAcxHReJQ0EprY6kREAq', '954093370@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-20 10:55:30'),
(87, NULL, 'zx123', '$bcrypt-sha256$v=2,t=2b,r=12$7agb2vuPCVYf0TbukCd0Ge$VJqLBviOGP3pO/fH9UrWC6J9tAPqQRG', '2404628131@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-20 11:22:27'),
(88, NULL, 'aaaa', '$bcrypt-sha256$v=2,t=2b,r=12$C5t6hG/hhZC2HxCkd/mW8e$cVtXzXbVRQ0VGwZ4YccqE1cFbsuUPJi', 'aaaaaa@132.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '2022-12-20 17:57:28'),
(89, NULL, 'enderaoe', '$bcrypt-sha256$v=2,t=2b,r=12$iM5AMYvNm7nsVYikOeyPku$vfmQvsspLMdC992Kd.e8Tr/p893LCZi', 'enderaoelyther@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-21 15:51:18'),
(90, NULL, '飞常', '$bcrypt-sha256$v=2,t=2b,r=12$7NVE1.WOu3AQEbrGec55fu$35.7Vc98/mdtRquGQji3Yd9naFaL6Q6', '369565940@qq.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-22 06:14:50'),
(91, NULL, 'xaitx', '$bcrypt-sha256$v=2,t=2b,r=12$RQR5GkyuJa7k8kq2CdDUvO$yCV/ie7./NAsKqxPWmUrjDCxwIYfLVG', 'admin@xaitx.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-22 08:03:16'),
(92, NULL, 'eskilrefsgaard', '$bcrypt-sha256$v=2,t=2b,r=12$9uWOvOoWn7EMkS0qiQ8Jh.$3IaF3NugB7zdIGVBiKd0Vls6PtgCo3O', 'eskil.refsgaard@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-22 20:14:53'),
(93, NULL, 'Neptune', '$bcrypt-sha256$v=2,t=2b,r=12$BvOF.pcLHkVs1d4jrl5xWe$sQTszc/8TKtSZhPkB9memiGhp18O5O2', 'neptuneblank@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-23 01:49:57'),
(94, NULL, 'LGLJ', '$bcrypt-sha256$v=2,t=2b,r=12$u8ErqJW2smIB3XvGc6IVm.$3i.zV76OawrJqzHOv6i6RGQVXvdZHke', 'xlgljx@outlook.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-23 02:36:08'),
(95, NULL, 'cyb3rn3wbi3', '$bcrypt-sha256$v=2,t=2b,r=12$4PlxzAs6faCrDYEGkY6HVO$vPnyck0I6RIlVsegh7o0xLrTyhW0hJu', 'andrei.ilie@devoteam.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-23 07:54:20'),
(96, NULL, 'orb', '$bcrypt-sha256$v=2,t=2b,r=12$eizvunewxYd8Eo1k4g1rv.$p7hSbNNbscKUaBy0XM6MLQJc/HvTo8O', 'orb@orbina.no', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-23 09:44:28'),
(97, NULL, 'tempato', '$bcrypt-sha256$v=2,t=2b,r=12$ruW2GQGNns9/.mP7QuOW2O$TtS3dCRxgGF9lkzk8LpBIq76mMQtVZC', 'marcode04@gmail.com', 'user', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '2022-12-23 10:05:48');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenges`
--
ALTER TABLE `challenges`
  ADD CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`next_id`) REFERENCES `challenges` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dynamic_challenge`
--
ALTER TABLE `dynamic_challenge`
  ADD CONSTRAINT `dynamic_challenge_ibfk_1` FOREIGN KEY (`id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `solves`
--
ALTER TABLE `solves`
  ADD CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `solves_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `solves_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `team_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
