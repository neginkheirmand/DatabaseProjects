
# TwitteringConsole  

![image](https://user-images.githubusercontent.com/56405454/126060603-0b940ed6-7cfa-4e40-aff9-842706dddb28.png)


## Tables


this table contains data about the **Block User** feature
**BLOCKED_DATA**( ID INT NOT NULL AUTO_INCREMENT,
Blocked VARCHAR(20) NOT NULL,
Blocker VARCHAR(20) NOT NULL)
so when a user blockes another person the data about that process is saved in this table.
the primmary key being id

this table contains data about the **Follow User** feature
**FOLLOWING_DATA**(
ID INT NOT NULL AUTO_INCREMENT,
Followed VARCHAR(20) NOT NULL,
Follower VARCHAR(20) NOT NULL)
so when a user follows another person the data about that process is saved in this table.
the primmary key being id

this table contains data about the **Hashtag** feature
**HASHTAG**(
Content VARCHAR(5) NOT NULL)
so when a user tweets some content with hashtags that hashtag is inserted in this table(if doesn't already exist). The hashtag is a 6 lengthed string starting with #
the primmary key being content


this table contains data about the **hashtag in tweet** feature
 **HASHTAG_DATA**(
ID int NOT NUll auto_increment,
idOfTweet int NOT NULL,
hashtagUsed VARCHAR(5) NOT NULL)
so when a user tweets some content with hashtags that hashtag with the id of tweet is inserted in this table.
the primmary key being ID

this table contains data about the **Like Tweet** feature
**LIKED_DATA**(
ID INT NOT NULL AUTO_INCREMENT,
IDTweet INT NOT NULL,
LikedBy VARCHAR(20) NOT NULL)
so when a user likes some tweet the data about that process is saved in this table.
the primmary key being id

this table contains data about the **LogIn** feature
**LOGIN**(
ID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20),
LogInTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
so when a user logs in, the data about that process is saved in this table.
the primmary key being id

this table contains data about the **Send Message** feature
**MESSAGE**(
ID INT NOT NULL AUTO_INCREMENT,
IDTweet INT,
Content VARCHAR(256),
Sender VARCHAR(20),
Receiver VARCHAR(20),
SendTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
so when a user Sends a valid Message to another user, the data about that process is saved in this table.
the primmary key being id

this table contains data about the **Sign Up Log** feature
**SIGNUP_DATA**(
ID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20) NOT NULL,
SubTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
so each time a user sign up the log for that process is logged in this table
the primmary key being id

this table contains data about the **Twittering ** feature
**TWEET**(
ID INT NOT NULL AUTO_INCREMENT,
ParentID int DEFAULT NULL,
Content VARCHAR(256),
Username VARCHAR(20) NOT NULL,
TwittedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
This is one of the most important tables of the database, holds info about the tweets of this platform. The primary key is Id. 

this table contains data about the **User Role in Platform** Feature.
**USER**(
Username VARCHAR(20) NOT NULL,
Name_ VARCHAR(20) NOT NULL,
Surname VARCHAR(20) NOT NULL,
Pass VARCHAR(40) NOT NULL, #since the value of the 128 character is passed throw a sha1 function the output will be of fixed lenght of 40
Date_Of_Birth DATE NOT NULL,
SubTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Bio VARCHAR(64))
This is one of the most important tables of the database, holds info about users public information. Since the Username is unique its also the primary key of this table. 

this table contains data about the **Tweet Log** Feature.
**Tweet_LOG**(
log_id int auto_increment not null,
tweeter VARCHAR(20) NOT NULL,
tweet_Id int NOT NULL unique,
tweeted_date DATE NOT NULL)
each time a user tweets the log is logged in this table.
the primary key is log_id



## project documentation:
[doc1]()
[doc1]()


---




[1]: https://github.com/neginkheirmand
[![github](https://github.com/neginkheirmand/DatabaseProjects/blob/master/2_Canary%20Project/doc/red%20twittering%20bird%20icon.png?raw=true)][1]
