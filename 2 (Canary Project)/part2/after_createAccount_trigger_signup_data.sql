CREATE TRIGGER after_createAccount_trigger_signup_data
    AFTER INSERT ON User
    FOR EACH ROW 
 INSERT INTO signup_data
 SET Username = NEW.Username;
 # since its an 'after' trigger there is no need to validate the data