select *
from tweet
where Username = "Heartbreaker" and 
	not exists(		select *
					from blocked_data
                    where Blocked="newUserCreated" and Blocker="Heartbreaker")    