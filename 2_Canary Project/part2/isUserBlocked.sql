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
END