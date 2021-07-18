CREATE DATABASE  IF NOT EXISTS `twitter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `twitter`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: twitter
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDTweet` int DEFAULT NULL,
  `Content` varchar(256) DEFAULT NULL,
  `Sender` varchar(20) DEFAULT NULL,
  `Receiver` varchar(20) DEFAULT NULL,
  `SendTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IDTweet` (`IDTweet`),
  KEY `Sender` (`Sender`),
  KEY `Receiver` (`Receiver`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`IDTweet`) REFERENCES `tweet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`Sender`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`Receiver`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,NULL,'Ayam Taken','Anony Mouse','2021-06-05 14:26:10'),(2,2,NULL,'Anony Mouse','Ayam Taken','2021-06-05 14:26:10'),(3,3,NULL,'Ayam Taken','Anony Mouse','2021-06-05 14:26:10'),(4,NULL,'Thank you for sending me a message','Ayam Taken','Anony Mouse','2021-06-05 14:26:10'),(5,NULL,'thank you for answering','Anony Mouse','Ayam Taken','2021-06-05 14:26:10'),(6,NULL,'nice to meet you!','Ayam Taken','Anony Mouse','2021-06-05 14:26:10'),(7,2,NULL,'Heartbreaker','Born Confused','2021-06-07 15:29:03'),(8,4,NULL,'Born Confused','Heartbreaker','2021-06-07 15:41:51'),(9,5,NULL,'Born Confused','Heartbreaker','2021-06-07 15:42:01'),(10,16,NULL,'Born Confused','Heartbreaker','2021-06-07 15:42:24'),(11,2,NULL,'Heartbreaker','newUserCreated','2021-06-07 16:37:16'),(12,NULL,'Hi Heartbreaker, please don\'t break my heart','Heartbreaker','newUserCreated','2021-06-07 16:39:31'),(13,NULL,'Hi Heartbreaker, please don\'t break my heart','Heartbreaker','newUserCreated','2021-06-07 16:39:33'),(14,NULL,'Hi Heartbreaker, please don\'t break my heart','Heartbreaker','newUserCreated','2021-06-07 16:39:33'),(15,NULL,'Hi newUserCreated, nice to meet you','newUserCreated','Heartbreaker','2021-06-07 16:54:55'),(16,18,NULL,'Berb DiWire','AlphabeticAfterimage','2021-07-16 18:19:36'),(19,18,NULL,'Arabic Denial','Heartbreaker','2021-07-16 18:31:58'),(20,1,NULL,'pyUsername','reyhane','2021-07-18 06:19:03'),(21,NULL,'hireyhan','pyUsername','reyhane','2021-07-18 06:26:50'),(22,NULL,'salam in avalin matn kamele mane','pyUsername','reyhane','2021-07-18 07:03:24');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 11:42:11
