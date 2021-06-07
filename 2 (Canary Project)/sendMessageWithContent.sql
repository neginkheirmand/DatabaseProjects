#this one will send a message to a user 
				###		EXAMPLE WITH CONTENT
INSERT INTO
  Message (
	Content, Sender, Receiver
  )
SELECT
  "Hi Heartbreaker, please don't break my heart" , "Heartbreaker", "newUserCreated"
