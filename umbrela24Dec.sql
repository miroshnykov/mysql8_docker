-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.25 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for umbrella
DROP DATABASE IF EXISTS `umbrella`;
CREATE DATABASE IF NOT EXISTS `umbrella` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `umbrella`;

-- Dumping structure for table umbrella.am_applications
DROP TABLE IF EXISTS `am_applications`;
CREATE TABLE IF NOT EXISTS `am_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `key` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_applications: ~4 rows (approximately)
/*!40000 ALTER TABLE `am_applications` DISABLE KEYS */;
INSERT INTO `am_applications` (`id`, `name`, `description`, `key`, `is_active`, `date_added`, `date_modified`) VALUES
	(2, 'Umbrella', 'Security management tool', '796e393cb7b0f98d813ecd31f4adb3bcs', 1, NULL, '2020-10-23 18:37:46'),
	(10, 'Custom Offers Admin', 'BackOffice for custom offers flow', 'a539a7d11d82152093842cbe00093ba8', 1, NULL, '2021-06-10 13:05:02'),
	(12, 'RiskTool', 'Application for managing fraud and risk cases', 'c522e467cd464f1b5b6a6b93f8d4b358', 1, NULL, '2021-09-01 16:43:58'),
	(13, 'PaymentTool', 'Payments management tool', '366bfc5ee024fff83956d3c571f0cb12', 1, NULL, '2021-11-15 18:08:11');
/*!40000 ALTER TABLE `am_applications` ENABLE KEYS */;

-- Dumping structure for table umbrella.am_employee_emails
DROP TABLE IF EXISTS `am_employee_emails`;
CREATE TABLE IF NOT EXISTS `am_employee_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` smallint NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `am_employee_emails_FK` (`employee_id`),
  CONSTRAINT `am_employee_emails_FK` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_employee_emails: ~0 rows (approximately)
/*!40000 ALTER TABLE `am_employee_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_employee_emails` ENABLE KEYS */;

-- Dumping structure for table umbrella.am_employee_roles
DROP TABLE IF EXISTS `am_employee_roles`;
CREATE TABLE IF NOT EXISTS `am_employee_roles` (
  `employee_id` smallint NOT NULL,
  `role_id` int NOT NULL,
  KEY `am_employee_roles_FK` (`role_id`),
  KEY `am_employee_roles_FK_1` (`employee_id`),
  CONSTRAINT `am_employee_roles_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_employee_roles_FK_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_employee_roles: ~31 rows (approximately)
/*!40000 ALTER TABLE `am_employee_roles` DISABLE KEYS */;
INSERT INTO `am_employee_roles` (`employee_id`, `role_id`) VALUES
	(1228, 2),
	(1242, 2),
	(1300, 2),
	(1302, 2),
	(1164, 2),
	(1222, 2),
	(1304, 2),
	(1314, 2),
	(1154, 2),
	(1316, 30),
	(1318, 30),
	(1320, 22),
	(1322, 22),
	(1328, 22),
	(1326, 22),
	(1330, 28),
	(1332, 28),
	(1336, 28),
	(1338, 28),
	(1340, 30),
	(1306, 22),
	(1312, 2),
	(1182, 2),
	(1192, 2),
	(1342, 2),
	(1334, 28),
	(1236, 2),
	(1252, 10),
	(1324, 22),
	(1343, 32),
	(1344, 22);
/*!40000 ALTER TABLE `am_employee_roles` ENABLE KEYS */;

-- Dumping structure for table umbrella.am_permissions
DROP TABLE IF EXISTS `am_permissions`;
CREATE TABLE IF NOT EXISTS `am_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `application_id` int NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `am_permissions_key_IDX` (`key`) USING BTREE,
  KEY `am_permissions_FK` (`application_id`),
  CONSTRAINT `am_permissions_FK` FOREIGN KEY (`application_id`) REFERENCES `am_applications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_permissions: ~15 rows (approximately)
/*!40000 ALTER TABLE `am_permissions` DISABLE KEYS */;
INSERT INTO `am_permissions` (`id`, `name`, `key`, `application_id`, `date_modified`) VALUES
	(92, 'Login', 'login', 10, '2021-06-10 13:05:02'),
	(98, 'Manage Campaigns', 'manage_campaigns', 10, '2021-06-10 17:19:51'),
	(100, 'Manage Offers', 'manage_offers', 10, '2021-06-10 17:19:51'),
	(102, 'See All Affiliates PII', 'see_all_affiliates_pii', 10, '2021-06-10 17:19:51'),
	(104, 'See Own Affiliates PII', 'see_own_affiliates_pii', 10, '2021-06-10 17:19:51'),
	(106, 'Login', 'login', 12, '2021-09-01 16:43:58'),
	(108, 'Manage policy cases', 'manage_policy_cases', 12, '2021-09-01 21:36:23'),
	(110, 'Manage risk cases', 'manage_risk_cases', 12, '2021-09-01 21:38:10'),
	(111, 'Login', 'login', 2, '2021-10-11 14:36:16'),
	(112, 'See Analytics Section', 'see_analytics_section', 10, '2021-11-11 18:28:56'),
	(113, 'See Affiliates Section', 'see_affiliates_section', 10, '2021-11-11 18:28:56'),
	(114, 'See Advertisers Section', 'see_advertisers_section', 10, '2021-11-11 18:28:56'),
	(115, 'See Finance Section', 'see_finance_section', 10, '2021-11-11 18:28:56'),
	(116, 'Edit Payin/Payout', 'edit_payin_payout', 10, '2021-11-11 18:28:56'),
	(117, 'Login', 'login', 13, '2021-11-15 18:08:11');
/*!40000 ALTER TABLE `am_permissions` ENABLE KEYS */;

-- Dumping structure for table umbrella.am_roles
DROP TABLE IF EXISTS `am_roles`;
CREATE TABLE IF NOT EXISTS `am_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_roles: ~9 rows (approximately)
/*!40000 ALTER TABLE `am_roles` DISABLE KEYS */;
INSERT INTO `am_roles` (`id`, `name`, `is_active`, `date_added`, `date_modified`) VALUES
	(2, 'QA', 1, NULL, '2020-10-23 18:41:01'),
	(8, 'BI Agent', 1, NULL, '2020-12-18 03:14:29'),
	(10, 'Admin', 1, NULL, '2020-12-18 03:14:44'),
	(22, 'Affiliate Manager', 1, NULL, '2021-06-10 21:07:15'),
	(24, 'Affiliate Lead', 1, NULL, '2021-06-10 21:08:08'),
	(26, 'Business Developer', 1, NULL, '2021-06-10 21:09:10'),
	(28, 'Account Executive', 1, NULL, '2021-10-28 16:09:25'),
	(30, 'CO Admin', 1, NULL, '2021-10-28 16:11:31'),
	(32, 'Payment Manager', 1, NULL, '2021-12-23 15:37:42');
/*!40000 ALTER TABLE `am_roles` ENABLE KEYS */;

-- Dumping structure for table umbrella.am_role_permissions
DROP TABLE IF EXISTS `am_role_permissions`;
CREATE TABLE IF NOT EXISTS `am_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  KEY `am_role_permissions_FK` (`role_id`),
  KEY `am_role_permissions_FK_1` (`permission_id`),
  CONSTRAINT `am_role_permissions_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_role_permissions_FK_1` FOREIGN KEY (`permission_id`) REFERENCES `am_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.am_role_permissions: ~63 rows (approximately)
/*!40000 ALTER TABLE `am_role_permissions` DISABLE KEYS */;
INSERT INTO `am_role_permissions` (`role_id`, `permission_id`) VALUES
	(2, 111),
	(2, 102),
	(2, 98),
	(2, 100),
	(2, 104),
	(2, 110),
	(2, 106),
	(2, 108),
	(2, 92),
	(2, 114),
	(2, 112),
	(2, 113),
	(2, 115),
	(2, 116),
	(2, 117),
	(28, 92),
	(28, 104),
	(28, 98),
	(28, 100),
	(28, 113),
	(28, 112),
	(22, 100),
	(22, 98),
	(22, 104),
	(22, 92),
	(22, 113),
	(22, 112),
	(24, 98),
	(24, 100),
	(24, 102),
	(24, 92),
	(24, 113),
	(24, 112),
	(10, 92),
	(10, 98),
	(10, 100),
	(10, 104),
	(10, 102),
	(10, 106),
	(10, 108),
	(10, 110),
	(10, 116),
	(10, 113),
	(10, 112),
	(10, 115),
	(10, 114),
	(10, 117),
	(26, 92),
	(26, 100),
	(26, 112),
	(26, 114),
	(26, 116),
	(32, 117),
	(30, 102),
	(30, 98),
	(30, 100),
	(30, 92),
	(30, 112),
	(30, 115),
	(30, 114),
	(30, 113),
	(30, 116),
	(30, 111);
/*!40000 ALTER TABLE `am_role_permissions` ENABLE KEYS */;

-- Dumping structure for table umbrella.employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_added` int NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `group_id` int NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `it` tinyint unsigned NOT NULL DEFAULT '0',
  `health_check` tinyint(1) NOT NULL,
  `manager_id` smallint DEFAULT NULL,
  `is_account_executive_display` tinyint NOT NULL DEFAULT '0',
  `advertiser_id` int DEFAULT NULL,
  `password_reset` varchar(50) DEFAULT NULL,
  `office_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(20)),
  KEY `manager_id` (`manager_id`),
  KEY `advertiser_id` (`advertiser_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `employees_offices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1345 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.employees: ~32 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `username`, `password`, `email`, `name`, `date_added`, `is_admin`, `group_id`, `status`, `it`, `health_check`, `manager_id`, `is_account_executive_display`, `advertiser_id`, `password_reset`, `office_id`) VALUES
	(1154, 'dmytro2', 'd59896e8e103a1ebe27697aca108814d', 'dmytro.miroshnykov@actionmediamtl.com', 'Dmytro Miroshnykov', 1550667925, 1, 0, 'active', 0, 0, 832, 0, 1, '', 2),
	(1164, 'qateam_ae', 'b144ef4a51d09eb8878c77bdc4ee8e6e', 'artem.makarov@actionmediamtl.com', 'QA Team AE', 1557753986, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1166, 'qateam_am', 'f8f269ef65fa65f6ecd27f1dc464b072', 'inna.lucenko@actionmediamtl.com', 'AM-QATeam', 1557754199, 0, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1182, 'timothyj', 'db13f2470712a37fc78de91c35e2f54d', 'timothy.jahn@actionmediamtl.com', 'Timothy Jahn', 1565120164, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1192, 'timothy.ja', '644b487c6850a29f67e20d936a613024', 'timothy.jahn@actionmediamtl.com', 'Timothy Jahn', 1567775241, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1222, 'pmobile78', '', 'dmitriy.tretyak@actionmediamtl.com', 'Dmytro Tretiak', 1573054206, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1228, 'maxim.litv', 'db13f2470712a37fc78de91c35e2f54d', 'maxim.litvinchik@milkbox.com', 'Maxim Litvinchik', 1575050482, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1236, 'leonid.ser', '', 'leonid.serdiuk@actionmediamtl.com', 'Leonid Serdiuk', 1585142742, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 6),
	(1242, 'vladislav.', '', 'vladislav.trofimov@actionmediamtl.com', 'Vladislav Trofimov', 1587042687, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1252, 'timothy.jo', 'ce71c4402f3a7cbbf1ace98100d55e1d', 'timothy.josse@actionmediamtl.com', 'Timothy Josse', 1594235106, 1, 0, 'active', 0, 0, NULL, 0, NULL, '', 2),
	(1300, 'pitigin.aleksander@milkbox.com', '0247380cc24886424a21b4ae0c91252e', 'pitigin.aleksander@milkbox.com', 'Alexander', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1302, 'razumovsky.denis@milkbox.com', '37e1830f850c624118adba33ef58d3b9', 'razumovsky.denis@milkbox.com', 'Denis Razumovsky', 0, 1, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1304, 'leonid.serdiuk@milkbox.com', '5ae865f6088f5d051ad40b75a98a1347', 'leonid.serdiuk@milkbox.com', 'Leonid Serdiuk', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1306, 'leonid.serdiukmanag@milkbox.co', 'c2ec7b0ea4b9c3b85336eb6aa7c4ecad', 'leonid.serdiukmanag@milkbox.com', 'Devteam Manager', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1312, 'timothy.jahn@milkbox.com', '3fa8251bbe233a08e5a6c2fc6b66e164', 'timothy.jahn@milkbox.com', 'Timothy Jahn MB', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1314, 'dmytro.miroshnykov@milkbox.com', 'd1631ace361e75ab889a1a29462a6c83', 'dmytro.miroshnykov@milkbox.com', 'dmytro.miroshnykov', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1316, 'ken@ad-firm.com', 'a95c576bdb91fd5362d0930f5274e2e6', 'ken@ad-firm.com', 'Kenneth Bindon', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1318, 'veronica@ad-firm.com', '6fc0c5b1a90641c833823ba5a520ab7b', 'veronica@ad-firm.com', 'Veronica Amodio', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1320, 'isis@ad-firm.com', 'a575f4958d548fce68357f170139934c', 'isis@ad-firm.com', 'Isis Vallejos', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1322, 'anabelen@ad-firm.com', '8dce4f3d9ea4b33b430f4b19e14d5e14', 'anabelen@ad-firm.com', 'Anabelen Alva', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1324, 'elizaveta@ad-firm.com', '9ea77813f947b93d419c6e3b652949ca', 'eliza@ad-firm.com', 'Elizaveta Smirnova', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1326, 'utpinjar@ad-firm.com', '548ec23b5d489a3282d03a8429eaae51', 'utpinjar@ad-firm.com', 'Utpinjar Dey', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1328, 'klaudia@ad-firm.com', 'ea4e32292cf83b55814dc787db8ee5c5', 'klaudia@ad-firm.com', 'Klaudia Roseline', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1330, 'gonzalo@ad-firm.com', 'ec8c2699c94c802c3c37997745ffeb57', 'gonzalo@ad-firm.com', 'Gonzalo Morales', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1332, 'igor@ad-firm.com', '008749e244f53e3ce34e2d9a0f1db146', 'igor@ad-firm.com', 'Igor Chraplak', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1334, 'abhishek@ad-firm.com', 'ad455f6fea1901a92b4045b49b80a8db', 'abhi@ad-firm.com', 'Abhishek Ganguly', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1336, 'alex@ad-firm.com', '0338d6e5b73fc5328828a04f80f172d7', 'alex@ad-firm.com', 'Alex Hermanto', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1338, 'orlando@ad-firm.com', '1239e4f7d8afa2b9801c35a57652aaab', 'orlando@ad-firm.com', 'Orlando Victorson', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1340, 'eric@ad-firm.com', 'b64506db6029e60190e488de0ff93dda', 'eric@ad-firm.com', 'Eric Pedersen', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1342, 'dmitriy.tretyak@milkbox.com', 'fe1fb893ff65c10e1f29b09551e53ed9', 'dmitriy.tretyak@milkbox.com', 'Tretiak Dmytro', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 4),
	(1343, 'payments@ad-firm.com', 'd329067fb1bf9d90d307364c80e952d1', 'payments@ad-firm.com', 'Payment Manager (Alia)', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2),
	(1344, 'assistant@ad-firm.com', '2761d1e9630cbdea503ab97d7713db64', 'assistant@ad-firm.com', 'Connect Devmanager', 0, 0, 0, 'active', 0, 0, NULL, 0, NULL, NULL, 2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table umbrella.employees_offices
DROP TABLE IF EXISTS `employees_offices`;
CREATE TABLE IF NOT EXISTS `employees_offices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.employees_offices: ~6 rows (approximately)
/*!40000 ALTER TABLE `employees_offices` DISABLE KEYS */;
INSERT INTO `employees_offices` (`id`, `name`) VALUES
	(2, 'Canada'),
	(10, 'China'),
	(6, 'Indonesia'),
	(8, 'Latvia'),
	(4, 'Malta'),
	(12, 'Peru');
/*!40000 ALTER TABLE `employees_offices` ENABLE KEYS */;

-- Dumping structure for table umbrella.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `name` varchar(40) NOT NULL,
  `picture` varchar(256) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `password` (`password`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6222 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table umbrella.users: ~24 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `password`, `email`, `name`, `picture`, `verified`) VALUES
	(16, '$2b$10$0HlO/T48RCSqWOBBsePVrOzTngRhBDTa.oYGowGXgg7ibTXno9nH2', 'dmytro.miroshnykov@actionmediamtl.com', 'dmytro.miroshnykov', 'https://s.gravatar.com/avatar/00012705f585c85333034ee81f87dd36?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fdm.png', 1),
	(36, '$2b$10$sbpGiFhMbIcFfbzafXwTo.GRvS1pYNC3YtyHpu1F0ZgLXu6vSaIb6', 'timothy.josse@actionmediamtl.com', 'timothy.josse', 'https://s.gravatar.com/avatar/745ce39af70e22fd8b3a29baf448b055?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fti.png', 1),
	(98, '$2b$10$H8ifbZFPKrDRn1.OjnDNye73BKLVFsGAYr9dGT9WJmc6z3TmJHCMW', 'timothy.jahn@actionmediamtl.com', 'timothy.jahn', 'https://s.gravatar.com/avatar/ec3d9ede03c4ee056c60e6f36acabfb2?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fti.png', 0),
	(120, '$2b$10$eIxyHbESiImq3Qgw9SQefepHJ8LfePsNYEPdEBaHfVPZzV5FLWMuy', 'maxim.litvinchik@milkbox.com', 'maxim.litvinchik', 'https://s.gravatar.com/avatar/16a31ae03a4cd8851ef37b027f4806b4?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fma.png', 0),
	(186, '$2b$10$vxagB/kI1fLC6EabAJ8H3.ODxaS2htuQr8Nr/Zo5GvcIPJQ.EMFa.', 'leonid.serdiuk@actionmediamtl.com', 'leonid.serdiuk', 'https://s.gravatar.com/avatar/b524f2006a5b337740231cbfc151e9c9?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fle.png', 0),
	(1276, '$2b$10$PEFNnuEvCOnWNXealNwio.cVw/tYuh.HWKUgMCBRMhbGQeaI.921S', 'artem.makarov@actionmediamtl.com', 'artem.makarov', 'https://s.gravatar.com/avatar/e60da361f42ad2afabb2090303c7e0eb?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Far.png', 0),
	(1378, '$2b$10$66UjR3gYpIj4QCNufsomVuAmXrg9HYjlnsPFyjAgXOYklS0YkQT3C', 'dmitriy.tretyak@actionmediamtl.com', 'dmitriy.tretyak', 'https://s.gravatar.com/avatar/6f73579002b79dd902cdc44b1808a781?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fdm.png', 0),
	(1870, '$2b$10$eRAgkrOXPkSP15wFOv6EKeY/2nqVDhqr2Y4LD9VZopG0L5.cBahRy', 'inna.lucenko@actionmediamtl.com', '', '', 0),
	(1950, '$2b$10$1ruRtiKuc9rbrDbnuQNSE.d4mD33Kk.JJqNPnyZvzxre6WzjxsM/a', 'vladislav.trofimov@actionmediamtl.com', 'vladislav.trofimov', 'https://s.gravatar.com/avatar/95615aa64c571f69a1499d0038e55028?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fvl.png', 0),
	(4830, '$2b$10$wEa3dIAb/PIYsoXT.SlHV.kmODnOx45TVHd3cZRJ8VZm/s6DHAeoi', 'pitigin.aleksander@milkbox.com', '', '', 0),
	(4894, '$2b$10$J.XYCIf0F06sd2fp0pzT1.ER3uJ58FWfB1LFIaKeFgMjIHnq.MaCa', 'razumovsky.denis@milkbox.com', '', '', 0),
	(5014, '$2b$10$vnquFPWGKUpqmSwwFtYEKOthkYGI2aTXT6gGRxn0B5.GdZaw5vBBu', 'leonid.serdiuk@milkbox.com', 'leonid.serdiuk', 'https://s.gravatar.com/avatar/5ae865f6088f5d051ad40b75a98a1347?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fle.png', 0),
	(5200, '$2b$10$thlzob.MHAWFz4pyKpDmWuBGzSNxLiTI5gD8W2hVBUvpkfge0cJa2', 'leonid.serdiukmanag@milkbox.com', 'leonid.serdiukmanag', 'https://s.gravatar.com/avatar/c2ec7b0ea4b9c3b85336eb6aa7c4ecad?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fle.png', 0),
	(5580, '$2b$10$UMJ/x5mYwJP8QmUpBBKZ7.kmgNQKQuPkIV3qLaMOuYsIfbNiaGER2', 'veronica@ad-firm.com', 'veronica', 'https://s.gravatar.com/avatar/6fc0c5b1a90641c833823ba5a520ab7b?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fve.png', 0),
	(5607, '$2b$10$jhvv2XgwzEWlHT.yclA3auiMuX0r8Cm4qASYsTZxNERKJhve3i3.u', 'ken@ad-firm.com', 'ken', 'https://s.gravatar.com/avatar/a95c576bdb91fd5362d0930f5274e2e6?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fke.png', 0),
	(5750, '$2b$10$pUtigcCSpX6mN2NljQopVOfQCPxHIBVw0BcranQbRsBbsSeNa.NW2', 'dmitriy.tretyak@milkbox.com', 'dmitriy.tretyak', 'https://s.gravatar.com/avatar/fe1fb893ff65c10e1f29b09551e53ed9?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fdm.png', 0),
	(5805, '$2b$10$nmINI9bc0Wa1PVeJ29hAI.br160OyjJLo3rV0Jelp2Jv.3owaO6nW', 'eric@ad-firm.com', 'eric', 'https://s.gravatar.com/avatar/b64506db6029e60190e488de0ff93dda?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fer.png', 1),
	(5821, '$2b$10$zztXzg9St5sJzD.QetCuBeIoeBOj/Z7Y4hYxAWktuQNEe.r2yvWZ.', 'abhi@ad-firm.com', 'abhi', 'https://s.gravatar.com/avatar/050a2f978324ad5d69c52992bc2794b6?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fab.png', 1),
	(5896, '$2b$10$AwL.pZODZ3jfldkOOfauC.1VhCXzluQP/JfbZ6OrLSPnQAft6.Y7W', 'yaremenko.vitalii@milkbox.com', '', '', 1),
	(6066, '$2b$10$ZvUwqj/zBvoivO07vYNUP.cp3LA4qGwDMGIdLKIqDbwUB3vQ5iBbG', 'anabelen@ad-firm.com', 'anabelen', 'https://s.gravatar.com/avatar/8dce4f3d9ea4b33b430f4b19e14d5e14?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fan.png', 0),
	(6100, '$2b$10$Uz5OpLx/N6/1E/MaItMxOOd9A2TyLcFVoe68ugIk121/PFdkfHDSi', 'eliza@ad-firm.com', 'eliza', 'https://s.gravatar.com/avatar/41d2161d2dfbcfc039c2d514cc897008?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fel.png', 1),
	(6126, '$2b$10$fNrN65HfHTgKHWVsROT1oO1DJjTyKNLTSatTuGefyat15l2UfDNre', 'gonzalo@ad-firm.com', 'gonzalo', 'https://s.gravatar.com/avatar/ec8c2699c94c802c3c37997745ffeb57?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fgo.png', 1),
	(6150, '$2b$10$2BoGVuwvJx.3fKWFVyiHz.YWiArNsiMnAf1Oi/k87gWnvmZDlncZK', 'isis@ad-firm.com', 'isis', 'https://s.gravatar.com/avatar/a575f4958d548fce68357f170139934c?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fis.png', 0),
	(6208, '$2b$10$8H0bahUOb9MnNgw/alboVOZUg/XpBiRF9bDeMNe3IlMF3dz8njNgO', 'assistant@ad-firm.com', '', '', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
