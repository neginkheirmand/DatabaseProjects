select * 
from(
	select ID, IDTweet, Content, Sender, Receiver, SendTime
	from Message
	where Receiver = "Heartbreaker" 
	 and (not IDTweet is null)
	 and not exists( 				
									select Blocked, Blocker
									from blocked_data
									where Blocked = "Heartbreaker" 	
										and Blocker =  (
														select Username
														from tweet
														where tweet.ID = Message.IDTweet
														)
									)
	union 
	select ID, IDTweet, Content, Sender, Receiver, SendTime
	from Message
	where Receiver = "Heartbreaker" 
	 and ( IDTweet is null)
 ) as T
 order by T.SendTime desc
