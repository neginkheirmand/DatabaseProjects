# this procedure is supposed to find all the acceptable hastags in a string
# insert them into hashtag table if not existent and then insert them into hashtag_data table
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHashtags`(content_ varchar(256), tweetID int)
BEGIN
	DECLARE temp varchar(5);
	DECLARE numSign varchar(1);
	DECLARE i INT Default 0 ;
	simple_loop: LOOP
		SET i = i + 1 ;
		IF i +6 > length(content_) + 1 THEN
			LEAVE simple_loop;
		END IF;
		SET numSign = substring(content_, i , 1 );
		SET temp = substring(content_, i+1 , 5 );
        if temp regexp '^[A-Za-z]+$' then
			if numSign regexp '^#' then
				# insert hashtag into table if does not exist
                insert into hashtag(Content) 
				select(temp)
                where not exists(select * from hashtag where hashtag.Content = temp);
                #anyway insert it into hashtag_data
                insert into hashtag_data(idoftweet, hashtagUsed)
                values( tweetID , temp);
            end if;
		end if;
	END LOOP simple_loop;
END