CREATE DEFINER=`root`@`localhost` FUNCTION `GetLastLogIn`() RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	 DECLARE lastUser VARCHAR(20);
	 SELECT Username 
     FROM login 
     ORDER BY ID 
     DESC LIMIT 1
     into lastUser;

RETURN lastUser;
END