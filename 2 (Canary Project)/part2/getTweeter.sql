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
END