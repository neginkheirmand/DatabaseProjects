CREATE DEFINER=`root`@`localhost` PROCEDURE `stopFollowingUser`(Followed_ VARCHAR(20))
BEGIN
	DECLARE Follower_ VARCHAR(20);
    SET Follower_ = twitter.GetLastLogIn();
    # stop following someone for the user if isnt already following that person
	DELETE FROM FOLLOWING_DATA
	where Followed = Followed_ and Follower = Follower_ ;
END