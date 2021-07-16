CREATE DEFINER=`root`@`localhost` FUNCTION `createOpinionAsTweet`(Content_ varchar(256), parentTweetId int) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
	DECLARE user VARCHAR(20);
	DECLARE tweeter VARCHAR(20);
    set validation = true;
    SET user = twitter.GetLastLogIn();

	if (LENGTH(Content_)>256 or user is null ) 
		then select false into validation;
    end if;
    
    #make sure data is valid
	IF (validation is TRUE) THEN
		#make sure the tweet exists
        set tweeter =  twitter.getTweeter(parentTweetId);
        if not(tweeter = null) then
        # make sure the tweeter did not block user
			if (twitter.isUserBlocked(tweeter) = 0) then
				INSERT INTO TWEET(Content, Username, ParentID)
				VALUES 	(Content_, user, parentTweetId);
				RETURN 1;
			end if;
		end if;
	end IF;
RETURN 0;
END