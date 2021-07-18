create table Tweet_LOG(
	log_id int auto_increment not null,
	tweeter VARCHAR(20) NOT NULL,
	tweet_Id int NOT NULL unique,
	tweeted_date DATE NOT NULL,

	PRIMARY KEY (log_id),
	FOREIGN KEY (tweeter) REFERENCES USER(Username),
	FOREIGN KEY (tweet_Id) REFERENCES tweet(id) 
);