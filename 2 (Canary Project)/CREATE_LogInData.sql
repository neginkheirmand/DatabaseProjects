CREATE TABLE LOGIN(
ID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20),
LogInTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (ID),
FOREIGN KEY (Username) REFERENCES USER(Username)
);