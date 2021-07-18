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
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ParentID` int DEFAULT NULL,
  `Content` varchar(256) DEFAULT NULL,
  `Username` varchar(20) NOT NULL,
  `TwittedTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `Username` (`Username`),
  CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `tweet` (`ID`),
  CONSTRAINT `tweet_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,NULL,'My smile is a thrill, and I want to be famous. Looking for clammy permission, in a way.','Heartbreaker','2021-06-05 14:14:07'),(2,NULL,'My dad is getting old, and I want to go to Mars. We need perfect drugs, bro','Heartbreaker','2021-06-05 14:14:07'),(3,NULL,'My groove is a personal wish, and I want to move to a new town. Unlikely free shoes, IMHO.','Heartbreaker','2021-06-05 14:14:07'),(4,NULL,'My sister is so robust, and I want to go to Mars. No one cares about better pets, you see','Heartbreaker','2021-06-05 14:14:07'),(5,NULL,'My life is so robust, and I want to run a marathon. The world has creepy weather, for once. ','Heartbreaker','2021-06-05 14:14:07'),(6,NULL,'My home is a shadow, and I want to go to Mars. Laughable random drinks, you see.','Heartbreaker','2021-06-05 14:14:07'),(7,1,'I am soooo happy that you say that','Bad Karma','2021-06-06 19:33:42'),(8,NULL,'Hi this is karen','Bad Karma','2021-06-07 14:53:51'),(14,1,'This is my opinion','Ayam Taken','2021-06-07 15:15:12'),(15,1,'This is also another one of my opinions','Ayam Taken','2021-06-07 15:15:28'),(16,1,'just passed by and wanted to say hello','BeenThere DoneThat','2021-06-07 15:16:05'),(17,NULL,'my latest tweet :( #sadAF #heheh','Heartbreaker','2021-07-16 09:27:05'),(18,NULL,'im just so done with my life','Berb DiWire','2021-07-16 18:19:04'),(19,1,'IamsooooNotHappy','Heartbreaker','2021-07-18 06:06:08'),(20,1,'GoodMorning','Heartbreaker','2021-07-18 06:07:22'),(21,NULL,'thisIsMyFirstTweetIsentit?','pyUsername','2021-07-18 06:28:44');
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_tweet_trigger_1` AFTER INSERT ON `tweet` FOR EACH ROW INSERT INTO tweet_log( tweeter , tweet_Id , tweeted_date)
 values( NEW.Username , NEW.ID , NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_tweet_trigger_2_insert_hashtags` AFTER INSERT ON `tweet` FOR EACH ROW call getHashtags(NEW.Content, NEW.ID) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 11:42:11
