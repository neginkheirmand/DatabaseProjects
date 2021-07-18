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
-- Table structure for table `signup_data`
--

DROP TABLE IF EXISTS `signup_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup_data` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `SubTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_data`
--

LOCK TABLES `signup_data` WRITE;
/*!40000 ALTER TABLE `signup_data` DISABLE KEYS */;
INSERT INTO `signup_data` VALUES (1,'AlphabeticAfterimage','2021-06-05 14:01:11'),(2,'Anony Mouse','2021-06-05 14:01:11'),(3,'Arabic Denial','2021-06-05 14:01:11'),(4,'Ass Ass In','2021-06-05 14:01:11'),(5,'Ass Whupper','2021-06-05 14:01:11'),(6,'Ayam Taken','2021-06-05 14:01:11'),(7,'Bad Karma','2021-06-05 14:01:11'),(8,'BeenThere DoneThat','2021-06-05 14:01:11'),(9,'Behind You','2021-06-05 14:01:11'),(10,'Ben Dover','2021-06-05 14:01:11'),(11,'Berb DiWire','2021-06-05 14:01:11'),(12,'Blurry Image','2021-06-05 14:01:11'),(13,'Born Confused','2021-06-05 14:01:11'),(14,'Born Confusedn','2021-06-05 14:01:11'),(15,'Bros Before Hoes','2021-06-05 14:01:11'),(16,'Butt Smasher','2021-06-05 14:01:11'),(17,'Heartbreaker','2021-06-05 14:01:11'),(18,'newUserCreated','2021-06-05 15:24:52'),(32,'123456789qwertyuiopl','2021-07-12 18:27:35'),(34,'reyhane','2021-07-17 16:02:54'),(35,'pyUsername','2021-07-18 05:49:15');
/*!40000 ALTER TABLE `signup_data` ENABLE KEYS */;
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
