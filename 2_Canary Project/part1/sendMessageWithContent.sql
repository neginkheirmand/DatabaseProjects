#this one will send a message to a user 
				###		EXAMPLE WITH CONTENT
INSERT INTO
  Message (
	Content, Sender, Receiver
  )
SELECT
  "Hi newUserCreated, nice to meet you" , "newUserCreated", "Heartbreaker"
