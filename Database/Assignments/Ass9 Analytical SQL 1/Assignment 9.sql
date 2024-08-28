-- Q1 --

select userid ,
	   CONCAT(firstname , ' ' , lastname )as user_name ,
	   count(distinct song) as num_distinct_songs, 
	   dense_rank() over (order by count(distinct song) desc ) as rank
from events 
group by userid , firstname , lastname

-- Q2 --

select userid ,
	   CONCAT(firstname , ' ' , lastname )as user_name ,
	   count(distinct song) as num_distinct_songs, 
	   row_number() over (order by count(distinct song) desc ) as rank
from events 
group by userid , firstname , lastname

-- Q3 --
select userid ,
	   CONCAT(firstname , ' ' , lastname )as user_name ,
	   sessionid , 
	   song , 
	   lead(song , 1 , 'No Next') over (partition by events.userid , events.sessionid order by timestamp)
	   
from events
order by userid , sessionid , timestamp 

-- Q4 --
select distinct e.userid ,
       CONCAT(firstname , ' ' , lastname )as user_name ,
	   ranks.num_of_paid_songs , '3rd highest paid song listener'
from (
	select e.userid ,
		   count(distinct song) as num_of_paid_songs,
		   dense_rank() over (order by count(distinct song) desc) as rank
	from events e
	where level = 'paid'
	group by e.userid
			) ranks 
join events e on e.userid = ranks.userid
where ranks.rank = 3

-- Q5 --
select distinct userid ,
	   CONCAT(firstname , ' ' , lastname )as user_name ,
	   sessionid ,
	   first_value(song) over (partition by userid , sessionid order by timestamp) as first_song_at_session,
	   last_value(song) over (partition by userid , sessionid order by timestamp ) as last_song_at_session

from events 
order by userid