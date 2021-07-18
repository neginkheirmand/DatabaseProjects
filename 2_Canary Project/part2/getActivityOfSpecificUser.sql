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
END