CREATE DEFINER=`root`@`localhost` FUNCTION `logInToPlatformQuery`(		username_ varchar(20),
											pass_ varchar(40)
											) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
    set validation = true;
    IF not EXISTS ( SELECT * 
				FROM user 
                WHERE user.Username = username_ and user.pass = sha1(pass_)) 
		then SELECT false into validation;
	end IF;
    
    if (validation is false) then 
		return 0;
    end if;
		
	INSERT INTO
	  LOGIN (
		Username
	  )
		SELECT
		  username_ 
		WHERE
		  EXISTS (SELECT * FROM User WHERE Username = username_ AND Pass = sha1(pass_));

RETURN 1;
END