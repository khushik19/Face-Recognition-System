-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: face_recognition
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `entry_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,NULL,'Visitor',NULL),(2,NULL,'Visitor',NULL),(3,'1','Achal Goyal','2025-02-21 14:08:25'),(4,NULL,'Visitor',NULL),(5,'2','deepanshi mane','2025-02-21 14:30:33'),(6,'1','Achal Goyal','2025-02-21 14:31:02'),(7,'2','deepanshi mane','2025-02-21 14:31:40'),(8,'1','Achal Goyal','2025-02-21 14:31:46'),(9,'2','deepanshi mane','2025-02-21 14:32:39'),(10,'3','Khushi Katiyar','2025-02-21 14:33:27'),(11,NULL,'Visitor',NULL),(12,NULL,'Visitor',NULL),(13,'1','Achal Goyal','2025-02-21 14:33:56'),(14,'1','Achal Goyal','2025-02-21 14:34:27'),(15,'1','Achal Goyal','2025-02-21 15:34:20'),(16,'1','Achal Goyal','2025-02-21 15:34:52'),(17,'1','Achal Goyal','2025-02-21 15:37:03'),(18,'1','Achal Goyal','2025-02-21 15:37:35'),(19,'1','Achal Goyal','2025-02-21 15:38:06'),(20,'3','Khushi Katiyar','2025-02-21 15:38:35'),(21,'1','Achal Goyal','2025-02-21 15:38:54'),(22,'1','Achal Goyal','2025-02-21 15:46:47'),(23,'1','Achal Goyal','2025-02-21 15:53:11'),(24,'1','Achal Goyal','2025-02-21 15:56:06'),(25,'1','Achal Goyal','2025-02-21 15:59:34'),(26,'1','Achal Goyal','2025-02-21 16:00:05'),(27,'3','Khushi Katiyar','2025-02-21 16:00:11'),(28,'1','Achal Goyal','2025-02-21 16:01:24'),(29,'3','Khushi Katiyar','2025-02-21 16:01:34'),(30,'1','Achal Goyal','2025-02-21 16:01:55'),(31,'1','Achal Goyal','2025-02-21 16:04:37'),(32,'1','Achal Goyal','2025-02-21 16:05:08'),(33,'1','Achal Goyal','2025-02-21 16:05:39'),(34,'1','Achal Goyal','2025-02-21 16:06:28'),(35,'1','Achal Goyal','2025-02-21 16:08:53'),(36,'1','Achal Goyal','2025-02-21 16:12:42'),(37,'1','Achal Goyal','2025-02-21 16:13:14'),(38,'1','Achal Goyal','2025-02-21 16:13:54'),(39,'1','Achal Goyal','2025-02-21 16:15:09'),(40,'1','Achal Goyal','2025-02-21 16:15:43'),(41,NULL,'Visitor','2025-02-21 16:15:50'),(42,'3','Khushi Katiyar','2025-02-21 16:15:55'),(43,'1','Achal Goyal','2025-02-21 16:16:15'),(44,'1','Achal Goyal','2025-02-21 18:08:21'),(45,'1','Achal Goyal','2025-02-21 18:08:52'),(46,'1','Achal Goyal','2025-02-21 18:09:24'),(47,'1','Achal Goyal','2025-02-21 18:09:55'),(48,'1','Achal Goyal','2025-02-21 18:10:27'),(49,NULL,'Visitor','2025-02-21 18:16:36'),(50,'1','Achal Goyal','2025-02-21 18:16:58'),(51,'1','Achal Goyal','2025-02-21 18:17:45'),(52,'1','Achal Goyal','2025-02-21 18:19:00'),(53,NULL,'Visitor','2025-02-21 18:19:50'),(54,NULL,'Visitor','2025-02-21 18:25:51'),(55,'1','Achal Goyal','2025-02-21 18:26:06'),(56,NULL,'Visitor','2025-02-21 18:26:28'),(57,'1','Achal Goyal','2025-02-21 18:26:39'),(58,'1','Achal Goyal','2025-02-21 18:27:21'),(59,'1','Achal Goyal','2025-02-21 18:31:42'),(60,'1','Achal Goyal','2025-02-21 18:32:13'),(61,'1','Achal Goyal','2025-02-21 18:32:45'),(62,NULL,'Visitor','2025-02-21 18:33:53'),(63,'1','Achal Goyal','2025-02-21 18:34:23'),(64,'1','Achal Goyal','2025-02-21 18:34:55');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-22 19:41:06
