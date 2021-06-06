#this query gets the list of all people liking some tweet, if the tweeter has blocked you, you won't be able to see anything
#and if any user who liked the tweet also blocked you, you won't be able to see his/her name on the list

#in this query the user requesting to see the likes of the tweet is "AlphabeticAfterimage" and the tweet id is 2
select Username
from User
where exists(
			select LikedBy
			from liked_data
            where LikedBy = Username and IDTweet=2)
	and not exists(
	
		select blocked, blocker 
		from blocked_data
		where blocked = "AlphabeticAfterimage" 
		and blocker = ( select Username
					from tweet
					where id= 2)
	)# you are not blocked by the poster
	and not exists(
		select blocked, blocker 
		from blocked_data
		where blocked = "AlphabeticAfterimage" 
		and blocker = Username
	)#you are not blocked by this user
            