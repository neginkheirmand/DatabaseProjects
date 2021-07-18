CREATE DEFINER=`root`@`localhost` FUNCTION `sendMessageWithContent`( receiver_ varchar(20), 
		content_ varchar(256) ) RETURNS int
BEGIN
	DECLARE user_ VARCHAR(20);
    SET user_ = twitter.GetLastLogIn();
    if user_ is null	THEN
		return 0;
	end if;
    
    if not exists(select * from user where user.username = receiver_ )then
		return 0;
	end if;
    
    if exists (select *  from blocked_data where blocker = receiver_ and blocked = user_) then
		return 0;
	end if;
    
	INSERT INTO
	  Message (
		Content, Sender, Receiver
	  )
	SELECT
	  content_ , user_, receiver_
	;
    
RETURN 1;
END