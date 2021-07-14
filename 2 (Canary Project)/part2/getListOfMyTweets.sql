CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMyTweets`()
BEGIN
	#since the user is the last person to log in
    DECLARE user VARCHAR(20);
    SET user = GetLastLogIn();
    select *
	from tweet
	where tweet.Username = user;
END