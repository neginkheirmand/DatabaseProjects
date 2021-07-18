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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Username` varchar(20) NOT NULL,
  `Name_` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Pass` varchar(40) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `SubTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Bio` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('AlphabeticAfterimage','holly','obama','6ec2b170b2293544d1d5baf3f1f58687023ee251','2000-09-20','2021-06-05 14:01:11','Hello there'),('Anony Mouse','camila','quintana','775cec129335edb616473a9683d98af758fa9514','2009-03-02','2021-06-05 14:01:11','Hello there'),('Arabic Denial','abys','kertchner','ac27bb34803cc7d5aa149fd947057244d706903b','2000-04-04','2021-06-05 14:01:11','Hello there'),('Ass Ass In','Abuzz','cantona','a7fc3dc2fcaf1533ab04e5d33458752faf961b9a','2000-11-16','2021-06-05 14:01:11','Hello there'),('Ass Whupper','agustina','cantona','6c086bc9bf20343610d1cd2e9965ed9c5f00d1f3','2003-04-11','2021-06-05 14:01:11','Hello there'),('Ayam Taken','zaira','rodrigez','c6b464c3e86db17088b6d95fae16077a5a46a1df','2004-01-23','2021-06-05 14:01:11','Hello there'),('Bad Karma','valentina','ramirez','ef1f7f499cd73070b5ee89419d4d751a8b3ff21c','2005-11-03','2021-06-05 14:01:11','Hello there'),('BeenThere DoneThat','valentina','ramirez','de34917b9f2304ca0d0e83352918dbca79c0b35f','2008-04-25','2021-06-05 14:01:11','Hello there'),('Behind You','valentina','ramirez','798ea9102b00e41edf707b4b3fcfaa80e0105236','2006-06-21','2021-06-05 14:01:11','Hello there'),('Ben Dover','ally','gonzales','0f58d5a5515f1a8a9d179aa58858b67b2f8a3388','1999-03-19','2021-06-05 14:01:11','Hello here'),('Berb DiWire','justin','quinteros','582170d97073d0e68bafb9577f6e3f5e55aa2b5f','1999-10-08','2021-06-05 14:01:11','Hello !there'),('Blurry Image','valentina','ramirez','50741ba3a215a42b997779228f65b6b270fa0c5c','2005-11-03','2021-06-05 14:01:11','Hello there'),('Born Confused','valentina','ramirez','1208238e5e8daedaf7ee58a35a46441504ac5226','2007-04-02','2021-06-05 14:01:11','Hello there'),('Born Confusedn','valentina','ramirez','fe7b49c5bc35d2eededc37f090c4c0c2af4e0ca8','2006-08-10','2021-06-05 14:01:11','Hello there'),('Bros Before Hoes','chaos','silva','348162101fc6f7e624681b7400b085eeac6df7bd','2012-01-01','2021-06-05 14:01:11','Hello there'),('Butt Smasher','taylor','fernandez','99baee504a1fe91a07bc66b6900bd39874191889','2012-01-01','2021-06-05 14:01:11','Hello there'),('Heartbreaker','Abuzz','su','7c4a8d09ca3762af61e59520943dc26494f8941b','2016-10-27','2021-06-05 14:01:11','Hello there'),('newUserCreated','myName','mySurname','c984aed014aec7623a54f0591da07a85fd4b762d','2016-10-27','2021-06-05 15:24:52','I am a new User in this awesome platform'),('pyUsername','pyUser','puSur','c2783fc2809472ef82136d501af1148663a86ed1','2012-01-01','2021-07-18 05:49:15','emm'),('reyhane','reyhan','Bagheri','7c4a8d09ca3762af61e59520943dc26494f8941b','2016-10-27','2021-07-17 16:02:54','Hi im reyhan');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_createAccount_trigger_signup_data` AFTER INSERT ON `user` FOR EACH ROW INSERT INTO signup_data
 SET Username = NEW.Username */;;
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
