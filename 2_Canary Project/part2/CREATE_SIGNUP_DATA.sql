CREATE TABLE SIGNUP_DATA(
ID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20) NOT NULL,
SubTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (ID)
);

#since there are some data already inserted in the user table
INSERT INTO signup_data(Username, SubTime)
SELECT Username, SUBTIME
		FROM USER
