-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bennit
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_bennit_subscriptions`
--

DROP TABLE IF EXISTS `tbl_bennit_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bennit_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` text,
  `subscription_id` text,
  `plan_id` text,
  `customer_id` text,
  `customer_email` text,
  `status` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `current_period_start` datetime DEFAULT NULL,
  `current_period_end` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_credentials`
--

DROP TABLE IF EXISTS `tbl_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_trainingpartner_id` int DEFAULT NULL,
  `credential_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_industry`
--

DROP TABLE IF EXISTS `tbl_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_industry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_matches`
--

DROP TABLE IF EXISTS `tbl_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `public_id` varchar(30) NOT NULL,
  `fk_opportunity_id` varchar(30) NOT NULL,
  `fk_solver_id` varchar(30) NOT NULL,
  `matched_by` varchar(30) NOT NULL,
  `seeker_viewed` timestamp NULL DEFAULT NULL,
  `solver_viewed` timestamp NULL DEFAULT NULL,
  `seeker_match` varchar(30) DEFAULT '0',
  `solver_match` varchar(30) DEFAULT '0',
  `matchmaker_approved` varchar(30) DEFAULT '0',
  `seeker_solver_connect` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_message_queue`
--

DROP TABLE IF EXISTS `tbl_message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_message_queue` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  `opportunity_id` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `matched_solver_id` varchar(255) DEFAULT NULL,
  `matched_opportunity_id` varchar(255) DEFAULT NULL,
  `matched_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_opportunities`
--

DROP TABLE IF EXISTS `tbl_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opportunities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` varchar(30) NOT NULL,
  `fk_org_id` varchar(30) NOT NULL,
  `public_id` varchar(30) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `requirements` longtext,
  `start_date` varchar(255) DEFAULT NULL,
  `complete_date` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `rate_type` varchar(50) DEFAULT NULL,
  `active_status` varchar(20) NOT NULL DEFAULT 'review',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_opportunity_credentials`
--

DROP TABLE IF EXISTS `tbl_opportunity_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opportunity_credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_opportunity_id` int NOT NULL,
  `fk_credential_id` int NOT NULL,
  `completed` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_opportunity_skills`
--

DROP TABLE IF EXISTS `tbl_opportunity_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opportunity_skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_opportunity_id` int NOT NULL,
  `fk_skill_id` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_opportunity_smprofiles`
--

DROP TABLE IF EXISTS `tbl_opportunity_smprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_opportunity_smprofiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_opportunity_id` int NOT NULL,
  `fk_profile_id` int NOT NULL,
  `last_activity` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_organization_users`
--

DROP TABLE IF EXISTS `tbl_organization_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_organization_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_org_id` int NOT NULL,
  `fk_user_id` int NOT NULL,
  `org_level` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_organizations`
--

DROP TABLE IF EXISTS `tbl_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orgname` varchar(255) DEFAULT NULL,
  `creator` varchar(30) NOT NULL,
  `public_id` varchar(30) NOT NULL,
  `orgtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `location` varchar(255) DEFAULT NULL,
  `precise_location` point DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `buisness_ein` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `social_media` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'role_id',
  `role` varchar(255) DEFAULT NULL COMMENT 'role_text',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_skills`
--

DROP TABLE IF EXISTS `tbl_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_smprofiles`
--

DROP TABLE IF EXISTS `tbl_smprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_smprofiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL,
  `profile_namespace_uri` varchar(255) NOT NULL,
  `profile_marketplace_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_credentials`
--

DROP TABLE IF EXISTS `tbl_solver_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` int NOT NULL,
  `fk_credential_id` int NOT NULL,
  `completed` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_industry`
--

DROP TABLE IF EXISTS `tbl_solver_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_industry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `fk_industry_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solver_industry_solver` (`fk_solver_id`),
  KEY `fk_solver_industry_industry` (`fk_industry_id`),
  CONSTRAINT `fk_solver_industry_industry` FOREIGN KEY (`fk_industry_id`) REFERENCES `tbl_industry` (`id`),
  CONSTRAINT `fk_solver_industry_solver` FOREIGN KEY (`fk_solver_id`) REFERENCES `tbl_solvers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_locations`
--

DROP TABLE IF EXISTS `tbl_solver_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solver_id` (`fk_solver_id`),
  CONSTRAINT `tbl_solver_locations_ibfk_1` FOREIGN KEY (`fk_solver_id`) REFERENCES `tbl_solvers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_skills`
--

DROP TABLE IF EXISTS `tbl_solver_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `fk_skill_id` int NOT NULL,
  `duration` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_smprofiles`
--

DROP TABLE IF EXISTS `tbl_solver_smprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_smprofiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `fk_profile_id` int NOT NULL,
  `last_activity` int DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_speciality`
--

DROP TABLE IF EXISTS `tbl_solver_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_speciality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `fk_speciality_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solver_speciality_solver` (`fk_solver_id`),
  KEY `fk_solver_speciality_speciality` (`fk_speciality_id`),
  CONSTRAINT `fk_solver_speciality_solver` FOREIGN KEY (`fk_solver_id`) REFERENCES `tbl_solvers` (`id`),
  CONSTRAINT `fk_solver_speciality_speciality` FOREIGN KEY (`fk_speciality_id`) REFERENCES `tbl_speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solver_technology`
--

DROP TABLE IF EXISTS `tbl_solver_technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solver_technology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_solver_id` int NOT NULL,
  `fk_technology_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solver_technology_solver` (`fk_solver_id`),
  KEY `fk_solver_technology_technology` (`fk_technology_id`),
  CONSTRAINT `fk_solver_technology_solver` FOREIGN KEY (`fk_solver_id`) REFERENCES `tbl_solvers` (`id`),
  CONSTRAINT `fk_solver_technology_technology` FOREIGN KEY (`fk_technology_id`) REFERENCES `tbl_technology` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_solvers`
--

DROP TABLE IF EXISTS `tbl_solvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_solvers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_user_id` varchar(30) NOT NULL,
  `fk_org_id` varchar(30) NOT NULL,
  `public_id` varchar(30) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `experience` longtext,
  `portraitImage` longblob,
  `bannerImage` longblob,
  `availability` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `locations` varchar(255) DEFAULT NULL,
  `is_coach` bit(1) DEFAULT b'0',
  `allow_external` bit(1) DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `certificates` text,
  `location_preference` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `rate_type` varchar(50) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `technology` varchar(255) DEFAULT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_speciality`
--

DROP TABLE IF EXISTS `tbl_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_speciality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speciality_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_subscriptions`
--

DROP TABLE IF EXISTS `tbl_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `public_id` varchar(30) NOT NULL,
  `fk_user_id` varchar(30) NOT NULL,
  `fk_org_id` varchar(30) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `purchase_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canceled_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_technology`
--

DROP TABLE IF EXISTS `tbl_technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_technology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `technology_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_temp_stripe_data`
--

DROP TABLE IF EXISTS `tbl_temp_stripe_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_temp_stripe_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `payment_id` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `public_id` varchar(30) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `roleid` tinyint DEFAULT NULL,
  `is_disabled` bit(1) DEFAULT b'0',
  `is_firstrun` bit(1) DEFAULT b'1',
  `stripe_id` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reset_token` varchar(255) DEFAULT NULL,
  `payment_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-13 21:01:55
