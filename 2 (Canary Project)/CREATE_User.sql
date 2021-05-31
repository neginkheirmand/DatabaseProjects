CREATE TABLE USER(
Username VARCHAR(20) NOT NULL,
Name VARCHAR(20) NOT NULL,
Surname VARCHAR(20) NOT NULL,
Pass VARCHAR(40) NOT NULL, #since the value of the 128 character is passed throw a sha1 function the output will be of fixed lenght of 40
Date_Of_Birth DATE NOT NULL,
SubTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Bio VARCHAR(64),

PRIMARY KEY (Username)
);