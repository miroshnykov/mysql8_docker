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


-- Dumping database structure for traffic-1
CREATE DATABASE IF NOT EXISTS `traffic-1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `traffic-1`;

-- Dumping structure for table traffic-1.advertiser_payments
CREATE TABLE IF NOT EXISTS `advertiser_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `period_id` int DEFAULT NULL,
  `advertiser_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.advertiser_payment_items
CREATE TABLE IF NOT EXISTS `advertiser_payment_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `advertiser_id` int DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `advertiser_payment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3394 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `Index 2` (`code`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.cpm_sales
CREATE TABLE IF NOT EXISTS `cpm_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `affiliate_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `lid` varchar(255) DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.old_sfl_affiliate_managers
CREATE TABLE IF NOT EXISTS `old_sfl_affiliate_managers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12624 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.old_sfl_offers_group_maps
CREATE TABLE IF NOT EXISTS `old_sfl_offers_group_maps` (
  `sfl_offers_group_id` int unsigned NOT NULL,
  `sfl_offers_id` int unsigned NOT NULL,
  UNIQUE KEY `FK_sfl_offers_group_maps_sfl_offers` (`sfl_offers_id`,`sfl_offers_group_id`),
  CONSTRAINT `FK_sfl_offers_group_maps_sfl_offers` FOREIGN KEY (`sfl_offers_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `affiliate_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('active','pending','approved','closed','carried_over','rejected') NOT NULL DEFAULT 'active',
  `start_period` timestamp NULL DEFAULT NULL,
  `billing_cycle` enum('semimonthly','weekly','monthly') DEFAULT NULL,
  `end_period` timestamp NULL DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `affiliate_payment_term_id` int DEFAULT NULL,
  `affiliate_payment_method_id` int DEFAULT NULL,
  `affiliate_currency_id` int NOT NULL,
  `referral_commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `carry_over_referral_commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1933 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.payment_history_log
CREATE TABLE IF NOT EXISTS `payment_history_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `action` enum('created','updated','carried_over') NOT NULL,
  `entity` enum('payment','payment_item') NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `from_value` varchar(255) DEFAULT NULL,
  `to_value` varchar(255) NOT NULL,
  `initiator` varchar(255) NOT NULL,
  `date_added` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5929 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.payment_items
CREATE TABLE IF NOT EXISTS `payment_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `affiliate_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `count` int DEFAULT '1',
  `campaign_id` int DEFAULT NULL,
  `geo` varchar(2) DEFAULT NULL,
  `offer_currency_id` int NOT NULL,
  `currency_rate` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46020 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.payment_modifications
CREATE TABLE IF NOT EXISTS `payment_modifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `affiliate_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int NOT NULL DEFAULT '1',
  `affiliate_note_id` int NOT NULL,
  `currency_rate` decimal(10,3) NOT NULL,
  `date_added` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.pixels_log
CREATE TABLE IF NOT EXISTS `pixels_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `row_data` varchar(255) DEFAULT NULL,
  `affiliate_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `campaign_id` int DEFAULT NULL,
  `advertiser_id` int DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` enum('accepted','rejected') DEFAULT NULL,
  `reject_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288119 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.referral_sales_log
CREATE TABLE IF NOT EXISTS `referral_sales_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `affiliate_id` int DEFAULT NULL,
  `child_affiliate_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `period_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.rejected_pixels
CREATE TABLE IF NOT EXISTS `rejected_pixels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lid` varchar(255) DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lid` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=3738 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.s2s_pings
CREATE TABLE IF NOT EXISTS `s2s_pings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `params` varchar(255) DEFAULT NULL,
  `status_code` int DEFAULT NULL,
  `last_attempt` timestamp NOT NULL,
  `attempts_count` int DEFAULT '0',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100959 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sales
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `payout` double DEFAULT NULL,
  `payin` double DEFAULT NULL,
  `advertiser` varchar(255) DEFAULT NULL,
  `segment_amount` double DEFAULT NULL,
  `affiliate_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `lid` varchar(255) DEFAULT NULL,
  `conversion_type` enum('cpi','cpa','cpl','cpc','cpm','hybrid/multistep','revShare','hybrid','multistep') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135367 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sale_events
CREATE TABLE IF NOT EXISTS `sale_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lid` varchar(255) NOT NULL,
  `event` enum('conversion','registration','impression') DEFAULT 'conversion',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_advertisers
CREATE TABLE IF NOT EXISTS `sfl_advertisers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive','pending','rejected','suspended','blacklisted') NOT NULL DEFAULT 'inactive',
  `advertiser_manager_id` int unsigned NOT NULL,
  `origin_id` int unsigned NOT NULL,
  `website` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `descriptions` varchar(256) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token_version` int NOT NULL DEFAULT '1',
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `verified` datetime DEFAULT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `gateway_token_version` int NOT NULL DEFAULT '1',
  `margin` float DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_3c7ae9a07eab8def26c136d753` (`email`),
  KEY `fk_sfl_advertiser_id` (`advertiser_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2505 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_advertisers_clone210704
CREATE TABLE IF NOT EXISTS `sfl_advertisers_clone210704` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `advertiser_manager_id` int unsigned NOT NULL,
  `origin_id` int unsigned NOT NULL,
  `website` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `descriptions` varchar(256) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token_version` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`name`),
  KEY `fk_sfl_advertiser_id` (`advertiser_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2367 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_advertiser_information
CREATE TABLE IF NOT EXISTS `sfl_advertiser_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `advertiser_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `top_countries` varchar(255) DEFAULT NULL,
  `offered_products` varchar(255) DEFAULT NULL,
  `other_networks` text,
  `traffic_types` text,
  `verticals` text,
  `websites` text,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_752ef32797ffa24645c0af02dff` (`advertiser_id`),
  CONSTRAINT `FK_752ef32797ffa24645c0af02dff` FOREIGN KEY (`advertiser_id`) REFERENCES `sfl_advertisers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_advertiser_managers_clone210704
CREATE TABLE IF NOT EXISTS `sfl_advertiser_managers_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`first_name`,`last_name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_ad_domains
CREATE TABLE IF NOT EXISTS `sfl_ad_domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `expiry_date` timestamp NULL DEFAULT NULL,
  `date_added` int DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliates
CREATE TABLE IF NOT EXISTS `sfl_affiliates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive','pending','rejected','suspended','blacklisted') NOT NULL DEFAULT 'inactive',
  `affiliate_manager_id` int unsigned DEFAULT NULL,
  `origin_id` int unsigned NOT NULL,
  `salesforce_id` varchar(18) DEFAULT '0',
  `payment_type` varchar(50) NOT NULL,
  `last_traffic_date` int NOT NULL,
  `postback_url` varchar(250) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `tokenVersion` int NOT NULL DEFAULT '0',
  `verified` datetime DEFAULT NULL,
  `billing_cycle` enum('weekly','semimonthly','monthly') NOT NULL DEFAULT 'semimonthly',
  `payment_term_id` int DEFAULT '2',
  `timezone` varchar(30) DEFAULT NULL,
  `affiliate_type` enum('Publisher','Marketer','Network') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`id`),
  KEY `fk_sfl_affiliates_id` (`affiliate_manager_id`),
  KEY `sfl_affiliates_FK` (`currency_id`),
  CONSTRAINT `sfl_affiliates_FK` FOREIGN KEY (`currency_id`) REFERENCES `sfl_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143621 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliates_clone210704
CREATE TABLE IF NOT EXISTS `sfl_affiliates_clone210704` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive','pending','rejected','suspended','blacklisted') NOT NULL DEFAULT 'inactive',
  `affiliate_manager_id` int unsigned DEFAULT NULL,
  `origin_id` int unsigned NOT NULL,
  `salesforce_id` varchar(18) DEFAULT '0',
  `billing_cycle` enum('daily','weekly','monthly') NOT NULL DEFAULT 'weekly',
  `payment_type` varchar(50) NOT NULL,
  `last_traffic_date` int NOT NULL,
  `postback_url` varchar(250) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `tokenVersion` int NOT NULL DEFAULT '0',
  `verified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`id`),
  KEY `fk_sfl_affiliates_id` (`affiliate_manager_id`),
  KEY `sfl_affiliates_FK` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142517 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_commission
CREATE TABLE IF NOT EXISTS `sfl_affiliate_commission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `commission` decimal(5,2) NOT NULL DEFAULT '5.00',
  `is_commission_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_optional_earnings_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_information
CREATE TABLE IF NOT EXISTS `sfl_affiliate_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `learn_source` varchar(255) DEFAULT NULL,
  `top_countries` varchar(255) DEFAULT NULL,
  `top_promoted_brands` varchar(255) DEFAULT NULL,
  `other_networks` text,
  `traffic_types` text,
  `verticals` text,
  `websites` text,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `expected_monthly_revenue` text,
  `im_type` varchar(255) DEFAULT NULL,
  `im_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_14479bffd32b5731a9f2dd3f12c` (`affiliate_id`),
  CONSTRAINT `FK_14479bffd32b5731a9f2dd3f12c` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_managers_clone210704
CREATE TABLE IF NOT EXISTS `sfl_affiliate_managers_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12621 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_notes
CREATE TABLE IF NOT EXISTS `sfl_affiliate_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `note` text,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author_email` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'account',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6490 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_payment_methods
CREATE TABLE IF NOT EXISTS `sfl_affiliate_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `type` enum('primary','secondary') NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_6f83649444a835edb5386f3e18b` (`affiliate_id`),
  KEY `FK_16f16ddadb87c34f2f861af4891` (`payment_method_id`),
  CONSTRAINT `FK_16f16ddadb87c34f2f861af4891` FOREIGN KEY (`payment_method_id`) REFERENCES `sfl_payment_methods` (`id`),
  CONSTRAINT `FK_6f83649444a835edb5386f3e18b` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6012 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_payment_methods_data
CREATE TABLE IF NOT EXISTS `sfl_affiliate_payment_methods_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_payment_method_id` int NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_364b94b2be11cc51f28a3942f72` (`affiliate_payment_method_id`),
  CONSTRAINT `FK_364b94b2be11cc51f28a3942f72` FOREIGN KEY (`affiliate_payment_method_id`) REFERENCES `sfl_affiliate_payment_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22030 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_affiliate_referrals
CREATE TABLE IF NOT EXISTS `sfl_affiliate_referrals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `child_id` int NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_case
CREATE TABLE IF NOT EXISTS `sfl_case` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum('active','closed','pending','in progress') DEFAULT NULL,
  `affiliate_id` int NOT NULL,
  `campaign_id` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` enum('policy','risk') DEFAULT NULL,
  `blocked_by` int DEFAULT NULL,
  `date_blocked` datetime DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `initiator` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_case_category
CREATE TABLE IF NOT EXISTS `sfl_case_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_case_comment
CREATE TABLE IF NOT EXISTS `sfl_case_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int NOT NULL,
  `text` varchar(250) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `manager_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_case_log
CREATE TABLE IF NOT EXISTS `sfl_case_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field` varchar(150) DEFAULT NULL,
  `old_value` varchar(100) DEFAULT NULL,
  `new_value` varchar(100) DEFAULT NULL,
  `case_id` int NOT NULL,
  `manager_id` int DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_case_notes
CREATE TABLE IF NOT EXISTS `sfl_case_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `note` text,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author_email` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'account',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_currency
CREATE TABLE IF NOT EXISTS `sfl_currency` (
  `id` int unsigned NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `abbr` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_email_log
CREATE TABLE IF NOT EXISTS `sfl_email_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int NOT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_id` int DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `recipient_id` int DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_body` text,
  `from_platform` tinyint(1) DEFAULT '1',
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_exchange_rate
CREATE TABLE IF NOT EXISTS `sfl_exchange_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_id_from` int DEFAULT NULL,
  `currency_id_to` int DEFAULT '1',
  `rate` double DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2027 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_fingerprints
CREATE TABLE IF NOT EXISTS `sfl_fingerprints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fingerprint` varchar(70) NOT NULL,
  `user` int NOT NULL,
  `used_at` timestamp NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3825 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_fingerprint_collisions
CREATE TABLE IF NOT EXISTS `sfl_fingerprint_collisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fingerprint` varchar(70) NOT NULL,
  `user` int NOT NULL,
  `collided_user` int NOT NULL,
  `issued_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45886 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_history
CREATE TABLE IF NOT EXISTS `sfl_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_id` int unsigned NOT NULL,
  `entity` varchar(20) DEFAULT 'offer',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `date_added` int NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_history` (`sfl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34802 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_managers
CREATE TABLE IF NOT EXISTS `sfl_managers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `office` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive') DEFAULT 'active',
  `platform_employee_id` int DEFAULT NULL,
  `skype_id` varchar(50) DEFAULT NULL,
  `role` enum('BA','BD') DEFAULT 'BA',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`first_name`,`last_name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers
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
  `payout_percent` decimal(16,8) DEFAULT NULL,
  `is_cpm_option_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `use_start_end_date` tinyint(1) DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `restriction` text,
  `step` tinyint DEFAULT '0',
  `deleted_at` datetime(6) DEFAULT NULL,
  `min_payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `max_payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `min_payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `max_payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `is_restricted` tinyint NOT NULL DEFAULT '0',
  `margin_type` enum('fixed','percent') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_lp` (`sfl_offer_landing_page_id`),
  KEY `FK_sfl_offers_sfl_advertiser` (`sfl_advertiser_id`),
  KEY `FK_sfl_offers_sfl_employees` (`advertiser_manager_id`),
  KEY `FK_sfl_offers_sfl_vertical` (`sfl_vertical_id`),
  CONSTRAINT `FK_sfl_offers_sfl_advertisers` FOREIGN KEY (`sfl_advertiser_id`) REFERENCES `sfl_advertisers` (`id`),
  CONSTRAINT `FK_sfl_offers_sfl_vertical` FOREIGN KEY (`sfl_vertical_id`) REFERENCES `sfl_vertical` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40883 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_aggregated
CREATE TABLE IF NOT EXISTS `sfl_offers_aggregated` (
  `sfl_offer_aggregated_id` int unsigned NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  UNIQUE KEY `FK_sfl_offers_aggregated_sfl_offers` (`sfl_offer_id`,`sfl_offer_aggregated_id`),
  CONSTRAINT `FK_sfl_offers_aggregated_sfl_offers` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_cap
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
) ENGINE=InnoDB AUTO_INCREMENT=4720 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_cap_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offers_cap_clone210704` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
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
  KEY `fk_sales_redirect_offer_id` (`sales_redirect_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_cap_current_data
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

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_cap_current_data_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offers_cap_current_data_clone210704` (
  `sfl_offer_id` int unsigned NOT NULL,
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `Index_sfl_offer_cap_current_id` (`sfl_offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offers_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `sfl_advertiser_id` int NOT NULL DEFAULT '1',
  `advertiser_manager_id` int unsigned NOT NULL DEFAULT '1',
  `sfl_vertical_id` int unsigned NOT NULL DEFAULT '1',
  `descriptions` varchar(255) DEFAULT '',
  `status` enum('public','private','apply_to_run','inactive') NOT NULL DEFAULT 'inactive',
  `conversion_type` enum('cpi','cpa','cpl','cpc','cpm','revShare','hybrid/multistep') NOT NULL DEFAULT 'cpi',
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `sfl_offer_landing_page_id` int DEFAULT '0',
  `sfl_offer_geo_id` int DEFAULT '0',
  `offer_id_redirect` int DEFAULT '0',
  `payout_percent` int DEFAULT '0',
  `is_cpm_option_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `use_start_end_date` tinyint(1) DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `restriction` text,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_lp` (`sfl_offer_landing_page_id`),
  KEY `FK_sfl_offers_sfl_advertiser` (`sfl_advertiser_id`),
  KEY `FK_sfl_offers_sfl_employees` (`advertiser_manager_id`),
  KEY `FK_sfl_offers_sfl_vertical` (`sfl_vertical_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35759 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_custom_payout
CREATE TABLE IF NOT EXISTS `sfl_offers_custom_payout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `geo` varchar(2) NOT NULL,
  `payment_type` enum('fixed','percentage') NOT NULL DEFAULT 'fixed',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) DEFAULT '0.00000000',
  `payout_percent` int DEFAULT '0',
  `date_added` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_id` (`sfl_offer_id`,`geo`),
  CONSTRAINT `fk_sfl_offer_id_` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=455550 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offers_history_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offers_history_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `user` varchar(50) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `date_added` int NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_history` (`sfl_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_campaigns
CREATE TABLE IF NOT EXISTS `sfl_offer_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `affiliate_id` int NOT NULL,
  `currency_id` int unsigned NOT NULL DEFAULT '1',
  `payout` double(16,8) DEFAULT '0.00000000',
  `payout_percent` decimal(16,8) DEFAULT NULL,
  `status` enum('active','inactive','pending','blocked','rejected') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('regular','bonus') NOT NULL DEFAULT 'regular',
  `margin_type` enum('fixed','percent') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_aff` (`affiliate_id`),
  KEY `FK_sfl_offer_campaigns_sfl_currency` (`currency_id`),
  KEY `campaign_name_index` (`name`) USING BTREE,
  KEY `campaign_user_index` (`user`) USING BTREE,
  CONSTRAINT `FK_sfl_offer_campaigns_sfl_currency` FOREIGN KEY (`currency_id`) REFERENCES `sfl_currency` (`id`),
  CONSTRAINT `fk_v_sfl_offer` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk_v_sfl_offer_aff` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007639 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_campaigns_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offer_campaigns_clone210704` (
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
  KEY `campaign_user_index` (`user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=998841 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_campaign_cap
CREATE TABLE IF NOT EXISTS `sfl_offer_campaign_cap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sfl_offer_campaign_id` int unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `clicks_day` int NOT NULL DEFAULT '0',
  `clicks_week` int NOT NULL DEFAULT '0',
  `clicks_month` int NOT NULL DEFAULT '0',
  `clicks_redirect_offer_id` int unsigned DEFAULT NULL,
  `sales_day` int NOT NULL DEFAULT '0',
  `sales_week` int NOT NULL DEFAULT '0',
  `sales_month` int NOT NULL DEFAULT '0',
  `sales_redirect_offer_id` int unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_campaign_id` (`sfl_offer_campaign_id`),
  KEY `fk1_clicks_redirect_offer_id` (`clicks_redirect_offer_id`),
  KEY `fk1_sales_redirect_offer_id` (`sales_redirect_offer_id`),
  CONSTRAINT `fk1_clicks_redirect_offer_id` FOREIGN KEY (`clicks_redirect_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk1_sales_redirect_offer_id` FOREIGN KEY (`sales_redirect_offer_id`) REFERENCES `sfl_offers` (`id`),
  CONSTRAINT `fk1_sfl_offer_id` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_campaign_cap_current_data
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

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_campaign_rules
CREATE TABLE IF NOT EXISTS `sfl_offer_campaign_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `sfl_offer_campaign_id` int unsigned NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_rules` (`sfl_offer_campaign_id`),
  CONSTRAINT `fk_v_sfl_offer_rules` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_custom_landing_pages
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
) ENGINE=InnoDB AUTO_INCREMENT=4458 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_custom_landing_pages_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offer_custom_landing_pages_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lp_offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_custom_lp` (`sfl_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_geo
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
) ENGINE=InnoDB AUTO_INCREMENT=4800 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_geo_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offer_geo_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int unsigned NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_geo` (`sfl_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_landing_pages
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
) ENGINE=InnoDB AUTO_INCREMENT=25636 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_offer_landing_pages_clone210704
CREATE TABLE IF NOT EXISTS `sfl_offer_landing_pages_clone210704` (
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
  KEY `FK_sfl_offer_landing_pages_sfl_offers` (`sfl_offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19409 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_payment_methods
CREATE TABLE IF NOT EXISTS `sfl_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `minimum_payment_amount` int NOT NULL,
  `tipalti` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_payment_term
CREATE TABLE IF NOT EXISTS `sfl_payment_term` (
  `id` int NOT NULL AUTO_INCREMENT,
  `term_value` int NOT NULL,
  `term_desc` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_rate_request_logs
CREATE TABLE IF NOT EXISTS `sfl_rate_request_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result` enum('success','error') DEFAULT NULL,
  `description` text,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_referral_sales
CREATE TABLE IF NOT EXISTS `sfl_referral_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `child_id` int NOT NULL,
  `commission_percent` decimal(5,2) NOT NULL DEFAULT '5.00',
  `sale_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission_amount` tinyint(1) NOT NULL DEFAULT '0',
  `rate` decimal(5,2) NOT NULL DEFAULT '1.00',
  `is_commission_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_traffic_links_test
CREATE TABLE IF NOT EXISTS `sfl_traffic_links_test` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `entity_type` enum('offer','campaign') DEFAULT NULL,
  `details` text,
  `errors` text,
  `date_added` int DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2107 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_vertical
CREATE TABLE IF NOT EXISTS `sfl_vertical` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_vertical` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table traffic-1.sfl_vertical_clone210704
CREATE TABLE IF NOT EXISTS `sfl_vertical_clone210704` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_added` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_vertical` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
