delimiter $$
CREATE PROCEDURE getListOfLogInsDesc ()
BEGIN
	SELECT *
	FROM LOGIN
	ORDER BY LogInTime DESC;
END $$
delimiter ;
call twitter.getListOfLogInsDesc();
