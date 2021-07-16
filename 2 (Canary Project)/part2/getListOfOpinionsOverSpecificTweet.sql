CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfOpinionsOverSpecificTweet`(idOfTweet int)
BEGIN

	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    SET tweeter = twitter.getTweeter(idOfTweet);
    SET user = twitter.GetLastLogIn();
    
    if (tweeter=null or user=null ) then
		select null;
	end if;
    select *
		from tweet
		where ParentID = idOfTweet and 
			# the opiner blocked the receiver
			not exists(	select *
						from blocked_data
						where Blocked = user and Blocker = Username) and
			#the poster of the main tweet blocked the receiver
			not exists(	select *
						from blocked_data
						where Blocked = user 
							and Blocker = tweeter);
END