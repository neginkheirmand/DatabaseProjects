#if the tweet is from someone who has blocked this user the number of likes will be 0
select count(id) as "numberOfLikes" 
from liked_data
where IDTweet = 2 and 
#is not blocked
	not exists( select blocked, blocker 
		from blocked_data
		where blocked = "Berb DiWire" # the user who requests this query
		-- where blocked = "Ben Dover" # the user who requests this query (this one is blocked)
			and blocker = ( select Username
							from tweet
							where id= 1)
                            )
	 