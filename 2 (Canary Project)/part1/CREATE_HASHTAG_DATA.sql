create table HASHTAG_DATA(
ID int NOT NUll auto_increment,
idOfTweet int NOT NULL,
hashtagUsed VARCHAR(5) NOT NULL,

PRIMARY KEY (ID),
FOREIGN KEY (idOfTweet) REFERENCES TWEET(ID),
FOREIGN KEY (hashtagUsed) REFERENCES hashtag(Content)
);
