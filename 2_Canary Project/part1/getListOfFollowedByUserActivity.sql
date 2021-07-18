select *
from tweet
where Username = (
	select T.Followed
    from(
		select Followed, Follower
		from following_data
		where Follower="Berb DiWire" and 
			not exists(		select *
							from blocked_data
							where Blocked="Berb DiWire" and Blocker=Followed
			)
		) as T
        ) 
    