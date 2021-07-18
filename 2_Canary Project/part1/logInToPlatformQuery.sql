# this query adds a new login data to the table and makes sure the user actually exists in the table of users
#this first one wont do anything since the user doesnt even exist in the User table
INSERT INTO
  LOGIN (
    Username
  )
SELECT
  "555"
WHERE
  EXISTS (SELECT * FROM User WHERE Username = '555' AND Pass = sha1('test 1234'));

#this one will also do nothing since the pass is not correct (LOL, you dumbass, you forgot your pass)
INSERT INTO
  LOGIN (
    Username
  )
SELECT
  "Behind You"
WHERE
  EXISTS (SELECT * FROM User WHERE Username = 'Behind You' AND Pass = sha1('test 1234'));


#this one will insert a new log in data for the user since the pass and the user are correct
INSERT INTO
  LOGIN (
    Username
  )
SELECT
  "AlphabeticAfterimage"
WHERE
  EXISTS (SELECT * FROM User WHERE Username = "AlphabeticAfterimage" AND Pass = sha1('sugftwsvcxnb'));
