CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfFollowedByUserActivity`()
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    select *
	from tweet
	where Username = (
		select T.Followed
		from(
			select Followed, Follower
			from following_data
			where Follower = user and 
				not exists(		select *
								from blocked_data
								where Blocked = user and Blocker = Followed
				)
			) as T
			) ;
END