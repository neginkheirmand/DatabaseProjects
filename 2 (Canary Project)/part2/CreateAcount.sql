CREATE DEFINER=`root`@`localhost` FUNCTION `createAccount`(	
									username_ VARCHAR(20) ,
									name_Of_User VARCHAR(20),
									surname_ VARCHAR(20),
									pass_ VARCHAR(40),
									Date_Of_Birth_ DATE,
									Bio_ VARCHAR(64)
								) RETURNS int
BEGIN
	#first validate the input parameters
	DECLARE validation bool;
    set validation = true;
    IF EXISTS ( SELECT * 
				FROM user 
                WHERE user.Username = username_ ) 
		then SELECT false into validation;
	end IF;
	IF (username_ is null or name_Of_User is null or surname_ is null or pass_ is null or Date_Of_Birth_ is null) 
		then select false into validation;
    end IF;
    IF (validation is TRUE) THEN
		insert Into user(Username, Name_, Surname, Pass, Date_Of_Birth, Bio)
		values(username_ , name_Of_User , surname_ , sha1(pass_), Date_Of_Birth_ , Bio_ );
        return 1;
	end IF;
RETURN 0;
END