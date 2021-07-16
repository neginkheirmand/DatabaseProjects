CREATE DEFINER=`root`@`localhost` FUNCTION `sendMessage`(receiver_ varchar(20), idOfTweet int) RETURNS int
BEGIN
#this one will send a message to a user 
# the receiving persong should not have blocked the sender and if a tweet is used the tweeter shouldn't have blocked the sender 

	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ = null	THEN
		return 0;
	end if;
    
    if not exists(select * from tweet where id=idOfTweet)then
		return 0;
	end if;
    
    if not exists(select * from user where username=receiver_ )then
		return 0;
	end if;
    
	INSERT INTO
	  Message (
		IDTweet, Sender, Receiver
	  )
	SELECT
	  idOfTweet , user_, receiver_
	WHERE
		NOT EXISTS (	SELECT * 
						FROM blocked_data 
						WHERE Blocked = user_ AND Blocker = receiver_) AND
		NOT EXISTS(  	SELECT *
						FROM blocked_data 
						WHERE Blocked = user_ 
							AND Blocker = (	select Username
											from tweet
											where ID = idOfTweet
												));

RETURN 1;
END