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
-- Dumping events for database 'twitter'
--

--
-- Dumping routines for database 'twitter'
--
/*!50003 DROP FUNCTION IF EXISTS `createAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createAccount`(	
									username_ VARCHAR(20) ,
									name_Of_User VARCHAR(20),
									surname_ VARCHAR(20),
									pass_ VARCHAR(40),
									Date_Of_Birth_ DATE,
									Bio_ VARCHAR(64)
								) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
    set validation = true;
    IF EXISTS ( SELECT * 
				FROM user 
                WHERE user.Username = username_ ) 
		then SELECT false into validation;
	end IF;
    if validation is false then
		return 0;
    end if;
    
	IF (username_ is null or name_Of_User is null or surname_ is null or pass_ is null or Date_Of_Birth_ is null) 
		then select false into validation;
    end IF;
    IF (validation is TRUE) THEN
		insert Into user(Username, Name_, Surname, Pass, Date_Of_Birth, Bio)
		values(username_ , name_Of_User , surname_ , sha1(pass_), Date_Of_Birth_ , Bio_ );
        return 1;
	end IF;
RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `createOpinionAsTweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createOpinionAsTweet`(Content_ varchar(256), parentTweetId int) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    set validation = true;
    SET user = twitter.GetLastLogIn();

	if (LENGTH(Content_)>256 or user is null ) 
		then select false into validation;
    end if;
    #make sure data is valid
	IF (validation is TRUE) THEN
		#make sure the tweet exists
        set tweeter =  twitter.getTweeter(parentTweetId);
        
        if not(tweeter is null) then
        # make sure the tweeter did not block user
			if (twitter.isUserBlocked(tweeter) = 0) then
				INSERT INTO TWEET(Content, Username, ParentID)
				VALUES 	(Content_, user, parentTweetId);
				RETURN 1;
			end if;
		end if;
	end IF;
RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetLastLogIn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetLastLogIn`() RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	 DECLARE lastUser VARCHAR(20);
	 SELECT Username 
     FROM login 
     ORDER BY ID 
     DESC LIMIT 1
     into lastUser;

RETURN lastUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNumLikesOfTweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNumLikesOfTweet`(idOfTweet int) RETURNS int
BEGIN
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
	DECLARE ret int;
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		return -1;
	end if;
    set tweeter =  twitter.getTweeter(idOfTweet);
    set ret = 0;
    if not ( tweeter is null )then
		select count(id) into ret
		from liked_data
		where IDTweet = idOfTweet and 
		#is not blocked
			not exists( select blocked, blocker 
				from blocked_data
				where blocked = user 
					and blocker = ( select Username
									from tweet
									where id= idOfTweet)
                            );
		return ret;
	else 
    return -1;
    end if;
	
RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTweeter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTweeter`(tweetId int) RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE tweeter VARCHAR(20);
    if exists(select Username
	from tweet
	where Id = tweetId) then 
		select Username
		from tweet
		where Id = tweetId
		into tweeter;
        return tweeter;
	end if;
RETURN null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isUserBlocked` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isUserBlocked`(Blocker_ varchar(20)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE Blocked_ VARCHAR(20);
    SET Blocked_ = twitter.GetLastLogIn();
	if not exists(	select * 
				from blocked_data
				where blocker = Blocker_ and blocked = Blocked_) then 
                return 0;
		end if;
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `likeTweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `likeTweet`(idOfTweet int) RETURNS int
BEGIN
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		return 0;
	end if;
    set tweeter =  twitter.getTweeter(idOfTweet);
    if not (tweeter is null) then
		
		INSERT INTO
		   liked_data (
			 IDTweet, LikedBy
		   )
		 SELECT
		   idOfTweet , user
		 WHERE
		   NOT EXISTS (
				#the user liking in the list of blocked users by the tweeter
				 select blocked, blocker 
				from blocked_data
				 where blocked = user 
					and blocker = ( select Username
									from tweet
									where id= idOfTweet )
				 )
				 and
				 #this tweet should not be already liked by this user
			not exists( select *
						from liked_data
						where IDTweet = idOfTweet and LikedBy=user );
				RETURN 1;
	end if;
RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `logInToPlatform` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `logInToPlatform`(		username_ varchar(20),
											pass_ varchar(128)
											) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
    set validation = true;
    IF not EXISTS ( SELECT * 
				FROM user 
                WHERE user.Username = username_ and user.pass = sha1(pass_)) 
		then SELECT false into validation;
	end IF;
    
    if (validation is false) then 
		return 0;
    end if;
		
	INSERT INTO
	  LOGIN (
		Username
	  )
		SELECT
		  username_ 
		WHERE
		  EXISTS (SELECT * FROM User WHERE Username = username_ AND Pass = sha1(pass_));

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sendMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sendMessage`(receiver_ varchar(20), idOfTweet int) RETURNS int
BEGIN
#this one will send a message to a user 
# the receiving persong should not have blocked the sender and if a tweet is used the tweeter shouldn't have blocked the sender 

	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		return 0;
	end if;
    
    if not exists(select * from tweet where id=idOfTweet)then
		return 0;
	end if;
    
    if not exists(select * from user where username=receiver_ )then
		return 0;
	end if;
    
	INSERT INTO
	  Message (
		IDTweet, Sender, Receiver
	  )
	SELECT
	  idOfTweet , user_, receiver_
	WHERE
		NOT EXISTS (	SELECT * 
						FROM blocked_data 
						WHERE Blocked = user_ AND Blocker = receiver_) AND
		NOT EXISTS(  	SELECT *
						FROM blocked_data 
						WHERE Blocked = user_ 
							AND Blocker = (	select Username
											from tweet
											where ID = idOfTweet
												));

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sendMessageWithContent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sendMessageWithContent`( receiver_ varchar(20), 
		content_ varchar(256) ) RETURNS int
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ is null	THEN
		return 0;
	end if;
    
    if not exists(select * from user where user.username = receiver_ )then
		return 0;
	end if;
    
    if exists (select *  from blocked_data where blocker = receiver_ and blocked = user_) then
		return 0;
	end if;
    
	INSERT INTO
	  Message (
		Content, Sender, Receiver
	  )
	SELECT
	  content_ , user_, receiver_
	;
    
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `tweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tweet`(Content_ varchar(256)) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
	DECLARE user VARCHAR(20);
    set validation = true;
    SET user = twitter.GetLastLogIn();

	if (LENGTH(Content_)>256 or user is null ) 
		then select false into validation;
    end if;
    
	IF (validation is TRUE) THEN
		INSERT INTO TWEET(Content, Username, ParentID)
		VALUES 	(Content_, user, null);
		RETURN 1;
	end IF;
RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BlockSomeUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BlockSomeUser`(Blocked_ varchar(20))
BEGIN
	DECLARE Blocker_ VARCHAR(20);
    SET Blocker_ = twitter.GetLastLogIn();
    
    INSERT INTO
	  blocked_data (
		Blocked, Blocker
	  )
	SELECT
	  Blocked_ , Blocker_
	WHERE
	  NOT EXISTS (SELECT * FROM blocked_data WHERE Blocked = Blocked_ AND Blocker = Blocker_);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `followSomeUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `followSomeUser`(Followed_ VARCHAR(20))
BEGIN
	DECLARE Follower_ VARCHAR(20);
    SET Follower_ = twitter.GetLastLogIn();
    # follow someone for the user if isnt already following that person
	INSERT INTO
	  FOLLOWING_DATA (
		Follower, Followed
	  )
	SELECT
	  Follower_, Followed_
	WHERE
	  NOT EXISTS (SELECT * FROM FOLLOWING_DATA WHERE Follower = Follower_ AND Followed = Followed_);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getActivityOfSpecificUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getActivityOfSpecificUser`(specificUser varchar(20))
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		select null;
	end if;
    select *
	from tweet
	where Username = specificUser and 
		not exists(		select *
						from blocked_data
						where Blocked = user and Blocker = specificUser);    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHashtags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHashtags`(content_ varchar(256), tweetID int)
BEGIN
	DECLARE temp varchar(5);
	DECLARE numSign varchar(1);
	DECLARE i INT Default 0 ;
	simple_loop: LOOP
		SET i = i + 1 ;
		IF i +6 > length(content_) + 1 THEN
			LEAVE simple_loop;
		END IF;
		SET numSign = substring(content_, i , 1 );
		SET temp = substring(content_, i+1 , 5 );
        if temp regexp '^[A-Za-z]+$' then
			if numSign regexp '^#' then
				# insert hashtag into table if does not exist
                insert into hashtag(Content) 
				select(temp)
                where not exists(select * from hashtag where hashtag.Content = temp);
                #anyway insert it into hashtag_data
                insert into hashtag_data(idoftweet, hashtagUsed)
                values( tweetID , temp);
            end if;
		end if;
	END LOOP simple_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfFollowedByUserActivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfFollowedByUserActivity`()
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    select *
	from tweet
	where Username = (
		select T.Followed
		from(
			select Followed, Follower
			from following_data
			where Follower = user and 
				not exists(		select *
								from blocked_data
								where Blocked = user and Blocker = Followed
				)
			) as T
			) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfLikedBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfLikedBy`(idOfTweet int)
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    
    if user is null then
		select null;
	end if;
    
    if not exists( select * from tweet where id = idOfTweet) then
		select null;
	end if;
    #this procedure gets the list of all people liking some tweet, if the tweeter has blocked you, you won't be able to see anything
	#and if any user who liked the tweet also blocked you, you won't be able to see his/her name on the list
	select Username
	from User
	where exists(
				select LikedBy
				from liked_data
				where LikedBy = Username and IDTweet=idOfTweet)
		and not exists(
		
			select blocked, blocker 
			from blocked_data
			where blocked = user 
			and blocker = ( select Username
						from tweet
						where id= idOfTweet)
		)# you are not blocked by the poster
		and not exists(
			select blocked, blocker 
			from blocked_data
			where blocked = user 
			and blocker = Username
		);#you are not blocked by this user
				
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfLogInsDesc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfLogInsDesc`()
BEGIN
	SELECT *
	FROM LOGIN
	ORDER BY LogInTime DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfMessagesFromAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMessagesFromAllUsers`()
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		select null;
	end if;
    
    select * 
	from(
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ 
		 and (not IDTweet is null)
		 and not exists( 				
										select Blocked, Blocker
										from blocked_data
										where Blocked = user_ 	
											and Blocker =  (
															select Username
															from tweet
															where tweet.ID = Message.IDTweet
															)
										)
		union 
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ 
		 and ( IDTweet is null)
	 ) as T
	 order by T.SendTime desc;

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfMessagesFromSpecificUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMessagesFromSpecificUsers`( sender_ varchar(20))
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		select null;
	end if;
    if not exists(select * from user where username = sender_)then
		select null;
	end if;
    
    select * 
	from(
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ and Sender= sender_
		 and (not IDTweet is null)
		 and not exists( 				
										select Blocked, Blocker
										from blocked_data
										where Blocked = user_ 	
											and Blocker =  sender_
										)
		union 
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ and Sender = sender_
		 and ( IDTweet is null)
	 ) as T
	 order by T.SendTime desc;

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfMessangers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMessangers`()
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		select null;
	end if;
    
    select *
	from user
	where Username in (
						select M.Sender 
						from (
							select * 
							from(
								select ID, IDTweet, Content, Sender, Receiver, SendTime
								from Message
								where Receiver = user_ 
								 and (not IDTweet is null)
								 and not exists( 				
																select Blocked, Blocker
																from blocked_data
																where Blocked = user_ 	
																	and Blocker =  (
																					select Username
																					from tweet
																					where tweet.ID = Message.IDTweet
																					)
																)
								union 
								select ID, IDTweet, Content, Sender, Receiver, SendTime
								from Message
								where Receiver = user_ 
								 and ( IDTweet is null)
							 ) as T
							 order by T.SendTime desc

							)as M
						);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfMyTweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMyTweets`()
BEGIN
	#since the user is the last person to log in
    DECLARE user VARCHAR(20);
    SET user = GetLastLogIn();
    
    if user = null then 
		select null;
    end if;
    
    select *
	from tweet
	where tweet.Username = user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfOpinionsOverSpecificTweet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfOpinionsOverSpecificTweet`(idOfTweet int)
BEGIN

	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    SET tweeter = twitter.getTweeter(idOfTweet);
    SET user = twitter.GetLastLogIn();
    
    if (tweeter=null or user=null ) then
		select null;
	end if;
    select *
		from tweet
		where ParentID = idOfTweet and 
			# the opiner blocked the receiver
			not exists(	select *
						from blocked_data
						where Blocked = user and Blocker = Username) and
			#the poster of the main tweet blocked the receiver
			not exists(	select *
						from blocked_data
						where Blocked = user 
							and Blocker = tweeter);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOfPopularTweets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfPopularTweets`()
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		select null;
	end if;
    
    #get the list of all tweets ordered by the number of likes, if the poster blocked you, you wont be able to see their post in the list
	select info.idOfTweet as TweetID, info.Content as TweetContent, info.TwittedTime as TweetTime, info.count as numberOfLikes
	from(
		select tweets.idOfTweet, tweets.Content, tweets.poster, tweets.TwittedTime, liked_data.ID as idOfLiked , liked_data.LikedBy as likedBy, count(idOfTweet) as count
		from(
			select ID as idOfTweet , Content, Username as poster, TwittedTime 
			from tweet
			where not exists( #the poster in the list of people who blocked you
				select Blocked, Blocker
				from blocked_data
				where Blocked = user and 	
					Blocker = Username)
		) as tweets
		right join liked_data On IDTweet=idOfTweet
		group by IDTweet
		order by count(idOfTweet) desc
	) as info;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLisTOfTweetsByHashtag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLisTOfTweetsByHashtag`(Content_ varchar(5))
BEGIN
	#since the user is the last person to log in
    DECLARE user VARCHAR(20);
    SET user = GetLastLogIn();
    
    
    if user = null then 
		select null;
    end if;
		
		
	select *
	from tweet
	where not exists(
					select *
					from blocked_data
					where Blocked = user and 
						Blocker = Username
						)
			and
			exists( select *
					from hashtag_data
					where tweet.ID = idOfTweet and hashtagUsed = Content_
					)
	order by TwittedTime desc;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stopBlockingSomeUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stopBlockingSomeUser`(Blocked_ varchar(20))
BEGIN
	DECLARE Blocker_ VARCHAR(20);
    SET Blocker_ = twitter.GetLastLogIn();
    DELETE FROM blocked_data
	where Blocker = Blocker_ and Blocked = Blocked_;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stopFollowingUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stopFollowingUser`(Followed_ VARCHAR(20))
BEGIN
	DECLARE Follower_ VARCHAR(20);
    SET Follower_ = twitter.GetLastLogIn();
    # stop following someone for the user if isnt already following that person
	DELETE FROM FOLLOWING_DATA
	where Followed = Followed_ and Follower = Follower_ ;
END ;;
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

-- Dump completed on 2021-07-18 11:42:12
