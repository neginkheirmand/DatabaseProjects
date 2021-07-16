GetLastLogIn.sql									->works like a charm
CREATE_SIGNUP_DATA.sql								->worked allright
SET_log_bin_trust_function_creators ToOne.sql		->works babe
CreateAcount.sql									->great
after_createAccount_trigger_signup_data				-> great
logInToPlatformQuery								->nice
getListOfLogInsDesc				-> not tested, not validated
getListOfMyTweets				-> not tested, not validated
followSomeUser					-> not tested, not validated
stopFollowingUser				-> not tested, not validated
BlockSomeUser					-> not tested, not validated
stopBlockingSomeUser			-> not tested, not validated
getListOfFollowedByUserActivity	-> not tested, not validated
getActivityOfSpecificUser		-> not tested, not validated
CREATE Tweet_LOG				-> it a query to create table no need for validation


			NEED TO ADD VALIDATION FOR USER IN ALL THE FUNCTIONS AND PROCEDURES
			
tweet_func								-> works babe
after_tweet_trigger_1					-> works yaiy
after_tweet_trigger_2_insert_hashtags	-> this trigger calls the get Hashtag procedure	 which is supposed to add the hashtags on its own

used this https://www.oreilly.com/library/view/mysql-cookbook/0596001452/ch04s08.html for the regexp 


getHashtags -> works like a charm

isUserBlocked 					-> function that return 1 if the user is blocked and 0 if its not, not tested
getTweeter						-> function that returns the user of a tweet using tweetID and if tweet does not exist returns null
createOpinionAsTweet			-> function that creates an opinion on a tweet if the data is valid and return 1 and if data is invalid returns 0
getListOfOpinionsOverSpecificTweet	-> procedure that gets opinion over specific tweet, validated and tested
getLisTOfTweetsByHashtag			-> procedure that gets tweetswith specific hashtags on them, validated and tested
likeTweet.sql						-> function to like a tweet
getNumLikesOfTweet