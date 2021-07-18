#this one will block someone for the user if it sent already blocking that person
INSERT INTO
  blocked_data (
    Blocked, Blocker
  )
SELECT
  "Anony Mouse", "Heartbreaker"
WHERE
  NOT EXISTS (SELECT * FROM blocked_data WHERE Blocked = "Anony Mouse" AND Blocker = "Heartbreaker");
