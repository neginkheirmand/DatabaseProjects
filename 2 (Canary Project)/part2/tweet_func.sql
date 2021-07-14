CREATE DEFINER=`root`@`localhost` FUNCTION `tweet`(Content_ varchar(256)) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
	DECLARE user VARCHAR(20);
    set validation = true;
    SET user = twitter.GetLastLogIn();

	if (LENGTH(Content_)>256 or user is null ) 
		then select false into validation;
    end if;

	INSERT INTO TWEET(Content, Username, ParentID)
	VALUES 	(Content_, user, null);
RETURN 1;
END