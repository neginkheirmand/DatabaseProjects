CREATE FUNCTION createOpinionAsTweet (Content_ varchar(256), parentTweetId int)
RETURNS INTEGER
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
	DECLARE user VARCHAR(20);
    set validation = true;
    SET user = twitter.GetLastLogIn();

	if (LENGTH(Content_)>256 or user is null ) 
		then select false into validation;
    end if;
    
	IF (validation is TRUE) THEN
		INSERT INTO TWEET(Content, Username, ParentID)
		VALUES 	(Content_, user, parentTweetId);
		RETURN 1;
	end IF;
RETURN 0;
END
