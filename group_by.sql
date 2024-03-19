

-- functions
-- single row functions
-- string , numeric, date functions

-- multi row functions
-- applies on multi rows => return one or more output

use sakila;
select  distinct customer_id from payment;


select  distinct(customer_id) from payment;

select * from payment;
-- operation  -> multi row function
select  count(payment_id) from payment;

select count(actor_id) from actor;

select  sum(amount) from payment;

select  count(amount) from payment;

select  avg(amount) from payment;

select  sum(amount)/count(amount) from payment;

select count(customer_id) from payment;

-- finding unique customer_id
select count( distinct(customer_id) )  from payment;

select * from payment
where customer_id=1;

-- total count of customer_id =1 to 599
select count(customer_id) from payment
where customer_id=3;


select distinct(customer_id)  from payment;

-- group by
select   customer_id,count(*)  from payment
group by customer_id;


select   customer_id,count(*),sum(amount)  from payment
group by customer_id;

select sum(amount) from payment where customer_id=3;

-- sort
select  * from actor order by actor_id desc;

select first_name, count(*) from 
actor group by first_name order by count(*) desc,
first_name;

--  on 2 column  sort
select * from payment
order by customer_id, amount desc;

-- select can use only column used in group by
-- other column can be used with the group by function
--        like  count , sum, avg, max
select customer_id,count(payment_id) from payment
group by customer_id;

-- customer_id  => who was come more than 30 time
-- conditionn  gorup by function pr apply ( having
select  customer_id,count(*)
from payment  group by customer_id
having count(*)>30;

select  customer_id,sum(amount)
from payment  group by customer_id
having sum(amount)>120;

select  customer_id,sum(amount)
from payment  group by customer_id
having customer_id=2 or customer_id=3;

select customer_id,sum(amount) from payment
where customer_id=1 or customer_id=2
group by customer_id;






