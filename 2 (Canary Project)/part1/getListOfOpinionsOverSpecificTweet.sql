#we want to see the opinions of people in the tweet id = 1
select *
from tweet
where ParentID = 1 and 
	# the opiner blocked the receiver
	not exists(	select *
				from blocked_data
                where Blocked="Heartbreaker" and Blocker = Username) and
	#the poster of the main tweet blocked the receiver
    not exists(	select *
				from blocked_data
                where Blocked = "Heartbreaker" 
					and Blocker = (	select Username
									from tweet
                                    where ID = 1))