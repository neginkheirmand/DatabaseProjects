CREATE PROCEDURE getLisTOfTweetsByHashtag (Content_ varchar(5))
BEGIN
	#since the user is the last person to log in
    DECLARE user VARCHAR(20);
    SET user = GetLastLogIn();
    
    
    if user = null then 
		select null;
    end if;
		
		
	select *
	from tweet
	where not exists(
					select *
					from blocked_data
					where Blocked = user and 
						Blocker = Username
						)
			and
			exists( select *
					from hashtag_data
					where tweet.ID = idOfTweet and hashtagUsed = Content_
					)
	order by TwittedTime desc;


END
