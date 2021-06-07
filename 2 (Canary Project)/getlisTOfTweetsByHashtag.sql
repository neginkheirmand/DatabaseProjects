#the receiver of this list is the user: "newUserCreated"

select *
from tweet
where not exists(
				select *
                from blocked_data
                where Blocked = "Heartbreaker" and 
					Blocker = Username
					)
order by TwittedTime desc