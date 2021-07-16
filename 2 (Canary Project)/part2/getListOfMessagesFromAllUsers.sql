CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOfMessagesFromAllUsers`()
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		select null;
	end if;
    
    select * 
	from(
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ 
		 and (not IDTweet is null)
		 and not exists( 				
										select Blocked, Blocker
										from blocked_data
										where Blocked = user_ 	
											and Blocker =  (
															select Username
															from tweet
															where tweet.ID = Message.IDTweet
															)
										)
		union 
		select ID, IDTweet, Content, Sender, Receiver, SendTime
		from Message
		where Receiver = user_ 
		 and ( IDTweet is null)
	 ) as T
	 order by T.SendTime desc;

    

END