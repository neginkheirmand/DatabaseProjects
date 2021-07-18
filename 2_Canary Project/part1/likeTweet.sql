 #this one will like someone's tweet for the user if the user hasent been blocked 
 INSERT INTO
   liked_data (
     IDTweet, LikedBy
   )
 SELECT
   2 , "Berb DiWire"
 WHERE
   NOT EXISTS (
 		#the user liking in the list of blocked users by the tweeter
         select blocked, blocker 
 		from blocked_data
         where blocked = "Berb DiWire" 
 			and blocker = ( select Username
 							from tweet
 							where id= 2)
         )
         and
         #this tweet should not be already liked by this user
 	not exists( select *
 				from liked_data
 				where IDTweet = 2 and LikedBy="Berb DiWire" )
                 ;