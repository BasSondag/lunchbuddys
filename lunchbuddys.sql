CREATE DATABASE  IF NOT EXISTS `lunchbuddys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lunchbuddys`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: lunchbuddys
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `linkedin_user_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `buddy` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_topics_idx` (`topic_id`),
  KEY `fk_appointments_linkedin_users1_idx` (`linkedin_user_id`),
  KEY `fk_appointments_locations1_idx` (`location_id`),
  CONSTRAINT `fk_appointments_linkedin_users1` FOREIGN KEY (`linkedin_user_id`) REFERENCES `linkedin_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_topics` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (129,9,23,'2016-04-01','2016-04-01 11:28:26',17,2),(130,16,24,'2016-04-01','2016-04-01 11:29:57',17,7),(131,11,25,'2016-04-01','2016-04-01 11:35:31',17,5),(132,14,22,'2016-04-01','2016-04-01 11:36:51',17,1),(136,12,27,'2016-04-01','2016-04-01 18:00:01',18,1),(137,12,18,'2016-04-01','2016-04-01 18:04:02',27,1),(143,9,18,'2016-05-28','2016-05-28 00:32:22',17,1),(144,9,17,'2016-05-28','2016-05-28 00:33:11',18,1);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkedin_users`
--

DROP TABLE IF EXISTS `linkedin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkedin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `headline` varchar(500) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkedin_users`
--

LOCK TABLES `linkedin_users` WRITE;
/*!40000 ALTER TABLE `linkedin_users` DISABLE KEYS */;
INSERT INTO `linkedin_users` VALUES (17,'AQW4vmecqTg9lrYqOWgW4Pn6lWVqq2ZGL8SecJ_p-XPv6BbyG3jUc33Ni8DeUC-YUtGGiHsTWf_M4nbqs3Ko7vrUQkSeCxF7f4w0CP7q4RSjnQ5TCFosxjFpGZJq5a25qpTjTN2ljurxy6aJwEyxjflNgBjQQ-TPK-tbfKfBbTGYi3ldW6g','Nigel Koh','nigelkoh.hs@gmail.com','Nigel','Investment Banking Analyst at Barclays','Financial Services','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_-zPcT8HDkgHKgZOJRkLcWitDhHFSYstHliWckNODkpM2REfdAAFnuNEDCpwAgZjLZzFndtdSeoLuZO_LOQnIWNHTDoLDZYwdgQnqCvju6IrTteKvAchsG31gSx0jAYp4qL-RLwcfSLf','2016-03-31 18:14:20','2016-05-28 00:52:28'),(18,'AQWKNBKUwR7ng0pwZw8LQ_2nfcms2O6acddN2UxVuYjTqiARMk80YQ6A94Mrge67EUoUCPoOchL2rxqViw5TqkkHq6_gG0kT1TH5gU7vNiAAuZam1Zc_nPuFqd9FU5KEw56bKKwVv800ksukZmimvH0KF3Bi-JMg6r2PZjoe6iyUJpOp9t0','Monica Kang','monica.kang10@gmail.com','Monica','Partnerships Associate at Informa','Marketing and Advertising','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_x0rFQvOEDy9-wIRw1moQwGkEWRs-asqFnmkF_TlESd3PwELRpRoQwGyEm0B-wEUbPmkdmb0oksR1HY7EvuzRmTO63sRtHYTb9uzX58IIoUaOGesRsj_ELqLVTf3CTY9nxflIGOCPxJ5','2016-03-31 18:49:58','2016-05-28 00:07:58'),(22,'AQX4ERacaQHHkJxikqyoMdDEoan-oNk2kJlUnkpq_Rzt4TbstYlLF6SebS5x3XxwvSh8I1hs5sp8uXHY3VsxNqtp6_Pg-D4PK1wQt94md86PVu9FDg8RMUx3qv1lQZmQgGVHHcSWQcdwFaXn0F_79lCH7ODAzwnD6bb1Kz6hg6rQQc5tRRU','Bas Sondag','bassondag@gmail.com','Bas','Experienced Optical Manager & Future Coder','Computer Software','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_Og-UycyHXN7AuW1SOMHntigdhCxAdJ8KgMQUViKd587KudYr4wQUR3gHCQES7R8lgMkRZkOeeiprEjJr-acbNi0kDiplEjVAqacZxGoW6Gdj8I3SZxT90nXZSn6TijShgSPB4KKEbKi','2016-03-31 19:13:54','2016-04-01 11:36:33'),(23,'AQXu09hEFU_eQqNfJ152PuftvKFmX5X2k-ZJ7KYaZEmSL-1yd3l59DzJ5DD2nVO8GruEvOjGfQuI9ePWT20lQAx2SxdUMnjbFQTArnReZCNoIv1IpD5i9qPQg-OnrwPSm9TQd6DJ4LyjF0c-EokEj99RXntAzFwfe-kL0uiYxJpxAnqBV1A','Christina Doane','christa@doane.net','Christina','Product Manager at Pivotal Software, Inc.','Information Technology and Services','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_yq555BbCiEk7PZaMOvLs5zkhTo_8xZ7MO1lV5zqxYuBK8pZJr-vWIv8l7FixpxmvgcbUEtETHaZM','2016-04-01 11:28:11','2016-04-01 11:28:11'),(24,'AQUMMo-r5CWZwr4PQ4dHnmCeN7hzEwK7XOoCM3GPVpVBbnicg7xAggZ4Dav0GAjbyJxUoJHH-ilubFGJcPMR9G94jTxoUA42RhxlTRP5nxT52ybI3u2IIVbCbdHhScGcwz7sbEhf-Grr7Ww6RhhA3FbIruCHInj6mirt_PtERpAa03eppqU','Heidi Pak','heidi.pak.143@my.csun.edu','Heidi','Management Internship Trainee at Big Lots','Hospitality','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_VoW0fTEWUgf7ECXXZEsufiyHUpV8okqX4eg8fisMkJalzhikn2M1T_aBvtsYW_zHRdw3hketD6xf','2016-04-01 11:29:13','2016-04-01 11:29:13'),(25,'AQWKTeScdJS5mSwM-GAKR8mPCdbdfeVkMrwyEOsHNN0TOA8ZxEz9jhUSyaT8nXGZ5x_kN1MGKthFo_Bte7KWzmpznL5lZC5OTMId_UHJdea-mb0GDZoRNAQ1-705u6TS964OhTFJrWyyzf-0ygYp64-O_d0KofjVSgfwlZp_5JqqfWkRwII','Tomomi Tamura','tomomi.hoag@runforjapanusa.com','Tomomi','Administrative Assistant at Honda Research Institute USA, Inc.','Research','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_JcF2qhNaAhMfY9xrRq5PqCcaPi03Y9xrR91PqCvju6IrTteKvAchsG31gSx0jAYp4qL-RLF0eYKf','2016-04-01 11:35:08','2016-04-01 11:35:08'),(26,'AQVMA_3dZDCPHf8kq9mNbVu5NxQByjmu_HbeZmK3isXfS06uYT0NIDDkE9ed4cr3hWOfWRcCvvTr39x_pduTB84h76Wwe5b7sHsHbAYj8XESm3MlkivUzOCFdmz44YOdFBc3Mn6hXU2BZYnSsJijhp29dVKhMbfv_rZp_LO5eYPihRC_S6U','Jimmy Jun','jimmy.s.jun@gmail.com','Jimmy','Full Stack Developer','Computer Software','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_a5UcrZWY_L4F9MaTHPDnj2Ix6LGUrdy3STfcnuaxCCfVrJfTkq_JBy8x5QUFnIjD3qDBRR70mQ4sPDBuX9YI4uG1IQ4RPDwhX9Yq1ScOhbDBMRKyebHsPJJfw1GIVDpASvVRN11qPFU','2016-04-01 13:41:06','2016-04-01 13:41:06'),(27,'AQVO656Qq0xIhn7V7jDokACFfRT0EQhbyST8Yd5az8S_RsssZM2WbCyBx_kS6tj_dZO6ybZzhJmNKakZeHw0xtwwOxhclCkzV3N9Vc8MOCFmGI-AkiVZm9pK5HNPcfaODF28d0xZLKKjRSekfwI3xTCgioWi0FcXuEAy0yZbekGvUNLxkGY','Stefanie Steininger','stefanie.steininger@gmx.net','Stefanie','Mathematics Teacher bei BACH Math Club','Primary/Secondary','San Francisco Bay Area','https://media.licdn.com/mpr/mprx/0_x9J4KtA1oAF8pdQtxKWIKrc_e-A8pfntgNDbKAnPBcLliwT-1rdqOlGgQylYxHBYYzR6xne-ldCn','2016-04-01 17:59:26','2016-04-01 17:59:26');
/*!40000 ALTER TABLE `linkedin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'San Jose','2016-03-31 18:12:24','2016-03-31 18:12:24'),(2,'Palo Alto','2016-03-31 18:13:10','2016-03-31 18:13:10'),(3,'Seattle','2016-03-31 18:13:19','2016-03-31 18:13:19'),(4,'Menlo Park','2016-03-31 18:13:28','2016-03-31 18:13:28'),(5,'Mountain View','2016-03-31 18:13:35','2016-03-31 18:13:35'),(6,'Home','2016-03-31 18:30:12','2016-03-31 18:30:12'),(7,'Los Angeles','2016-04-01 11:29:57','2016-04-01 11:29:57'),(8,'mountain view','2016-04-01 11:35:31','2016-04-01 11:35:31'),(12,'Coding Dojo','2016-04-01 13:43:12','2016-04-01 13:43:12'),(15,'dawd','2016-05-28 01:53:03','2016-05-28 01:53:03');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (9,'IoT','2016-03-31 18:16:34','2016-03-31 18:16:34'),(10,'Wearables','2016-03-31 18:16:39','2016-03-31 18:16:39'),(11,'Finance','2016-03-31 18:16:43','2016-03-31 18:16:43'),(12,'Marketing','2016-03-31 18:16:47','2016-03-31 18:16:47'),(13,'Coding','2016-03-31 18:16:53','2016-03-31 18:16:53'),(14,'codingdojo','2016-03-31 18:16:59','2016-03-31 18:16:59'),(15,'Validation','2016-03-31 18:18:13','2016-03-31 18:18:13'),(16,'Event Management','2016-04-01 11:29:57','2016-04-01 11:29:57'),(17,'Coding Dojo','2016-04-01 11:38:02','2016-04-01 11:38:02'),(22,'awdawd','2016-05-28 01:53:03','2016-05-28 01:53:03');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-31 12:23:10
