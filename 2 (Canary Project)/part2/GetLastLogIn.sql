CREATE FUNCTION `GetLastLogIn` ()
RETURNS VARCHAR(20)
BEGIN
	 DECLARE lastUser VARCHAR(20);
	 SELECT Username 
     FROM login 
     ORDER BY ID 
     ASC LIMIT 1
     into lastUser;

RETURN lastUser;
END
