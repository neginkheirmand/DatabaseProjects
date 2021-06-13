#the receiver of this list is the user: "newUserCreated"

select *
from tweet
where not exists(
				select *
                from blocked_data
                where Blocked = "Anony Mouse" and 
					Blocker = Username
					)
		and
        exists( select *
				from hashtag_data
                where tweet.ID = idOfTweet and hashtagUsed = "HaPPy"
                )
order by TwittedTime desc