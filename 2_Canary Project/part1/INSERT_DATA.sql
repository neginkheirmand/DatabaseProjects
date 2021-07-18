
#fill the user table
INSERT INTO USER(Username, Name_, Surname, Pass, Date_Of_Birth, Bio)
VALUES  ("Heartbreaker"    		, "Abuzz", "su",  sha1("123456"), '2016-10-27', "Hello there" ),
        ("Ben Dover"       		, "ally", "gonzales",  sha1("000000000"), '1999-03-19', "Hello here" ),
        ("Berb DiWire"     		, "justin", "quinteros",  sha1("kL5LIH7CQib14SVri73EVpP4MPT1al37qzhMtKNUMrwTGM2gE8DjsK5NMuiqT77N2JQ4M9wPNIOsY69dr7bZzM1OrHRG0Brgq7q7Rh4QjjzB0RABPhbyGbbVaABFtgCz"), '1999-10-08', "Hello !there" ),
        ("Butt Smasher"    		, "taylor", "fernandez",  sha1("asdasdasdasd"), '2012-01-01', "Hello there" ),
        ("Arabic Denial"   		, "abys", "kertchner",  sha1("asdASD"), '2000-04-04', "Hello there" ),
        ("Bros Before Hoes"		, "chaos", "silva",  sha1("54321"), '2012-01-01', "Hello there" ),
        ("AlphabeticAfterimage", "holly" , "obama",  sha1("sugftwsvcxnb"), '2000-09-20', "Hello there" ),
        ("Anony Mouse"			, "camila", "quintana",  sha1("$WHRktlqYNbE"), '2009-03-02', "Hello there" ),
        ("Ass Ass In"			, "Abuzz", "cantona",  sha1("Ubl#M3sxWhVk"), '2000-11-16', "Hello there" ),
        ("Ass Whupper"			, "agustina", "cantona",  sha1("K#V!Yd4YlB5Q"), '2003-04-11', "Hello there" ),
        ("Ayam Taken"			, "zaira", "rodrigez",  sha1("NsK&D%x0^XwR"), '2004-01-23', "Hello there" ),
        ("Born Confused"		, "valentina", "ramirez",  sha1("EMStN4f9e*Zw`=t=baN"), '2007-04-02', "Hello there" ),
        ("BeenThere DoneThat"	, "valentina", "ramirez",  sha1("&+}\nP9%7e\M&Uyy2>?eWN+"), '2008-04-25', "Hello there" ),
        ("Born Confusedn"		, "valentina", "ramirez",  sha1("zg:!@v37Jz:E9ZY8A9A:"), '2006-08-10', "Hello there" ),
        ("Behind You"			, "valentina", "ramirez",  sha1("Bu&SK!/%<W}%gLP;yc*9)78"), '2006-06-21', "Hello there" ),
        ("Bad Karma"			, "valentina", "ramirez",  sha1("NsKBu&SK!/%<W}%gLP;yc*9)78E1Mx9"), '2005-11-03', "Hello there" ),
        ("Blurry Image"			, "valentina", "ramirez",  sha1("cSz6wfKuOoJQxY7zl4R1iAQydbk7SVklh86KZReeKxC8HvxoWSHpidY8KTlIy67QJUcq4H3osbCuCu8L4yAVVHWFS11huKoBi8Snx0279nldbpnrwyTSNTlCOzEcxe5t"), '2005-11-03', "Hello there" );

#fill the hashtag table
INSERT INTO HASHTAG(Content)
VALUES  ("WORTH"),
		("SWEET"),
		("style"),
		("Trust"),
		("Truth"),
		("Yummy"),
		("YOUNG"),
		("shINE"),
		("RENEW"),
		("pride"),
		("gaaai"),
		("RELAX"),
		("HaPPy");
        
#fill the following_data table
INSERT INTO FOLLOWING_DATA(Followed, Follower)
VALUES	("Heartbreaker", "Ben Dover"),
		("Heartbreaker", "Berb DiWire"),
		("Heartbreaker", "Butt Smasher"),
		("Heartbreaker", "Arabic Denial");
        
        
#fill the blocked_data table
INSERT INTO BLOCKED_DATA(Blocked, Blocker)
VALUES	("Ben Dover", "Heartbreaker");

#fill login data table
INSERT INTO LOGIN(Username)
VALUES	("Heartbreaker"),
		("Butt Smasher");

#fill the tweet table        
INSERT INTO TWEET(Content, Username, ParentID)
VALUES 	("My smile is a thrill, and I want to be famous. Looking for clammy permission, in a way.", "Heartbreaker", null),
		("My dad is getting old, and I want to go to Mars. We need perfect drugs, bro", "Heartbreaker", null),
		("My groove is a personal wish, and I want to move to a new town. Unlikely free shoes, IMHO.", "Heartbreaker", null),
		("My sister is so robust, and I want to go to Mars. No one cares about better pets, you see", "Heartbreaker", null),
		("My life is so robust, and I want to run a marathon. The world has creepy weather, for once. ", "Heartbreaker", null),
		("My home is a shadow, and I want to go to Mars. Laughable random drinks, you see." , "Heartbreaker", null);
        

