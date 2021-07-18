CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfLikedBy`(idOfTweet int)
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    
    if user is null then
		select null;
	end if;
    
    if not exists( select * from tweet where id = idOfTweet) then
		select null;
	end if;
    #this procedure gets the list of all people liking some tweet, if the tweeter has blocked you, you won't be able to see anything
	#and if any user who liked the tweet also blocked you, you won't be able to see his/her name on the list
	select Username
	from User
	where exists(
				select LikedBy
				from liked_data
				where LikedBy = Username and IDTweet=idOfTweet)
		and not exists(
		
			select blocked, blocker 
			from blocked_data
			where blocked = user 
			and blocker = ( select Username
						from tweet
						where id= idOfTweet)
		)# you are not blocked by the poster
		and not exists(
			select blocked, blocker 
			from blocked_data
			where blocked = user 
			and blocker = Username
		);#you are not blocked by this user
				
    
END