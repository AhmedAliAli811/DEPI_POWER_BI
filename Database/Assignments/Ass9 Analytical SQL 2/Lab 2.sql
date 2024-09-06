-- Q1 --
select userId, sessionId ,  (max(ts) - min(ts)) as duration , rank() over (order by (max(ts) - min(ts)) desc)
FROM Songs_Events
GROUP BY userId, sessionId
limit 1 


-- Q2 --

 