CREATE DEFINER=`root`@`localhost` FUNCTION `getNumLikesOfTweet`(idOfTweet int) RETURNS int
BEGIN
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
	DECLARE ret int;
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		return -1;
	end if;
    set tweeter =  twitter.getTweeter(idOfTweet);
    set ret = 0;
    if not ( tweeter is null )then
		select count(id) into ret
		from liked_data
		where IDTweet = idOfTweet and 
		#is not blocked
			not exists( select blocked, blocker 
				from blocked_data
				where blocked = user 
					and blocker = ( select Username
									from tweet
									where id= idOfTweet)
                            );
		return ret;
	else 
    return -1;
    end if;
	
RETURN 0;
END