#this query has 2 parts, first you make sure the foreign keys (the hashtag specified) actually exists and then you add them to the table 
#of hashtag data 
insert ignore into hashtag(Content)
values	("HaPPy"),
		("shINE"),
		("emmmm");

insert into hashtag_data(idOfTweet, hashtagUsed)
Values	(1, "HaPPy"),
		(1, "shINE"),
        (1, "emmmm");