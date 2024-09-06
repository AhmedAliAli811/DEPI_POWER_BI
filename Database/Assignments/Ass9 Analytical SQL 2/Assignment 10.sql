WITH MSevents
       AS 
(
	SELECT id , time_id , user_id , customer_id , client_id , event_type , event_id
           FROM(VALUES
				(1,'366-QBG','2020-02-28', 'Sendit', 'Desktop',  'message sent' , 3),
				(2,'367-QBG','2020-02-28', 'Connectix', 'mobile',  'file received' , 2),
				(3,'368-QBG','2020-04-03', 'Zoomit', 'Desktop', 'video call received', 7), 
				(4,'366-QBH','2020-04-02', 'Connectix', 'Desktop', 'video call received', 7), 
				(5,'362-QBG','2020-02-06', 'Sendit', 'Desktop',  'video call received', 7), 
				(6,'316-QBG','2020-02-27', 'Connectix', 'Desktop' , 'file received' , 2), 
				(7,'456-QBG','2020-04-03', 'Connectix', 'Desktop', 'video call received', 7),
				(8,'366-FBG','2020-03-01', 'Connectix', 'mobile' ,  'message received' , 4),
				(9,'366-QMG','2020-04-02', 'Connectix', 'mobile', 'video call received', 7),
				(10,'336-QBG','2020-04-21', 'Sendit' , 'Desktop',  'file received' , 2))
				Val(id , time_id , user_id , customer_id , client_id , event_type , event_id)
				),
cte as (
select user_id , count(*) as total_events , sum( case when  event_type in ('video call received', 'video call sent','voice call received', 'voice call sent' ) 
                                                then 1 else 0 end) as count_our_events_types ,
												
												1.0 * (sum( case when  event_type in ('video call received', 'video call sent','voice call received', 'voice call sent' ) 
                                                then 1 else 0 end)) / count(*)  as percentage_of_our_events 
from MSevents
group by user_id
)

select client_id , count(*) as count_of_popular_client_types
from MSevents where user_id in (select user_id from cte where percentage_of_our_events >= 0.5)
group by client_id
order by count(*) desc 
Limit 1