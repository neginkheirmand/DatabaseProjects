CREATE DEFINER=`root`@`localhost` FUNCTION `likeTweet`(idOfTweet int) RETURNS int
BEGIN
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		return 0;
	end if;
    set tweeter =  twitter.getTweeter(idOfTweet);
    if not (tweeter is null) then
		
		INSERT INTO
		   liked_data (
			 IDTweet, LikedBy
		   )
		 SELECT
		   idOfTweet , user
		 WHERE
		   NOT EXISTS (
				#the user liking in the list of blocked users by the tweeter
				 select blocked, blocker 
				from blocked_data
				 where blocked = user 
					and blocker = ( select Username
									from tweet
									where id= idOfTweet )
				 )
				 and
				 #this tweet should not be already liked by this user
			not exists( select *
						from liked_data
						where IDTweet = idOfTweet and LikedBy=user );
				RETURN 1;
	end if;
RETURN 0;
END