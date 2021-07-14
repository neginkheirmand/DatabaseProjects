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
END