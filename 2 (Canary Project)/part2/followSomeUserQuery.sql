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
END