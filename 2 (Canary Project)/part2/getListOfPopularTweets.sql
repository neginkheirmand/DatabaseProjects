CREATE PROCEDURE getListOfPopularTweets ()
BEGIN
	DECLARE user VARCHAR(20);
    SET user = twitter.GetLastLogIn();
    if user = null	THEN
		select null;
	end if;
    
    #get the list of all tweets ordered by the number of likes, if the poster blocked you, you wont be able to see their post in the list
	select info.idOfTweet as TweetID, info.Content as TweetContent, info.TwittedTime as TweetTime, info.count as numberOfLikes
	from(
		select tweets.idOfTweet, tweets.Content, tweets.poster, tweets.TwittedTime, liked_data.ID as idOfLiked , liked_data.LikedBy as likedBy, count(idOfTweet) as count
		from(
			select ID as idOfTweet , Content, Username as poster, TwittedTime 
			from tweet
			where not exists( #the poster in the list of people who blocked you
				select Blocked, Blocker
				from blocked_data
				where Blocked = user and 	
					Blocker = Username)
		) as tweets
		right join liked_data On IDTweet=idOfTweet
		group by IDTweet
		order by count(idOfTweet) desc
	) as info;
    
END