#this query is to show a user with username "Heartbreaker" all its follower's username 
select follower 
from following_data
where Followed ="Heartbreaker"