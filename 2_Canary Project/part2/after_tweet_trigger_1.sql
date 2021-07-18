CREATE TRIGGER after_tweet_trigger_1
    AFTER INSERT ON Tweet
    FOR EACH ROW 
 INSERT INTO tweet_log( tweeter , tweet_Id , tweeted_date)
 values( NEW.Username , NEW.ID , NOW());
 
 # since its an 'after' trigger there is no need to validate the data