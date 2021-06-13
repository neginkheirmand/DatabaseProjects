CREATE TABLE TWEET(
ID INT NOT NULL AUTO_INCREMENT,
ParentID int DEFAULT NULL,
Content VARCHAR(256),
Username VARCHAR(20) NOT NULL,
TwittedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
##LATER THE HASTAGS COLUMN WILL BE ADDED

PRIMARY KEY (ID),
FOREIGN KEY (ParentID) REFERENCES TWEET(ID),
FOREIGN KEY (Username) REFERENCES USER(Username)
);