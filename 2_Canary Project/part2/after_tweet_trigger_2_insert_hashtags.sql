CREATE TRIGGER after_tweet_trigger_2_insert_hashtags
    AFTER INSERT ON Tweet
    FOR EACH ROW 
call getHashtags(NEW.Content, NEW.ID)
 # since its an 'after' trigger there is no need to validate the data