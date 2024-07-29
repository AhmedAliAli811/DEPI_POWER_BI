use BikeStores;
go 

-- Assignment 4 --

-- Q1 --
select *
from sales.orders
where staff_id = 9

-- Q2 --
select first_name + ' ' + last_name as full_name
from sales.customers
where city = 'new york' and phone is not null

-- Q3 --
select distinct c.customer_id , c.first_name + ' ' + c.last_name as Full_name 
from sales.customers c join sales.orders o
on c.customer_id = o.customer_id
where o.store_id = 2

-- Q4 --
select distinct s.staff_id , s.first_name + ' ' + s.last_name as staff_name
from sales.orders o join sales.staffs s 
on o.staff_id = s.staff_id
join sales.order_items item
on o.order_id = item.item_id
where item.discount > 0.05

-- Q5 --
select distinct c.customer_id , c.first_name + ' ' + c.last_name as Full_name 
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id 
join sales.stores s 
on s.store_id = o.store_id
where s.store_name = 'Baldwin Bikes' or s.store_name = 'Santa Cruz Bikes'

-- Q6 --
select item_id , product_name 
from sales.order_items items join production.products p
on items.product_id = p.product_id
where discount > 0.05

-- Q7 --

select c.first_name , c.last_name , c.customer_id , o.shipped_date
from sales.customers c join sales.orders o
on c.customer_id = o.customer_id

-- Q8 --	
select s.first_name , s.last_name , o.customer_id , o.shipped_date
from sales.orders o join sales.staffs s
on o.staff_id = s.staff_id
where s.first_name = 'fabiola' or s.first_name = 'mireya'

-- Q9 --	
select s.first_name , s.last_name , o.customer_id , o.shipped_date
from sales.orders o join sales.staffs s
on o.staff_id = s.staff_id

-- Q10 --
select c.first_name + ' ' + c.last_name as customer_name , o.order_id , c.customer_id ,o.order_date , s.first_name + ' ' +s.last_name as staff_name
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id
join sales.staffs s 
on o.staff_id = s.staff_id

-- Q11 --
select count(*) as number_of_customers
from sales.customers

-- Q12 --
select count(*) as number_of_orders
from sales.orders

-- Q13 --
select top 1 o.store_id , s.store_name , count(o.store_id) as num_of_orders
from sales.orders o join sales.stores s 
on o.store_id = s.store_id
group by o.store_id , s.store_name
order by num_of_orders desc

-- Q14 --
select top 1 s2.store_id , s2.store_name , 
DATEPART(YEAR , o2.order_date) as order_year ,
DATEPART(Month , o2.order_date) as order_month,
count(o2.store_id) as num_of_orders
from sales.orders o2 join sales.stores s2
on o2.store_id = s2.store_id
where o2.store_id = (
select top 1 o.store_id 
from sales.orders o join sales.stores s 
on o.store_id = s.store_id
group by o.store_id , s.store_name
order by count(o.store_id) desc
)
group by s2.store_id , s2.store_name ,
DATEPART(YEAR , o2.order_date) ,
DATEPART(Month , o2.order_date)
order by count(o2.store_id) desc 


-- Q15 --
select top 10 c.customer_id ,
c.first_name + ' ' + c.last_name as customer_name ,
count(c.customer_id) as num_of_orders
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id
group by 
c.customer_id ,
c.first_name  ,
c.last_name
order by num_of_orders desc

-- Q16 --
select top 3 p.product_id , p.product_name , count(it.product_id) as Number_of_product_sales
from sales.orders o join sales.order_items it 
on o.order_id = it.item_id
join production.products p
on it.product_id = p.product_id
group by p.product_id , p.product_name
order by Number_of_product_sales desc

-- Q17 --

select c2.customer_id , min(o2.order_date) as first_order , max(o2.order_date) as last_order 
from sales.customers c2 join sales.orders o2 
on c2.customer_id = o2.customer_id

where c2.customer_id = 
(select top 1 c.customer_id
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id
group by 
c.customer_id ,
c.first_name  ,
c.last_name
order by c.customer_id , count(c.customer_id) desc
)
group by c2.customer_id 

-- Q18 --
select c.customer_id , c.first_name + ' ' +  c.last_name as customer_name , min(it1.list_price) as min_price , MAX(it2.list_price) as max_product
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id join sales.order_items it1 
on o.order_id = it1.order_id join sales.order_items it2
on o.order_id = it2.order_id
group by c.customer_id , c.first_name , c.last_name
order by c.customer_id

-- Q19 --

select it.product_id , p.product_name , count(it.product_id) as num_of_orders
from sales.order_items it join production.products p
on it.product_id  = p.product_id
group by it.product_id , p.product_name
having count(it.product_id) > 100

-- Q20 --
select distinct order_date
from sales.orders
order by order_date

-- Q21 --
select distinct b.* , c.* 
from production.products p join production.brands b 
on b.brand_id = p.brand_id join production.categories c
on p.category_id = c.category_id

-- Q22 --
select *
from sales.staffs s 
where s.manager_id = 2 and s.store_id = 1
order by first_name

-- Q23 --
select *
from production.products p
where (p.brand_id = 1 or p.brand_id = 9 ) and list_price between 199.99 and 499.99

-- Q24 --
select top 5 product_name
from production.products p
where model_year = 2018
order by list_price desc

-- Q25 --
select *
from sales.customers c
where c.first_name like '%t_' and c.zip_code like '11%'
order by c.first_name

-- Q26 --
select *
from production.products p
where p.list_price in (999.99 , 1999.99 , 2999.99)

-- Q27 --
select count(*) as num_of_products
from production.products p 
where p.product_name like 'Trek%' and p.list_price between 199.99 and 999.99

-- Q28 --
select p.product_name , sum(quantity) as quantity
from production.stocks st join production.products p
on st.product_id = p.product_id
where p.product_name like '%Ladies%'
group by p.product_name

-- Q29 --
select it.order_id,sum(it.quantity * it.list_price * (1 - it.discount)) AS total_net_value
from sales.order_items it
group by it.order_id
having sum(it.quantity * it.list_price * (1 - it.discount)) > 20000;

-- Q30 --
select  o.order_id , o.order_date , p.* , it.quantity
from sales.orders o join sales.order_items it
on o.order_id = it.order_id join production.products p
on it.product_id = p.product_id

-- Q31 --
select b.brand_id , b.brand_name , avg(p.list_price) as avg_price
from production.brands b join production.products p 
on b.brand_id = p.brand_id
group by b.brand_id , b.brand_name

-- Q32 --
select o.order_id, c.first_name + ' ' + c.last_name as customer_name, s.store_name,
sum(it.quantity) AS total_quantity,sum(it.quantity * it.list_price * (1 - it.discount)) AS total_net_value
from sales.customers c join sales.orders o
on c.customer_id = o.customer_id
join sales.order_items it
on o.order_id = it.order_id
join sales.stores s 
on o.store_id = s.store_id
group by o.order_id, c.first_name , c.last_name, s.store_name
order by o.order_id

-- Q33 -- 

select s.store_name , p.product_name
from production.products p left join sales.order_items it 
on p.product_id = it.product_id left join sales.orders o 
on o.order_id = it.order_id left join sales.stores s 
on s.store_id = o.store_id left join production.stocks st 
on s.store_id = st.store_id
where it.product_id is null or st.quantity = 0

-- Bonus --

-- Q1 --
select first_name + ' ' + last_name as [Full Customer Name ] , email , phone , state
from sales.customers
where phone is null
order by state

-- Q2 --
select top 10 product_name , model_year , list_price
from production.products 
order by list_price desc 

-- Q3 --
select *
from production.products 
where product_name like '%townie%'

-- Q4 --
select order_id , required_date , shipped_date , DATEDIFF(day , required_date ,  shipped_date ) as diff
from sales.orders 
where shipped_date > required_date

-- Q5 --
select distinct state
from sales.stores
where store_name like '%jeff%'

-- Q6 --
select order_id , order_date , store_id
from sales.orders o 
where datepart(month , o.order_date) = 6
and store_id not in (1 , 3)

 -- Q7 --
select c.* , p.*
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id join sales.order_items it 
on it.order_id = o.order_id join production.products p 
on p.product_id = it.product_id join production.categories cat
on cat.category_id = p.category_id
where cat.category_name like '%electric bikes%'
and c.city = 'new york'

-- Q8 --
select st.*
from sales.customers c join sales.orders o 
on c.customer_id = o.customer_id join sales.stores s
on o.store_id = s.store_id join sales.staffs st
on s.store_id = st.store_id
where c.zip_code = 11418 and s.store_name like '%Jeff’s %'

-- Q9 --
select s.store_id , s.store_name , p.product_id , p.product_name , st.quantity
from sales.stores s join production.stocks st
on s.store_id = st.store_id join production.products p 
on st.product_id = p.product_id
where st.quantity < 4

-- Q10 --
select *
from sales.customers c1 join sales.orders o1 
on c1.customer_id = o1.customer_id join sales.order_items it1 
on o1.order_id = it1.order_id join production.products p1 
on it1.product_id = p1.product_id join sales.orders o2
on c1.customer_id = o2.customer_id join sales.order_items it2
on o2.order_id = it2.order_id join production.products p2 
on it2.product_id = p2.product_id
where p1.product_name != p2.product_name and 
p1.product_name like '%Surly Straggler 650b - 2016%' and p2.product_name like '%Sun Bicycles Cruz 3 – 2017%'
