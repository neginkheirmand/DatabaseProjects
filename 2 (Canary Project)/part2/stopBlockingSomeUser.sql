CREATE DEFINER=`root`@`localhost` PROCEDURE `stopBlockingSomeUser`(Blocked_ varchar(20))
BEGIN
	DECLARE Blocker_ VARCHAR(20);
    SET Blocker_ = twitter.GetLastLogIn();
    DELETE FROM blocked_data
	where Blocker = Blocker_ and Blocked = Blocked_;
END