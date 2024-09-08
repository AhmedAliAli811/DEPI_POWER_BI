-- Q1 --
select userid, sessionid, (max(ts) - min(ts)) as session_duration
from songs_events
group by userid, sessionid
order by session_duration desc
limit 1;

-- Q2 --

select song ,
count (*) over (partition by userid , sessionid order by timezone('America/New_york' , to_timestamp(ts / 1000))
				RANGE BETWEEN INTERVAL '1' hour PRECEDING AND INTERVAL '1' hour FOLLOWING
 ) as count_songs_within_hour 
from songs_events
order by sessionId, ts;



