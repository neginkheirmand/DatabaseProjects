#this one will follow someone for the user if isent already following that person
INSERT INTO
  FOLLOWING_DATA (
    Follower, Followed
  )
SELECT
  "AlphabeticAfterimage", "Berb DiWire"
WHERE
  NOT EXISTS (SELECT * FROM FOLLOWING_DATA WHERE Follower = "AlphabeticAfterimage" AND Followed = "Berb DiWire")