-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: traffic
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ac_products`
--

DROP TABLE IF EXISTS `ac_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_added` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '241',
  `show_link` int(11) NOT NULL DEFAULT '1',
  `forward_offer_parameters` smallint(6) DEFAULT '1',
  `advertiser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `advertiser_id` (`advertiser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_products`
--

LOCK TABLES `ac_products` WRITE;
/*!40000 ALTER TABLE `ac_products` DISABLE KEYS */;
INSERT INTO `ac_products` VALUES (1,'acProductTest','active',0,0,'',0,241,1,1,NULL);
/*!40000 ALTER TABLE `ac_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisers`
--

DROP TABLE IF EXISTS `advertisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `currency_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `ads_permitted_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisers`
--

LOCK TABLES `advertisers` WRITE;
/*!40000 ALTER TABLE `advertisers` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_applications`
--

DROP TABLE IF EXISTS `am_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `key` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_applications`
--

LOCK TABLES `am_applications` WRITE;
/*!40000 ALTER TABLE `am_applications` DISABLE KEYS */;
INSERT INTO `am_applications` VALUES (2,'Umbrella','Security management tool','303ad1011a2a9388d5fa953031d1ac15',1,NULL,'2020-10-23 18:37:46'),(4,'BackOffice','Affiliate management platform','59024b48f676d96f146f092088a26241',1,NULL,'2020-10-26 21:09:42'),(6,'PCAPI','Affiliate Fraud Suspension System\n\n','50a7876dacb656b1c06566bf9a8223fd',1,NULL,'2020-12-18 03:08:31'),(8,'PaymentsTool','Payment management system','f563bf99436e6fa965da7c423830be85',1,NULL,'2021-02-02 20:52:22'),(10,'Custom Offers Admin','BackOffice for custom offers flow','a539a7d11d82152093842cbe00093ba8',1,NULL,'2021-06-10 13:05:02');
/*!40000 ALTER TABLE `am_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_employee_emails`
--

DROP TABLE IF EXISTS `am_employee_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_employee_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` smallint(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `am_employee_emails_FK` (`employee_id`),
  CONSTRAINT `am_employee_emails_FK` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_employee_emails`
--

LOCK TABLES `am_employee_emails` WRITE;
/*!40000 ALTER TABLE `am_employee_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_employee_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_employee_roles`
--

DROP TABLE IF EXISTS `am_employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_employee_roles` (
  `employee_id` smallint(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `am_employee_roles_FK` (`role_id`),
  KEY `am_employee_roles_FK_1` (`employee_id`),
  CONSTRAINT `am_employee_roles_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_employee_roles_FK_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_employee_roles`
--

LOCK TABLES `am_employee_roles` WRITE;
/*!40000 ALTER TABLE `am_employee_roles` DISABLE KEYS */;
INSERT INTO `am_employee_roles` VALUES (1,10);
/*!40000 ALTER TABLE `am_employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_permissions`
--

DROP TABLE IF EXISTS `am_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `am_permissions_key_IDX` (`key`) USING BTREE,
  KEY `am_permissions_FK` (`application_id`),
  CONSTRAINT `am_permissions_FK` FOREIGN KEY (`application_id`) REFERENCES `am_applications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_permissions`
--

LOCK TABLES `am_permissions` WRITE;
/*!40000 ALTER TABLE `am_permissions` DISABLE KEYS */;
INSERT INTO `am_permissions` VALUES (10,'Login','login',4,'2020-10-26 21:09:42'),(14,'Confirm Email','confirm_email',4,'2020-12-17 22:14:04'),(16,'Login','login',6,'2020-12-18 03:08:31'),(18,'Full Access','admin',6,'2020-12-18 03:27:20'),(20,'BI Agent Access','bi_agent',6,'2020-12-18 03:28:14'),(22,'Viewer Access','viewer',6,'2020-12-18 19:40:58'),(44,'See all unassigned','see_all_unassigned',4,'2021-01-18 21:58:21'),(46,'See all pending','see_all_pending',4,'2021-01-18 21:58:21'),(48,'See pending for office','see_pending_for_office',4,'2021-01-18 21:58:21'),(50,'See own pending','see_own_pending',4,'2021-01-18 21:58:21'),(52,'See all ae affiliates','see_all_ae_affiliates',4,'2021-01-18 21:58:21'),(54,'See ae affiliates for office','see_ae_affiliates_for_office',4,'2021-01-18 21:58:21'),(56,'See own ae affiliate','see_own_ae_affiliate',4,'2021-01-18 21:58:21'),(58,'Reject all affiliates','reject_all_affiliates',4,'2021-01-18 21:58:21'),(60,'Reject affiliates for office','reject_affiliates_for_office',4,'2021-01-18 21:58:21'),(62,'Reject own affiliates','reject_own_affiliates',4,'2021-01-18 21:58:21'),(64,'AE use assign','ae_can_use_assign',4,'2021-01-21 20:25:56'),(66,'AE use re-assign','ae_can_use_re_assign',4,'2021-01-21 20:25:56'),(68,'AM use assign/re-assign','am_can_use_re_assign',4,'2021-01-21 20:25:56'),(70,'Login','login',8,'2021-02-02 20:52:22'),(72,'See all am affiliates','see_all_am_affiliates',4,'2021-02-22 18:10:10'),(74,'Approve pendign affiliates','approve_pending_affiliates',4,'2021-02-22 18:10:10'),(76,'Suspend affiliate','suspend_affiliate',4,'2021-02-22 18:10:10'),(78,'See am affiliates for office','see_am_affiliates_for_office',4,'2021-02-22 18:10:10'),(80,'See Open Market','see_open_market',4,'2021-02-22 18:10:10'),(82,'Single/Mass Reactivate in Open Market','single/mass_reactivate_in_open_market',4,'2021-02-22 18:10:10'),(84,'See own am affiliates','see_own_am_affiliates',4,'2021-02-22 18:10:10'),(86,'Single Reactivate in Open Market','single_reactivate_in_open_market',4,'2021-02-22 18:10:10'),(88,'Manage Campaigns','manage_campaigns',4,'2021-02-22 18:10:10'),(90,'Manage Offers','manage_offers',4,'2021-02-22 18:10:10'),(92,'Login','login',10,'2021-06-10 13:05:02'),(94,'Ad-Center Workspace','ac_workspace',10,'2021-06-10 17:19:51'),(96,'Gotzha Workspace','gotzha_workspace',10,'2021-06-10 17:19:51'),(98,'Manage Campaigns','manage_campaigns',10,'2021-06-10 17:19:51'),(100,'Manage Offers','manage_offers',10,'2021-06-10 17:19:51'),(102,'See All Affiliates PII','see_all_affiliates_pii',10,'2021-06-10 17:19:51'),(104,'See Own Affiliates PII','see_own_affiliates_pii',10,'2021-06-10 17:19:51'),(105,'see_advertisers_section','see_advertisers_section',10,'2021-11-17 16:02:24'),(106,'see_affiliates_section','see_affiliates_section',10,'2021-11-17 16:04:27'),(107,'edit_payin_payout','edit_payin_payout',10,'2021-11-17 16:04:27');
/*!40000 ALTER TABLE `am_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_role_permissions`
--

DROP TABLE IF EXISTS `am_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  KEY `am_role_permissions_FK` (`role_id`),
  KEY `am_role_permissions_FK_1` (`permission_id`),
  CONSTRAINT `am_role_permissions_FK` FOREIGN KEY (`role_id`) REFERENCES `am_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `am_role_permissions_FK_1` FOREIGN KEY (`permission_id`) REFERENCES `am_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_role_permissions`
--

LOCK TABLES `am_role_permissions` WRITE;
/*!40000 ALTER TABLE `am_role_permissions` DISABLE KEYS */;
INSERT INTO `am_role_permissions` VALUES (8,16),(8,20),(10,105),(14,10),(14,50),(14,56),(14,62),(18,10),(18,50),(18,56),(18,62),(18,76),(20,10),(20,80),(20,86),(20,84),(16,10),(16,68),(16,80),(16,78),(16,82),(4,10),(4,14),(4,44),(4,46),(4,52),(4,58),(4,64),(4,66),(4,68),(4,62),(4,60),(4,54),(4,48),(4,50),(4,56),(4,76),(4,74),(4,72),(4,78),(4,80),(4,82),(4,88),(4,86),(4,84),(4,90),(6,10),(6,68),(6,72),(10,10),(10,14),(10,44),(10,46),(10,52),(10,58),(10,64),(10,66),(10,68),(10,76),(10,74),(10,72),(10,80),(10,82),(10,88),(10,86),(10,90),(10,16),(10,18),(10,70),(10,50),(10,56),(10,54),(10,48),(10,60),(10,62),(10,78),(10,84),(22,92),(22,96),(22,100),(22,98),(22,104),(24,92),(24,96),(24,98),(24,100),(24,102),(26,92),(26,96),(26,98),(26,100),(26,102),(2,14),(2,44),(2,46),(2,52),(2,58),(2,10),(2,48),(2,50),(2,56),(2,54),(2,62),(2,60),(2,64),(2,66),(2,68),(2,74),(2,72),(2,78),(2,84),(2,86),(2,80),(2,82),(2,88),(2,90),(2,76),(2,70),(2,92),(2,96),(2,102),(2,98),(2,100),(2,104),(12,10),(12,44),(12,14),(12,64),(12,66),(12,58),(12,74),(12,76),(12,80),(12,86),(12,46),(12,52),(12,72),(12,68),(12,82),(10,106),(10,107);
/*!40000 ALTER TABLE `am_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_roles`
--

DROP TABLE IF EXISTS `am_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_roles`
--

LOCK TABLES `am_roles` WRITE;
/*!40000 ALTER TABLE `am_roles` DISABLE KEYS */;
INSERT INTO `am_roles` VALUES (2,'QA',1,NULL,'2020-10-23 18:41:01'),(4,'General AE manager',1,NULL,'2020-10-26 21:11:40'),(6,'General AM manager',1,NULL,'2020-10-26 21:15:17'),(8,'BI Agent',1,NULL,'2020-12-18 03:14:29'),(10,'Admin',1,NULL,'2020-12-18 03:14:44'),(12,'AE Office Lead',1,NULL,'2021-01-18 22:22:31'),(14,'AE Manager',1,NULL,'2021-01-18 22:23:21'),(16,'AM Office Lead',1,NULL,'2021-02-09 13:23:35'),(18,'AE',1,NULL,'2021-02-09 13:24:10'),(20,'AM',1,NULL,'2021-02-09 13:24:25'),(22,'Gotzha Affiliate Manager',1,NULL,'2021-06-10 21:07:15'),(24,'Gotzha Affiliate Lead',1,NULL,'2021-06-10 21:08:08'),(26,'Gotzha Business Developer',1,NULL,'2021-06-10 21:09:10');
/*!40000 ALTER TABLE `am_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_regions_associated`
--

DROP TABLE IF EXISTS `countries_regions_associated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_regions_associated` (
  `code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  `region_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_regions_associated`
--

LOCK TABLES `countries_regions_associated` WRITE;
/*!40000 ALTER TABLE `countries_regions_associated` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_regions_associated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'USD'),(2,'CAD'),(3,'EURO');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_added` int(11) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `it` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `health_check` tinyint(1) NOT NULL,
  `manager_id` smallint(6) DEFAULT NULL,
  `is_account_executive_display` tinyint(4) NOT NULL DEFAULT '0',
  `advertiser_id` int(11) DEFAULT NULL,
  `password_reset` varchar(50) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(20)),
  KEY `manager_id` (`manager_id`),
  KEY `advertiser_id` (`advertiser_id`),
  KEY `office_id` (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'dimon','','','',0,1,0,'active',0,0,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_offices`
--

DROP TABLE IF EXISTS `employees_offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_offices`
--

LOCK TABLES `employees_offices` WRITE;
/*!40000 ALTER TABLE `employees_offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landing_pages`
--

DROP TABLE IF EXISTS `landing_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landing_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `prefix` enum('www','tour','ads') NOT NULL,
  `target` text NOT NULL,
  `date_added` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `advertiser_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `forced_landing_url` text NOT NULL,
  `extra_params` varchar(255) NOT NULL,
  `static_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landing_pages`
--

LOCK TABLES `landing_pages` WRITE;
/*!40000 ALTER TABLE `landing_pages` DISABLE KEYS */;
INSERT INTO `landing_pages` VALUES (1,'landing page 1','www','TargetExample',0,'active',NULL,1,'landingPageForceUrl','','landingPageStaticUrl');
/*!40000 ALTER TABLE `landing_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualified_countries`
--

DROP TABLE IF EXISTS `qualified_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualified_countries` (
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualified_countries`
--

LOCK TABLES `qualified_countries` WRITE;
/*!40000 ALTER TABLE `qualified_countries` DISABLE KEYS */;
INSERT INTO `qualified_countries` VALUES ('0','International'),('A1','Anonymous Proxy'),('A2','Satellite Provider'),('AD','Andorra'),('AE','United Arab Emirates'),('AG','Antigua and Barbuda'),('AI','Anguilla'),('AM','Armenia'),('AN','Netherlands Antilles'),('AO','Angola'),('AP','Asia/Pacific Region'),('AQ','Antarctica'),('AR','Argentina'),('AS','American Samoa'),('AT','Austria'),('AU','Australia'),('AW','Aruba'),('AX','Aland Islands'),('AZ','Azerbaijan'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgium'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrain'),('BI','Burundi'),('BJ','Benin'),('BM','Bermuda'),('BN','Brunei Darussalam'),('BO','Bolivia'),('BR','Brazil'),('BT','Bhutan'),('BV','Bouvet Island'),('BW','Botswana'),('BY','Belarus'),('BZ','Belize'),('CA','Canada'),('CC','Cocos (Keeling) Islands'),('CD','Congo, The democratic republic'),('CF','Central African Republic'),('CG','Congo'),('CH','Switzerland'),('CI','Cote D\'Ivorie'),('CK','Cook Islands'),('CL','Chile'),('CO','Colombia'),('CR','Costa Rica'),('CV','Cape Verde'),('CX','Christmas Island'),('CY','Cyprus'),('CZ','Czech Republic'),('DE','Germany'),('DK','Denmark'),('DM','Dominica'),('DO','Dominican Republic'),('EC','Ecuador'),('EE','Estonia'),('ER','Eritrea'),('ES','Spain'),('EU','Europe'),('FI','Finland'),('FJ','Fiji'),('FK','Falkland Islands (Malvinas)'),('FM','Micronesia, Federated States of'),('FO','Faroe Islands'),('FR','France'),('GB','United Kingdom'),('GD','Grenada'),('GF','French Guiana'),('GG','Guernsey'),('GI','Gibraltar'),('GL','Greenland'),('GM','Gambia'),('GN','Guinea'),('GP','Guadeloupe'),('GQ','Equatorial Guinea'),('GR','Greece'),('GS','South Georgia and the South Sandwich Islands'),('GT','Guatemala'),('GU','Guam'),('GW','Guinea-Bissau'),('GY','Guyana'),('HK','Hong Kong'),('HM','Heard Island and McDonald Islands'),('HN','Honduras'),('HT','Haiti'),('HU','Hungary'),('IE','Ireland'),('IM','Isle of Man'),('IO','British Indian Ocean Territory'),('IQ','Iraq'),('IS','Iceland'),('IT','Italy'),('JE','Jersey'),('JM','Jamaica'),('JO','Jordan'),('JP','Japan'),('KG','Kyrgyzstan'),('KH','Cambodia'),('KI','Kiribati'),('KM','Comoros'),('KN','Saint Kitts and Nevis'),('KP','Korea, Democratic People\'s Republic of'),('KR','Korea, Republic of'),('KW','Kuwait'),('KY','Cayman Islands'),('KZ','Kazakhstan'),('LA','Lao People\'s Democratic Republic'),('LB','Lebanon'),('LC','Saint Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lithuania'),('LU','Luxembourg'),('LV','Latvia'),('MC','Monaco'),('MD','Moldova, Republic of'),('ME','Montenegro'),('MH','Marshall Islands'),('MK','Macedonia'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MO','Macao'),('MP','Northern Mariana Islands'),('MQ','Martinique'),('MS','Montserrat'),('MT','Malta'),('MU','Mauritius'),('MV','Maldives'),('MW','Malawi'),('MX','Mexico'),('MZ','Mozambique'),('NA','Namibia'),('NC','New Caledonia'),('NF','Norfolk Island'),('NI','Nicaragua'),('NL','Netherlands'),('NO','Norway'),('NP','Nepal'),('NR','Nauru'),('NU','Niue'),('NZ','New Zealand'),('O1','Other Country'),('OM','Oman'),('PA','Panama'),('PE','Peru'),('PF','French Polynesia'),('PG','Papua New Guinea'),('PH','Philippines'),('PL','Poland'),('PM','Saint Pierre and Miquelon'),('PN','Pitcairn'),('PR','Puerto Rico'),('PS','Palestinian Territory'),('PT','Portugal'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RE','Reunion'),('RS','Serbia'),('RW','Rwanda'),('SA','Saudi Arabia'),('SB','Solomon Islands'),('SE','Sweden'),('SG','Singapore'),('SH','Saint Helena'),('SI','Slovenia'),('SJ','Svalbard and Jan Mayen'),('SK','Slovakia'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('SS','South Sudan'),('ST','Sao Tome and Principe'),('SV','El Salvador'),('SY','Syrian Arab Republic'),('SZ','Swaziland'),('TC','Turks and Caicos Islands'),('TD','Chad'),('TF','French Southern Territories'),('TG','Togo'),('TH','Thailand'),('TJ','Tajikistan'),('TK','Tokelau'),('TL','Timor-Leste'),('TM','Turkmenistan'),('TO','Tonga'),('TR','Turkey'),('TT','Trinidad and Tobago'),('TV','Tuvalu'),('TW','Taiwan'),('TZ','Tanzania, United Republic of'),('UG','Uganda'),('UM','United States Minor Outlying Islands'),('US','United States'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Holy See (Vatican City State)'),('VC','Saint Vincent and the Grenadines'),('VE','Venezuela'),('VG','Virgin Islands, British'),('VI','Virgin Islands, U.S.'),('VU','Vanuatu'),('WF','Wallis and Futuna'),('WS','Samoa'),('YE','Yemen'),('YT','Mayotte'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `qualified_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_ad_domains`
--

DROP TABLE IF EXISTS `sfl_ad_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_ad_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `expiry_date` timestamp NULL DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_ad_domains`
--

LOCK TABLES `sfl_ad_domains` WRITE;
/*!40000 ALTER TABLE `sfl_ad_domains` DISABLE KEYS */;
INSERT INTO `sfl_ad_domains` VALUES (2,'ryzvxm.com',1,NULL,NULL,'2021-11-01 16:23:29'),(3,'xuzeez.com',1,NULL,NULL,'2021-11-01 16:23:29'),(4,'uvbyty.com',1,NULL,NULL,'2021-11-01 16:23:29'),(5,'mghkpg.com',1,NULL,NULL,'2021-11-01 16:23:29'),(6,'hogqmd.com',1,NULL,NULL,'2021-11-01 16:23:29'),(7,'fjrkcx.com',1,NULL,NULL,'2021-11-01 16:23:29');
/*!40000 ALTER TABLE `sfl_ad_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_advertisers`
--

DROP TABLE IF EXISTS `sfl_advertisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_advertisers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `advertiser_manager_id` int(10) unsigned NOT NULL,
  `origin_id` int(10) unsigned NOT NULL,
  `website` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `descriptions` varchar(256) NOT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token_version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`name`),
  KEY `fk_sfl_advertiser_id` (`advertiser_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_advertisers`
--

LOCK TABLES `sfl_advertisers` WRITE;
/*!40000 ALTER TABLE `sfl_advertisers` DISABLE KEYS */;
INSERT INTO `sfl_advertisers` VALUES (1,'adChenter','active',1,0,'','','',0,'2021-11-01 18:21:51',1),(2,'Firm','active',1,0,'','','',0,'2021-11-01 18:21:56',1),(3,'AdvNikopol','active',1,0,'','','',0,'2021-11-01 18:22:05',1),(4,'Hyana','active',1,0,'','','',0,'2021-11-01 18:22:05',1),(5,'Various','active',1,0,'','','',0,'2021-11-01 18:29:57',1),(6,'Various1','active',1,0,'','','',0,'2021-11-01 18:29:57',1),(8,'Variou','active',0,0,'','','',0,'2021-11-17 15:12:23',1);
/*!40000 ALTER TABLE `sfl_advertisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_affiliates`
--

DROP TABLE IF EXISTS `sfl_affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive','pending','rejected','suspended','blacklisted') NOT NULL DEFAULT 'inactive',
  `affiliate_manager_id` int(10) unsigned NOT NULL,
  `origin_id` int(10) unsigned NOT NULL,
  `salesforce_id` varchar(18) DEFAULT '0',
  `billing_cycle` enum('daily','weekly','monthly') NOT NULL DEFAULT 'weekly',
  `payment_type` varchar(50) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `last_traffic_date` int(11) NOT NULL,
  `postback_url` varchar(250) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`id`),
  KEY `fk_sfl_affiliates_id` (`affiliate_manager_id`),
  CONSTRAINT `fk_sfl_affiliates_id` FOREIGN KEY (`affiliate_manager_id`) REFERENCES `sfl_managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_affiliates`
--

LOCK TABLES `sfl_affiliates` WRITE;
/*!40000 ALTER TABLE `sfl_affiliates` DISABLE KEYS */;
INSERT INTO `sfl_affiliates` VALUES (2,'afilaites 1','ee3e3','gotzha','active',2,0,'0','weekly','',1,0,'',NULL,'2021-08-15 22:58:22',NULL),(3,'affilaite 2','e3e','adcenter','active',1,0,'0','weekly','',1,0,'',NULL,'2021-08-15 22:58:35',NULL),(4,'affilaite 3','e3e','gotzha','active',2,0,'0','weekly','',1,0,'',NULL,'2021-08-15 22:58:53',NULL),(5,'affilaite 4','e3e','gotzha','active',2,0,'0','weekly','',1,0,'',NULL,'2021-08-15 22:58:53',NULL);
/*!40000 ALTER TABLE `sfl_affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_currency`
--

DROP TABLE IF EXISTS `sfl_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_currency` (
  `id` int(10) unsigned NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `abbr` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_currency`
--

LOCK TABLES `sfl_currency` WRITE;
/*!40000 ALTER TABLE `sfl_currency` DISABLE KEYS */;
INSERT INTO `sfl_currency` VALUES (1,'$','USD'),(2,'€','EUR'),(3,'R$','BRL'),(4,'£','GBP');
/*!40000 ALTER TABLE `sfl_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_dimension`
--

DROP TABLE IF EXISTS `sfl_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_dimension` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `displayed_name` varchar(45) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `displayed_name_UNIQUE` (`displayed_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_dimension`
--

LOCK TABLES `sfl_dimension` WRITE;
/*!40000 ALTER TABLE `sfl_dimension` DISABLE KEYS */;
INSERT INTO `sfl_dimension` VALUES (1,'affiliate','Affiliate','0000-00-00 00:00:00','2020-01-15 15:53:55'),(2,'country','Country','0000-00-00 00:00:00','2020-01-15 15:51:44'),(3,'affiliate_country','Affileate / Country','0000-00-00 00:00:00','2020-11-10 18:51:38'),(4,'prod','Prod','0000-00-00 00:00:00','2020-11-10 18:51:38'),(5,'affiliate_campaign','Affiliate / Campaign','0000-00-00 00:00:00','2021-01-20 19:35:01'),(6,'website','Website','0000-00-00 00:00:00','2021-01-20 19:35:21'),(7,'affiliate_status','Affiliate status','0000-00-00 00:00:00','2021-03-04 01:37:37'),(8,'affiliate_type','Affiliate type','0000-00-00 00:00:00','2021-03-04 01:37:57'),(9,'os','OS','0000-00-00 00:00:00','2021-03-04 01:38:15'),(10,'advertisers','Advertisers','0000-00-00 00:00:00','2021-03-04 01:38:25');
/*!40000 ALTER TABLE `sfl_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_exchange_rate`
--

DROP TABLE IF EXISTS `sfl_exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id_from` int(11) DEFAULT NULL,
  `currency_id_to` int(11) DEFAULT '1',
  `rate` double DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_exchange_rate`
--

LOCK TABLES `sfl_exchange_rate` WRITE;
/*!40000 ALTER TABLE `sfl_exchange_rate` DISABLE KEYS */;
INSERT INTO `sfl_exchange_rate` VALUES (2,2,1,1,'2021-08-02 23:46:23'),(4,3,1,0,'2021-08-02 23:46:23'),(6,4,1,0,'2021-08-02 23:46:23'),(8,2,1,56,'2021-08-02 23:46:32'),(10,3,1,0,'2021-08-02 23:46:32'),(12,4,1,0,'2021-08-02 23:46:32'),(14,2,1,0.5,'2021-08-02 23:47:20'),(16,3,1,0.1,'2021-08-02 23:47:20'),(18,4,1,0.12,'2021-08-02 23:47:20'),(20,2,1,0.5,'2021-08-02 23:47:28'),(22,3,1,0.1,'2021-08-02 23:47:28'),(24,4,1,0.12,'2021-08-02 23:47:28'),(26,2,1,0,'2021-08-02 23:51:46'),(28,3,1,0,'2021-08-02 23:51:46'),(30,4,1,0,'2021-08-02 23:51:46'),(32,2,1,1.19,'2021-08-03 15:54:20'),(34,3,1,0.19,'2021-08-03 15:54:20'),(36,4,1,1.39,'2021-08-03 15:54:20'),(38,2,1,1.19,'2021-08-03 15:54:25'),(40,3,1,0.19,'2021-08-03 15:54:25'),(42,4,1,1.39,'2021-08-03 15:54:25'),(44,2,1,1.19,'2021-08-03 15:55:22'),(46,3,1,0.19,'2021-08-03 15:55:22'),(48,4,1,1.39,'2021-08-03 15:55:22'),(50,2,1,1.19,'2021-08-03 15:55:28'),(52,3,1,0.19,'2021-08-03 15:55:28'),(54,4,1,1.39,'2021-08-03 15:55:28'),(56,2,1,1.19,'2021-08-03 15:55:47'),(58,3,1,0.19,'2021-08-03 15:55:47'),(60,4,1,1.39,'2021-08-03 15:55:47'),(62,2,1,1,'2021-08-03 15:59:49'),(64,3,1,1,'2021-08-03 15:59:49'),(66,4,1,1,'2021-08-03 15:59:49'),(68,2,1,1.17,'2021-08-03 16:09:13'),(70,3,1,0.21,'2021-08-03 16:09:13'),(72,4,1,1.23,'2021-08-03 16:09:13'),(74,2,1,1.17,'2021-08-03 17:30:04'),(76,3,1,0.21,'2021-08-03 17:30:04'),(78,4,1,1.23,'2021-08-03 17:30:04'),(80,2,1,1.17,'2021-08-03 17:33:24'),(82,3,1,0.21,'2021-08-03 17:33:24'),(84,4,1,1.23,'2021-08-03 17:33:24'),(86,2,1,1.17,'2021-08-03 18:10:41'),(88,3,1,0.22,'2021-08-03 18:10:41'),(90,4,1,1.23,'2021-08-03 18:10:41'),(92,2,1,2,'2021-08-03 18:10:58'),(94,3,1,3,'2021-08-03 18:10:58'),(96,4,1,4,'2021-08-03 18:10:58'),(98,2,1,1.19,'2021-08-04 15:43:35'),(100,3,1,0.19,'2021-08-04 15:43:35'),(102,4,1,1.39,'2021-08-04 15:43:35'),(104,2,1,1.17,'2021-08-11 19:35:26'),(106,3,1,0.19,'2021-08-11 19:35:26'),(108,4,1,1.39,'2021-08-11 19:35:26'),(110,2,1,3400,'2021-08-12 13:25:04'),(112,3,1,0.19,'2021-08-12 13:25:04'),(114,4,1,1.39,'2021-08-12 13:25:04'),(116,2,1,3400,'2021-08-12 22:16:14'),(118,3,1,0.19,'2021-08-12 22:16:14'),(120,4,1,1.39,'2021-08-12 22:16:14'),(122,2,1,1.17,'2021-08-18 22:34:32'),(124,3,1,0.19,'2021-08-18 22:34:32'),(126,4,1,1.38,'2021-08-18 22:34:32'),(128,2,1,1.19,'2021-09-29 18:21:48'),(130,3,1,1.19,'2021-09-29 18:21:48'),(132,4,1,1.39,'2021-09-29 18:21:48'),(134,2,1,1.17,'2021-09-30 01:04:39'),(136,3,1,0.19,'2021-09-30 01:04:39'),(138,4,1,1.39,'2021-09-30 01:04:39'),(140,2,1,1.17,'2021-09-30 01:04:56'),(142,3,1,0.19,'2021-09-30 01:04:56'),(144,4,1,1.39,'2021-09-30 01:04:56'),(146,2,1,1.17,'2021-09-30 01:06:01'),(148,3,1,0.19,'2021-09-30 01:06:01'),(150,4,1,1.39,'2021-09-30 01:06:01'),(151,4,1,444,'2021-11-07 18:33:19');
/*!40000 ALTER TABLE `sfl_exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_history`
--

DROP TABLE IF EXISTS `sfl_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sfl_id` int(10) unsigned NOT NULL,
  `entity` varchar(20) DEFAULT 'offer',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_history`
--

LOCK TABLES `sfl_history` WRITE;
/*!40000 ALTER TABLE `sfl_history` DISABLE KEYS */;
INSERT INTO `sfl_history` VALUES (1,35931,'offer','dmytro.miroshnykov@actionmediamtl.com','update',1637165457,'[{\"field\":\"advertiserName\",\"newValue\":\"adChenter\",\"oldValue\":null},{\"field\":\"restriction\",\"newValue\":\"null\",\"oldValue\":null},{\"field\":\"payIn\",\"newValue\":30,\"oldValue\":0},{\"field\":\"payOut\",\"newValue\":44,\"oldValue\":0},{\"field\":\"defaultSiteName\",\"newValue\":\"http://121.com\",\"oldValue\":null}]');
/*!40000 ALTER TABLE `sfl_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_managers`
--

DROP TABLE IF EXISTS `sfl_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `platform` enum('gotzha','adcenter') NOT NULL DEFAULT 'gotzha',
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_advertiser_managers` (`first_name`,`last_name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_managers`
--

LOCK TABLES `sfl_managers` WRITE;
/*!40000 ALTER TABLE `sfl_managers` DISABLE KEYS */;
INSERT INTO `sfl_managers` VALUES (1,'jon','vasiiy','jon@email.com','jon','',0,'2021-08-15 21:53:19','gotzha','active'),(2,'dimon','dimon','dimon@dimon.com','dimon','',0,'2021-08-15 21:53:21','gotzha','active'),(3,'dimon2','dimon2','dimon2@dimon.com','dim2on','',0,'2021-08-15 21:53:21','adcenter','active');
/*!40000 ALTER TABLE `sfl_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_campaign_cap`
--

DROP TABLE IF EXISTS `sfl_offer_campaign_cap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_campaign_cap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sfl_offer_campaign_id` int(10) unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `clicks_day` int(11) NOT NULL DEFAULT '0',
  `clicks_week` int(11) NOT NULL DEFAULT '0',
  `clicks_month` int(11) NOT NULL DEFAULT '0',
  `clicks_redirect_offer_id` int(10) unsigned NOT NULL,
  `sales_day` int(11) NOT NULL DEFAULT '0',
  `sales_week` int(11) NOT NULL DEFAULT '0',
  `sales_month` int(11) NOT NULL DEFAULT '0',
  `sales_redirect_offer_id` int(10) unsigned NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_campaign_id` (`sfl_offer_campaign_id`),
  KEY `fk1_clicks_redirect_offer_id` (`clicks_redirect_offer_id`),
  KEY `fk1_sales_redirect_offer_id` (`sales_redirect_offer_id`),
  CONSTRAINT `fk1_clicks_redirect_offer_id` FOREIGN KEY (`clicks_redirect_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk1_sales_redirect_offer_id` FOREIGN KEY (`sales_redirect_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk1_sfl_offer_id` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_campaign_cap`
--

LOCK TABLES `sfl_offer_campaign_cap` WRITE;
/*!40000 ALTER TABLE `sfl_offer_campaign_cap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offer_campaign_cap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_campaign_cap_current_data`
--

DROP TABLE IF EXISTS `sfl_offer_campaign_cap_current_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_campaign_cap_current_data` (
  `sfl_offer_campaign_id` int(10) unsigned NOT NULL,
  `clicks_day` int(11) NOT NULL DEFAULT '0',
  `clicks_week` int(11) NOT NULL DEFAULT '0',
  `clicks_month` int(11) NOT NULL DEFAULT '0',
  `sales_day` int(11) NOT NULL DEFAULT '0',
  `sales_week` int(11) NOT NULL DEFAULT '0',
  `sales_month` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `Index_sfl_campaign_cap_current_id` (`sfl_offer_campaign_id`),
  CONSTRAINT `FK_sfl_offer_campaign_cap_current_data_sfl_offer_campaigns` FOREIGN KEY (`sfl_offer_campaign_id`) REFERENCES `sfl_offer_campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_campaign_cap_current_data`
--

LOCK TABLES `sfl_offer_campaign_cap_current_data` WRITE;
/*!40000 ALTER TABLE `sfl_offer_campaign_cap_current_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offer_campaign_cap_current_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_campaigns`
--

DROP TABLE IF EXISTS `sfl_offer_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '1',
  `payout` double(16,8) DEFAULT '0.00000000',
  `payout_percent` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_aff` (`affiliate_id`),
  KEY `FK_sfl_offer_campaigns_sfl_currency` (`currency_id`),
  KEY `campaign_name_index` (`name`) USING BTREE,
  KEY `campaign_user_index` (`user`) USING BTREE,
  CONSTRAINT `FK_sfl_offer_campaigns_sfl_currency` FOREIGN KEY (`currency_id`) REFERENCES `sfl_currency` (`id`),
  CONSTRAINT `fk_v_sfl_offer` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_v_sfl_offer_aff` FOREIGN KEY (`affiliate_id`) REFERENCES `sfl_affiliates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=998966 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_campaigns`
--

LOCK TABLES `sfl_offer_campaigns` WRITE;
/*!40000 ALTER TABLE `sfl_offer_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offer_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_custom_landing_pages`
--

DROP TABLE IF EXISTS `sfl_offer_custom_landing_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_custom_landing_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lp_offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_custom_lp` (`sfl_offer_id`),
  CONSTRAINT `fk_v_sfl_custom_lp` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_custom_landing_pages`
--

LOCK TABLES `sfl_offer_custom_landing_pages` WRITE;
/*!40000 ALTER TABLE `sfl_offer_custom_landing_pages` DISABLE KEYS */;
INSERT INTO `sfl_offer_custom_landing_pages` VALUES (53,'{\"customLPRules\":[]}',35931,1637165457,'2021-11-17 16:10:57');
/*!40000 ALTER TABLE `sfl_offer_custom_landing_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_geo`
--

DROP TABLE IF EXISTS `sfl_offer_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_geo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rules` text NOT NULL,
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_id_UNIQUE` (`sfl_offer_id`),
  KEY `fk_v_sfl_offer_geo` (`sfl_offer_id`),
  CONSTRAINT `fk_v_sfl_offer_geo` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_geo`
--

LOCK TABLES `sfl_offer_geo` WRITE;
/*!40000 ALTER TABLE `sfl_offer_geo` DISABLE KEYS */;
INSERT INTO `sfl_offer_geo` VALUES (53,'{\"geo\":[]}',35931,1637165457,'2021-11-17 16:10:57');
/*!40000 ALTER TABLE `sfl_offer_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offer_landing_pages`
--

DROP TABLE IF EXISTS `sfl_offer_landing_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offer_landing_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  `params` varchar(128) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sfl_offer_landing_pages_sfl_offers` (`sfl_offer_id`),
  CONSTRAINT `FK_sfl_offer_landing_pages_sfl_offers` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offer_landing_pages`
--

LOCK TABLES `sfl_offer_landing_pages` WRITE;
/*!40000 ALTER TABLE `sfl_offer_landing_pages` DISABLE KEYS */;
INSERT INTO `sfl_offer_landing_pages` VALUES (377,35931,'http://121.com','http://121.com','','inactive','dmytro.miroshnykov@actionmediamtl.com',1637165457,'2021-11-17 16:10:57');
/*!40000 ALTER TABLE `sfl_offer_landing_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offers`
--

DROP TABLE IF EXISTS `sfl_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `sfl_advertiser_id` int(11) DEFAULT NULL,
  `advertiser_manager_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sfl_vertical_id` int(10) unsigned NOT NULL DEFAULT '1',
  `descriptions` varchar(255) DEFAULT '',
  `status` enum('public','private','apply_to_run','inactive','pending') NOT NULL DEFAULT 'inactive',
  `conversion_type` enum('cpi','cpa','cpl','cpc','cpm','revShare','hybrid/multistep') NOT NULL DEFAULT 'cpi',
  `type` enum('regular','aggregated') NOT NULL DEFAULT 'regular',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `sfl_offer_landing_page_id` int(11) DEFAULT '0',
  `sfl_offer_geo_id` int(11) DEFAULT '0',
  `offer_id_redirect` int(11) DEFAULT '0',
  `payout_percent` int(11) DEFAULT '0',
  `is_cpm_option_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `use_start_end_date` tinyint(1) DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `restriction` text,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_sfl_offer_lp` (`sfl_offer_landing_page_id`),
  KEY `FK_sfl_offers_sfl_advertiser` (`sfl_advertiser_id`),
  KEY `FK_sfl_offers_sfl_employees` (`advertiser_manager_id`),
  KEY `FK_sfl_offers_sfl_vertical` (`sfl_vertical_id`),
  CONSTRAINT `FK_sfl_offers_sfl_advertisers` FOREIGN KEY (`sfl_advertiser_id`) REFERENCES `sfl_advertisers` (`id`),
  CONSTRAINT `FK_sfl_offers_sfl_advertiser_managers` FOREIGN KEY (`advertiser_manager_id`) REFERENCES `sfl_managers` (`id`),
  CONSTRAINT `FK_sfl_offers_sfl_vertical` FOREIGN KEY (`sfl_vertical_id`) REFERENCES `sfl_vertical` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35932 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offers`
--

LOCK TABLES `sfl_offers` WRITE;
/*!40000 ALTER TABLE `sfl_offers` DISABLE KEYS */;
INSERT INTO `sfl_offers` VALUES (35931,'1111',1,1,1,'','inactive','cpi','regular',1,'dmytro.miroshnykov@actionmediamtl.com',377,0,0,0,0,30.00000000,44.00000000,0,NULL,NULL,1637165440,'2021-11-17 16:10:57','null',NULL);
/*!40000 ALTER TABLE `sfl_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offers_aggregated`
--

DROP TABLE IF EXISTS `sfl_offers_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offers_aggregated` (
  `sfl_offer_aggregated_id` int(11) unsigned NOT NULL,
  `sfl_offer_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `FK_sfl_offers_aggregated_sfl_offers` (`sfl_offer_id`,`sfl_offer_aggregated_id`),
  CONSTRAINT `FK_sfl_offers_aggregated_sfl_offers` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offers_aggregated`
--

LOCK TABLES `sfl_offers_aggregated` WRITE;
/*!40000 ALTER TABLE `sfl_offers_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offers_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offers_cap`
--

DROP TABLE IF EXISTS `sfl_offers_cap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offers_cap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `clicks_day` int(11) NOT NULL DEFAULT '0',
  `clicks_week` int(11) NOT NULL DEFAULT '0',
  `clicks_month` int(11) NOT NULL DEFAULT '0',
  `clicks_redirect_status` enum('default','custom') NOT NULL DEFAULT 'default',
  `clicks_redirect_offer_id` int(10) unsigned NOT NULL,
  `clicks_redirect_offer_use_default` tinyint(1) NOT NULL DEFAULT '1',
  `sales_day` int(11) NOT NULL DEFAULT '0',
  `sales_week` int(11) NOT NULL DEFAULT '0',
  `sales_month` int(11) NOT NULL DEFAULT '0',
  `sales_redirect_status` enum('default','custom') NOT NULL DEFAULT 'default',
  `sales_redirect_offer_id` int(10) unsigned NOT NULL,
  `sales_redirect_offer_use_default` tinyint(1) NOT NULL DEFAULT '1',
  `use_start_end_date` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `date_added` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_id` (`sfl_offer_id`),
  KEY `fk_redirect_offer_id` (`clicks_redirect_offer_id`),
  KEY `fk_sales_redirect_offer_id` (`sales_redirect_offer_id`),
  CONSTRAINT `fk_sfl_offer_id` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offers_cap`
--

LOCK TABLES `sfl_offers_cap` WRITE;
/*!40000 ALTER TABLE `sfl_offers_cap` DISABLE KEYS */;
INSERT INTO `sfl_offers_cap` VALUES (56,35931,0,0,0,0,'default',0,1,0,0,0,'default',0,1,1,NULL,NULL,1637165457);
/*!40000 ALTER TABLE `sfl_offers_cap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offers_cap_current_data`
--

DROP TABLE IF EXISTS `sfl_offers_cap_current_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offers_cap_current_data` (
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `clicks_day` int(11) NOT NULL DEFAULT '0',
  `clicks_week` int(11) NOT NULL DEFAULT '0',
  `clicks_month` int(11) NOT NULL DEFAULT '0',
  `sales_day` int(11) NOT NULL DEFAULT '0',
  `sales_week` int(11) NOT NULL DEFAULT '0',
  `sales_month` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `Index_sfl_offer_cap_current_id` (`sfl_offer_id`),
  CONSTRAINT `fk_sfl_offer_cap_current_id` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offers_cap_current_data`
--

LOCK TABLES `sfl_offers_cap_current_data` WRITE;
/*!40000 ALTER TABLE `sfl_offers_cap_current_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offers_cap_current_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_offers_custom_payout`
--

DROP TABLE IF EXISTS `sfl_offers_custom_payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_offers_custom_payout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sfl_offer_id` int(10) unsigned NOT NULL,
  `geo` varchar(2) NOT NULL,
  `payment_type` enum('fixed','percentage') NOT NULL DEFAULT 'fixed',
  `payin` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout` decimal(16,8) NOT NULL DEFAULT '0.00000000',
  `payout_percent` int(11) DEFAULT '0',
  `date_added` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_sfl_offer_id` (`sfl_offer_id`,`geo`),
  CONSTRAINT `fk_sfl_offer_id_` FOREIGN KEY (`sfl_offer_id`) REFERENCES `sfl_offers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_offers_custom_payout`
--

LOCK TABLES `sfl_offers_custom_payout` WRITE;
/*!40000 ALTER TABLE `sfl_offers_custom_payout` DISABLE KEYS */;
/*!40000 ALTER TABLE `sfl_offers_custom_payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_segment`
--

DROP TABLE IF EXISTS `sfl_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_segment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `type` enum('standard','block') NOT NULL DEFAULT 'standard',
  `position` int(10) NOT NULL,
  `is_override_product` tinyint(3) DEFAULT '0',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_segment`
--

LOCK TABLES `sfl_segment` WRITE;
/*!40000 ALTER TABLE `sfl_segment` DISABLE KEYS */;
INSERT INTO `sfl_segment` VALUES (1,'dimon','active','block',1,0,'0',0,'2021-08-16 18:18:31');
/*!40000 ALTER TABLE `sfl_segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_segment_dimension`
--

DROP TABLE IF EXISTS `sfl_segment_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_segment_dimension` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sfl_segment_id` int(10) unsigned NOT NULL,
  `sfl_dimension_id` int(10) unsigned NOT NULL,
  `value` varchar(254) NOT NULL,
  `position` int(10) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL DEFAULT '0',
  `filter_type_id` tinyint(3) unsigned NOT NULL,
  `match_type_id` tinyint(3) unsigned NOT NULL,
  `segment_rule_index` int(10) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_conditions` (`sfl_dimension_id`,`sfl_segment_id`,`value`),
  KEY `sfl_segment_id` (`sfl_segment_id`),
  CONSTRAINT `fk_v_sfl_dimension1` FOREIGN KEY (`sfl_dimension_id`) REFERENCES `sfl_dimension` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_v_sfl_segment1` FOREIGN KEY (`sfl_segment_id`) REFERENCES `sfl_segment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_segment_dimension`
--

LOCK TABLES `sfl_segment_dimension` WRITE;
/*!40000 ALTER TABLE `sfl_segment_dimension` DISABLE KEYS */;
INSERT INTO `sfl_segment_dimension` VALUES (1,1,4,'650',0,'0',0,0,0,0,'2021-08-16 18:18:58');
/*!40000 ALTER TABLE `sfl_segment_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_segment_landing_page`
--

DROP TABLE IF EXISTS `sfl_segment_landing_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_segment_landing_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sfl_segment_id` int(10) unsigned NOT NULL,
  `landing_pages_id` int(11) NOT NULL,
  `weight` int(10) DEFAULT '0',
  `date_added` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`sfl_segment_id`),
  KEY `Index 3` (`landing_pages_id`),
  CONSTRAINT `fk_sfl_segments_id` FOREIGN KEY (`sfl_segment_id`) REFERENCES `sfl_segment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sfl_segments_landing_pages` FOREIGN KEY (`landing_pages_id`) REFERENCES `landing_pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_segment_landing_page`
--

LOCK TABLES `sfl_segment_landing_page` WRITE;
/*!40000 ALTER TABLE `sfl_segment_landing_page` DISABLE KEYS */;
INSERT INTO `sfl_segment_landing_page` VALUES (1,1,1,0,NULL);
/*!40000 ALTER TABLE `sfl_segment_landing_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_traffic_links_test`
--

DROP TABLE IF EXISTS `sfl_traffic_links_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_traffic_links_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) NOT NULL,
  `entity_type` enum('offer','campaign') DEFAULT NULL,
  `details` text,
  `errors` text,
  `date_added` int(11) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_traffic_links_test`
--

LOCK TABLES `sfl_traffic_links_test` WRITE;
/*!40000 ALTER TABLE `sfl_traffic_links_test` DISABLE KEYS */;
INSERT INTO `sfl_traffic_links_test` VALUES (77,35888,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(78,35889,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(79,35890,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(80,35891,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(81,35893,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(82,35894,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(83,35895,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(84,35896,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(85,35903,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(86,35904,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(87,35907,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(88,35908,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(89,35909,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(90,35910,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(91,35912,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(92,35919,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(93,35920,'offer','offerInfo empty','offerInfo empty',1636557853,'2021-11-10 15:24:13'),(94,1,'campaign','campaignInfo empty','campaignInfo empty',1636557862,'2021-11-10 15:24:23'),(95,2,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(96,3,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(97,4,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(98,5,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(99,31,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(100,41,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(101,42,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(102,43,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(103,44,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(104,45,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(105,46,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(106,47,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(107,48,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(108,49,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(109,998960,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(110,998961,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(111,998962,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(112,998963,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(113,998964,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(114,998965,'campaign','campaignInfo empty','campaignInfo empty',1636557863,'2021-11-10 15:24:23'),(115,1,'campaign','campaignInfo empty','campaignInfo empty',1636604942,'2021-11-11 04:29:02'),(116,2,'campaign','campaignInfo empty','campaignInfo empty',1636604942,'2021-11-11 04:29:02'),(117,3,'campaign','campaignInfo empty','campaignInfo empty',1636604943,'2021-11-11 04:29:03'),(118,4,'campaign','campaignInfo empty','campaignInfo empty',1636604943,'2021-11-11 04:29:03'),(119,5,'campaign','campaignInfo empty','campaignInfo empty',1636604943,'2021-11-11 04:29:03'),(120,31,'campaign','campaignInfo empty','campaignInfo empty',1636604943,'2021-11-11 04:29:03'),(121,41,'campaign','campaignInfo empty','campaignInfo empty',1636604943,'2021-11-11 04:29:03'),(122,42,'campaign','campaignInfo empty','campaignInfo empty',1636604944,'2021-11-11 04:29:04'),(123,43,'campaign','campaignInfo empty','campaignInfo empty',1636604944,'2021-11-11 04:29:04'),(124,44,'campaign','campaignInfo empty','campaignInfo empty',1636604944,'2021-11-11 04:29:04'),(125,45,'campaign','campaignInfo empty','campaignInfo empty',1636604944,'2021-11-11 04:29:04'),(126,46,'campaign','campaignInfo empty','campaignInfo empty',1636604944,'2021-11-11 04:29:04'),(127,47,'campaign','campaignInfo empty','campaignInfo empty',1636604945,'2021-11-11 04:29:05'),(128,48,'campaign','campaignInfo empty','campaignInfo empty',1636604945,'2021-11-11 04:29:05'),(129,49,'campaign','campaignInfo empty','campaignInfo empty',1636604945,'2021-11-11 04:29:05'),(130,998960,'campaign','campaignInfo empty','campaignInfo empty',1636604945,'2021-11-11 04:29:05'),(131,998961,'campaign','campaignInfo empty','campaignInfo empty',1636604945,'2021-11-11 04:29:05'),(132,998962,'campaign','campaignInfo empty','campaignInfo empty',1636604946,'2021-11-11 04:29:06'),(133,998963,'campaign','campaignInfo empty','campaignInfo empty',1636604946,'2021-11-11 04:29:06'),(134,998964,'campaign','campaignInfo empty','campaignInfo empty',1636604946,'2021-11-11 04:29:06'),(135,998965,'campaign','campaignInfo empty','campaignInfo empty',1636604946,'2021-11-11 04:29:06'),(136,35888,'offer','offerInfo empty','offerInfo empty',1636608542,'2021-11-11 05:29:02'),(137,35889,'offer','offerInfo empty','offerInfo empty',1636608542,'2021-11-11 05:29:02'),(138,35890,'offer','offerInfo empty','offerInfo empty',1636608542,'2021-11-11 05:29:02'),(139,35891,'offer','offerInfo empty','offerInfo empty',1636608543,'2021-11-11 05:29:03'),(140,35893,'offer','offerInfo empty','offerInfo empty',1636608543,'2021-11-11 05:29:03'),(141,35894,'offer','offerInfo empty','offerInfo empty',1636608543,'2021-11-11 05:29:03'),(142,35895,'offer','offerInfo empty','offerInfo empty',1636608543,'2021-11-11 05:29:03'),(143,35896,'offer','offerInfo empty','offerInfo empty',1636608543,'2021-11-11 05:29:03'),(144,35903,'offer','offerInfo empty','offerInfo empty',1636608544,'2021-11-11 05:29:04'),(145,35904,'offer','offerInfo empty','offerInfo empty',1636608544,'2021-11-11 05:29:04'),(146,35907,'offer','offerInfo empty','offerInfo empty',1636608544,'2021-11-11 05:29:04'),(147,35908,'offer','offerInfo empty','offerInfo empty',1636608544,'2021-11-11 05:29:04'),(148,35909,'offer','offerInfo empty','offerInfo empty',1636608544,'2021-11-11 05:29:04'),(149,35910,'offer','offerInfo empty','offerInfo empty',1636608545,'2021-11-11 05:29:05'),(150,35912,'offer','offerInfo empty','offerInfo empty',1636608545,'2021-11-11 05:29:05'),(151,35919,'offer','offerInfo empty','offerInfo empty',1636608545,'2021-11-11 05:29:05'),(152,35920,'offer','offerInfo empty','offerInfo empty',1636608545,'2021-11-11 05:29:05'),(153,1,'campaign','campaignInfo empty','campaignInfo empty',1636610744,'2021-11-11 06:05:44'),(154,2,'campaign','campaignInfo empty','campaignInfo empty',1636610744,'2021-11-11 06:05:44'),(155,3,'campaign','campaignInfo empty','campaignInfo empty',1636610745,'2021-11-11 06:05:45'),(156,4,'campaign','campaignInfo empty','campaignInfo empty',1636610745,'2021-11-11 06:05:45'),(157,5,'campaign','campaignInfo empty','campaignInfo empty',1636610745,'2021-11-11 06:05:45'),(158,31,'campaign','campaignInfo empty','campaignInfo empty',1636610745,'2021-11-11 06:05:45'),(159,41,'campaign','campaignInfo empty','campaignInfo empty',1636610745,'2021-11-11 06:05:45'),(160,42,'campaign','campaignInfo empty','campaignInfo empty',1636610746,'2021-11-11 06:05:46'),(161,43,'campaign','campaignInfo empty','campaignInfo empty',1636610746,'2021-11-11 06:05:46'),(162,44,'campaign','campaignInfo empty','campaignInfo empty',1636610746,'2021-11-11 06:05:46'),(163,45,'campaign','campaignInfo empty','campaignInfo empty',1636610746,'2021-11-11 06:05:46'),(164,46,'campaign','campaignInfo empty','campaignInfo empty',1636610746,'2021-11-11 06:05:46'),(165,47,'campaign','campaignInfo empty','campaignInfo empty',1636610747,'2021-11-11 06:05:47'),(166,48,'campaign','campaignInfo empty','campaignInfo empty',1636610747,'2021-11-11 06:05:47'),(167,49,'campaign','campaignInfo empty','campaignInfo empty',1636610747,'2021-11-11 06:05:47'),(168,998960,'campaign','campaignInfo empty','campaignInfo empty',1636610747,'2021-11-11 06:05:47'),(169,998961,'campaign','campaignInfo empty','campaignInfo empty',1636610747,'2021-11-11 06:05:47'),(170,998962,'campaign','campaignInfo empty','campaignInfo empty',1636610748,'2021-11-11 06:05:48'),(171,998963,'campaign','campaignInfo empty','campaignInfo empty',1636610748,'2021-11-11 06:05:48'),(172,998964,'campaign','campaignInfo empty','campaignInfo empty',1636610748,'2021-11-11 06:05:48'),(173,998965,'campaign','campaignInfo empty','campaignInfo empty',1636610748,'2021-11-11 06:05:48'),(174,35888,'offer','offerInfo empty','offerInfo empty',1636614344,'2021-11-11 07:05:44'),(175,35889,'offer','offerInfo empty','offerInfo empty',1636614344,'2021-11-11 07:05:44'),(176,35890,'offer','offerInfo empty','offerInfo empty',1636614344,'2021-11-11 07:05:44'),(177,35891,'offer','offerInfo empty','offerInfo empty',1636614345,'2021-11-11 07:05:45'),(178,35893,'offer','offerInfo empty','offerInfo empty',1636614345,'2021-11-11 07:05:45'),(179,35894,'offer','offerInfo empty','offerInfo empty',1636614345,'2021-11-11 07:05:45'),(180,35895,'offer','offerInfo empty','offerInfo empty',1636614345,'2021-11-11 07:05:45'),(181,35896,'offer','offerInfo empty','offerInfo empty',1636614345,'2021-11-11 07:05:45'),(182,35903,'offer','offerInfo empty','offerInfo empty',1636614346,'2021-11-11 07:05:46'),(183,35904,'offer','offerInfo empty','offerInfo empty',1636614346,'2021-11-11 07:05:46'),(184,35907,'offer','offerInfo empty','offerInfo empty',1636614346,'2021-11-11 07:05:46'),(185,35908,'offer','offerInfo empty','offerInfo empty',1636614346,'2021-11-11 07:05:46'),(186,35909,'offer','offerInfo empty','offerInfo empty',1636614346,'2021-11-11 07:05:46'),(187,35910,'offer','offerInfo empty','offerInfo empty',1636614347,'2021-11-11 07:05:47'),(188,35912,'offer','offerInfo empty','offerInfo empty',1636614347,'2021-11-11 07:05:47'),(189,35919,'offer','offerInfo empty','offerInfo empty',1636614347,'2021-11-11 07:05:47'),(190,35920,'offer','offerInfo empty','offerInfo empty',1636614347,'2021-11-11 07:05:47'),(191,1,'campaign','campaignInfo empty','campaignInfo empty',1636630142,'2021-11-11 11:29:02'),(192,2,'campaign','campaignInfo empty','campaignInfo empty',1636630142,'2021-11-11 11:29:02'),(193,3,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(194,4,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(195,5,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(196,31,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(197,41,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(198,42,'campaign','campaignInfo empty','campaignInfo empty',1636630143,'2021-11-11 11:29:03'),(199,43,'campaign','campaignInfo empty','campaignInfo empty',1636630144,'2021-11-11 11:29:04'),(200,44,'campaign','campaignInfo empty','campaignInfo empty',1636630144,'2021-11-11 11:29:04'),(201,45,'campaign','campaignInfo empty','campaignInfo empty',1636630144,'2021-11-11 11:29:04'),(202,46,'campaign','campaignInfo empty','campaignInfo empty',1636630144,'2021-11-11 11:29:04'),(203,47,'campaign','campaignInfo empty','campaignInfo empty',1636630144,'2021-11-11 11:29:04'),(204,48,'campaign','campaignInfo empty','campaignInfo empty',1636630145,'2021-11-11 11:29:05'),(205,49,'campaign','campaignInfo empty','campaignInfo empty',1636630145,'2021-11-11 11:29:05'),(206,998960,'campaign','campaignInfo empty','campaignInfo empty',1636630145,'2021-11-11 11:29:05'),(207,998961,'campaign','campaignInfo empty','campaignInfo empty',1636630145,'2021-11-11 11:29:05'),(208,998962,'campaign','campaignInfo empty','campaignInfo empty',1636630145,'2021-11-11 11:29:05'),(209,998963,'campaign','campaignInfo empty','campaignInfo empty',1636630146,'2021-11-11 11:29:06'),(210,998964,'campaign','campaignInfo empty','campaignInfo empty',1636630146,'2021-11-11 11:29:06'),(211,998965,'campaign','campaignInfo empty','campaignInfo empty',1636630146,'2021-11-11 11:29:06'),(212,1,'campaign','campaignInfo empty','campaignInfo empty',1636635944,'2021-11-11 13:05:44'),(213,2,'campaign','campaignInfo empty','campaignInfo empty',1636635944,'2021-11-11 13:05:44'),(214,3,'campaign','campaignInfo empty','campaignInfo empty',1636635944,'2021-11-11 13:05:44'),(215,4,'campaign','campaignInfo empty','campaignInfo empty',1636635945,'2021-11-11 13:05:45'),(216,5,'campaign','campaignInfo empty','campaignInfo empty',1636635945,'2021-11-11 13:05:45'),(217,31,'campaign','campaignInfo empty','campaignInfo empty',1636635945,'2021-11-11 13:05:45'),(218,41,'campaign','campaignInfo empty','campaignInfo empty',1636635945,'2021-11-11 13:05:45'),(219,42,'campaign','campaignInfo empty','campaignInfo empty',1636635945,'2021-11-11 13:05:45'),(220,43,'campaign','campaignInfo empty','campaignInfo empty',1636635946,'2021-11-11 13:05:46'),(221,44,'campaign','campaignInfo empty','campaignInfo empty',1636635946,'2021-11-11 13:05:46'),(222,45,'campaign','campaignInfo empty','campaignInfo empty',1636635946,'2021-11-11 13:05:46'),(223,46,'campaign','campaignInfo empty','campaignInfo empty',1636635946,'2021-11-11 13:05:46'),(224,47,'campaign','campaignInfo empty','campaignInfo empty',1636635946,'2021-11-11 13:05:46'),(225,48,'campaign','campaignInfo empty','campaignInfo empty',1636635947,'2021-11-11 13:05:47'),(226,49,'campaign','campaignInfo empty','campaignInfo empty',1636635947,'2021-11-11 13:05:47'),(227,998960,'campaign','campaignInfo empty','campaignInfo empty',1636635947,'2021-11-11 13:05:47'),(228,998961,'campaign','campaignInfo empty','campaignInfo empty',1636635947,'2021-11-11 13:05:47'),(229,998962,'campaign','campaignInfo empty','campaignInfo empty',1636635947,'2021-11-11 13:05:47'),(230,998963,'campaign','campaignInfo empty','campaignInfo empty',1636635948,'2021-11-11 13:05:48'),(231,998964,'campaign','campaignInfo empty','campaignInfo empty',1636635948,'2021-11-11 13:05:48'),(232,998965,'campaign','campaignInfo empty','campaignInfo empty',1636635948,'2021-11-11 13:05:48'),(233,35888,'offer','offerInfo empty','offerInfo empty',1636637342,'2021-11-11 13:29:02'),(234,35889,'offer','offerInfo empty','offerInfo empty',1636637342,'2021-11-11 13:29:02'),(235,35890,'offer','offerInfo empty','offerInfo empty',1636637342,'2021-11-11 13:29:02'),(236,35891,'offer','offerInfo empty','offerInfo empty',1636637343,'2021-11-11 13:29:03'),(237,35893,'offer','offerInfo empty','offerInfo empty',1636637343,'2021-11-11 13:29:03'),(238,35894,'offer','offerInfo empty','offerInfo empty',1636637343,'2021-11-11 13:29:03'),(239,35895,'offer','offerInfo empty','offerInfo empty',1636637343,'2021-11-11 13:29:03'),(240,35896,'offer','offerInfo empty','offerInfo empty',1636637343,'2021-11-11 13:29:03'),(241,35903,'offer','offerInfo empty','offerInfo empty',1636637344,'2021-11-11 13:29:04'),(242,35904,'offer','offerInfo empty','offerInfo empty',1636637344,'2021-11-11 13:29:04'),(243,35907,'offer','offerInfo empty','offerInfo empty',1636637344,'2021-11-11 13:29:04'),(244,35908,'offer','offerInfo empty','offerInfo empty',1636637344,'2021-11-11 13:29:04'),(245,35909,'offer','offerInfo empty','offerInfo empty',1636637344,'2021-11-11 13:29:04'),(246,35910,'offer','offerInfo empty','offerInfo empty',1636637345,'2021-11-11 13:29:05'),(247,35912,'offer','offerInfo empty','offerInfo empty',1636637345,'2021-11-11 13:29:05'),(248,35919,'offer','offerInfo empty','offerInfo empty',1636637345,'2021-11-11 13:29:05'),(249,35888,'offer','offerInfo empty','offerInfo empty',1636643144,'2021-11-11 15:05:44'),(250,35889,'offer','offerInfo empty','offerInfo empty',1636643144,'2021-11-11 15:05:44'),(251,35890,'offer','offerInfo empty','offerInfo empty',1636643144,'2021-11-11 15:05:44'),(252,35891,'offer','offerInfo empty','offerInfo empty',1636643145,'2021-11-11 15:05:45'),(253,35893,'offer','offerInfo empty','offerInfo empty',1636643145,'2021-11-11 15:05:45'),(254,35894,'offer','offerInfo empty','offerInfo empty',1636643145,'2021-11-11 15:05:45'),(255,35895,'offer','offerInfo empty','offerInfo empty',1636643145,'2021-11-11 15:05:45'),(256,35896,'offer','offerInfo empty','offerInfo empty',1636643145,'2021-11-11 15:05:45'),(257,35903,'offer','offerInfo empty','offerInfo empty',1636643146,'2021-11-11 15:05:46'),(258,35904,'offer','offerInfo empty','offerInfo empty',1636643146,'2021-11-11 15:05:46'),(259,35907,'offer','offerInfo empty','offerInfo empty',1636643146,'2021-11-11 15:05:46'),(260,35908,'offer','offerInfo empty','offerInfo empty',1636643146,'2021-11-11 15:05:46'),(261,35909,'offer','offerInfo empty','offerInfo empty',1636643146,'2021-11-11 15:05:46'),(262,35910,'offer','offerInfo empty','offerInfo empty',1636643147,'2021-11-11 15:05:47'),(263,35912,'offer','offerInfo empty','offerInfo empty',1636643147,'2021-11-11 15:05:47'),(264,35919,'offer','offerInfo empty','offerInfo empty',1636643147,'2021-11-11 15:05:47'),(265,35920,'offer','offerInfo empty','offerInfo empty',1636643147,'2021-11-11 15:05:47'),(266,35923,'offer','offerInfo empty','offerInfo empty',1636643147,'2021-11-11 15:05:47'),(267,1,'campaign','campaignInfo empty','campaignInfo empty',1636702022,'2021-11-12 07:27:02'),(268,2,'campaign','campaignInfo empty','campaignInfo empty',1636702022,'2021-11-12 07:27:02'),(269,3,'campaign','campaignInfo empty','campaignInfo empty',1636702022,'2021-11-12 07:27:02'),(270,4,'campaign','campaignInfo empty','campaignInfo empty',1636702022,'2021-11-12 07:27:02'),(271,5,'campaign','campaignInfo empty','campaignInfo empty',1636702023,'2021-11-12 07:27:03'),(272,31,'campaign','campaignInfo empty','campaignInfo empty',1636702023,'2021-11-12 07:27:03'),(273,41,'campaign','campaignInfo empty','campaignInfo empty',1636702023,'2021-11-12 07:27:03'),(274,42,'campaign','campaignInfo empty','campaignInfo empty',1636702023,'2021-11-12 07:27:03'),(275,43,'campaign','campaignInfo empty','campaignInfo empty',1636702023,'2021-11-12 07:27:03'),(276,44,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(277,45,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(278,46,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(279,47,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(280,48,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(281,49,'campaign','campaignInfo empty','campaignInfo empty',1636702024,'2021-11-12 07:27:04'),(282,998960,'campaign','campaignInfo empty','campaignInfo empty',1636702025,'2021-11-12 07:27:05'),(283,998961,'campaign','campaignInfo empty','campaignInfo empty',1636702025,'2021-11-12 07:27:05'),(284,998962,'campaign','campaignInfo empty','campaignInfo empty',1636702025,'2021-11-12 07:27:05'),(285,998963,'campaign','campaignInfo empty','campaignInfo empty',1636702025,'2021-11-12 07:27:05'),(286,998964,'campaign','campaignInfo empty','campaignInfo empty',1636702025,'2021-11-12 07:27:05'),(287,998965,'campaign','campaignInfo empty','campaignInfo empty',1636702026,'2021-11-12 07:27:06'),(288,35888,'offer','offerInfo empty','offerInfo empty',1636705622,'2021-11-12 08:27:02'),(289,35889,'offer','offerInfo empty','offerInfo empty',1636705622,'2021-11-12 08:27:02'),(290,35890,'offer','offerInfo empty','offerInfo empty',1636705622,'2021-11-12 08:27:02'),(291,35891,'offer','offerInfo empty','offerInfo empty',1636705622,'2021-11-12 08:27:02'),(292,35893,'offer','offerInfo empty','offerInfo empty',1636705623,'2021-11-12 08:27:03'),(293,35894,'offer','offerInfo empty','offerInfo empty',1636705623,'2021-11-12 08:27:03'),(294,35895,'offer','offerInfo empty','offerInfo empty',1636705623,'2021-11-12 08:27:03'),(295,35896,'offer','offerInfo empty','offerInfo empty',1636705623,'2021-11-12 08:27:03'),(296,35903,'offer','offerInfo empty','offerInfo empty',1636705623,'2021-11-12 08:27:03'),(297,35904,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(298,35907,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(299,35908,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(300,35909,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(301,35910,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(302,35912,'offer','offerInfo empty','offerInfo empty',1636705624,'2021-11-12 08:27:04'),(303,35919,'offer','offerInfo empty','offerInfo empty',1636705625,'2021-11-12 08:27:05'),(304,35920,'offer','offerInfo empty','offerInfo empty',1636705625,'2021-11-12 08:27:05'),(305,35923,'offer','offerInfo empty','offerInfo empty',1636705625,'2021-11-12 08:27:05'),(306,35924,'offer','offerInfo empty','offerInfo empty',1636705625,'2021-11-12 08:27:05'),(307,1,'campaign','campaignInfo empty','campaignInfo empty',1636727222,'2021-11-12 14:27:02'),(308,2,'campaign','campaignInfo empty','campaignInfo empty',1636727222,'2021-11-12 14:27:02'),(309,3,'campaign','campaignInfo empty','campaignInfo empty',1636727222,'2021-11-12 14:27:02'),(310,4,'campaign','campaignInfo empty','campaignInfo empty',1636727222,'2021-11-12 14:27:02'),(311,5,'campaign','campaignInfo empty','campaignInfo empty',1636727222,'2021-11-12 14:27:02'),(312,31,'campaign','campaignInfo empty','campaignInfo empty',1636727223,'2021-11-12 14:27:03'),(313,41,'campaign','campaignInfo empty','campaignInfo empty',1636727223,'2021-11-12 14:27:03'),(314,42,'campaign','campaignInfo empty','campaignInfo empty',1636727223,'2021-11-12 14:27:03'),(315,43,'campaign','campaignInfo empty','campaignInfo empty',1636727223,'2021-11-12 14:27:03'),(316,44,'campaign','campaignInfo empty','campaignInfo empty',1636727223,'2021-11-12 14:27:03'),(317,45,'campaign','campaignInfo empty','campaignInfo empty',1636727224,'2021-11-12 14:27:04'),(318,46,'campaign','campaignInfo empty','campaignInfo empty',1636727224,'2021-11-12 14:27:04'),(319,47,'campaign','campaignInfo empty','campaignInfo empty',1636727224,'2021-11-12 14:27:04'),(320,48,'campaign','campaignInfo empty','campaignInfo empty',1636727224,'2021-11-12 14:27:04'),(321,49,'campaign','campaignInfo empty','campaignInfo empty',1636727224,'2021-11-12 14:27:04'),(322,998960,'campaign','campaignInfo empty','campaignInfo empty',1636727225,'2021-11-12 14:27:05'),(323,998961,'campaign','campaignInfo empty','campaignInfo empty',1636727225,'2021-11-12 14:27:05'),(324,998962,'campaign','campaignInfo empty','campaignInfo empty',1636727225,'2021-11-12 14:27:05'),(325,998963,'campaign','campaignInfo empty','campaignInfo empty',1636727225,'2021-11-12 14:27:05'),(326,998964,'campaign','campaignInfo empty','campaignInfo empty',1636727225,'2021-11-12 14:27:05'),(327,998965,'campaign','campaignInfo empty','campaignInfo empty',1636727226,'2021-11-12 14:27:06'),(328,35888,'offer','offerInfo empty','offerInfo empty',1636734422,'2021-11-12 16:27:02'),(329,35889,'offer','offerInfo empty','offerInfo empty',1636734422,'2021-11-12 16:27:02'),(330,35890,'offer','offerInfo empty','offerInfo empty',1636734422,'2021-11-12 16:27:02'),(331,35891,'offer','offerInfo empty','offerInfo empty',1636734422,'2021-11-12 16:27:02'),(332,35893,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(333,35894,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(334,35895,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(335,35896,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(336,35903,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(337,35904,'offer','offerInfo empty','offerInfo empty',1636734423,'2021-11-12 16:27:03'),(338,35907,'offer','offerInfo empty','offerInfo empty',1636734424,'2021-11-12 16:27:04'),(339,35908,'offer','offerInfo empty','offerInfo empty',1636734424,'2021-11-12 16:27:04'),(340,35909,'offer','offerInfo empty','offerInfo empty',1636734424,'2021-11-12 16:27:04'),(341,35910,'offer','offerInfo empty','offerInfo empty',1636734424,'2021-11-12 16:27:04'),(342,35912,'offer','offerInfo empty','offerInfo empty',1636734424,'2021-11-12 16:27:04'),(343,35919,'offer','offerInfo empty','offerInfo empty',1636734425,'2021-11-12 16:27:05'),(344,35920,'offer','offerInfo empty','offerInfo empty',1636734425,'2021-11-12 16:27:05'),(345,35923,'offer','offerInfo empty','offerInfo empty',1636734425,'2021-11-12 16:27:05'),(346,35924,'offer','offerInfo empty','offerInfo empty',1636734425,'2021-11-12 16:27:05'),(347,1,'campaign','campaignInfo empty','campaignInfo empty',1636752422,'2021-11-12 21:27:02'),(348,2,'campaign','campaignInfo empty','campaignInfo empty',1636752422,'2021-11-12 21:27:02'),(349,3,'campaign','campaignInfo empty','campaignInfo empty',1636752422,'2021-11-12 21:27:02'),(350,4,'campaign','campaignInfo empty','campaignInfo empty',1636752422,'2021-11-12 21:27:02'),(351,5,'campaign','campaignInfo empty','campaignInfo empty',1636752422,'2021-11-12 21:27:02'),(352,31,'campaign','campaignInfo empty','campaignInfo empty',1636752423,'2021-11-12 21:27:03'),(353,41,'campaign','campaignInfo empty','campaignInfo empty',1636752423,'2021-11-12 21:27:03'),(354,42,'campaign','campaignInfo empty','campaignInfo empty',1636752423,'2021-11-12 21:27:03'),(355,43,'campaign','campaignInfo empty','campaignInfo empty',1636752423,'2021-11-12 21:27:03'),(356,44,'campaign','campaignInfo empty','campaignInfo empty',1636752423,'2021-11-12 21:27:03'),(357,45,'campaign','campaignInfo empty','campaignInfo empty',1636752424,'2021-11-12 21:27:04'),(358,46,'campaign','campaignInfo empty','campaignInfo empty',1636752424,'2021-11-12 21:27:04'),(359,47,'campaign','campaignInfo empty','campaignInfo empty',1636752424,'2021-11-12 21:27:04'),(360,48,'campaign','campaignInfo empty','campaignInfo empty',1636752424,'2021-11-12 21:27:04'),(361,49,'campaign','campaignInfo empty','campaignInfo empty',1636752424,'2021-11-12 21:27:04'),(362,998960,'campaign','campaignInfo empty','campaignInfo empty',1636752425,'2021-11-12 21:27:05'),(363,998961,'campaign','campaignInfo empty','campaignInfo empty',1636752425,'2021-11-12 21:27:05'),(364,998962,'campaign','campaignInfo empty','campaignInfo empty',1636752425,'2021-11-12 21:27:05'),(365,998963,'campaign','campaignInfo empty','campaignInfo empty',1636752425,'2021-11-12 21:27:05'),(366,998964,'campaign','campaignInfo empty','campaignInfo empty',1636752425,'2021-11-12 21:27:05'),(367,998965,'campaign','campaignInfo empty','campaignInfo empty',1636752426,'2021-11-12 21:27:06'),(368,35888,'offer','offerInfo empty','offerInfo empty',1636763222,'2021-11-13 00:27:02'),(369,35889,'offer','offerInfo empty','offerInfo empty',1636763222,'2021-11-13 00:27:02'),(370,35890,'offer','offerInfo empty','offerInfo empty',1636763222,'2021-11-13 00:27:02'),(371,35891,'offer','offerInfo empty','offerInfo empty',1636763222,'2021-11-13 00:27:02'),(372,35893,'offer','offerInfo empty','offerInfo empty',1636763223,'2021-11-13 00:27:03'),(373,35894,'offer','offerInfo empty','offerInfo empty',1636763223,'2021-11-13 00:27:03'),(374,35895,'offer','offerInfo empty','offerInfo empty',1636763223,'2021-11-13 00:27:03'),(375,35896,'offer','offerInfo empty','offerInfo empty',1636763223,'2021-11-13 00:27:03'),(376,35903,'offer','offerInfo empty','offerInfo empty',1636763223,'2021-11-13 00:27:03'),(377,35904,'offer','offerInfo empty','offerInfo empty',1636763224,'2021-11-13 00:27:04'),(378,35907,'offer','offerInfo empty','offerInfo empty',1636763224,'2021-11-13 00:27:04'),(379,35908,'offer','offerInfo empty','offerInfo empty',1636763224,'2021-11-13 00:27:04'),(380,35909,'offer','offerInfo empty','offerInfo empty',1636763224,'2021-11-13 00:27:04'),(381,35910,'offer','offerInfo empty','offerInfo empty',1636763224,'2021-11-13 00:27:04'),(382,35912,'offer','offerInfo empty','offerInfo empty',1636763225,'2021-11-13 00:27:05'),(383,35919,'offer','offerInfo empty','offerInfo empty',1636763225,'2021-11-13 00:27:05'),(384,35920,'offer','offerInfo empty','offerInfo empty',1636763225,'2021-11-13 00:27:05'),(385,35923,'offer','offerInfo empty','offerInfo empty',1636763225,'2021-11-13 00:27:05'),(386,35924,'offer','offerInfo empty','offerInfo empty',1636763225,'2021-11-13 00:27:05'),(387,1,'campaign','campaignInfo empty','campaignInfo empty',1636780984,'2021-11-13 05:23:04'),(388,2,'campaign','campaignInfo empty','campaignInfo empty',1636780984,'2021-11-13 05:23:04'),(389,3,'campaign','campaignInfo empty','campaignInfo empty',1636780984,'2021-11-13 05:23:04'),(390,4,'campaign','campaignInfo empty','campaignInfo empty',1636780984,'2021-11-13 05:23:04'),(391,5,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(392,31,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(393,41,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(394,42,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(395,43,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(396,44,'campaign','campaignInfo empty','campaignInfo empty',1636780985,'2021-11-13 05:23:05'),(397,45,'campaign','campaignInfo empty','campaignInfo empty',1636780986,'2021-11-13 05:23:06'),(398,46,'campaign','campaignInfo empty','campaignInfo empty',1636780986,'2021-11-13 05:23:06'),(399,47,'campaign','campaignInfo empty','campaignInfo empty',1636780986,'2021-11-13 05:23:06'),(400,48,'campaign','campaignInfo empty','campaignInfo empty',1636780986,'2021-11-13 05:23:06'),(401,49,'campaign','campaignInfo empty','campaignInfo empty',1636780986,'2021-11-13 05:23:06'),(402,998960,'campaign','campaignInfo empty','campaignInfo empty',1636780987,'2021-11-13 05:23:07'),(403,998961,'campaign','campaignInfo empty','campaignInfo empty',1636780987,'2021-11-13 05:23:07'),(404,998962,'campaign','campaignInfo empty','campaignInfo empty',1636780987,'2021-11-13 05:23:07'),(405,998963,'campaign','campaignInfo empty','campaignInfo empty',1636780987,'2021-11-13 05:23:07'),(406,998964,'campaign','campaignInfo empty','campaignInfo empty',1636780987,'2021-11-13 05:23:07'),(407,998965,'campaign','campaignInfo empty','campaignInfo empty',1636780988,'2021-11-13 05:23:08'),(408,35888,'offer','offerInfo empty','offerInfo empty',1636795384,'2021-11-13 09:23:04'),(409,35889,'offer','offerInfo empty','offerInfo empty',1636795384,'2021-11-13 09:23:04'),(410,35890,'offer','offerInfo empty','offerInfo empty',1636795384,'2021-11-13 09:23:04'),(411,35891,'offer','offerInfo empty','offerInfo empty',1636795384,'2021-11-13 09:23:04'),(412,35893,'offer','offerInfo empty','offerInfo empty',1636795385,'2021-11-13 09:23:05'),(413,35894,'offer','offerInfo empty','offerInfo empty',1636795385,'2021-11-13 09:23:05'),(414,35895,'offer','offerInfo empty','offerInfo empty',1636795385,'2021-11-13 09:23:05'),(415,35896,'offer','offerInfo empty','offerInfo empty',1636795385,'2021-11-13 09:23:05'),(416,35903,'offer','offerInfo empty','offerInfo empty',1636795385,'2021-11-13 09:23:05'),(417,35904,'offer','offerInfo empty','offerInfo empty',1636795386,'2021-11-13 09:23:06'),(418,35907,'offer','offerInfo empty','offerInfo empty',1636795386,'2021-11-13 09:23:06'),(419,35908,'offer','offerInfo empty','offerInfo empty',1636795386,'2021-11-13 09:23:06'),(420,35909,'offer','offerInfo empty','offerInfo empty',1636795386,'2021-11-13 09:23:06'),(421,35910,'offer','offerInfo empty','offerInfo empty',1636795386,'2021-11-13 09:23:06'),(422,35912,'offer','offerInfo empty','offerInfo empty',1636795387,'2021-11-13 09:23:07'),(423,35919,'offer','offerInfo empty','offerInfo empty',1636795387,'2021-11-13 09:23:07'),(424,35920,'offer','offerInfo empty','offerInfo empty',1636795387,'2021-11-13 09:23:07'),(425,35923,'offer','offerInfo empty','offerInfo empty',1636795387,'2021-11-13 09:23:07'),(426,35924,'offer','offerInfo empty','offerInfo empty',1636795387,'2021-11-13 09:23:07'),(427,1,'campaign','campaignInfo empty','campaignInfo empty',1636806184,'2021-11-13 12:23:04'),(428,2,'campaign','campaignInfo empty','campaignInfo empty',1636806184,'2021-11-13 12:23:04'),(429,3,'campaign','campaignInfo empty','campaignInfo empty',1636806184,'2021-11-13 12:23:04'),(430,4,'campaign','campaignInfo empty','campaignInfo empty',1636806184,'2021-11-13 12:23:04'),(431,5,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(432,31,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(433,41,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(434,42,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(435,43,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(436,44,'campaign','campaignInfo empty','campaignInfo empty',1636806185,'2021-11-13 12:23:05'),(437,45,'campaign','campaignInfo empty','campaignInfo empty',1636806186,'2021-11-13 12:23:06'),(438,46,'campaign','campaignInfo empty','campaignInfo empty',1636806186,'2021-11-13 12:23:06'),(439,47,'campaign','campaignInfo empty','campaignInfo empty',1636806186,'2021-11-13 12:23:06'),(440,48,'campaign','campaignInfo empty','campaignInfo empty',1636806186,'2021-11-13 12:23:06'),(441,49,'campaign','campaignInfo empty','campaignInfo empty',1636806186,'2021-11-13 12:23:06'),(442,998960,'campaign','campaignInfo empty','campaignInfo empty',1636806187,'2021-11-13 12:23:07'),(443,998961,'campaign','campaignInfo empty','campaignInfo empty',1636806187,'2021-11-13 12:23:07'),(444,998962,'campaign','campaignInfo empty','campaignInfo empty',1636806187,'2021-11-13 12:23:07'),(445,998963,'campaign','campaignInfo empty','campaignInfo empty',1636806187,'2021-11-13 12:23:07'),(446,998964,'campaign','campaignInfo empty','campaignInfo empty',1636806187,'2021-11-13 12:23:07'),(447,998965,'campaign','campaignInfo empty','campaignInfo empty',1636806188,'2021-11-13 12:23:08'),(448,35888,'offer','offerInfo empty','offerInfo empty',1636824184,'2021-11-13 17:23:04'),(449,35889,'offer','offerInfo empty','offerInfo empty',1636824184,'2021-11-13 17:23:04'),(450,35890,'offer','offerInfo empty','offerInfo empty',1636824184,'2021-11-13 17:23:04'),(451,35891,'offer','offerInfo empty','offerInfo empty',1636824184,'2021-11-13 17:23:04'),(452,35893,'offer','offerInfo empty','offerInfo empty',1636824185,'2021-11-13 17:23:05'),(453,35894,'offer','offerInfo empty','offerInfo empty',1636824185,'2021-11-13 17:23:05'),(454,35895,'offer','offerInfo empty','offerInfo empty',1636824185,'2021-11-13 17:23:05'),(455,35896,'offer','offerInfo empty','offerInfo empty',1636824185,'2021-11-13 17:23:05'),(456,35903,'offer','offerInfo empty','offerInfo empty',1636824185,'2021-11-13 17:23:05'),(457,35904,'offer','offerInfo empty','offerInfo empty',1636824186,'2021-11-13 17:23:06'),(458,35907,'offer','offerInfo empty','offerInfo empty',1636824186,'2021-11-13 17:23:06'),(459,35908,'offer','offerInfo empty','offerInfo empty',1636824186,'2021-11-13 17:23:06'),(460,35909,'offer','offerInfo empty','offerInfo empty',1636824186,'2021-11-13 17:23:06'),(461,35910,'offer','offerInfo empty','offerInfo empty',1636824186,'2021-11-13 17:23:06'),(462,35912,'offer','offerInfo empty','offerInfo empty',1636824187,'2021-11-13 17:23:07'),(463,35919,'offer','offerInfo empty','offerInfo empty',1636824187,'2021-11-13 17:23:07'),(464,35920,'offer','offerInfo empty','offerInfo empty',1636824187,'2021-11-13 17:23:07'),(465,35923,'offer','offerInfo empty','offerInfo empty',1636824187,'2021-11-13 17:23:07'),(466,35924,'offer','offerInfo empty','offerInfo empty',1636824187,'2021-11-13 17:23:07'),(467,1,'campaign','campaignInfo empty','campaignInfo empty',1636831384,'2021-11-13 19:23:04'),(468,2,'campaign','campaignInfo empty','campaignInfo empty',1636831384,'2021-11-13 19:23:04'),(469,3,'campaign','campaignInfo empty','campaignInfo empty',1636831384,'2021-11-13 19:23:04'),(470,4,'campaign','campaignInfo empty','campaignInfo empty',1636831384,'2021-11-13 19:23:04'),(471,5,'campaign','campaignInfo empty','campaignInfo empty',1636831385,'2021-11-13 19:23:05'),(472,31,'campaign','campaignInfo empty','campaignInfo empty',1636831385,'2021-11-13 19:23:05'),(473,41,'campaign','campaignInfo empty','campaignInfo empty',1636831385,'2021-11-13 19:23:05'),(474,42,'campaign','campaignInfo empty','campaignInfo empty',1636831385,'2021-11-13 19:23:05'),(475,43,'campaign','campaignInfo empty','campaignInfo empty',1636831385,'2021-11-13 19:23:05'),(476,44,'campaign','campaignInfo empty','campaignInfo empty',1636831386,'2021-11-13 19:23:06'),(477,45,'campaign','campaignInfo empty','campaignInfo empty',1636831386,'2021-11-13 19:23:06'),(478,46,'campaign','campaignInfo empty','campaignInfo empty',1636831386,'2021-11-13 19:23:06'),(479,47,'campaign','campaignInfo empty','campaignInfo empty',1636831386,'2021-11-13 19:23:06'),(480,48,'campaign','campaignInfo empty','campaignInfo empty',1636831386,'2021-11-13 19:23:06'),(481,49,'campaign','campaignInfo empty','campaignInfo empty',1636831387,'2021-11-13 19:23:07'),(482,998960,'campaign','campaignInfo empty','campaignInfo empty',1636831387,'2021-11-13 19:23:07'),(483,998961,'campaign','campaignInfo empty','campaignInfo empty',1636831387,'2021-11-13 19:23:07'),(484,998962,'campaign','campaignInfo empty','campaignInfo empty',1636831387,'2021-11-13 19:23:07'),(485,998963,'campaign','campaignInfo empty','campaignInfo empty',1636831387,'2021-11-13 19:23:07'),(486,998964,'campaign','campaignInfo empty','campaignInfo empty',1636831388,'2021-11-13 19:23:08'),(487,998965,'campaign','campaignInfo empty','campaignInfo empty',1636831388,'2021-11-13 19:23:08'),(488,35888,'offer','offerInfo empty','offerInfo empty',1636852984,'2021-11-14 01:23:04'),(489,35889,'offer','offerInfo empty','offerInfo empty',1636852984,'2021-11-14 01:23:04'),(490,35890,'offer','offerInfo empty','offerInfo empty',1636852984,'2021-11-14 01:23:04'),(491,35891,'offer','offerInfo empty','offerInfo empty',1636852984,'2021-11-14 01:23:04'),(492,35893,'offer','offerInfo empty','offerInfo empty',1636852985,'2021-11-14 01:23:05'),(493,35894,'offer','offerInfo empty','offerInfo empty',1636852985,'2021-11-14 01:23:05'),(494,35895,'offer','offerInfo empty','offerInfo empty',1636852985,'2021-11-14 01:23:05'),(495,35896,'offer','offerInfo empty','offerInfo empty',1636852985,'2021-11-14 01:23:05'),(496,35903,'offer','offerInfo empty','offerInfo empty',1636852986,'2021-11-14 01:23:06'),(497,35904,'offer','offerInfo empty','offerInfo empty',1636852986,'2021-11-14 01:23:06'),(498,35907,'offer','offerInfo empty','offerInfo empty',1636852986,'2021-11-14 01:23:06'),(499,35908,'offer','offerInfo empty','offerInfo empty',1636852986,'2021-11-14 01:23:06'),(500,35909,'offer','offerInfo empty','offerInfo empty',1636852988,'2021-11-14 01:23:08'),(501,35910,'offer','offerInfo empty','offerInfo empty',1636852988,'2021-11-14 01:23:08'),(502,35912,'offer','offerInfo empty','offerInfo empty',1636852989,'2021-11-14 01:23:09'),(503,35919,'offer','offerInfo empty','offerInfo empty',1636852989,'2021-11-14 01:23:09'),(504,35923,'offer','offerInfo empty','offerInfo empty',1636852989,'2021-11-14 01:23:09'),(505,35924,'offer','offerInfo empty','offerInfo empty',1636852989,'2021-11-14 01:23:09'),(506,1,'campaign','campaignInfo empty','campaignInfo empty',1636856584,'2021-11-14 02:23:04'),(507,2,'campaign','campaignInfo empty','campaignInfo empty',1636856584,'2021-11-14 02:23:04'),(508,3,'campaign','campaignInfo empty','campaignInfo empty',1636856587,'2021-11-14 02:23:07'),(509,4,'campaign','campaignInfo empty','campaignInfo empty',1636856587,'2021-11-14 02:23:07'),(510,5,'campaign','campaignInfo empty','campaignInfo empty',1636856587,'2021-11-14 02:23:07'),(511,31,'campaign','campaignInfo empty','campaignInfo empty',1636856587,'2021-11-14 02:23:07'),(512,41,'campaign','campaignInfo empty','campaignInfo empty',1636856588,'2021-11-14 02:23:08'),(513,42,'campaign','campaignInfo empty','campaignInfo empty',1636856588,'2021-11-14 02:23:08'),(514,43,'campaign','campaignInfo empty','campaignInfo empty',1636856588,'2021-11-14 02:23:08'),(515,44,'campaign','campaignInfo empty','campaignInfo empty',1636856588,'2021-11-14 02:23:08'),(516,45,'campaign','campaignInfo empty','campaignInfo empty',1636856588,'2021-11-14 02:23:08'),(517,46,'campaign','campaignInfo empty','campaignInfo empty',1636856589,'2021-11-14 02:23:09'),(518,47,'campaign','campaignInfo empty','campaignInfo empty',1636856589,'2021-11-14 02:23:09'),(519,48,'campaign','campaignInfo empty','campaignInfo empty',1636856589,'2021-11-14 02:23:09'),(520,49,'campaign','campaignInfo empty','campaignInfo empty',1636856589,'2021-11-14 02:23:09'),(521,998960,'campaign','campaignInfo empty','campaignInfo empty',1636856592,'2021-11-14 02:23:12'),(522,998961,'campaign','campaignInfo empty','campaignInfo empty',1636856592,'2021-11-14 02:23:12'),(523,998962,'campaign','campaignInfo empty','campaignInfo empty',1636856592,'2021-11-14 02:23:12'),(524,998963,'campaign','campaignInfo empty','campaignInfo empty',1636856592,'2021-11-14 02:23:12'),(525,998964,'campaign','campaignInfo empty','campaignInfo empty',1636856594,'2021-11-14 02:23:14'),(526,998965,'campaign','campaignInfo empty','campaignInfo empty',1636856594,'2021-11-14 02:23:14'),(527,35888,'offer','offerInfo empty','offerInfo empty',1636881784,'2021-11-14 09:23:04'),(528,1,'campaign','campaignInfo empty','campaignInfo empty',1636881784,'2021-11-14 09:23:04'),(529,35889,'offer','offerInfo empty','offerInfo empty',1636881784,'2021-11-14 09:23:04'),(530,2,'campaign','campaignInfo empty','campaignInfo empty',1636881784,'2021-11-14 09:23:04'),(531,3,'campaign','campaignInfo empty','campaignInfo empty',1636881784,'2021-11-14 09:23:04'),(532,35890,'offer','offerInfo empty','offerInfo empty',1636881784,'2021-11-14 09:23:04'),(533,4,'campaign','campaignInfo empty','campaignInfo empty',1636881784,'2021-11-14 09:23:04'),(534,35891,'offer','offerInfo empty','offerInfo empty',1636881784,'2021-11-14 09:23:04'),(535,5,'campaign','campaignInfo empty','campaignInfo empty',1636881785,'2021-11-14 09:23:05'),(536,35893,'offer','offerInfo empty','offerInfo empty',1636881785,'2021-11-14 09:23:05'),(537,31,'campaign','campaignInfo empty','campaignInfo empty',1636881785,'2021-11-14 09:23:05'),(538,35894,'offer','offerInfo empty','offerInfo empty',1636881785,'2021-11-14 09:23:05'),(539,41,'campaign','campaignInfo empty','campaignInfo empty',1636881785,'2021-11-14 09:23:05'),(540,35895,'offer','offerInfo empty','offerInfo empty',1636881785,'2021-11-14 09:23:05'),(541,42,'campaign','campaignInfo empty','campaignInfo empty',1636881785,'2021-11-14 09:23:05'),(542,35896,'offer','offerInfo empty','offerInfo empty',1636881785,'2021-11-14 09:23:05'),(543,43,'campaign','campaignInfo empty','campaignInfo empty',1636881785,'2021-11-14 09:23:05'),(544,35903,'offer','offerInfo empty','offerInfo empty',1636881785,'2021-11-14 09:23:05'),(545,44,'campaign','campaignInfo empty','campaignInfo empty',1636881786,'2021-11-14 09:23:06'),(546,35904,'offer','offerInfo empty','offerInfo empty',1636881786,'2021-11-14 09:23:06'),(547,45,'campaign','campaignInfo empty','campaignInfo empty',1636881786,'2021-11-14 09:23:06'),(548,35907,'offer','offerInfo empty','offerInfo empty',1636881786,'2021-11-14 09:23:06'),(549,46,'campaign','campaignInfo empty','campaignInfo empty',1636881786,'2021-11-14 09:23:06'),(550,35908,'offer','offerInfo empty','offerInfo empty',1636881786,'2021-11-14 09:23:06'),(551,47,'campaign','campaignInfo empty','campaignInfo empty',1636881786,'2021-11-14 09:23:06'),(552,35909,'offer','offerInfo empty','offerInfo empty',1636881786,'2021-11-14 09:23:06'),(553,48,'campaign','campaignInfo empty','campaignInfo empty',1636881786,'2021-11-14 09:23:06'),(554,35910,'offer','offerInfo empty','offerInfo empty',1636881786,'2021-11-14 09:23:06'),(555,49,'campaign','campaignInfo empty','campaignInfo empty',1636881787,'2021-11-14 09:23:07'),(556,35912,'offer','offerInfo empty','offerInfo empty',1636881787,'2021-11-14 09:23:07'),(557,998960,'campaign','campaignInfo empty','campaignInfo empty',1636881787,'2021-11-14 09:23:07'),(558,35919,'offer','offerInfo empty','offerInfo empty',1636881787,'2021-11-14 09:23:07'),(559,998961,'campaign','campaignInfo empty','campaignInfo empty',1636881787,'2021-11-14 09:23:07'),(560,998962,'campaign','campaignInfo empty','campaignInfo empty',1636881787,'2021-11-14 09:23:07'),(561,35923,'offer','offerInfo empty','offerInfo empty',1636881787,'2021-11-14 09:23:07'),(562,998963,'campaign','campaignInfo empty','campaignInfo empty',1636881787,'2021-11-14 09:23:07'),(563,35924,'offer','offerInfo empty','offerInfo empty',1636881787,'2021-11-14 09:23:07'),(564,998964,'campaign','campaignInfo empty','campaignInfo empty',1636881788,'2021-11-14 09:23:08'),(565,998965,'campaign','campaignInfo empty','campaignInfo empty',1636881788,'2021-11-14 09:23:08'),(566,1,'campaign','campaignInfo empty','campaignInfo empty',1636906984,'2021-11-14 16:23:04'),(567,2,'campaign','campaignInfo empty','campaignInfo empty',1636906984,'2021-11-14 16:23:04'),(568,3,'campaign','campaignInfo empty','campaignInfo empty',1636906984,'2021-11-14 16:23:04'),(569,4,'campaign','campaignInfo empty','campaignInfo empty',1636906984,'2021-11-14 16:23:04'),(570,5,'campaign','campaignInfo empty','campaignInfo empty',1636906985,'2021-11-14 16:23:05'),(571,31,'campaign','campaignInfo empty','campaignInfo empty',1636906985,'2021-11-14 16:23:05'),(572,41,'campaign','campaignInfo empty','campaignInfo empty',1636906985,'2021-11-14 16:23:05'),(573,42,'campaign','campaignInfo empty','campaignInfo empty',1636906985,'2021-11-14 16:23:05'),(574,43,'campaign','campaignInfo empty','campaignInfo empty',1636906985,'2021-11-14 16:23:05'),(575,44,'campaign','campaignInfo empty','campaignInfo empty',1636906986,'2021-11-14 16:23:06'),(576,45,'campaign','campaignInfo empty','campaignInfo empty',1636906986,'2021-11-14 16:23:06'),(577,46,'campaign','campaignInfo empty','campaignInfo empty',1636906986,'2021-11-14 16:23:06'),(578,47,'campaign','campaignInfo empty','campaignInfo empty',1636906986,'2021-11-14 16:23:06'),(579,48,'campaign','campaignInfo empty','campaignInfo empty',1636906986,'2021-11-14 16:23:06'),(580,49,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:07'),(581,998960,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:07'),(582,998961,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:07'),(583,998962,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:07'),(584,998963,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:07'),(585,998964,'campaign','campaignInfo empty','campaignInfo empty',1636906987,'2021-11-14 16:23:08'),(586,998965,'campaign','campaignInfo empty','campaignInfo empty',1636906988,'2021-11-14 16:23:08'),(587,35888,'offer','offerInfo empty','offerInfo empty',1636910584,'2021-11-14 17:23:04'),(588,35889,'offer','offerInfo empty','offerInfo empty',1636910584,'2021-11-14 17:23:04'),(589,35890,'offer','offerInfo empty','offerInfo empty',1636910584,'2021-11-14 17:23:04'),(590,35891,'offer','offerInfo empty','offerInfo empty',1636910584,'2021-11-14 17:23:04'),(591,35893,'offer','offerInfo empty','offerInfo empty',1636910585,'2021-11-14 17:23:05'),(592,35894,'offer','offerInfo empty','offerInfo empty',1636910585,'2021-11-14 17:23:05'),(593,35895,'offer','offerInfo empty','offerInfo empty',1636910585,'2021-11-14 17:23:05'),(594,35896,'offer','offerInfo empty','offerInfo empty',1636910585,'2021-11-14 17:23:05'),(595,35903,'offer','offerInfo empty','offerInfo empty',1636910585,'2021-11-14 17:23:05'),(596,35904,'offer','offerInfo empty','offerInfo empty',1636910586,'2021-11-14 17:23:06'),(597,35907,'offer','offerInfo empty','offerInfo empty',1636910586,'2021-11-14 17:23:06'),(598,35908,'offer','offerInfo empty','offerInfo empty',1636910586,'2021-11-14 17:23:06'),(599,35909,'offer','offerInfo empty','offerInfo empty',1636910586,'2021-11-14 17:23:06'),(600,35910,'offer','offerInfo empty','offerInfo empty',1636910586,'2021-11-14 17:23:06'),(601,35912,'offer','offerInfo empty','offerInfo empty',1636910587,'2021-11-14 17:23:07'),(602,35919,'offer','offerInfo empty','offerInfo empty',1636910587,'2021-11-14 17:23:07'),(603,35923,'offer','offerInfo empty','offerInfo empty',1636910587,'2021-11-14 17:23:07'),(604,35924,'offer','offerInfo empty','offerInfo empty',1636910587,'2021-11-14 17:23:07'),(605,1,'campaign','campaignInfo empty','campaignInfo empty',1636956785,'2021-11-15 06:13:05'),(606,2,'campaign','campaignInfo empty','campaignInfo empty',1636956786,'2021-11-15 06:13:06'),(607,3,'campaign','campaignInfo empty','campaignInfo empty',1636956786,'2021-11-15 06:13:06'),(608,4,'campaign','campaignInfo empty','campaignInfo empty',1636956786,'2021-11-15 06:13:06'),(609,5,'campaign','campaignInfo empty','campaignInfo empty',1636956786,'2021-11-15 06:13:06'),(610,31,'campaign','campaignInfo empty','campaignInfo empty',1636956786,'2021-11-15 06:13:06'),(611,41,'campaign','campaignInfo empty','campaignInfo empty',1636956787,'2021-11-15 06:13:07'),(612,42,'campaign','campaignInfo empty','campaignInfo empty',1636956787,'2021-11-15 06:13:07'),(613,43,'campaign','campaignInfo empty','campaignInfo empty',1636956787,'2021-11-15 06:13:07'),(614,44,'campaign','campaignInfo empty','campaignInfo empty',1636956787,'2021-11-15 06:13:07'),(615,45,'campaign','campaignInfo empty','campaignInfo empty',1636956787,'2021-11-15 06:13:07'),(616,46,'campaign','campaignInfo empty','campaignInfo empty',1636956788,'2021-11-15 06:13:08'),(617,47,'campaign','campaignInfo empty','campaignInfo empty',1636956788,'2021-11-15 06:13:08'),(618,48,'campaign','campaignInfo empty','campaignInfo empty',1636956788,'2021-11-15 06:13:08'),(619,49,'campaign','campaignInfo empty','campaignInfo empty',1636956788,'2021-11-15 06:13:08'),(620,998960,'campaign','campaignInfo empty','campaignInfo empty',1636956788,'2021-11-15 06:13:08'),(621,998961,'campaign','campaignInfo empty','campaignInfo empty',1636956789,'2021-11-15 06:13:09'),(622,998962,'campaign','campaignInfo empty','campaignInfo empty',1636956789,'2021-11-15 06:13:09'),(623,998963,'campaign','campaignInfo empty','campaignInfo empty',1636956789,'2021-11-15 06:13:09'),(624,998964,'campaign','campaignInfo empty','campaignInfo empty',1636956789,'2021-11-15 06:13:09'),(625,998965,'campaign','campaignInfo empty','campaignInfo empty',1636956789,'2021-11-15 06:13:09'),(626,35888,'offer','offerInfo empty','offerInfo empty',1636960385,'2021-11-15 07:13:05'),(627,35889,'offer','offerInfo empty','offerInfo empty',1636960386,'2021-11-15 07:13:06'),(628,35890,'offer','offerInfo empty','offerInfo empty',1636960386,'2021-11-15 07:13:06'),(629,35891,'offer','offerInfo empty','offerInfo empty',1636960386,'2021-11-15 07:13:06'),(630,35893,'offer','offerInfo empty','offerInfo empty',1636960386,'2021-11-15 07:13:06'),(631,35894,'offer','offerInfo empty','offerInfo empty',1636960386,'2021-11-15 07:13:06'),(632,35895,'offer','offerInfo empty','offerInfo empty',1636960387,'2021-11-15 07:13:07'),(633,35896,'offer','offerInfo empty','offerInfo empty',1636960387,'2021-11-15 07:13:07'),(634,35903,'offer','offerInfo empty','offerInfo empty',1636960387,'2021-11-15 07:13:07'),(635,35904,'offer','offerInfo empty','offerInfo empty',1636960387,'2021-11-15 07:13:07'),(636,35907,'offer','offerInfo empty','offerInfo empty',1636960387,'2021-11-15 07:13:07'),(637,35908,'offer','offerInfo empty','offerInfo empty',1636960388,'2021-11-15 07:13:08'),(638,35909,'offer','offerInfo empty','offerInfo empty',1636960388,'2021-11-15 07:13:08'),(639,35910,'offer','offerInfo empty','offerInfo empty',1636960388,'2021-11-15 07:13:08'),(640,35912,'offer','offerInfo empty','offerInfo empty',1636960388,'2021-11-15 07:13:08'),(641,35919,'offer','offerInfo empty','offerInfo empty',1636960388,'2021-11-15 07:13:08'),(642,35923,'offer','offerInfo empty','offerInfo empty',1636960389,'2021-11-15 07:13:09'),(643,35924,'offer','offerInfo empty','offerInfo empty',1636960389,'2021-11-15 07:13:09'),(644,1,'campaign','campaignInfo empty','campaignInfo empty',1636981985,'2021-11-15 13:13:05'),(645,2,'campaign','campaignInfo empty','campaignInfo empty',1636981986,'2021-11-15 13:13:06'),(646,3,'campaign','campaignInfo empty','campaignInfo empty',1636981986,'2021-11-15 13:13:06'),(647,4,'campaign','campaignInfo empty','campaignInfo empty',1636981986,'2021-11-15 13:13:06'),(648,5,'campaign','campaignInfo empty','campaignInfo empty',1636981986,'2021-11-15 13:13:06'),(649,31,'campaign','campaignInfo empty','campaignInfo empty',1636981986,'2021-11-15 13:13:06'),(650,41,'campaign','campaignInfo empty','campaignInfo empty',1636981987,'2021-11-15 13:13:07'),(651,42,'campaign','campaignInfo empty','campaignInfo empty',1636981987,'2021-11-15 13:13:07'),(652,43,'campaign','campaignInfo empty','campaignInfo empty',1636981987,'2021-11-15 13:13:07'),(653,44,'campaign','campaignInfo empty','campaignInfo empty',1636981987,'2021-11-15 13:13:07'),(654,45,'campaign','campaignInfo empty','campaignInfo empty',1636981987,'2021-11-15 13:13:07'),(655,46,'campaign','campaignInfo empty','campaignInfo empty',1636981988,'2021-11-15 13:13:08'),(656,47,'campaign','campaignInfo empty','campaignInfo empty',1636981988,'2021-11-15 13:13:08'),(657,48,'campaign','campaignInfo empty','campaignInfo empty',1636981988,'2021-11-15 13:13:08'),(658,49,'campaign','campaignInfo empty','campaignInfo empty',1636981988,'2021-11-15 13:13:08'),(659,998960,'campaign','campaignInfo empty','campaignInfo empty',1636981988,'2021-11-15 13:13:08'),(660,998961,'campaign','campaignInfo empty','campaignInfo empty',1636981989,'2021-11-15 13:13:09'),(661,998962,'campaign','campaignInfo empty','campaignInfo empty',1636981989,'2021-11-15 13:13:09'),(662,998963,'campaign','campaignInfo empty','campaignInfo empty',1636981989,'2021-11-15 13:13:09'),(663,998964,'campaign','campaignInfo empty','campaignInfo empty',1636981989,'2021-11-15 13:13:09'),(664,998965,'campaign','campaignInfo empty','campaignInfo empty',1636981989,'2021-11-15 13:13:09'),(665,35888,'offer','offerInfo empty','offerInfo empty',1636989185,'2021-11-15 15:13:05'),(666,35889,'offer','offerInfo empty','offerInfo empty',1636989186,'2021-11-15 15:13:06'),(667,35890,'offer','offerInfo empty','offerInfo empty',1636989186,'2021-11-15 15:13:06'),(668,35891,'offer','offerInfo empty','offerInfo empty',1636989186,'2021-11-15 15:13:06'),(669,35893,'offer','offerInfo empty','offerInfo empty',1636989186,'2021-11-15 15:13:06'),(670,35894,'offer','offerInfo empty','offerInfo empty',1636989186,'2021-11-15 15:13:06'),(671,35895,'offer','offerInfo empty','offerInfo empty',1636989187,'2021-11-15 15:13:07'),(672,35896,'offer','offerInfo empty','offerInfo empty',1636989187,'2021-11-15 15:13:07'),(673,35903,'offer','offerInfo empty','offerInfo empty',1636989187,'2021-11-15 15:13:07'),(674,35904,'offer','offerInfo empty','offerInfo empty',1636989187,'2021-11-15 15:13:07'),(675,35907,'offer','offerInfo empty','offerInfo empty',1636989187,'2021-11-15 15:13:07'),(676,35908,'offer','offerInfo empty','offerInfo empty',1636989188,'2021-11-15 15:13:08'),(677,35909,'offer','offerInfo empty','offerInfo empty',1636989188,'2021-11-15 15:13:08'),(678,35910,'offer','offerInfo empty','offerInfo empty',1636989188,'2021-11-15 15:13:08'),(679,35912,'offer','offerInfo empty','offerInfo empty',1636989188,'2021-11-15 15:13:08'),(680,35919,'offer','offerInfo empty','offerInfo empty',1636989188,'2021-11-15 15:13:08'),(681,35920,'offer','offerInfo empty','offerInfo empty',1636989189,'2021-11-15 15:13:09'),(682,35923,'offer','offerInfo empty','offerInfo empty',1636989189,'2021-11-15 15:13:09'),(683,35924,'offer','offerInfo empty','offerInfo empty',1636989189,'2021-11-15 15:13:09'),(684,1,'campaign','campaignInfo empty','campaignInfo empty',1637007185,'2021-11-15 20:13:05'),(685,2,'campaign','campaignInfo empty','campaignInfo empty',1637007186,'2021-11-15 20:13:06'),(686,3,'campaign','campaignInfo empty','campaignInfo empty',1637007186,'2021-11-15 20:13:06'),(687,4,'campaign','campaignInfo empty','campaignInfo empty',1637007186,'2021-11-15 20:13:06'),(688,5,'campaign','campaignInfo empty','campaignInfo empty',1637007186,'2021-11-15 20:13:06'),(689,31,'campaign','campaignInfo empty','campaignInfo empty',1637007187,'2021-11-15 20:13:07'),(690,41,'campaign','campaignInfo empty','campaignInfo empty',1637007187,'2021-11-15 20:13:07'),(691,42,'campaign','campaignInfo empty','campaignInfo empty',1637007187,'2021-11-15 20:13:07'),(692,43,'campaign','campaignInfo empty','campaignInfo empty',1637007187,'2021-11-15 20:13:07'),(693,44,'campaign','campaignInfo empty','campaignInfo empty',1637007187,'2021-11-15 20:13:07'),(694,45,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:08'),(695,46,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:08'),(696,47,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:08'),(697,48,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:08'),(698,49,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:08'),(699,998960,'campaign','campaignInfo empty','campaignInfo empty',1637007188,'2021-11-15 20:13:09'),(700,998961,'campaign','campaignInfo empty','campaignInfo empty',1637007189,'2021-11-15 20:13:09'),(701,998962,'campaign','campaignInfo empty','campaignInfo empty',1637007189,'2021-11-15 20:13:09'),(702,998963,'campaign','campaignInfo empty','campaignInfo empty',1637007189,'2021-11-15 20:13:09'),(703,998964,'campaign','campaignInfo empty','campaignInfo empty',1637007189,'2021-11-15 20:13:09'),(704,998965,'campaign','campaignInfo empty','campaignInfo empty',1637007190,'2021-11-15 20:13:10'),(705,35888,'offer','offerInfo empty','offerInfo empty',1637017986,'2021-11-15 23:13:06'),(706,35889,'offer','offerInfo empty','offerInfo empty',1637017986,'2021-11-15 23:13:06'),(707,35890,'offer','offerInfo empty','offerInfo empty',1637017986,'2021-11-15 23:13:06'),(708,35891,'offer','offerInfo empty','offerInfo empty',1637017986,'2021-11-15 23:13:06'),(709,35893,'offer','offerInfo empty','offerInfo empty',1637017986,'2021-11-15 23:13:06'),(710,35894,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(711,35895,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(712,35896,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(713,35903,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(714,35904,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(715,35907,'offer','offerInfo empty','offerInfo empty',1637017987,'2021-11-15 23:13:07'),(716,35908,'offer','offerInfo empty','offerInfo empty',1637017988,'2021-11-15 23:13:08'),(717,35909,'offer','offerInfo empty','offerInfo empty',1637017988,'2021-11-15 23:13:08'),(718,35910,'offer','offerInfo empty','offerInfo empty',1637017988,'2021-11-15 23:13:08'),(719,35912,'offer','offerInfo empty','offerInfo empty',1637017988,'2021-11-15 23:13:08'),(720,35919,'offer','offerInfo empty','offerInfo empty',1637017988,'2021-11-15 23:13:08'),(721,35920,'offer','offerInfo empty','offerInfo empty',1637017989,'2021-11-15 23:13:09'),(722,35923,'offer','offerInfo empty','offerInfo empty',1637017989,'2021-11-15 23:13:09'),(723,35924,'offer','offerInfo empty','offerInfo empty',1637017989,'2021-11-15 23:13:09'),(724,1,'campaign','campaignInfo empty','campaignInfo empty',1637032385,'2021-11-16 03:13:05'),(725,2,'campaign','campaignInfo empty','campaignInfo empty',1637032386,'2021-11-16 03:13:06'),(726,3,'campaign','campaignInfo empty','campaignInfo empty',1637032386,'2021-11-16 03:13:06'),(727,4,'campaign','campaignInfo empty','campaignInfo empty',1637032386,'2021-11-16 03:13:06'),(728,5,'campaign','campaignInfo empty','campaignInfo empty',1637032389,'2021-11-16 03:13:09'),(729,31,'campaign','campaignInfo empty','campaignInfo empty',1637032389,'2021-11-16 03:13:09'),(730,41,'campaign','campaignInfo empty','campaignInfo empty',1637032389,'2021-11-16 03:13:09'),(731,42,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(732,43,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(733,44,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(734,45,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(735,46,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(736,47,'campaign','campaignInfo empty','campaignInfo empty',1637032390,'2021-11-16 03:13:10'),(737,48,'campaign','campaignInfo empty','campaignInfo empty',1637032391,'2021-11-16 03:13:11'),(738,49,'campaign','campaignInfo empty','campaignInfo empty',1637032391,'2021-11-16 03:13:11'),(739,998960,'campaign','campaignInfo empty','campaignInfo empty',1637032391,'2021-11-16 03:13:11'),(740,998961,'campaign','campaignInfo empty','campaignInfo empty',1637032391,'2021-11-16 03:13:11'),(741,998962,'campaign','campaignInfo empty','campaignInfo empty',1637032391,'2021-11-16 03:13:11'),(742,998963,'campaign','campaignInfo empty','campaignInfo empty',1637032392,'2021-11-16 03:13:12'),(743,998964,'campaign','campaignInfo empty','campaignInfo empty',1637032392,'2021-11-16 03:13:12'),(744,998965,'campaign','campaignInfo empty','campaignInfo empty',1637032392,'2021-11-16 03:13:12'),(745,35888,'offer','offerInfo empty','offerInfo empty',1637046785,'2021-11-16 07:13:05'),(746,35889,'offer','offerInfo empty','offerInfo empty',1637046786,'2021-11-16 07:13:06'),(747,35890,'offer','offerInfo empty','offerInfo empty',1637046786,'2021-11-16 07:13:06'),(748,35891,'offer','offerInfo empty','offerInfo empty',1637046786,'2021-11-16 07:13:06'),(749,35893,'offer','offerInfo empty','offerInfo empty',1637046786,'2021-11-16 07:13:06'),(750,35894,'offer','offerInfo empty','offerInfo empty',1637046786,'2021-11-16 07:13:06'),(751,35895,'offer','offerInfo empty','offerInfo empty',1637046787,'2021-11-16 07:13:07'),(752,35896,'offer','offerInfo empty','offerInfo empty',1637046787,'2021-11-16 07:13:07'),(753,35903,'offer','offerInfo empty','offerInfo empty',1637046787,'2021-11-16 07:13:07'),(754,35904,'offer','offerInfo empty','offerInfo empty',1637046787,'2021-11-16 07:13:07'),(755,35907,'offer','offerInfo empty','offerInfo empty',1637046787,'2021-11-16 07:13:07'),(756,35908,'offer','offerInfo empty','offerInfo empty',1637046788,'2021-11-16 07:13:08'),(757,35909,'offer','offerInfo empty','offerInfo empty',1637046788,'2021-11-16 07:13:08'),(758,35910,'offer','offerInfo empty','offerInfo empty',1637046788,'2021-11-16 07:13:08'),(759,35912,'offer','offerInfo empty','offerInfo empty',1637046788,'2021-11-16 07:13:08'),(760,35919,'offer','offerInfo empty','offerInfo empty',1637046788,'2021-11-16 07:13:08'),(761,35920,'offer','offerInfo empty','offerInfo empty',1637046789,'2021-11-16 07:13:09'),(762,35923,'offer','offerInfo empty','offerInfo empty',1637046789,'2021-11-16 07:13:09'),(763,35924,'offer','offerInfo empty','offerInfo empty',1637046789,'2021-11-16 07:13:09'),(764,1,'campaign','campaignInfo empty','campaignInfo empty',1637057585,'2021-11-16 10:13:05'),(765,2,'campaign','campaignInfo empty','campaignInfo empty',1637057586,'2021-11-16 10:13:06'),(766,3,'campaign','campaignInfo empty','campaignInfo empty',1637057586,'2021-11-16 10:13:06'),(767,4,'campaign','campaignInfo empty','campaignInfo empty',1637057586,'2021-11-16 10:13:06'),(768,5,'campaign','campaignInfo empty','campaignInfo empty',1637057586,'2021-11-16 10:13:06'),(769,31,'campaign','campaignInfo empty','campaignInfo empty',1637057586,'2021-11-16 10:13:06'),(770,41,'campaign','campaignInfo empty','campaignInfo empty',1637057587,'2021-11-16 10:13:07'),(771,42,'campaign','campaignInfo empty','campaignInfo empty',1637057587,'2021-11-16 10:13:07'),(772,43,'campaign','campaignInfo empty','campaignInfo empty',1637057587,'2021-11-16 10:13:07'),(773,44,'campaign','campaignInfo empty','campaignInfo empty',1637057587,'2021-11-16 10:13:07'),(774,45,'campaign','campaignInfo empty','campaignInfo empty',1637057587,'2021-11-16 10:13:07'),(775,46,'campaign','campaignInfo empty','campaignInfo empty',1637057588,'2021-11-16 10:13:08'),(776,47,'campaign','campaignInfo empty','campaignInfo empty',1637057588,'2021-11-16 10:13:08'),(777,48,'campaign','campaignInfo empty','campaignInfo empty',1637057588,'2021-11-16 10:13:08'),(778,49,'campaign','campaignInfo empty','campaignInfo empty',1637057588,'2021-11-16 10:13:08'),(779,998960,'campaign','campaignInfo empty','campaignInfo empty',1637057588,'2021-11-16 10:13:08'),(780,998961,'campaign','campaignInfo empty','campaignInfo empty',1637057589,'2021-11-16 10:13:09'),(781,998962,'campaign','campaignInfo empty','campaignInfo empty',1637057589,'2021-11-16 10:13:09'),(782,998963,'campaign','campaignInfo empty','campaignInfo empty',1637057589,'2021-11-16 10:13:09'),(783,998964,'campaign','campaignInfo empty','campaignInfo empty',1637057589,'2021-11-16 10:13:09'),(784,998965,'campaign','campaignInfo empty','campaignInfo empty',1637057589,'2021-11-16 10:13:09'),(785,35888,'offer','offerInfo empty','offerInfo empty',1637075585,'2021-11-16 15:13:05'),(786,35889,'offer','offerInfo empty','offerInfo empty',1637075586,'2021-11-16 15:13:06'),(787,35890,'offer','offerInfo empty','offerInfo empty',1637075586,'2021-11-16 15:13:06'),(788,35891,'offer','offerInfo empty','offerInfo empty',1637075586,'2021-11-16 15:13:06'),(789,35893,'offer','offerInfo empty','offerInfo empty',1637075586,'2021-11-16 15:13:06'),(790,35894,'offer','offerInfo empty','offerInfo empty',1637075586,'2021-11-16 15:13:06'),(791,35895,'offer','offerInfo empty','offerInfo empty',1637075587,'2021-11-16 15:13:07'),(792,35896,'offer','offerInfo empty','offerInfo empty',1637075587,'2021-11-16 15:13:07'),(793,35903,'offer','offerInfo empty','offerInfo empty',1637075587,'2021-11-16 15:13:07'),(794,35904,'offer','offerInfo empty','offerInfo empty',1637075587,'2021-11-16 15:13:07'),(795,35907,'offer','offerInfo empty','offerInfo empty',1637075587,'2021-11-16 15:13:07'),(796,35908,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(797,35909,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(798,35910,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(799,35912,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(800,35919,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(801,35920,'offer','offerInfo empty','offerInfo empty',1637075588,'2021-11-16 15:13:08'),(802,35923,'offer','offerInfo empty','offerInfo empty',1637075589,'2021-11-16 15:13:09'),(803,35924,'offer','offerInfo empty','offerInfo empty',1637075589,'2021-11-16 15:13:09');
/*!40000 ALTER TABLE `sfl_traffic_links_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sfl_vertical`
--

DROP TABLE IF EXISTS `sfl_vertical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sfl_vertical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_added` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sfl_vertical` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sfl_vertical`
--

LOCK TABLES `sfl_vertical` WRITE;
/*!40000 ALTER TABLE `sfl_vertical` DISABLE KEYS */;
INSERT INTO `sfl_vertical` VALUES (1,'notdefined',0,'2021-08-15 21:22:27'),(2,'e3e3e',0,'2021-08-15 21:22:27');
/*!40000 ALTER TABLE `sfl_vertical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `name` varchar(40) NOT NULL,
  `picture` varchar(256) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `password` (`password`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','dmytro.miroshnykov@actionmediamtl.com','dmytro.miroshnykov','https://s.gravatar.com/avatar/00012705f585c85333034ee81f87dd36?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fdm.png',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-17 11:34:15
