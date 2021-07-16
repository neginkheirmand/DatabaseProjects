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
END