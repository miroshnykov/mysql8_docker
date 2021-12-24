-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.25 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for traffic
DROP DATABASE IF EXISTS `traffic`;
CREATE DATABASE IF NOT EXISTS `traffic` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `traffic`;

-- Dumping structure for table traffic.ac_products
DROP TABLE IF EXISTS `ac_products`;
CREATE TABLE IF NOT EXISTS `ac_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_added` int NOT NULL,
  `date_modified` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `program_id` int NOT NULL DEFAULT '241',
  `show_link` int NOT NULL DEFAULT '1',
  `forward_offer_parameters` smallint DEFAULT '1',
  `advertiser_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `advertiser_id` (`advertiser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.ac_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `ac_products` DISABLE KEYS */;
INSERT INTO `ac_products` (`id`, `name`, `status`, `date_added`, `date_modified`, `image_path`, `is_default`, `program_id`, `show_link`, `forward_offer_parameters`, `advertiser_id`) VALUES
	(1, 'acProductTest', 'active', 0, 0, '', 0, 241, 1, 1, NULL);
/*!40000 ALTER TABLE `ac_products` ENABLE KEYS */;

-- Dumping structure for table traffic.advertisers
DROP TABLE IF EXISTS `advertisers`;
CREATE TABLE IF NOT EXISTS `advertisers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `website` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(35) DEFAULT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  `ads_permitted_id` int DEFAULT NULL,
  `payment_terms` varchar(255) DEFAULT NULL,
  `payout_model` varchar(255) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `platform_url` varchar(32) DEFAULT NULL,
  `platform_user` varchar(64) DEFAULT NULL,
  `platform_password` varchar(64) DEFAULT NULL,
  `rep_name` varchar(64) DEFAULT NULL,
  `rep_email` varchar(45) DEFAULT NULL,
  `rep_skype` varchar(45) DEFAULT NULL,
  `bill_rep_name` varchar(64) DEFAULT NULL,
  `bill_rep_email` varchar(45) DEFAULT NULL,
  `bill_rep_phone` varchar(45) DEFAULT NULL,
  `salesforce_id` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_currency_id_idx` (`currency_id`),
  KEY `fk_payment_type_id_idx` (`payment_type_id`),
  KEY `fk_ads_permitted_id_idx` (`ads_permitted_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.advertisers: ~0 rows (approximately)
/*!40000 ALTER TABLE `advertisers` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisers` ENABLE KEYS */;

-- Dumping structure for table traffic.am_applications
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_applications: ~5 rows (approximately)
/*!40000 ALTER TABLE `am_applications` DISABLE KEYS */;
INSERT INTO `am_applications` (`id`, `name`, `description`, `key`, `is_active`, `date_added`, `date_modified`) VALUES
	(2, 'Umbrella', 'Security management tool', '303ad1011a2a9388d5fa953031d1ac15', 1, NULL, '2020-10-23 18:37:46'),
	(4, 'BackOffice', 'Affiliate management platform', '59024b48f676d96f146f092088a26241', 1, NULL, '2020-10-26 21:09:42'),
	(6, 'PCAPI', 'Affiliate Fraud Suspension System\n\n', '50a7876dacb656b1c06566bf9a8223fd', 1, NULL, '2020-12-18 03:08:31'),
	(8, 'PaymentsTool', 'Payment management system', 'f563bf99436e6fa965da7c423830be85', 1, NULL, '2021-02-02 20:52:22'),
	(10, 'Custom Offers Admin', 'BackOffice for custom offers flow', 'a539a7d11d82152093842cbe00093ba8', 1, NULL, '2021-06-10 13:05:02');
/*!40000 ALTER TABLE `am_applications` ENABLE KEYS */;

-- Dumping structure for table traffic.am_employee_emails
DROP TABLE IF EXISTS `am_employee_emails`;
CREATE TABLE IF NOT EXISTS `am_employee_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` smallint NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `am_employee_emails_FK` (`employee_id`),
  CONSTRAINT `am_employee_emails_FK` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_employee_emails: ~0 rows (approximately)
/*!40000 ALTER TABLE `am_employee_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_employee_emails` ENABLE KEYS */;

-- Dumping structure for table traffic.am_employee_roles
DROP TABLE IF EXISTS `am_employee_roles`;
CREATE TABLE IF NOT EXISTS `am_employee_roles` (
  `employee_id` smallint NOT NULL,
  `role_id` int NOT NULL,
  KEY `am_employee_roles_FK` (`role_id`),
  KEY `am_employee_roles_FK_1` (`employee_id`),
  CONSTRAINT `am_employee_roles_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_employee_roles_FK_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_employee_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `am_employee_roles` DISABLE KEYS */;
INSERT INTO `am_employee_roles` (`employee_id`, `role_id`) VALUES
	(1, 10);
/*!40000 ALTER TABLE `am_employee_roles` ENABLE KEYS */;

-- Dumping structure for table traffic.am_permissions
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_permissions: ~40 rows (approximately)
/*!40000 ALTER TABLE `am_permissions` DISABLE KEYS */;
INSERT INTO `am_permissions` (`id`, `name`, `key`, `application_id`, `date_modified`) VALUES
	(10, 'Login', 'login', 4, '2020-10-26 21:09:42'),
	(14, 'Confirm Email', 'confirm_email', 4, '2020-12-17 22:14:04'),
	(16, 'Login', 'login', 6, '2020-12-18 03:08:31'),
	(18, 'Full Access', 'admin', 6, '2020-12-18 03:27:20'),
	(20, 'BI Agent Access', 'bi_agent', 6, '2020-12-18 03:28:14'),
	(22, 'Viewer Access', 'viewer', 6, '2020-12-18 19:40:58'),
	(44, 'See all unassigned', 'see_all_unassigned', 4, '2021-01-18 21:58:21'),
	(46, 'See all pending', 'see_all_pending', 4, '2021-01-18 21:58:21'),
	(48, 'See pending for office', 'see_pending_for_office', 4, '2021-01-18 21:58:21'),
	(50, 'See own pending', 'see_own_pending', 4, '2021-01-18 21:58:21'),
	(52, 'See all ae affiliates', 'see_all_ae_affiliates', 4, '2021-01-18 21:58:21'),
	(54, 'See ae affiliates for office', 'see_ae_affiliates_for_office', 4, '2021-01-18 21:58:21'),
	(56, 'See own ae affiliate', 'see_own_ae_affiliate', 4, '2021-01-18 21:58:21'),
	(58, 'Reject all affiliates', 'reject_all_affiliates', 4, '2021-01-18 21:58:21'),
	(60, 'Reject affiliates for office', 'reject_affiliates_for_office', 4, '2021-01-18 21:58:21'),
	(62, 'Reject own affiliates', 'reject_own_affiliates', 4, '2021-01-18 21:58:21'),
	(64, 'AE use assign', 'ae_can_use_assign', 4, '2021-01-21 20:25:56'),
	(66, 'AE use re-assign', 'ae_can_use_re_assign', 4, '2021-01-21 20:25:56'),
	(68, 'AM use assign/re-assign', 'am_can_use_re_assign', 4, '2021-01-21 20:25:56'),
	(70, 'Login', 'login', 8, '2021-02-02 20:52:22'),
	(72, 'See all am affiliates', 'see_all_am_affiliates', 4, '2021-02-22 18:10:10'),
	(74, 'Approve pendign affiliates', 'approve_pending_affiliates', 4, '2021-02-22 18:10:10'),
	(76, 'Suspend affiliate', 'suspend_affiliate', 4, '2021-02-22 18:10:10'),
	(78, 'See am affiliates for office', 'see_am_affiliates_for_office', 4, '2021-02-22 18:10:10'),
	(80, 'See Open Market', 'see_open_market', 4, '2021-02-22 18:10:10'),
	(82, 'Single/Mass Reactivate in Open Market', 'single/mass_reactivate_in_open_market', 4, '2021-02-22 18:10:10'),
	(84, 'See own am affiliates', 'see_own_am_affiliates', 4, '2021-02-22 18:10:10'),
	(86, 'Single Reactivate in Open Market', 'single_reactivate_in_open_market', 4, '2021-02-22 18:10:10'),
	(88, 'Manage Campaigns', 'manage_campaigns', 4, '2021-02-22 18:10:10'),
	(90, 'Manage Offers', 'manage_offers', 4, '2021-02-22 18:10:10'),
	(92, 'Login', 'login', 10, '2021-06-10 13:05:02'),
	(94, 'Ad-Center Workspace', 'ac_workspace', 10, '2021-06-10 17:19:51'),
	(96, 'Gotzha Workspace', 'gotzha_workspace', 10, '2021-06-10 17:19:51'),
	(98, 'Manage Campaigns', 'manage_campaigns', 10, '2021-06-10 17:19:51'),
	(100, 'Manage Offers', 'manage_offers', 10, '2021-06-10 17:19:51'),
	(102, 'See All Affiliates PII', 'see_all_affiliates_pii', 10, '2021-06-10 17:19:51'),
	(104, 'See Own Affiliates PII', 'see_own_affiliates_pii', 10, '2021-06-10 17:19:51'),
	(105, 'see_advertisers_section', 'see_advertisers_section', 10, '2021-11-17 16:02:24'),
	(106, 'see_affiliates_section', 'see_affiliates_section', 10, '2021-11-17 16:04:27'),
	(107, 'edit_payin_payout', 'edit_payin_payout', 10, '2021-11-17 16:04:27');
/*!40000 ALTER TABLE `am_permissions` ENABLE KEYS */;

-- Dumping structure for table traffic.am_roles
DROP TABLE IF EXISTS `am_roles`;
CREATE TABLE IF NOT EXISTS `am_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_roles: ~13 rows (approximately)
/*!40000 ALTER TABLE `am_roles` DISABLE KEYS */;
INSERT INTO `am_roles` (`id`, `name`, `is_active`, `date_added`, `date_modified`) VALUES
	(2, 'QA', 1, NULL, '2020-10-23 18:41:01'),
	(4, 'General AE manager', 1, NULL, '2020-10-26 21:11:40'),
	(6, 'General AM manager', 1, NULL, '2020-10-26 21:15:17'),
	(8, 'BI Agent', 1, NULL, '2020-12-18 03:14:29'),
	(10, 'Admin', 1, NULL, '2020-12-18 03:14:44'),
	(12, 'AE Office Lead', 1, NULL, '2021-01-18 22:22:31'),
	(14, 'AE Manager', 1, NULL, '2021-01-18 22:23:21'),
	(16, 'AM Office Lead', 1, NULL, '2021-02-09 13:23:35'),
	(18, 'AE', 1, NULL, '2021-02-09 13:24:10'),
	(20, 'AM', 1, NULL, '2021-02-09 13:24:25'),
	(22, 'Gotzha Affiliate Manager', 1, NULL, '2021-06-10 21:07:15'),
	(24, 'Gotzha Affiliate Lead', 1, NULL, '2021-06-10 21:08:08'),
	(26, 'Gotzha Business Developer', 1, NULL, '2021-06-10 21:09:10');
/*!40000 ALTER TABLE `am_roles` ENABLE KEYS */;

-- Dumping structure for table traffic.am_role_permissions
DROP TABLE IF EXISTS `am_role_permissions`;
CREATE TABLE IF NOT EXISTS `am_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  KEY `am_role_permissions_FK` (`role_id`),
  KEY `am_role_permissions_FK_1` (`permission_id`),
  CONSTRAINT `am_role_permissions_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_role_permissions_FK_1` FOREIGN KEY (`permission_id`) REFERENCES `am_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.am_role_permissions: ~141 rows (approximately)
/*!40000 ALTER TABLE `am_role_permissions` DISABLE KEYS */;
INSERT INTO `am_role_permissions` (`role_id`, `permission_id`) VALUES
	(8, 16),
	(8, 20),
	(10, 105),
	(14, 10),
	(14, 50),
	(14, 56),
	(14, 62),
	(18, 10),
	(18, 50),
	(18, 56),
	(18, 62),
	(18, 76),
	(20, 10),
	(20, 80),
	(20, 86),
	(20, 84),
	(16, 10),
	(16, 68),
	(16, 80),
	(16, 78),
	(16, 82),
	(4, 10),
	(4, 14),
	(4, 44),
	(4, 46),
	(4, 52),
	(4, 58),
	(4, 64),
	(4, 66),
	(4, 68),
	(4, 62),
	(4, 60),
	(4, 54),
	(4, 48),
	(4, 50),
	(4, 56),
	(4, 76),
	(4, 74),
	(4, 72),
	(4, 78),
	(4, 80),
	(4, 82),
	(4, 88),
	(4, 86),
	(4, 84),
	(4, 90),
	(6, 10),
	(6, 68),
	(6, 72),
	(10, 10),
	(10, 14),
	(10, 44),
	(10, 46),
	(10, 52),
	(10, 58),
	(10, 64),
	(10, 66),
	(10, 68),
	(10, 76),
	(10, 74),
	(10, 72),
	(10, 80),
	(10, 82),
	(10, 88),
	(10, 86),
	(10, 90),
	(10, 16),
	(10, 18),
	(10, 70),
	(10, 50),
	(10, 56),
	(10, 54),
	(10, 48),
	(10, 60),
	(10, 62),
	(10, 78),
	(10, 84),
	(22, 92),
	(22, 96),
	(22, 100),
	(22, 98),
	(22, 104),
	(24, 92),
	(24, 96),
	(24, 98),
	(24, 100),
	(24, 102),
	(26, 92),
	(26, 96),
	(26, 98),
	(26, 100),
	(26, 102),
	(2, 14),
	(2, 44),
	(2, 46),
	(2, 52),
	(2, 58),
	(2, 10),
	(2, 48),
	(2, 50),
	(2, 56),
	(2, 54),
	(2, 62),
	(2, 60),
	(2, 64),
	(2, 66),
	(2, 68),
	(2, 74),
	(2, 72),
	(2, 78),
	(2, 84),
	(2, 86),
	(2, 80),
	(2, 82),
	(2, 88),
	(2, 90),
	(2, 76),
	(2, 70),
	(2, 92),
	(2, 96),
	(2, 102),
	(2, 98),
	(2, 100),
	(2, 104),
	(12, 10),
	(12, 44),
	(12, 14),
	(12, 64),
	(12, 66),
	(12, 58),
	(12, 74),
	(12, 76),
	(12, 80),
	(12, 86),
	(12, 46),
	(12, 52),
	(12, 72),
	(12, 68),
	(12, 82),
	(10, 106),
	(10, 107);
/*!40000 ALTER TABLE `am_role_permissions` ENABLE KEYS */;

-- Dumping structure for table traffic.blocks
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE IF NOT EXISTS `blocks` (
  `startIpNum` int unsigned NOT NULL AUTO_INCREMENT,
  `endIpNum` int DEFAULT NULL,
  `locId` int DEFAULT NULL,
  PRIMARY KEY (`startIpNum`)
) ENGINE=InnoDB AUTO_INCREMENT=3758096129 DEFAULT CHARSET=latin1;

-- Dumping data for table traffic.blocks: ~0 rows (approximately)
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;

-- Dumping structure for table traffic.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `Index 2` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.countries: ~210 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`code`, `name`) VALUES
	('AA', 'DIMON'),
	('AD', 'Andorra'),
	('AE', 'United Arab Emirates'),
	('AG', 'Antigua and Barbuda'),
	('AI', 'Anguilla'),
	('AM', 'Armenia'),
	('AN', 'Netherlands Antilles'),
	('AO', 'Angola'),
	('AP', 'Asia/Pacific Region'),
	('AQ', 'Antarctica'),
	('AR', 'Argentina'),
	('AS', 'American Samoa'),
	('AT', 'Austria'),
	('AU', 'Australia'),
	('AW', 'Aruba'),
	('AX', 'Aland Islands'),
	('AZ', 'Azerbaijan'),
	('BB', 'Barbados'),
	('BD', 'Bangladesh'),
	('BE', 'Belgium'),
	('BF', 'Burkina Faso'),
	('BG', 'Bulgaria'),
	('BH', 'Bahrain'),
	('BI', 'Burundi'),
	('BJ', 'Benin'),
	('BM', 'Bermuda'),
	('BN', 'Brunei Darussalam'),
	('BO', 'Bolivia'),
	('BR', 'Brazil'),
	('BT', 'Bhutan'),
	('BV', 'Bouvet Island'),
	('BW', 'Botswana'),
	('BY', 'Belarus'),
	('BZ', 'Belize'),
	('CA', 'Canada'),
	('CC', 'Cocos (Keeling) Islands'),
	('CD', 'Congo, The democratic republic'),
	('CF', 'Central African Republic'),
	('CG', 'Congo'),
	('CH', 'Switzerland'),
	('CI', 'Cote D\'Ivorie'),
	('CK', 'Cook Islands'),
	('CL', 'Chile'),
	('CO', 'Colombia'),
	('CR', 'Costa Rica'),
	('CV', 'Cape Verde'),
	('CX', 'Christmas Island'),
	('CY', 'Cyprus'),
	('CZ', 'Czech Republic'),
	('DE', 'Germany'),
	('DK', 'Denmark'),
	('DM', 'Dominica'),
	('DO', 'Dominican Republic'),
	('EC', 'Ecuador'),
	('EE', 'Estonia'),
	('ER', 'Eritrea'),
	('ES', 'Spain'),
	('EU', 'Europe'),
	('FI', 'Finland'),
	('FJ', 'Fiji'),
	('FK', 'Falkland Islands (Malvinas)'),
	('FM', 'Micronesia, Federated States of'),
	('FO', 'Faroe Islands'),
	('FR', 'France'),
	('GB', 'United Kingdom'),
	('GD', 'Grenada'),
	('GF', 'French Guiana'),
	('GG', 'Guernsey'),
	('GI', 'Gibraltar'),
	('GL', 'Greenland'),
	('GM', 'Gambia'),
	('GN', 'Guinea'),
	('GP', 'Guadeloupe'),
	('GQ', 'Equatorial Guinea'),
	('GR', 'Greece'),
	('GS', 'South Georgia and the South Sandwich Islands'),
	('GT', 'Guatemala'),
	('GU', 'Guam'),
	('GW', 'Guinea-Bissau'),
	('GY', 'Guyana'),
	('HK', 'Hong Kong'),
	('HM', 'Heard Island and McDonald Islands'),
	('HN', 'Honduras'),
	('HT', 'Haiti'),
	('HU', 'Hungary'),
	('IE', 'Ireland'),
	('IM', 'Isle of Man'),
	('IO', 'British Indian Ocean Territory'),
	('IQ', 'Iraq'),
	('IS', 'Iceland'),
	('IT', 'Italy'),
	('JE', 'Jersey'),
	('JM', 'Jamaica'),
	('JO', 'Jordan'),
	('JP', 'Japan'),
	('KG', 'Kyrgyzstan'),
	('KH', 'Cambodia'),
	('KI', 'Kiribati'),
	('KM', 'Comoros'),
	('KN', 'Saint Kitts and Nevis'),
	('KP', 'Korea, Democratic People\'s Republic of'),
	('KR', 'Korea, Republic of'),
	('KW', 'Kuwait'),
	('KY', 'Cayman Islands'),
	('KZ', 'Kazakhstan'),
	('LA', 'Lao People\'s Democratic Republic'),
	('LB', 'Lebanon'),
	('LC', 'Saint Lucia'),
	('LI', 'Liechtenstein'),
	('LK', 'Sri Lanka'),
	('LR', 'Liberia'),
	('LS', 'Lesotho'),
	('LT', 'Lithuania'),
	('LU', 'Luxembourg'),
	('LV', 'Latvia'),
	('MC', 'Monaco'),
	('MD', 'Moldova, Republic of'),
	('ME', 'Montenegro'),
	('MH', 'Marshall Islands'),
	('MK', 'Macedonia'),
	('ML', 'Mali'),
	('MM', 'Myanmar'),
	('MN', 'Mongolia'),
	('MO', 'Macao'),
	('MP', 'Northern Mariana Islands'),
	('MQ', 'Martinique'),
	('MS', 'Montserrat'),
	('MT', 'Malta'),
	('MU', 'Mauritius'),
	('MV', 'Maldives'),
	('MW', 'Malawi'),
	('MX', 'Mexico'),
	('MZ', 'Mozambique'),
	('NA', 'Namibia'),
	('NC', 'New Caledonia'),
	('NF', 'Norfolk Island'),
	('NI', 'Nicaragua'),
	('NL', 'Netherlands'),
	('NO', 'Norway'),
	('NP', 'Nepal'),
	('NR', 'Nauru'),
	('NU', 'Niue'),
	('NZ', 'New Zealand'),
	('O1', 'Other Country'),
	('OM', 'Oman'),
	('PA', 'Panama'),
	('PE', 'Peru'),
	('PF', 'French Polynesia'),
	('PG', 'Papua New Guinea'),
	('PH', 'Philippines'),
	('PL', 'Poland'),
	('PM', 'Saint Pierre and Miquelon'),
	('PN', 'Pitcairn'),
	('PR', 'Puerto Rico'),
	('PS', 'Palestinian Territory'),
	('PT', 'Portugal'),
	('PW', 'Palau'),
	('PY', 'Paraguay'),
	('QA', 'Qatar'),
	('RE', 'Reunion'),
	('RS', 'Serbia'),
	('RW', 'Rwanda'),
	('SA', 'Saudi Arabia'),
	('SB', 'Solomon Islands'),
	('SE', 'Sweden'),
	('SG', 'Singapore'),
	('SH', 'Saint Helena'),
	('SI', 'Slovenia'),
	('SJ', 'Svalbard and Jan Mayen'),
	('SK', 'Slovakia'),
	('SL', 'Sierra Leone'),
	('SM', 'San Marino'),
	('SN', 'Senegal'),
	('SO', 'Somalia'),
	('SR', 'Suriname'),
	('SS', 'South Sudan'),
	('ST', 'Sao Tome and Principe'),
	('SV', 'El Salvador'),
	('SY', 'Syrian Arab Republic'),
	('SZ', 'Swaziland'),
	('TC', 'Turks and Caicos Islands'),
	('TD', 'Chad'),
	('TF', 'French Southern Territories'),
	('TG', 'Togo'),
	('TH', 'Thailand'),
	('TJ', 'Tajikistan'),
	('TK', 'Tokelau'),
	('TL', 'Timor-Leste'),
	('TM', 'Turkmenistan'),
	('TO', 'Tonga'),
	('TR', 'Turkey'),
	('TT', 'Trinidad and Tobago'),
	('TV', 'Tuvalu'),
	('TW', 'Taiwan'),
	('TZ', 'Tanzania, United Republic of'),
	('UG', 'Uganda'),
	('UM', 'United States Minor Outlying Islands'),
	('US', 'United States'),
	('UY', 'Uruguay'),
	('UZ', 'Uzbekistan'),
	('VA', 'Holy See (Vatican City State)'),
	('VC', 'Saint Vincent and the Grenadines'),
	('VE', 'Venezuela'),
	('VG', 'Virgin Islands, British'),
	('VI', 'Virgin Islands, U.S.'),
	('VU', 'Vanuatu'),
	('WF', 'Wallis and Futuna'),
	('WS', 'Samoa'),
	('YE', 'Yemen'),
	('YT', 'Mayotte'),
	('ZW', 'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table traffic.countries_regions_associated
DROP TABLE IF EXISTS `countries_regions_associated`;
CREATE TABLE IF NOT EXISTS `countries_regions_associated` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `region_id` int DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.countries_regions_associated: ~0 rows (approximately)
/*!40000 ALTER TABLE `countries_regions_associated` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_regions_associated` ENABLE KEYS */;

-- Dumping structure for table traffic.currency
DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.currency: ~3 rows (approximately)
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` (`id`, `name`) VALUES
	(1, 'USD'),
	(2, 'CAD'),
	(3, 'EURO');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;

-- Dumping structure for table traffic.employees
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
  KEY `office_id` (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.employees: ~0 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `username`, `password`, `email`, `name`, `date_added`, `is_admin`, `group_id`, `status`, `it`, `health_check`, `manager_id`, `is_account_executive_display`, `advertiser_id`, `password_reset`, `office_id`) VALUES
	(1, 'dimon', '', '', '', 0, 1, 0, 'active', 0, 0, NULL, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table traffic.employees_offices
DROP TABLE IF EXISTS `employees_offices`;
CREATE TABLE IF NOT EXISTS `employees_offices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.employees_offices: ~0 rows (approximately)
/*!40000 ALTER TABLE `employees_offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_offices` ENABLE KEYS */;

-- Dumping structure for table traffic.landing_pages
DROP TABLE IF EXISTS `landing_pages`;
CREATE TABLE IF NOT EXISTS `landing_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `prefix` enum('www','tour','ads') NOT NULL,
  `target` text NOT NULL,
  `date_added` int NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `advertiser_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `forced_landing_url` text NOT NULL,
  `extra_params` varchar(255) NOT NULL,
  `static_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.landing_pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `landing_pages` DISABLE KEYS */;
INSERT INTO `landing_pages` (`id`, `name`, `prefix`, `target`, `date_added`, `status`, `advertiser_id`, `product_id`, `forced_landing_url`, `extra_params`, `static_url`) VALUES
	(1, 'landing page 1', 'www', 'TargetExample', 0, 'active', NULL, 1, 'landingPageForceUrl', '', 'landingPageStaticUrl');
/*!40000 ALTER TABLE `landing_pages` ENABLE KEYS */;

-- Dumping structure for table traffic.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `locId` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(1000) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `metroCode` int DEFAULT NULL,
  `areaCode` int DEFAULT NULL,
  PRIMARY KEY (`locId`),
  KEY `city` (`city`(767))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table traffic.location: ~0 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table traffic.maxmind_geo_IP
DROP TABLE IF EXISTS `maxmind_geo_IP`;
CREATE TABLE IF NOT EXISTS `maxmind_geo_IP` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ip_start` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_end` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_int_start` int(1) unsigned zerofill NOT NULL,
  `ip_int_end` int(1) unsigned zerofill NOT NULL,
  `country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`,`ip_start`,`ip_end`,`ip_int_end`,`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.maxmind_geo_IP: ~331,507 rows (approximately)
/*!40000 ALTER TABLE `maxmind_geo_IP` DISABLE KEYS */;
/*!40000 ALTER TABLE `maxmind_geo_IP` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_advertisers
DROP TABLE IF EXISTS `sfl_advertisers`;
CREATE TABLE IF NOT EXISTS `sfl_advertisers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `advertiser_manager_id` int unsigned NOT NULL,
  `origin_id` int unsigned NOT NULL,
  `website` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `descriptions` varchar(256) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_version` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`name`),
  KEY `fk_sfl_advertiser_id` (`advertiser_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_advertisers: ~7 rows (approximately)
/*!40000 ALTER TABLE `sfl_advertisers` DISABLE KEYS */;
INSERT INTO `sfl_advertisers` (`id`, `name`, `status`, `advertiser_manager_id`, `origin_id`, `website`, `tags`, `descriptions`, `email`, `password`, `date_added`, `date_updated`, `verified`, `token_version`) VALUES
	(1, 'adChenter', 'active', 1, 0, '', '', '', 'miroshnykov.dmytro@gmail.com', '', 0, '2021-12-20 16:52:51', '2021-12-22 20:13:59', 1),
	(2, 'Firm', 'active', 1, 0, '', '', '', 'miroshnykov@gmail.com', '', 0, '2021-12-20 16:52:48', '2021-12-22 20:13:59', 1),
	(3, 'AdvNikopol', 'active', 1, 0, '', '', '', '', '', 0, '2021-11-01 18:22:05', '2021-12-22 20:13:59', 1),
	(4, 'Hyana', 'active', 1, 0, '', '', '', '', '', 0, '2021-11-01 18:22:05', '2021-12-22 20:13:59', 1),
	(5, 'Various Publishers', 'active', 1, 0, '', '', '', '', '', 0, '2021-11-18 15:02:30', '2021-12-22 20:13:59', 1),
	(6, 'Various1', 'active', 1, 0, '', '', '', '', '', 0, '2021-11-01 18:29:57', '2021-12-22 20:13:59', 1),
	(8, 'Variou', 'active', 0, 0, '', '', '', '', '', 0, '2021-11-17 15:12:23', '2021-12-22 20:13:59', 1);
/*!40000 ALTER TABLE `sfl_advertisers` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_ad_domains
DROP TABLE IF EXISTS `sfl_ad_domains`;
CREATE TABLE IF NOT EXISTS `sfl_ad_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `expiry_date` timestamp NULL DEFAULT NULL,
  `date_added` int DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table traffic.sfl_ad_domains: ~6 rows (approximately)
/*!40000 ALTER TABLE `sfl_ad_domains` DISABLE KEYS */;
INSERT INTO `sfl_ad_domains` (`id`, `name`, `is_active`, `expiry_date`, `date_added`, `date_updated`) VALUES
	(2, 'ryzvxm.com', 1, NULL, NULL, '2021-11-01 16:23:29'),
	(3, 'xuzeez.com', 1, NULL, NULL, '2021-11-01 16:23:29'),
	(4, 'uvbyty.com', 1, NULL, NULL, '2021-11-01 16:23:29'),
	(5, 'mghkpg.com', 1, NULL, NULL, '2021-11-01 16:23:29'),
	(6, 'hogqmd.com', 1, NULL, NULL, '2021-11-01 16:23:29'),
	(7, 'fjrkcx.com', 1, NULL, NULL, '2021-11-01 16:23:29');
/*!40000 ALTER TABLE `sfl_ad_domains` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_affiliates
DROP TABLE IF EXISTS `sfl_affiliates`;
CREATE TABLE IF NOT EXISTS `sfl_affiliates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive','pending','rejected','suspended','blacklisted') NOT NULL DEFAULT 'inactive',
  `affiliate_manager_id` int unsigned NOT NULL,
  `origin_id` int unsigned NOT NULL,
  `salesforce_id` varchar(18) DEFAULT '0',
  `billing_cycle` enum('daily','weekly','monthly') NOT NULL DEFAULT 'weekly',
  `payment_type` varchar(50) NOT NULL,
  `currency_id` int NOT NULL DEFAULT '0',
  `last_traffic_date` int NOT NULL,
  `postback_url` varchar(250) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`id`),
  KEY `fk_sfl_affiliates_id` (`affiliate_manager_id`),
  CONSTRAINT `fk_sfl_affiliates_id` FOREIGN KEY (`affiliate_manager_id`) REFERENCES `sfl_managers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_affiliates: ~4 rows (approximately)
/*!40000 ALTER TABLE `sfl_affiliates` DISABLE KEYS */;
INSERT INTO `sfl_affiliates` (`id`, `name`, `email`, `platform`, `status`, `affiliate_manager_id`, `origin_id`, `salesforce_id`, `billing_cycle`, `payment_type`, `currency_id`, `last_traffic_date`, `postback_url`, `date_added`, `date_updated`, `verified`) VALUES
	(2, 'afilaites 1', 'polnum24@gmail.com', 'gotzha', 'active', 3, 0, '0', 'weekly', '', 1, 0, '', NULL, '2021-12-20 19:48:55', NULL),
	(3, 'affilaite 2', 'polnum48@gmail.com', 'adcenter', 'active', 1, 0, '0', 'weekly', '', 1, 0, '', NULL, '2021-12-20 19:48:36', NULL),
	(4, 'affilaite 3', 'miroshnykov.dmytro@gmail.com', 'gotzha', 'active', 2, 0, '0', 'weekly', '', 1, 0, '', NULL, '2021-12-20 16:37:54', NULL),
	(5, 'affilaite 4', 'miroshnykov@gmail.com', 'gotzha', 'active', 2, 0, '0', 'weekly', '', 1, 0, '', NULL, '2021-12-20 16:32:30', NULL);
/*!40000 ALTER TABLE `sfl_affiliates` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_affiliate_payment_methods
DROP TABLE IF EXISTS `sfl_affiliate_payment_methods`;
CREATE TABLE IF NOT EXISTS `sfl_affiliate_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `type` enum('primary','secondary') NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_16f16ddadb87c34f2f861af4891` (`payment_method_id`),
  KEY `FK_6f83649444a835edb5386f3e18b` (`affiliate_id`),
  CONSTRAINT `FK_16f16ddadb87c34f2f861af4891` FOREIGN KEY (`payment_method_id`) REFERENCES `sfl_payment_methods` (`id`),
  CONSTRAINT `FK_6f83649444a835edb5386f3e18b` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_affiliate_payment_methods: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_affiliate_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_affiliate_payment_methods` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_currency
DROP TABLE IF EXISTS `sfl_currency`;
CREATE TABLE IF NOT EXISTS `sfl_currency` (
  `id` int unsigned NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `abbr` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_currency: ~4 rows (approximately)
/*!40000 ALTER TABLE `sfl_currency` DISABLE KEYS */;
INSERT INTO `sfl_currency` (`id`, `symbol`, `abbr`) VALUES
	(1, '$', 'USD'),
	(2, '€', 'EUR'),
	(3, 'R$', 'BRL'),
	(4, '£', 'GBP');
/*!40000 ALTER TABLE `sfl_currency` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_dimension
DROP TABLE IF EXISTS `sfl_dimension`;
CREATE TABLE IF NOT EXISTS `sfl_dimension` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `displayed_name` varchar(45) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `displayed_name_UNIQUE` (`displayed_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_dimension: ~10 rows (approximately)
/*!40000 ALTER TABLE `sfl_dimension` DISABLE KEYS */;
INSERT INTO `sfl_dimension` (`id`, `name`, `displayed_name`, `date_added`, `date_updated`) VALUES
	(1, 'affiliate', 'Affiliate', '0000-00-00 00:00:00', '2020-01-15 15:53:55'),
	(2, 'country', 'Country', '0000-00-00 00:00:00', '2020-01-15 15:51:44'),
	(3, 'affiliate_country', 'Affileate / Country', '0000-00-00 00:00:00', '2020-11-10 18:51:38'),
	(4, 'prod', 'Prod', '0000-00-00 00:00:00', '2020-11-10 18:51:38'),
	(5, 'affiliate_campaign', 'Affiliate / Campaign', '0000-00-00 00:00:00', '2021-01-20 19:35:01'),
	(6, 'website', 'Website', '0000-00-00 00:00:00', '2021-01-20 19:35:21'),
	(7, 'affiliate_status', 'Affiliate status', '0000-00-00 00:00:00', '2021-03-04 01:37:37'),
	(8, 'affiliate_type', 'Affiliate type', '0000-00-00 00:00:00', '2021-03-04 01:37:57'),
	(9, 'os', 'OS', '0000-00-00 00:00:00', '2021-03-04 01:38:15'),
	(10, 'advertisers', 'Advertisers', '0000-00-00 00:00:00', '2021-03-04 01:38:25');
/*!40000 ALTER TABLE `sfl_dimension` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_exchange_rate
DROP TABLE IF EXISTS `sfl_exchange_rate`;
CREATE TABLE IF NOT EXISTS `sfl_exchange_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_id_from` int DEFAULT NULL,
  `currency_id_to` int DEFAULT '1',
  `rate` double DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_exchange_rate: ~76 rows (approximately)
/*!40000 ALTER TABLE `sfl_exchange_rate` DISABLE KEYS */;
INSERT INTO `sfl_exchange_rate` (`id`, `currency_id_from`, `currency_id_to`, `rate`, `date_added`) VALUES
	(2, 2, 1, 1, '2021-08-02 23:46:23'),
	(4, 3, 1, 0, '2021-08-02 23:46:23'),
	(6, 4, 1, 0, '2021-08-02 23:46:23'),
	(8, 2, 1, 56, '2021-08-02 23:46:32'),
	(10, 3, 1, 0, '2021-08-02 23:46:32'),
	(12, 4, 1, 0, '2021-08-02 23:46:32'),
	(14, 2, 1, 0.5, '2021-08-02 23:47:20'),
	(16, 3, 1, 0.1, '2021-08-02 23:47:20'),
	(18, 4, 1, 0.12, '2021-08-02 23:47:20'),
	(20, 2, 1, 0.5, '2021-08-02 23:47:28'),
	(22, 3, 1, 0.1, '2021-08-02 23:47:28'),
	(24, 4, 1, 0.12, '2021-08-02 23:47:28'),
	(26, 2, 1, 0, '2021-08-02 23:51:46'),
	(28, 3, 1, 0, '2021-08-02 23:51:46'),
	(30, 4, 1, 0, '2021-08-02 23:51:46'),
	(32, 2, 1, 1.19, '2021-08-03 15:54:20'),
	(34, 3, 1, 0.19, '2021-08-03 15:54:20'),
	(36, 4, 1, 1.39, '2021-08-03 15:54:20'),
	(38, 2, 1, 1.19, '2021-08-03 15:54:25'),
	(40, 3, 1, 0.19, '2021-08-03 15:54:25'),
	(42, 4, 1, 1.39, '2021-08-03 15:54:25'),
	(44, 2, 1, 1.19, '2021-08-03 15:55:22'),
	(46, 3, 1, 0.19, '2021-08-03 15:55:22'),
	(48, 4, 1, 1.39, '2021-08-03 15:55:22'),
	(50, 2, 1, 1.19, '2021-08-03 15:55:28'),
	(52, 3, 1, 0.19, '2021-08-03 15:55:28'),
	(54, 4, 1, 1.39, '2021-08-03 15:55:28'),
	(56, 2, 1, 1.19, '2021-08-03 15:55:47'),
	(58, 3, 1, 0.19, '2021-08-03 15:55:47'),
	(60, 4, 1, 1.39, '2021-08-03 15:55:47'),
	(62, 2, 1, 1, '2021-08-03 15:59:49'),
	(64, 3, 1, 1, '2021-08-03 15:59:49'),
	(66, 4, 1, 1, '2021-08-03 15:59:49'),
	(68, 2, 1, 1.17, '2021-08-03 16:09:13'),
	(70, 3, 1, 0.21, '2021-08-03 16:09:13'),
	(72, 4, 1, 1.23, '2021-08-03 16:09:13'),
	(74, 2, 1, 1.17, '2021-08-03 17:30:04'),
	(76, 3, 1, 0.21, '2021-08-03 17:30:04'),
	(78, 4, 1, 1.23, '2021-08-03 17:30:04'),
	(80, 2, 1, 1.17, '2021-08-03 17:33:24'),
	(82, 3, 1, 0.21, '2021-08-03 17:33:24'),
	(84, 4, 1, 1.23, '2021-08-03 17:33:24'),
	(86, 2, 1, 1.17, '2021-08-03 18:10:41'),
	(88, 3, 1, 0.22, '2021-08-03 18:10:41'),
	(90, 4, 1, 1.23, '2021-08-03 18:10:41'),
	(92, 2, 1, 2, '2021-08-03 18:10:58'),
	(94, 3, 1, 3, '2021-08-03 18:10:58'),
	(96, 4, 1, 4, '2021-08-03 18:10:58'),
	(98, 2, 1, 1.19, '2021-08-04 15:43:35'),
	(100, 3, 1, 0.19, '2021-08-04 15:43:35'),
	(102, 4, 1, 1.39, '2021-08-04 15:43:35'),
	(104, 2, 1, 1.17, '2021-08-11 19:35:26'),
	(106, 3, 1, 0.19, '2021-08-11 19:35:26'),
	(108, 4, 1, 1.39, '2021-08-11 19:35:26'),
	(110, 2, 1, 3400, '2021-08-12 13:25:04'),
	(112, 3, 1, 0.19, '2021-08-12 13:25:04'),
	(114, 4, 1, 1.39, '2021-08-12 13:25:04'),
	(116, 2, 1, 3400, '2021-08-12 22:16:14'),
	(118, 3, 1, 0.19, '2021-08-12 22:16:14'),
	(120, 4, 1, 1.39, '2021-08-12 22:16:14'),
	(122, 2, 1, 1.17, '2021-08-18 22:34:32'),
	(124, 3, 1, 0.19, '2021-08-18 22:34:32'),
	(126, 4, 1, 1.38, '2021-08-18 22:34:32'),
	(128, 2, 1, 1.19, '2021-09-29 18:21:48'),
	(130, 3, 1, 1.19, '2021-09-29 18:21:48'),
	(132, 4, 1, 1.39, '2021-09-29 18:21:48'),
	(134, 2, 1, 1.17, '2021-09-30 01:04:39'),
	(136, 3, 1, 0.19, '2021-09-30 01:04:39'),
	(138, 4, 1, 1.39, '2021-09-30 01:04:39'),
	(140, 2, 1, 1.17, '2021-09-30 01:04:56'),
	(142, 3, 1, 0.19, '2021-09-30 01:04:56'),
	(144, 4, 1, 1.39, '2021-09-30 01:04:56'),
	(146, 2, 1, 1.17, '2021-09-30 01:06:01'),
	(148, 3, 1, 0.19, '2021-09-30 01:06:01'),
	(150, 4, 1, 1.39, '2021-09-30 01:06:01'),
	(151, 4, 1, 444, '2021-11-07 18:33:19');
/*!40000 ALTER TABLE `sfl_exchange_rate` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_history
DROP TABLE IF EXISTS `sfl_history`;
CREATE TABLE IF NOT EXISTS `sfl_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_id` int unsigned NOT NULL,
  `entity` varchar(20) DEFAULT 'offer',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `date_added` int NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_history: ~81 rows (approximately)
/*!40000 ALTER TABLE `sfl_history` DISABLE KEYS */;
INSERT INTO `sfl_history` (`id`, `sfl_id`, `entity`, `user`, `action`, `date_added`, `logs`) VALUES
	(1, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637165457, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":30,"oldValue":0},{"field":"payOut","newValue":44,"oldValue":0},{"field":"defaultSiteName","newValue":"http://121.com","oldValue":null}]'),
	(2, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637167282, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(3, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637167290, '[{"field":"payOut","newValue":19,"oldValue":44}]'),
	(4, 36328, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637173048, '[{"field":"email","newValue":"dmytro.miroshnykov@actionmediamtl.com","oldValue":"0"},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://caps.com","oldValue":null},{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(5, 36331, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637180432, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://333.com","oldValue":null}]'),
	(6, 36332, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192016, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerForAggr_1.com","oldValue":null}]'),
	(7, 36332, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192023, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(8, 36333, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192053, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"Firm","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerForAggr_2.com","oldValue":null}]'),
	(9, 36334, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192085, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerForAggr_3.com","oldValue":null}]'),
	(10, 36335, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192128, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerForAggr_4caps.com","oldValue":null}]'),
	(11, 36336, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192175, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"Firm","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerForAggr_5_caps.com","oldValue":null}]'),
	(12, 36335, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637192226, '[{"field":"status","newValue":"private","oldValue":"inactive"}]'),
	(14, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637248215, '[{"field":"name","newValue":"11114","oldValue":"1111"}]'),
	(15, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637248322, '[{"field":"name","newValue":"111143","oldValue":"11114"}]'),
	(16, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637248767, '[{"field":"name","newValue":"1111__","oldValue":"111143"}]'),
	(17, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637248804, '[{"field":"name","newValue":"111+","oldValue":"1111__"}]'),
	(18, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637249272, '[{"field":"name","newValue":"111__","oldValue":"111+"}]'),
	(19, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637249840, '[{"field":"status","newValue":"inactive","oldValue":"public"}]'),
	(20, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637249855, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(21, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637250353, '[{"field":"name","newValue":"111","oldValue":"111__"}]'),
	(22, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637250683, '[{"field":"name","newValue":"111+","oldValue":"111"}]'),
	(23, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637251649, '[{"field":"status","newValue":"inactive","oldValue":"public"}]'),
	(24, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637251661, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(25, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637253282, '[{"field":"name","newValue":"111","oldValue":"111+"}]'),
	(26, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637253575, '[{"field":"name","newValue":"1112","oldValue":"111"}]'),
	(27, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637253683, '[{"field":"name","newValue":"1117","oldValue":"1112"}]'),
	(28, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637255406, '[{"field":"name","newValue":"11172","oldValue":"1117"}]'),
	(29, 36339, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637255718, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://no_aggr.com","oldValue":null}]'),
	(30, 36332, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637256002, '[{"field":"name","newValue":"offerForAggr_1_","oldValue":"offerForAggr_1"}]'),
	(31, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260083, '[{"field":"status","newValue":"inactive","oldValue":"public"}]'),
	(32, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260180, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(33, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260203, '[{"field":"name","newValue":"syka","oldValue":"11172"}]'),
	(34, 35931, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260291, '[{"field":"name","newValue":"syka1","oldValue":"syka"}]'),
	(35, 36332, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260835, '[{"field":"name","newValue":"offerForAggr_1_+","oldValue":"offerForAggr_1_"}]'),
	(36, 36340, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260870, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":5,"oldValue":0},{"field":"payOut","newValue":4,"oldValue":0},{"field":"defaultSiteName","newValue":"http://gggg.com","oldValue":null}]'),
	(37, 36340, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260893, '[{"field":"name","newValue":"addTOaggreTest","oldValue":"gggg"}]'),
	(38, 36340, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637260949, '[{"field":"name","newValue":"addTOaggreTest1","oldValue":"addTOaggreTest"}]'),
	(39, 36328, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637269009, '[{"field":"status","newValue":"private","oldValue":"public"}]'),
	(40, 36340, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637269354, '[{"field":"status","newValue":"private","oldValue":"public"}]'),
	(41, 36340, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637269412, '[{"field":"name","newValue":"addTOaggreTest2","oldValue":"addTOaggreTest1"}]'),
	(42, 36341, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637269952, '[{"field":"status","newValue":"private","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"http://1111111111.com","oldValue":null}]'),
	(43, 36342, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637271142, '[{"field":"status","newValue":"private","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://222222.com","oldValue":null}]'),
	(44, 36342, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637271244, '[{"field":"status","newValue":"public","oldValue":"private"}]'),
	(45, 36342, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637271282, '[{"field":"verticalName","newValue":"e3e3e","oldValue":"notdefined"}]'),
	(46, 36341, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637336355, '[{"field":"name","newValue":"111111111111111----4","oldValue":"111111111111111"}]'),
	(47, 36343, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637336444, '[{"field":"status","newValue":"private","oldValue":"inactive"},{"field":"advertiserName","newValue":"Firm","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":4,"oldValue":0},{"field":"payOut","newValue":3,"oldValue":0},{"field":"defaultSiteName","newValue":"http://eeeeeeeee.com","oldValue":null}]'),
	(48, 36343, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637343970, '[{"field":"restriction","newValue":"nullee","oldValue":"null"}]'),
	(49, 36344, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1637601078, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"verticalName","newValue":"e3e3e","oldValue":"notdefined"},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://offerDefault.com","oldValue":null}]'),
	(50, 36341, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638230151, '[{"field":"name","newValue":"exitTraffic2","oldValue":"111111111111111----4"},{"field":"defaultSiteName","newValue":"http://exitTraffic2.com","oldValue":"http://1111111111.com"},{"field":"offerIdRedirect","newValue":36343,"oldValue":0}]'),
	(51, 36328, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638230201, '[{"field":"offerIdRedirect","newValue":36341,"oldValue":35931}]'),
	(52, 36345, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638287041, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":3,"oldValue":0},{"field":"defaultSiteName","newValue":"http://redirectCaps.com","oldValue":null},{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(53, 36345, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638287120, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(54, 36345, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638287188, '[{"field":"payIn","newValue":4,"oldValue":2}]'),
	(55, 36328, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638287224, '[{"field":"offerIdRedirect","newValue":36345,"oldValue":36341}]'),
	(56, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638289571, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"http://redirectCaps2.com","oldValue":null}]'),
	(57, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638289591, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(58, 36345, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638289628, '[{"field":"offerIdRedirect","newValue":36346,"oldValue":35931}]'),
	(59, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638292072, '[{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(60, 36347, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638312530, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"https://register.sirennno...","oldValue":null}]'),
	(64, 36347, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638312730, '[{"field":"defaultSiteName","newValue":"https://register.sirennnow.com/?fl=m9","oldValue":"https://register.sirennno..."}]'),
	(65, 36347, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638367573, '[{"field":"defaultSiteName","newValue":"http://dedededededede.com","oldValue":"https://register.sirennnow.com/?fl=m9"}]'),
	(66, 36344, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638386725, '[{"field":"name","newValue":"offerDefault-1","oldValue":"offerDefault"}]'),
	(67, 36344, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638388706, '[{"field":"name","newValue":"offerDefault-2","oldValue":"offerDefault-1"}]'),
	(68, 36345, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829318, '[{"field":"name","newValue":"ExitOffer1","oldValue":"redirectCaps"},{"field":"defaultSiteName","newValue":"http://ExitOffer1.com","oldValue":"http://redirectCaps.com"}]'),
	(69, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829339, '[{"field":"name","newValue":"ExitOffer2","oldValue":"redirectCaps2"},{"field":"defaultSiteName","newValue":"http://ExitOffer12.com","oldValue":"http://redirectCaps2.com"}]'),
	(70, 36348, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829495, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://ExitOffer3.com","oldValue":null}]'),
	(71, 36348, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829499, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(72, 36349, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829584, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://ExitOffer4.com","oldValue":null},{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(73, 36328, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829749, '[{"field":"name","newValue":"EXITOFFER-0","oldValue":"caps"},{"field":"defaultSiteName","newValue":"http://EXITOFFER-0.com","oldValue":"http://caps.com"}]'),
	(74, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829943, '[{"field":"offerIdRedirect","newValue":36348,"oldValue":35931}]'),
	(75, 36348, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638829962, '[{"field":"offerIdRedirect","newValue":36349,"oldValue":0}]'),
	(76, 36346, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1638835833, '[{"field":"defaultSiteName","newValue":"http://ExitOffer2.com","oldValue":"http://ExitOffer12.com"}]'),
	(77, 36351, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639497067, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":1,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://deded.com","oldValue":null}]'),
	(78, 36351, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639497128, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(79, 36351, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639497136, '[{"field":"payIn","newValue":3,"oldValue":1}]'),
	(80, 36531, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639511362, '[{"field":"name","newValue":"dimon","oldValue":"6yh6y6y"},{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":4,"oldValue":0},{"field":"defaultSiteName","newValue":"http://dimon.com","oldValue":null}]'),
	(81, 36532, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639511629, '[{"field":"name","newValue":"dimon2","oldValue":"r4r4r4"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"email","newValue":"dmytro.miroshnykov@actionmediamtl.com","oldValue":"0"},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://dimon2.com","oldValue":null}]'),
	(82, 36532, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639511651, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(83, 36533, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639520337, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":10,"oldValue":0},{"field":"payOut","newValue":11,"oldValue":0},{"field":"defaultSiteName","newValue":"http://aggrChild1.com","oldValue":null}]'),
	(84, 36533, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639520345, '[{"field":"payIn","newValue":12,"oldValue":10}]'),
	(85, 36534, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639520407, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":13,"oldValue":0},{"field":"payOut","newValue":12,"oldValue":0},{"field":"defaultSiteName","newValue":"http://aggrChild2.com","oldValue":null}]'),
	(86, 36533, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639520419, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(87, 36534, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639520427, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(88, 36344, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639588479, '[{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(89, 36536, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639595901, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"http://exitOfferNested.com","oldValue":null},{"field":"offerIdRedirect","newValue":36345,"oldValue":0}]'),
	(90, 36536, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639595916, '[{"field":"status","newValue":"public","oldValue":"inactive"}]'),
	(91, 36540, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1639683794, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"verticalName","newValue":"e3e3e","oldValue":"notdefined"},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://sendEmailTest.com","oldValue":null}]'),
	(92, 36541, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640017903, '[{"field":"name","newValue":"TestDeleteOffer","oldValue":"ssss"},{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://TestDeleteOffer.com","oldValue":null},{"field":"offerIdRedirect","newValue":35931,"oldValue":0}]'),
	(93, 36543, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640026308, '[{"field":"status","newValue":"public","oldValue":"inactive"},{"field":"advertiserName","newValue":"Firm","oldValue":null},{"field":"verticalName","newValue":"e3e3e","oldValue":"notdefined"},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"http://TestDeleteOfferExitTraffic.com","oldValue":null}]'),
	(94, 36541, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640026323, '[{"field":"offerIdRedirect","newValue":36543,"oldValue":35931}]'),
	(95, 36544, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640104510, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":2,"oldValue":0},{"field":"payOut","newValue":1,"oldValue":0},{"field":"defaultSiteName","newValue":"http://fordeleteempty.com","oldValue":null}]'),
	(96, 36546, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640182584, '[{"field":"advertiserName","newValue":"adChenter","oldValue":null},{"field":"restriction","newValue":"null","oldValue":null},{"field":"payIn","newValue":3,"oldValue":0},{"field":"payOut","newValue":2,"oldValue":0},{"field":"defaultSiteName","newValue":"http://reTEstOfferDel.com","oldValue":null},{"field":"offerIdRedirect","newValue":36543,"oldValue":0}]'),
	(97, 36546, 'offer', 'dmytro.miroshnykov@actionmediamtl.com', 'update', 1640182590, '[{"field":"status","newValue":"public","oldValue":"inactive"}]');
/*!40000 ALTER TABLE `sfl_history` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_managers
DROP TABLE IF EXISTS `sfl_managers`;
CREATE TABLE IF NOT EXISTS `sfl_managers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`first_name`,`last_name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_managers: ~3 rows (approximately)
/*!40000 ALTER TABLE `sfl_managers` DISABLE KEYS */;
INSERT INTO `sfl_managers` (`id`, `first_name`, `last_name`, `email`, `name`, `office`, `date_added`, `date_updated`, `platform`, `status`) VALUES
	(1, 'jon', 'vasiiy', 'jon@email.com', 'jon', '', 0, '2021-08-15 21:53:19', 'gotzha', 'active'),
	(2, 'dimon', 'dimon', 'dimon@dimon.com', 'dimon', '', 0, '2021-08-15 21:53:21', 'gotzha', 'active'),
	(3, 'bush', 'bush', 'bush@buch.com', 'dim2on', '', 0, '2021-12-20 19:47:14', 'adcenter', 'active');
/*!40000 ALTER TABLE `sfl_managers` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offers
DROP TABLE IF EXISTS `sfl_offers`;
CREATE TABLE IF NOT EXISTS `sfl_offers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `sfl_advertiser_id` int DEFAULT NULL,
  `advertiser_manager_id` int unsigned NOT NULL DEFAULT '1',
  `sfl_vertical_id` int unsigned NOT NULL DEFAULT '1',
  `descriptions` varchar(255) DEFAULT '',
  `status` enum('public','private','apply_to_run','inactive','pending','draft') NOT NULL DEFAULT 'inactive',
  `conversion_type` enum('cpi','cpa','cpl','cpc','cpm','revShare','hybrid/multistep') NOT NULL DEFAULT 'cpi',
  `type` enum('regular','aggregated') NOT NULL DEFAULT 'regular',
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `sfl_offer_landing_page_id` int DEFAULT '0',
  `sfl_offer_geo_id` int DEFAULT '0',
  `offer_id_redirect` int DEFAULT '0',
  `payout_percent` int DEFAULT '0',
  `is_cpm_option_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `use_start_end_date` tinyint(1) DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `restriction` text,
  `deleted_at` datetime DEFAULT NULL,
  `min_payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `max_payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `min_payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `max_payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_lp` (`sfl_offer_landing_page_id`),
  KEY `FK_sfl_offers_sfl_advertiser` (`sfl_advertiser_id`),
  KEY `FK_sfl_offers_sfl_employees` (`advertiser_manager_id`),
  KEY `FK_sfl_offers_sfl_vertical` (`sfl_vertical_id`),
  CONSTRAINT `FK_sfl_offers_sfl_advertiser_managers` FOREIGN KEY (`advertiser_manager_id`) REFERENCES `sfl_managers` (`id`),
  CONSTRAINT `FK_sfl_offers_sfl_advertisers` FOREIGN KEY (`sfl_advertiser_id`) REFERENCES `sfl_advertisers` (`id`),
  CONSTRAINT `FK_sfl_offers_sfl_vertical` FOREIGN KEY (`sfl_vertical_id`) REFERENCES `sfl_vertical` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36547 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offers: ~44 rows (approximately)
/*!40000 ALTER TABLE `sfl_offers` DISABLE KEYS */;
INSERT INTO `sfl_offers` (`id`, `name`, `sfl_advertiser_id`, `advertiser_manager_id`, `sfl_vertical_id`, `descriptions`, `status`, `conversion_type`, `type`, `currency_id`, `user`, `sfl_offer_landing_page_id`, `sfl_offer_geo_id`, `offer_id_redirect`, `payout_percent`, `is_cpm_option_enabled`, `payin`, `payout`, `use_start_end_date`, `start_date`, `end_date`, `date_added`, `date_updated`, `restriction`, `deleted_at`, `min_payin`, `max_payin`, `min_payout`, `max_payout`) VALUES
	(35931, 'syka1', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 377, 0, 0, 0, 0, 30.00000000, 19.00000000, 0, NULL, NULL, 1637165440, '2021-12-15 19:11:48', 'null', NULL, 30.00000000, 30.00000000, 19.00000000, 19.00000000),
	(35932, 'aggreMain', 1, 1, 2, '', 'public', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1637168749, '2021-11-17 17:06:05', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36328, 'EXITOFFER-0', 1, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 420, 0, 36345, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637172997, '2021-12-06 22:29:09', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36331, '33333', 1, 1, 1, '', 'inactive', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 379, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637180415, '2021-11-17 20:20:32', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36332, 'offerForAggr_1_+', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 381, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637191998, '2021-11-18 18:40:35', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36333, 'offerForAggr_2', 2, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 382, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637192031, '2021-11-17 23:34:13', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36334, 'offerForAggr_3', 1, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 383, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637192065, '2021-11-17 23:37:16', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36335, 'offerForAggr_4_caps', 1, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 384, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637192100, '2021-11-17 23:37:06', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36336, 'offerForAggr_5_caps', 2, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 385, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637192144, '2021-11-17 23:36:15', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36337, 'offerForAggr_MAIN_TEST', 5, 1, 1, '', 'public', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1637192196, '2021-11-17 23:38:47', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36339, 'no_aggregated', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 388, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637255697, '2021-11-18 17:19:26', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36340, 'addTOaggreTest2', 1, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 390, 0, 0, 0, 0, 5.00000000, 4.00000000, 0, NULL, NULL, 1637260846, '2021-11-18 21:03:32', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36341, 'exitTraffic2', 1, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 399, 0, 36343, 0, 0, 2.00000000, 1.00000000, 0, NULL, NULL, 1637269935, '2021-11-29 23:56:24', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36342, '222222222', 1, 1, 2, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 395, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1637271126, '2021-12-20 01:21:23', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36343, 'eeeeeeeeeee', 2, 1, 1, '', 'private', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 396, 0, 0, 0, 0, 4.00000000, 3.00000000, 0, NULL, NULL, 1637336428, '2021-11-19 17:46:10', 'nullee', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36344, 'offerDefault-2', 1, 1, 2, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 397, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, '2021-12-01 00:00:00', '2021-12-30 00:00:00', 1637601057, '2021-12-15 19:08:08', 'null', NULL, 3.00000000, 12.00000000, 2.00000000, 14.00000000),
	(36345, 'ExitOffer1', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 415, 0, 36346, 0, 0, 4.00000000, 3.00000000, 0, NULL, NULL, 1638286995, '2021-12-06 22:21:58', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36346, 'ExitOffer2', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 421, 0, 36348, 0, 0, 3.20000000, 2.11000000, 0, NULL, NULL, 1638289547, '2021-12-14 17:04:05', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36347, 'brokenUrlTest', 1, 1, 1, '', 'inactive', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 414, 0, 0, 0, 0, 3.20000000, 2.11000000, 0, NULL, NULL, 1638312455, '2021-12-14 17:04:04', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36348, 'ExitOffer3', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 418, 0, 36349, 0, 0, 3.20000000, 2.11000000, 0, NULL, NULL, 1638829457, '2021-12-14 17:04:03', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36349, 'ExitOffer4', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 422, 0, 35931, 0, 0, 3.20000000, 2.11000000, 0, NULL, NULL, 1638829511, '2021-12-14 17:03:54', 'null', NULL, 12.00000000, 24.00000000, 35.00000000, 40.00000000),
	(36350, 'aggrExitOffer', 1, 1, 1, '', 'inactive', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639495106, '2021-12-15 19:17:26', 'null', NULL, 0.00000000, 24.00000000, 0.00000000, 40.00000000),
	(36351, 'reEnerOfferPayout', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 422, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1639496784, '2021-12-14 15:52:16', 'null', NULL, 3.00000000, 3.00000000, 2.00000000, 2.00000000),
	(36352, 'aggr', 1, 1, 1, '', 'inactive', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639497208, '2021-12-14 17:04:22', 'null', NULL, 0.00000000, 24.00000000, 0.00000000, 40.00000000),
	(36526, '[automation test] click cap redirection custom exit traffic', 1, 1, 1, 'redirection offer for qa automation click cap custom exit traffic tests', 'private', 'cpm', 'regular', 1, 'timothy.jahn@actionmediamtl.com', 422, 0, 0, 0, 0, 2.22000000, 1.11000000, 0, NULL, NULL, 1637596223, '2021-12-14 16:52:52', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36527, 'AggrEmptytest', NULL, 1, 1, '', 'inactive', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639506066, '2021-12-14 18:23:08', NULL, '2021-12-14 13:23:09', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36528, 'AggrEmptytest', 1, 1, 1, '', 'inactive', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639506192, '2021-12-14 18:27:06', 'null', '2021-12-14 13:27:07', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36529, 'AggrEmptytest', 2, 1, 1, '', 'inactive', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639506430, '2021-12-14 18:34:30', 'null', '2021-12-14 13:34:30', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36530, 'AggrEmptytest', 5, 1, 1, '', 'public', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639506875, '2021-12-14 20:12:50', 'null', NULL, 0.00000000, 3.00000000, 0.00000000, 4.00000000),
	(36531, 'dimon', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 423, 0, 0, 0, 0, 2.00000000, 4.00000000, 0, NULL, NULL, 1639507694, '2021-12-16 16:23:08', 'null', '2021-12-16 11:23:09', 2.00000000, 2.00000000, 4.00000000, 4.00000000),
	(36532, 'dimon2', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 424, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 3333, '2021-12-14 19:54:11', 'null', NULL, 3.00000000, 3.00000000, 2.00000000, 2.00000000),
	(36533, 'aggrChild1', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 426, 0, 0, 0, 0, 12.00000000, 11.00000000, 0, NULL, NULL, 1639520317, '2021-12-14 22:20:19', 'null', NULL, 12.00000000, 12.00000000, 11.00000000, 11.00000000),
	(36534, 'aggrChild2', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 427, 0, 0, 0, 0, 13.00000000, 12.00000000, 0, NULL, NULL, 1639520384, '2021-12-14 22:20:27', 'null', NULL, 13.00000000, 13.00000000, 12.00000000, 12.00000000),
	(36535, 'aggrParent', 1, 1, 1, '', 'draft', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639520440, '2021-12-16 16:12:07', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36536, 'exitOfferNested', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 431, 0, 36345, 0, 0, 2.00000000, 1.00000000, 0, NULL, NULL, 1639595879, '2021-12-15 19:18:36', 'null', NULL, 2.00000000, 2.00000000, 1.00000000, 1.00000000),
	(36537, '4r4', NULL, 1, 1, '', 'inactive', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639671142, '2021-12-16 16:12:22', NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36538, '21', NULL, 1, 1, '', 'inactive', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639671154, '2021-12-22 18:20:21', NULL, '2021-12-22 13:20:21', 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36539, 'agggggg', 1, 1, 1, '', 'draft', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639671656, '2021-12-16 16:21:11', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36540, 'SEND_EMAIL_TEST', 1, 1, 2, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 432, 0, 0, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1639683745, '2021-12-22 21:02:24', 'null', NULL, 3.00000000, 3.00000000, 2.00000000, 2.00000000),
	(36541, 'TestDeleteOffer', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 433, 0, 36543, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1639759811, '2021-12-21 17:12:48', 'null', '2021-12-21 12:12:48', 3.00000000, 3.00000000, 2.00000000, 2.00000000),
	(36542, 'aggr', 1, 1, 2, '', 'public', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1639759822, '2021-12-17 17:20:00', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36543, 'TestDeleteOfferExitTraffic', 2, 1, 2, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 434, 0, 0, 0, 0, 2.00000000, 1.00000000, 0, NULL, NULL, 1640026280, '2021-12-20 18:51:48', 'null', NULL, 2.00000000, 2.00000000, 1.00000000, 1.00000000),
	(36544, 'for delete empty', 1, 1, 1, '', 'inactive', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 435, 0, 0, 0, 0, 2.00000000, 1.00000000, 0, NULL, NULL, 1640104494, '2021-12-22 21:02:26', 'null', NULL, 2.00000000, 2.00000000, 1.00000000, 1.00000000),
	(36545, 'aggree', 1, 1, 1, '', 'draft', 'cpi', 'aggregated', 1, 'dmytro.miroshnykov@actionmediamtl.com', 0, 0, 0, 0, 0, 0.00000000, 0.00000000, 0, NULL, NULL, 1640115527, '2021-12-22 20:27:59', 'null', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000),
	(36546, 'reTEstOfferDel', 1, 1, 1, '', 'public', 'cpi', 'regular', 1, 'dmytro.miroshnykov@actionmediamtl.com', 437, 0, 36543, 0, 0, 3.00000000, 2.00000000, 0, NULL, NULL, 1640182548, '2021-12-22 14:16:30', 'null', NULL, 3.00000000, 3.00000000, 2.00000000, 2.00000000);
/*!40000 ALTER TABLE `sfl_offers` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offers_aggregated
DROP TABLE IF EXISTS `sfl_offers_aggregated`;
CREATE TABLE IF NOT EXISTS `sfl_offers_aggregated` (
  `sfl_offer_aggregated_id` int unsigned NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  UNIQUE KEY `FK_sfl_offers_aggregated_sfl_offers` (`sfl_offer_id`,`sfl_offer_aggregated_id`),
  CONSTRAINT `FK_sfl_offers_aggregated_sfl_offers` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offers_aggregated: ~16 rows (approximately)
/*!40000 ALTER TABLE `sfl_offers_aggregated` DISABLE KEYS */;
INSERT INTO `sfl_offers_aggregated` (`sfl_offer_aggregated_id`, `sfl_offer_id`) VALUES
	(35932, 36328),
	(36542, 36328),
	(36337, 36332),
	(36337, 36333),
	(36337, 36334),
	(36337, 36335),
	(36337, 36336),
	(36530, 36336),
	(36350, 36345),
	(36350, 36346),
	(36350, 36348),
	(36350, 36349),
	(36352, 36349),
	(36352, 36526),
	(36530, 36531),
	(36530, 36532);
/*!40000 ALTER TABLE `sfl_offers_aggregated` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offers_cap
DROP TABLE IF EXISTS `sfl_offers_cap`;
CREATE TABLE IF NOT EXISTS `sfl_offers_cap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `clicks_redirect_status` enum('default','custom') NOT NULL DEFAULT 'default',
  `clicks_redirect_offer_id` int unsigned NOT NULL,
  `clicks_redirect_offer_use_default` tinyint(1) NOT NULL DEFAULT '1',
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `sales_redirect_status` enum('default','custom') NOT NULL DEFAULT 'default',
  `sales_redirect_offer_id` int unsigned NOT NULL,
  `sales_redirect_offer_use_default` tinyint(1) NOT NULL DEFAULT '1',
  `use_start_end_date` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_id` (`sfl_offer_id`),
  KEY `fk_redirect_offer_id` (`clicks_redirect_offer_id`),
  KEY `fk_sales_redirect_offer_id` (`sales_redirect_offer_id`),
  CONSTRAINT `fk_sfl_offer_id` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offers_cap: ~30 rows (approximately)
/*!40000 ALTER TABLE `sfl_offers_cap` DISABLE KEYS */;
INSERT INTO `sfl_offers_cap` (`id`, `sfl_offer_id`, `enabled`, `clicks_day`, `clicks_week`, `clicks_month`, `clicks_redirect_status`, `clicks_redirect_offer_id`, `clicks_redirect_offer_use_default`, `sales_day`, `sales_week`, `sales_month`, `sales_redirect_status`, `sales_redirect_offer_id`, `sales_redirect_offer_use_default`, `use_start_end_date`, `start_date`, `end_date`, `date_added`) VALUES
	(56, 35931, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637165457),
	(57, 36328, 1, 1200, 0, 0, 'default', 0, 1, 12, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637173048),
	(58, 36331, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637180432),
	(59, 36332, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637192016),
	(60, 36333, 1, 12, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637192053),
	(61, 36334, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637192085),
	(62, 36335, 1, 3, 0, 0, 'default', 0, 1, 12, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637192128),
	(63, 36336, 1, 2, 0, 0, 'default', 0, 1, 33, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637192175),
	(65, 36339, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637255718),
	(66, 36340, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637260870),
	(67, 36341, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637269952),
	(68, 36342, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637271142),
	(69, 36343, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637336444),
	(70, 36344, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1637601078),
	(71, 36345, 1, 1, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1638287041),
	(72, 36346, 1, 2, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1638289571),
	(73, 36347, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1638312530),
	(74, 36348, 1, 0, 0, 1, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1638829495),
	(75, 36349, 1, 0, 0, 30, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1638829584),
	(76, 36351, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639497067),
	(77, 36531, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639511362),
	(78, 36532, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639511629),
	(79, 36533, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639520337),
	(80, 36534, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639520407),
	(81, 36536, 1, 1, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639595901),
	(82, 36540, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1639683794),
	(83, 36541, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1640017903),
	(84, 36543, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1640026308),
	(85, 36544, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1640104510),
	(86, 36546, 0, 0, 0, 0, 'default', 0, 1, 0, 0, 0, 'default', 0, 1, 1, NULL, NULL, 1640182584);
/*!40000 ALTER TABLE `sfl_offers_cap` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offers_cap_current_data
DROP TABLE IF EXISTS `sfl_offers_cap_current_data`;
CREATE TABLE IF NOT EXISTS `sfl_offers_cap_current_data` (
  `sfl_offer_id` int unsigned NOT NULL,
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `Index_sfl_offer_cap_current_id` (`sfl_offer_id`),
  CONSTRAINT `fk_sfl_offer_cap_current_id` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offers_cap_current_data: ~5 rows (approximately)
/*!40000 ALTER TABLE `sfl_offers_cap_current_data` DISABLE KEYS */;
INSERT INTO `sfl_offers_cap_current_data` (`sfl_offer_id`, `clicks_day`, `clicks_week`, `clicks_month`, `sales_day`, `sales_week`, `sales_month`, `date_added`, `date_updated`) VALUES
	(36328, 0, 1, 13, 0, 0, 0, 1639337842, '2021-12-16 05:01:49'),
	(36345, 0, 1, 2, 0, 0, 0, 1639337842, '2021-12-16 05:01:49'),
	(36346, 0, 1, 7, 0, 0, 0, 1639337842, '2021-12-16 05:01:49'),
	(36348, 0, 0, 22, 0, 0, 0, 1639337842, '2021-12-13 05:01:11'),
	(36349, 0, 17, 27, 0, 0, 0, 1639337842, '2021-12-15 05:01:27'),
	(36536, 0, 6, 15, 0, 1, 4, 222, '2021-12-17 05:02:38');
/*!40000 ALTER TABLE `sfl_offers_cap_current_data` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offers_custom_payout
DROP TABLE IF EXISTS `sfl_offers_custom_payout`;
CREATE TABLE IF NOT EXISTS `sfl_offers_custom_payout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `geo` varchar(2) NOT NULL,
  `payment_type` enum('fixed','percentage') NOT NULL DEFAULT 'fixed',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout_percent` int DEFAULT '0',
  `date_added` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_id` (`sfl_offer_id`,`geo`),
  CONSTRAINT `fk_sfl_offer_id_` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offers_custom_payout: ~2 rows (approximately)
/*!40000 ALTER TABLE `sfl_offers_custom_payout` DISABLE KEYS */;
INSERT INTO `sfl_offers_custom_payout` (`id`, `sfl_offer_id`, `geo`, `payment_type`, `payin`, `payout`, `payout_percent`, `date_added`) VALUES
	(209, 36328, 'AA', 'fixed', 10.00000000, 15.00000000, 0, 1638479954),
	(211, 36344, 'US', 'fixed', 12.00000000, 14.00000000, 0, 1639595311);
/*!40000 ALTER TABLE `sfl_offers_custom_payout` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_campaigns
DROP TABLE IF EXISTS `sfl_offer_campaigns`;
CREATE TABLE IF NOT EXISTS `sfl_offer_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `affiliate_id` int NOT NULL,
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `payout` double(16,8) DEFAULT '0.00000000',
  `payout_percent` int DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_aff` (`affiliate_id`),
  KEY `FK_sfl_offer_campaigns_sfl_currency` (`currency_id`),
  KEY `campaign_name_index` (`name`) USING BTREE,
  KEY `campaign_user_index` (`user`) USING BTREE,
  CONSTRAINT `FK_sfl_offer_campaigns_sfl_currency` FOREIGN KEY (`currency_id`) REFERENCES `sfl_currency` (`id`),
  CONSTRAINT `fk_v_sfl_offer` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk_v_sfl_offer_aff` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=999956 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_campaigns: ~28 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_campaigns` DISABLE KEYS */;
INSERT INTO `sfl_offer_campaigns` (`id`, `sfl_offer_id`, `name`, `affiliate_id`, `currency_id`, `payout`, `payout_percent`, `status`, `user`, `date_added`, `date_updated`) VALUES
	(998966, 35931, 'rename1', 5, 1, 19.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637167303, '2021-11-18 15:51:35'),
	(998967, 35932, 'aggrCamp', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637168784, '2021-11-17 17:06:23'),
	(998968, 35932, '4r4', 4, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637169520, '2021-11-17 17:18:40'),
	(998969, 36328, 'caps', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637173068, '2021-11-17 18:17:48'),
	(998970, 35932, 'AggregateMain', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637192310, '2021-11-17 23:38:30'),
	(998971, 36337, 'AGGR_MAIN2', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637192416, '2021-11-17 23:40:16'),
	(999932, 36342, 'testCapsCampaigEta', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637346349, '2021-11-19 18:26:15'),
	(999933, 36344, 'offerDefault', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1637601094, '2021-11-22 17:11:34'),
	(999934, 36346, 'redirectCaps2', 5, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1638302020, '2021-11-30 19:53:40'),
	(999935, 36530, 'frfrfr', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639508307, '2021-12-14 18:58:27'),
	(999936, 36346, 'frfr222', 5, 1, 2.11000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639508676, '2021-12-14 19:06:20'),
	(999937, 36535, 'aggrFPTest', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639520491, '2021-12-14 22:21:30'),
	(999938, 36536, 'exitOfferNested1', 5, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639595932, '2021-12-15 19:19:06'),
	(999939, 36531, 'dimon', 5, 1, 4.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639671783, '2021-12-16 16:23:03'),
	(999940, 36540, 'sendEmailTest', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639683814, '2021-12-16 19:43:34'),
	(999941, 36542, 'aggrDraft', 5, 1, 0.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1639760855, '2021-12-17 17:07:34'),
	(999942, 36541, 'tetsDeleteOffer', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640017926, '2021-12-20 16:32:06'),
	(999943, 36541, 'testDeleteOffer2', 4, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640018256, '2021-12-20 16:37:35'),
	(999944, 36541, 'testDeleteOffer3', 4, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640018750, '2021-12-20 16:45:50'),
	(999945, 36543, 'testDeleteExitTraffic', 2, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640028009, '2021-12-20 19:45:02'),
	(999946, 36540, 'default', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640120197, '2021-12-21 20:56:37'),
	(999947, 36546, 'reTetsDelOffer', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640182637, '2021-12-22 14:17:16'),
	(999948, 36546, 'reTEstOfferDel2', 4, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640182652, '2021-12-22 14:17:31'),
	(999949, 36546, 'reTEstOfferDel3', 3, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640182661, '2021-12-22 14:17:41'),
	(999950, 36546, 'reTEstOfferDel4', 2, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640182671, '2021-12-22 14:17:50'),
	(999951, 36543, 'TestDeleteOfferExitTraffic', 4, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640184619, '2021-12-22 14:50:18'),
	(999952, 36543, 'TestDeleteOfferExitTraffic', 2, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640184628, '2021-12-22 14:50:28'),
	(999953, 36543, 'TestDeleteOfferExitTraffic5', 5, 1, 1.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640185393, '2021-12-22 15:03:12'),
	(999954, 36546, 'reTEstOfferDelForAff2', 3, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640185414, '2021-12-22 15:18:25'),
	(999955, 36546, 'reTEstOfferDeleee', 5, 1, 2.00000000, 1, 'active', 'dmytro.miroshnykov@actionmediamtl.com', 1640188850, '2021-12-22 16:00:49');
/*!40000 ALTER TABLE `sfl_offer_campaigns` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_campaign_cap
DROP TABLE IF EXISTS `sfl_offer_campaign_cap`;
CREATE TABLE IF NOT EXISTS `sfl_offer_campaign_cap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_campaign_id` int unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `clicks_redirect_offer_id` int unsigned NOT NULL,
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `sales_redirect_offer_id` int unsigned NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_campaign_id` (`sfl_offer_campaign_id`),
  KEY `fk1_clicks_redirect_offer_id` (`clicks_redirect_offer_id`),
  KEY `fk1_sales_redirect_offer_id` (`sales_redirect_offer_id`),
  CONSTRAINT `fk1_clicks_redirect_offer_id` FOREIGN KEY (`clicks_redirect_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk1_sales_redirect_offer_id` FOREIGN KEY (`sales_redirect_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk1_sfl_offer_id` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_campaign_cap: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_campaign_cap` DISABLE KEYS */;
INSERT INTO `sfl_offer_campaign_cap` (`id`, `sfl_offer_campaign_id`, `enabled`, `clicks_day`, `clicks_week`, `clicks_month`, `clicks_redirect_offer_id`, `sales_day`, `sales_week`, `sales_month`, `sales_redirect_offer_id`, `start_date`, `end_date`, `date_added`, `date_updated`) VALUES
	(12, 999932, 1, 1, 0, 0, 36341, 0, 0, 0, 36331, '2021-10-19 13:26:41', '2021-12-19 13:26:46', 2222, '2021-11-19 18:26:54');
/*!40000 ALTER TABLE `sfl_offer_campaign_cap` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_campaign_cap_current_data
DROP TABLE IF EXISTS `sfl_offer_campaign_cap_current_data`;
CREATE TABLE IF NOT EXISTS `sfl_offer_campaign_cap_current_data` (
  `sfl_offer_campaign_id` int unsigned NOT NULL,
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `Index_sfl_campaign_cap_current_id` (`sfl_offer_campaign_id`),
  CONSTRAINT `FK_sfl_offer_campaign_cap_current_data_sfl_offer_campaigns` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_campaign_cap_current_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_campaign_cap_current_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offer_campaign_cap_current_data` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_custom_landing_pages
DROP TABLE IF EXISTS `sfl_offer_custom_landing_pages`;
CREATE TABLE IF NOT EXISTS `sfl_offer_custom_landing_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lp_offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_custom_lp` (`sfl_offer_id`),
  CONSTRAINT `fk_v_sfl_custom_lp` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_custom_landing_pages: ~30 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_custom_landing_pages` DISABLE KEYS */;
INSERT INTO `sfl_offer_custom_landing_pages` (`id`, `rules`, `sfl_offer_id`, `date_added`, `date_updated`) VALUES
	(53, '{"customLPRules":[]}', 35931, 1637165457, '2021-11-17 16:10:57'),
	(54, '{"customLPRules":[]}', 36328, 1637173048, '2021-11-17 18:17:28'),
	(55, '{"customLPRules":[]}', 36331, 1637180432, '2021-11-17 20:20:32'),
	(56, '{"customLPRules":[]}', 36332, 1637192016, '2021-11-17 23:33:36'),
	(57, '{"customLPRules":[]}', 36333, 1637192053, '2021-11-17 23:34:13'),
	(58, '{"customLPRules":[]}', 36334, 1637192085, '2021-11-17 23:34:45'),
	(59, '{"customLPRules":[]}', 36335, 1637192128, '2021-11-17 23:35:28'),
	(60, '{"customLPRules":[]}', 36336, 1637192175, '2021-11-17 23:36:15'),
	(62, '{"customLPRules":[]}', 36339, 1637255718, '2021-11-18 17:15:18'),
	(63, '{"customLPRules":[]}', 36340, 1637260870, '2021-11-18 18:41:10'),
	(64, '{"customLPRules":[]}', 36341, 1637269952, '2021-11-18 21:12:32'),
	(65, '{"customLPRules":[]}', 36342, 1637271142, '2021-11-18 21:32:22'),
	(66, '{"customLPRules":[]}', 36343, 1637336444, '2021-11-19 15:40:44'),
	(67, '{"customLPRules":[]}', 36344, 1637601078, '2021-12-15 19:08:31'),
	(68, '{"customLPRules":[]}', 36345, 1638287041, '2021-11-30 15:44:01'),
	(69, '{"customLPRules":[]}', 36346, 1638289571, '2021-11-30 16:26:11'),
	(70, '{"customLPRules":[]}', 36347, 1638312530, '2021-11-30 22:48:50'),
	(71, '{"customLPRules":[]}', 36348, 1638829495, '2021-12-06 22:24:55'),
	(72, '{"customLPRules":[]}', 36349, 1638829584, '2021-12-06 22:26:24'),
	(73, '{"customLPRules":[]}', 36351, 1639497067, '2021-12-14 15:51:07'),
	(74, '{"customLPRules":[]}', 36531, 1639511362, '2021-12-14 19:49:22'),
	(75, '{"customLPRules":[]}', 36532, 1639511629, '2021-12-14 19:53:49'),
	(76, '{"customLPRules":[]}', 36533, 1639520337, '2021-12-14 22:18:57'),
	(77, '{"customLPRules":[]}', 36534, 1639520407, '2021-12-14 22:20:07'),
	(78, '{"customLPRules":[]}', 36536, 1639595901, '2021-12-15 19:18:21'),
	(79, '{"customLPRules":[]}', 36540, 1639683794, '2021-12-16 19:43:14'),
	(80, '{"customLPRules":[]}', 36541, 1640017903, '2021-12-20 16:31:43'),
	(81, '{"customLPRules":[]}', 36543, 1640026308, '2021-12-20 18:51:48'),
	(82, '{"customLPRules":[]}', 36544, 1640104510, '2021-12-21 16:35:10'),
	(83, '{"customLPRules":[]}', 36546, 1640182584, '2021-12-22 14:16:24');
/*!40000 ALTER TABLE `sfl_offer_custom_landing_pages` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_geo
DROP TABLE IF EXISTS `sfl_offer_geo`;
CREATE TABLE IF NOT EXISTS `sfl_offer_geo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_geo` (`sfl_offer_id`),
  CONSTRAINT `fk_v_sfl_offer_geo` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_geo: ~30 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_geo` DISABLE KEYS */;
INSERT INTO `sfl_offer_geo` (`id`, `rules`, `sfl_offer_id`, `date_added`, `date_updated`) VALUES
	(53, '{"geo":[]}', 35931, 1637165457, '2021-11-17 16:10:57'),
	(54, '{"geo":[]}', 36328, 1637173048, '2021-11-25 20:57:22'),
	(55, '{"geo":[]}', 36331, 1637180432, '2021-11-17 20:20:32'),
	(56, '{"geo":[{"country":"US","include":true},{"country":"CY","include":true},{"country":"BN","include":true},{"country":"AT","include":true}]}', 36332, 1637192016, '2021-11-22 00:40:33'),
	(57, '{"geo":[]}', 36333, 1637192053, '2021-11-17 23:34:13'),
	(58, '{"geo":[]}', 36334, 1637192085, '2021-11-17 23:34:45'),
	(59, '{"geo":[]}', 36335, 1637192128, '2021-11-17 23:35:28'),
	(60, '{"geo":[]}', 36336, 1637192175, '2021-11-17 23:36:15'),
	(62, '{"geo":[]}', 36339, 1637255718, '2021-11-18 17:15:18'),
	(63, '{"geo":[]}', 36340, 1637260870, '2021-11-18 18:41:10'),
	(64, '{"geo":[{"country":"US","include":true}]}', 36341, 1637269952, '2021-11-29 23:56:24'),
	(65, '{"geo":[]}', 36342, 1637271142, '2021-11-18 21:32:22'),
	(66, '{"geo":[]}', 36343, 1637336444, '2021-11-19 15:40:44'),
	(67, '{"geo":[]}', 36344, 1637601078, '2021-12-15 17:17:33'),
	(68, '{"geo":[]}', 36345, 1638287041, '2021-11-30 15:44:01'),
	(69, '{"geo":[]}', 36346, 1638289571, '2021-11-30 16:26:11'),
	(70, '{"geo":[]}', 36347, 1638312530, '2021-11-30 22:48:50'),
	(71, '{"geo":[]}', 36348, 1638829495, '2021-12-06 22:24:55'),
	(72, '{"geo":[]}', 36349, 1638829584, '2021-12-06 22:26:24'),
	(73, '{"geo":[]}', 36351, 1639497067, '2021-12-14 15:51:07'),
	(74, '{"geo":[]}', 36531, 1639511362, '2021-12-14 19:49:22'),
	(75, '{"geo":[]}', 36532, 1639511629, '2021-12-14 19:53:49'),
	(76, '{"geo":[]}', 36533, 1639520337, '2021-12-14 22:18:57'),
	(77, '{"geo":[]}', 36534, 1639520407, '2021-12-14 22:20:07'),
	(78, '{"geo":[]}', 36536, 1639595901, '2021-12-15 19:18:21'),
	(79, '{"geo":[]}', 36540, 1639683794, '2021-12-16 19:43:14'),
	(80, '{"geo":[]}', 36541, 1640017903, '2021-12-20 16:31:43'),
	(81, '{"geo":[]}', 36543, 1640026308, '2021-12-20 18:51:48'),
	(82, '{"geo":[]}', 36544, 1640104510, '2021-12-21 16:35:10'),
	(83, '{"geo":[]}', 36546, 1640182584, '2021-12-22 14:16:24');
/*!40000 ALTER TABLE `sfl_offer_geo` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_offer_landing_pages
DROP TABLE IF EXISTS `sfl_offer_landing_pages`;
CREATE TABLE IF NOT EXISTS `sfl_offer_landing_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  `params` varchar(128) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sfl_offer_landing_pages_sfl_offers` (`sfl_offer_id`),
  CONSTRAINT `FK_sfl_offer_landing_pages_sfl_offers` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_offer_landing_pages: ~37 rows (approximately)
/*!40000 ALTER TABLE `sfl_offer_landing_pages` DISABLE KEYS */;
INSERT INTO `sfl_offer_landing_pages` (`id`, `sfl_offer_id`, `name`, `url`, `params`, `status`, `user`, `date_added`, `date_updated`) VALUES
	(377, 35931, 'http://121.com', 'http://121.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637165457, '2021-11-17 16:10:57'),
	(378, 36328, 'http://caps.com', 'http://caps.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637173048, '2021-11-17 18:17:28'),
	(379, 36331, 'http://333.com', 'http://333.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637180432, '2021-11-17 20:20:32'),
	(381, 36332, 'http://offerForAggr_1.com', 'http://offerForAggr_1.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637192023, '2021-11-17 23:33:43'),
	(382, 36333, 'http://offerForAggr_2.com', 'http://offerForAggr_2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637192053, '2021-11-17 23:34:13'),
	(383, 36334, 'http://offerForAggr_3.com', 'http://offerForAggr_3.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637192085, '2021-11-17 23:34:45'),
	(384, 36335, 'http://offerForAggr_4caps.com', 'http://offerForAggr_4caps.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637192128, '2021-11-17 23:35:28'),
	(385, 36336, 'http://offerForAggr_5_caps.com', 'http://offerForAggr_5_caps.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637192175, '2021-11-17 23:36:15'),
	(388, 36339, 'http://no_aggr.com', 'http://no_aggr.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637255966, '2021-11-18 17:19:26'),
	(390, 36340, 'http://gggg.com', 'http://gggg.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637260893, '2021-11-18 18:41:33'),
	(392, 36341, 'http://1111111111.com', 'http://1111111111.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637269988, '2021-11-18 21:13:08'),
	(395, 36342, 'http://222222.com', 'http://222222.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637271282, '2021-11-18 21:34:42'),
	(396, 36343, 'http://eeeeeeeee.com', 'http://eeeeeeeee.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637336444, '2021-11-19 15:40:44'),
	(397, 36344, 'http://offerDefault.com', 'http://offerDefault.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1637601078, '2021-11-22 17:11:18'),
	(399, 36341, 'http://exitTraffic2.com', 'http://exitTraffic2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638230184, '2021-11-29 23:56:24'),
	(403, 36345, 'http://redirectCaps.com', 'http://redirectCaps.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638287188, '2021-11-30 15:46:28'),
	(404, 36346, 'http://redirectCaps2.com', 'http://redirectCaps2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638289571, '2021-11-30 16:26:11'),
	(413, 36347, 'fr', 'https://register.sirennnow.com/?fl=m9', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638313802, '2021-11-30 23:10:02'),
	(414, 36347, 'http://dedededededede.com', 'http://dedededededede.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638367573, '2021-12-01 14:06:13'),
	(415, 36345, 'http://ExitOffer1.com', 'http://ExitOffer1.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638829318, '2021-12-06 22:21:58'),
	(416, 36346, 'http://ExitOffer12.com', 'http://ExitOffer12.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638829339, '2021-12-06 22:22:19'),
	(418, 36348, 'http://ExitOffer3.com', 'http://ExitOffer3.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638829499, '2021-12-06 22:24:59'),
	(419, 36349, 'http://ExitOffer4.com', 'http://ExitOffer4.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638829584, '2021-12-06 22:26:24'),
	(420, 36328, 'http://EXITOFFER-0.com', 'http://EXITOFFER-0.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638829749, '2021-12-06 22:29:09'),
	(421, 36346, 'http://ExitOffer2.com', 'http://ExitOffer2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1638835833, '2021-12-07 00:10:33'),
	(422, 36351, 'http://deded.com', 'http://deded.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639497067, '2021-12-14 15:51:07'),
	(423, 36531, 'http://dimon.com', 'http://dimon.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639511362, '2021-12-14 19:49:22'),
	(424, 36532, 'http://dimon2.com', 'http://dimon2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639511629, '2021-12-14 19:53:49'),
	(426, 36533, 'http://aggrChild1.com', 'http://aggrChild1.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639520345, '2021-12-14 22:19:05'),
	(427, 36534, 'http://aggrChild2.com', 'http://aggrChild2.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639520407, '2021-12-14 22:20:07'),
	(430, 36344, 'dimonLpTest', 'http://dimonLpTest.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639595311, '2021-12-15 19:08:31'),
	(431, 36536, 'http://exitOfferNested.com', 'http://exitOfferNested.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639595901, '2021-12-15 19:18:21'),
	(432, 36540, 'http://sendEmailTest.com', 'http://sendEmailTest.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1639683794, '2021-12-16 19:43:14'),
	(433, 36541, 'http://TestDeleteOffer.com', 'http://TestDeleteOffer.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1640017903, '2021-12-20 16:31:43'),
	(434, 36543, 'http://TestDeleteOfferExitTraffic.com', 'http://TestDeleteOfferExitTraffic.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1640026308, '2021-12-20 18:51:48'),
	(435, 36544, 'http://fordeleteempty.com', 'http://fordeleteempty.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1640104510, '2021-12-21 16:35:10'),
	(437, 36546, 'http://reTEstOfferDel.com', 'http://reTEstOfferDel.com', '', 'inactive', 'dmytro.miroshnykov@actionmediamtl.com', 1640182590, '2021-12-22 14:16:30');
/*!40000 ALTER TABLE `sfl_offer_landing_pages` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_payment_methods
DROP TABLE IF EXISTS `sfl_payment_methods`;
CREATE TABLE IF NOT EXISTS `sfl_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `minimum_payment_amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_payment_methods: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_payment_methods` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_segment
DROP TABLE IF EXISTS `sfl_segment`;
CREATE TABLE IF NOT EXISTS `sfl_segment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `type` enum('standard','block') NOT NULL DEFAULT 'standard',
  `position` int NOT NULL,
  `is_override_product` tinyint DEFAULT '0',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_segment: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_segment` DISABLE KEYS */;
INSERT INTO `sfl_segment` (`id`, `name`, `status`, `type`, `position`, `is_override_product`, `user`, `date_added`, `date_updated`) VALUES
	(1, 'dimon', 'active', 'block', 1, 0, '0', 0, '2021-08-16 18:18:31');
/*!40000 ALTER TABLE `sfl_segment` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_segment_dimension
DROP TABLE IF EXISTS `sfl_segment_dimension`;
CREATE TABLE IF NOT EXISTS `sfl_segment_dimension` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_segment_id` int unsigned NOT NULL,
  `sfl_dimension_id` int unsigned NOT NULL,
  `value` varchar(254) NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `filter_type_id` tinyint unsigned NOT NULL,
  `match_type_id` tinyint unsigned NOT NULL,
  `segment_rule_index` int NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_conditions` (`sfl_dimension_id`,`sfl_segment_id`,`value`),
  KEY `sfl_segment_id` (`sfl_segment_id`),
  CONSTRAINT `fk_v_sfl_dimension1` FOREIGN KEY (`sfl_dimension_id`) REFERENCES `sfl_dimension` (`id`),
  CONSTRAINT `fk_v_sfl_segment1` FOREIGN KEY (`sfl_segment_id`) REFERENCES `sfl_segment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_segment_dimension: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_segment_dimension` DISABLE KEYS */;
INSERT INTO `sfl_segment_dimension` (`id`, `sfl_segment_id`, `sfl_dimension_id`, `value`, `position`, `user`, `filter_type_id`, `match_type_id`, `segment_rule_index`, `date_added`, `date_updated`) VALUES
	(1, 1, 4, '650', 0, '0', 0, 0, 0, 0, '2021-08-16 18:18:58');
/*!40000 ALTER TABLE `sfl_segment_dimension` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_segment_landing_page
DROP TABLE IF EXISTS `sfl_segment_landing_page`;
CREATE TABLE IF NOT EXISTS `sfl_segment_landing_page` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_segment_id` int unsigned NOT NULL,
  `landing_pages_id` int NOT NULL,
  `weight` int DEFAULT '0',
  `date_added` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`sfl_segment_id`),
  KEY `Index 3` (`landing_pages_id`),
  CONSTRAINT `fk_sfl_segments_id` FOREIGN KEY (`sfl_segment_id`) REFERENCES `sfl_segment` (`id`),
  CONSTRAINT `fk_sfl_segments_landing_pages` FOREIGN KEY (`landing_pages_id`) REFERENCES `landing_pages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_segment_landing_page: ~0 rows (approximately)
/*!40000 ALTER TABLE `sfl_segment_landing_page` DISABLE KEYS */;
INSERT INTO `sfl_segment_landing_page` (`id`, `sfl_segment_id`, `landing_pages_id`, `weight`, `date_added`) VALUES
	(1, 1, 1, 0, NULL);
/*!40000 ALTER TABLE `sfl_segment_landing_page` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_traffic_links_test
DROP TABLE IF EXISTS `sfl_traffic_links_test`;
CREATE TABLE IF NOT EXISTS `sfl_traffic_links_test` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `entity_type` enum('offer','campaign') DEFAULT NULL,
  `details` text,
  `errors` text,
  `date_added` int DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_traffic_links_test: ~18 rows (approximately)
/*!40000 ALTER TABLE `sfl_traffic_links_test` DISABLE KEYS */;
INSERT INTO `sfl_traffic_links_test` (`id`, `entity_id`, `entity_type`, `details`, `errors`, `date_added`, `date_updated`) VALUES
	(896, 35931, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(897, 35932, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(898, 36328, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(899, 36332, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(900, 36333, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(901, 36334, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992023, '2021-12-08 19:33:43'),
	(902, 36335, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(903, 36336, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(904, 36337, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(905, 36339, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(906, 36340, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(907, 36341, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992024, '2021-12-08 19:33:44'),
	(908, 36343, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45'),
	(909, 36344, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45'),
	(910, 36345, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45'),
	(911, 36346, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45'),
	(912, 36348, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45'),
	(913, 36349, 'offer', 'offerInfo empty', 'offerInfo empty', 1638992025, '2021-12-08 19:33:45');
/*!40000 ALTER TABLE `sfl_traffic_links_test` ENABLE KEYS */;

-- Dumping structure for table traffic.sfl_vertical
DROP TABLE IF EXISTS `sfl_vertical`;
CREATE TABLE IF NOT EXISTS `sfl_vertical` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_vertical` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.sfl_vertical: ~2 rows (approximately)
/*!40000 ALTER TABLE `sfl_vertical` DISABLE KEYS */;
INSERT INTO `sfl_vertical` (`id`, `name`, `date_added`, `date_updated`) VALUES
	(1, 'notdefined', 0, '2021-08-15 21:22:27'),
	(2, 'e3e3e', 0, '2021-08-15 21:22:27');
/*!40000 ALTER TABLE `sfl_vertical` ENABLE KEYS */;

-- Dumping structure for table traffic.users
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table traffic.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `password`, `email`, `name`, `picture`, `verified`) VALUES
	(1, '', 'dmytro.miroshnykov@actionmediamtl.com', 'dmytro.miroshnykov', 'https://s.gravatar.com/avatar/00012705f585c85333034ee81f87dd36?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fdm.png', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
