
-- substring, length, instr, 
-- trim,  locate, concat

-- numeric functions
-- single row numeric functions

select  11%2 from dual;

-- if decimal   .5>  upper convert
select round(11.5) from dual;

select round(12.4) from dual;

select round(12.62,1) from dual;

select round(12.64,2) from dual;

-- ( -1,-2) => before decimal valye will round off
select round(373.64,-2) from dual;

select floor(373.9999) from dual;

select  round(10.2945,1) from dual;
select  truncate(10.2945,2) from dual;

select pow(2,3) from dual;

-- % ( mod)  , round, floor, ceil
-- truncate, power

-- string,  numeric  ( single row function)

-- date function
select  now() from dual;

-- only date
select  curdate() from dual;

select  curtime() from dual;

select curdate()+2 from dual;

select adddate( now(), interval -2 month) from dual;

-- date_sub to subtract certain interval from file
select date_sub( now(), interval 2 year) from dual;

use sakila;
select * from actor;

select datediff( '2024-03-22',curdate()  ) from dual;


select dayofweek('2024-03-19') from dual;

select dayofyear('2024-12-31') from dual;

select * from film_actor
where year(last_update)=2006;


select extract(month from '2022-09-18'  ) from dual;

select * from inventory;


select dayofmonth(  now()   ) from dual;

use employees;
show tables;
select from_date,
datediff(now(), from_date)/7 from current_dept_emp;

select from_date,
timestampdiff(month, from_date,now()  )
from current_dept_emp;


select  timestampdiff(month, now(),'1996-05-19'  )
from dual;