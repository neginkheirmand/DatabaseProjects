# this procedure is supposed to find all the acceptable hastags in a string
# insert them into hashtag table if not existent and then insert the data into hashtag_data table
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHashtags`(content varchar(256), tweetID int)
BEGIN
	DECLARE temp varchar(256);
    
END