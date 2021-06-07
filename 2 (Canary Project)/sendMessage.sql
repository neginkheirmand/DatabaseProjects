#this one will send a message to a user 
# the receiving persong should not have blocked the sender and if a tweet is used the tweeter shouldn't have blocked the sender 

-- test case for
-- simple message  =>   2, "Heartbreaker", "Born Confused"
-- the tweeter blocked the sender =>   16, "Heartbreaker", "Born Confused"
-- the receiver blocked the sender =>   16, "Heartbreaker", "BeenThere DoneThat"

				###		EXAMPLE WITH TWEET
INSERT INTO
  Message (
	IDTweet, Sender, Receiver
  )
SELECT
  2 , "Heartbreaker", "Born Confused"
WHERE
	NOT EXISTS (	SELECT * 
					FROM blocked_data 
					WHERE Blocked = "Heartbreaker" AND Blocker = "Born Confused") AND
	NOT EXISTS(  	SELECT *
					FROM blocked_data 
                    WHERE Blocked = "Heartbreaker" 
						AND Blocker = (	select Username
										from tweet
										where ID = 2
											))
