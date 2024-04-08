use employees;

show tables;


select * from employees;
-- e,[ 10003   => hiring_date  1986-08-28
select hire_date from employees where emp_no=10003;  

select * from employees where hire_date>"1986-08-28";

select * from employees where first_name="Georgi" and birth_date="1953-09-02" ;
-- nested sub query
select * from employees 
where hire_date> ( select hire_date 
from employees where emp_no=10003);

-- nested => result 
drop table a;
create table a(id int);
select * from a;
insert into a values(null),(10),(29),(31),(4),(90),(30);

create table b(newid int);
insert into b values(10),(20),(30),(4),(5);

select * from a;
select * from a where id IN (select * from b where newid>=10);

-- > any  ( more than the minimum value of result)
-- < any  ( less than the maximum value of result set

-- < all ( less than the min of result set)
-- > all ( more than the max of result set
select * from a where id >=ALL (select * from b where newid>=10);
select * from b where newid>=10;

select * from b 
where newid =ANY (select id from a);

select id from a where id is not null;

select * from a; 
select * from b 
where newid < ALL (select id from a);

select * from b;
select * from b 
where newid IN (select id from a);

use employees;





use employees;
select * from employees;
select * from titles;

desc titles;
-- nested queries


select e.emp_no, first_name, hire_date, t.title
from employees as e inner join titles t
where (e.emp_no=t.emp_no);

select e.emp_no, first_name, hire_date, t.title
from employees as e inner join titles t
where (e.emp_no=t.emp_no) and title="Assistant Engineer"
and hire_date>any 
(select hire_date
from employees as e inner join titles t
where (e.emp_no=t.emp_no) and title="Manager");

select hire_date
from employees as e inner join titles t
where (e.emp_no=t.emp_no) and title="Manager";


use employees;
SELECT emp_no, first_name, last_name, hire_date
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer'
AND hire_date < ANY (SELECT hire_date FROM
employees JOIN titles USING (emp_no)
WHERE title = 'Manager')
order by hire_date desc ;

SELECT max(hire_date) FROM
employees JOIN titles USING (emp_no)
WHERE title = 'Manager';

show tables;
select * from titles;
-- title == emp_Np 10001
select title from titles where emp_no in (10001,10002);

-- subquery return 1 row => = , >, <, >=,<= 
select * from titles 
where title =  (select title from titles where emp_no in (10001,10002));

select title from titles where emp_no in (10001,10002);
select * from titles 
where title =ANY  (select title from titles where emp_no in (10001,10002));

select s.emp_no,first_name,salary from salaries s join employees as e
where (s.emp_no=e.emp_no) and s.emp_no=10002  
	and salary<(select max(salary) from salaries where emp_no=10002); 


select s.emp_no,first_name,salary from salaries s join employees as e
where (s.emp_no=e.emp_no) and s.emp_no=10002  
	and salary<any(select salary from salaries where emp_no=10002); 

-- manager data

select e.emp_no, first_name, title
from employees e join titles t
where(e.emp_no=t.emp_no) and title= "Manager"
and e.emp_no in (
	select e.emp_no
	from employees e join titles t
	where(e.emp_no=t.emp_no) and title <> "Manager");

select e.emp_no, first_name, title
from employees e join titles t
where(e.emp_no=t.emp_no) and title <> "Manager" and e.emp_no=110022;

select * from salaries 
where salary <=ANY ( select salary from salaries where emp_no=10002)
order by salary desc;

-- new 
SELECT emp_no, first_name, last_name,title
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND emp_no = ANY (SELECT emp_no FROM employees
JOIN titles USING (emp_no) WHERE
title <> 'Manager');

-- join part here
SELECT DISTINCT emp_no, first_name, last_name
FROM employees JOIN titles mgr USING (emp_no)
JOIN titles nonmgr USING (emp_no)
WHERE mgr.title = 'Manager'
AND nonmgr.title <> 'Manager';
select emp_no, first_name,tile 
where title="Manager" and 
emp_no
select e.emp_no
from employees e join titles t
where (e.emp_no=t.emp_no) and and title!="Manager";

-- ALL condition
SELECT emp_no, first_name, last_name, hire_date
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer'
AND hire_date < ALL (SELECT hire_date FROM
employees JOIN titles USING (emp_no)
 WHERE title = 'Manager');

use employees;
-- alternative check
(SELECT 'Assistant Engineer' AS title,
MIN(hire_date) AS mhd FROM employees
JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer')
UNION
(SELECT 'Manager' title, MIN(hire_date) mhd FROM employees
JOIN titles USING (emp_no)
WHERE title = 'Manager');

use employees;

show tables;
select * from titles;
select * from titles where emp_no=110022;

select mgr.emp_no, mgr.title, mgr.from_date, year(mgr.from_date), 
other.title,year(other.from_date)
from titles as mgr join titles as other
where(mgr.emp_no=other.emp_no) and mgr.title="Manager"
and mgr.title != other.title;

--  manager who has worked on other position 
-- and got promoted in the same year
select mgr.emp_no, mgr.title, year(mgr.from_date)
from titles as mgr where mgr.title="Manager"
and (mgr.emp_no, year(mgr.from_date) ) in (select emp_no,year(from_date)
from titles  where title!="Manager");

select mgr.emp_no, mgr.title
from titles as mgr where mgr.title!="Manager";



-- Other here ( ROW SubQuery )
SELECT mgr.emp_no, year(mgr.from_date),year(other.from_date),
 mgr.title,other.title AS fd
FROM titles AS mgr, titles AS other
where mgr.emp_no= other.emp_no and mgr.title="Manager"
and mgr.title<>other.title
and year(mgr.from_date)=year(other.from_date);

SELECT mgr.emp_no, YEAR(mgr.from_date) AS fd
FROM titles AS mgr, titles AS other
WHERE mgr.emp_no = other.emp_no
AND mgr.title = 'Manager'
AND mgr.title <> other.title
AND YEAR(mgr.from_date) = YEAR(other.from_date);

select mgr.emp_no, mgr.title, other.emp_no, other.title
from titles mgr, titles as other
where(mgr.emp_no=other.emp_no) and mgr.title="Manager"
and mgr.title<>other.title;


SELECT emp_no, YEAR(from_date),title FROM titles WHERE title <> 'Manager';

SELECT emp_no, YEAR(from_date) AS fd FROM titles 
WHERE title = 'Manager'
and (emp_no, year(from_date)) IN
	(SELECT emp_no, YEAR(from_date) FROM titles 
		WHERE title <> 'Manager');

select * from employees
where (emp_no, year(hire_date)) in
( SELECT emp_no, YEAR(from_date) FROM titles  
		WHERE title <> 'Manager');

-- alternative ( row subquery)
 SELECT emp_no, YEAR(from_date) AS fd FROM titles WHERE title = 'Manager' AND
(emp_no, YEAR(from_date)) IN
	(SELECT emp_no, YEAR(from_date) FROM titles WHERE title <> 'Manager');
    
show tables;

select salary, count(salary)
from salaries group by salary
having 
count(salary) >= (select count(salary) from salaries
					where salary=10006 group by salary);
                    
select * from salaries;


select emp_no, sum(salary)
from salaries group by emp_no
having sum(salary)> (select sum(salary) from salaries
					 where emp_no=10006 group by emp_no);

-- here if you see ( we are looking an other way for the query with 
-- where clause  - 10006
-- get the emp_no, sum of salary 
-- 
select * from salaries;


 SELECT employees.emp_no,first_name, last_name
FROM employees, titles where (employees.emp_no = titles.emp_no);

-- scaler
-- multi-row subquery  ( ANY, ALL
-- row subquery
use employees;
select * from employees;
SELECT employees.emp_no, first_name,last_name,title
FROM employees, titles
where employees.emp_no=titles.emp_no and first_name="Georgi"
and last_name="Klassen" and title="Staff";

-- first="JOHN" and last_nam="Klassen
--  (first,last_name)=("JOHN","Klassen")
SELECT employees.emp_no,first_name, last_name
FROM employees, titles
WHERE (employees.emp_no, first_name, last_name, title) =
(titles.emp_no, 'Georgi', 'Klassen', 'Staff');


use sakila;
select count(*) from film
where exists (select * from test);


--  In this section, you’ll learn about a fourth type, the correlated subquery, where a table used in the outer query is referenced in the subquery.
/*
Co-related query
*/

-- exists keyword
show tables;
select * from dept_emp where emp_no < 100;

select count(*) from departments
where exists( select * from dept_emp where emp_no < 100) ;

SELECT title FROM film
WHERE EXISTS (SELECT * FROM film WHERE title = 'IS THIS A MOVIE?');

use sakila;
show tables;
SELECT first_name, last_name FROM staff;
select * from customer where first_name="Jon" ;
SELECT first_name, last_name FROM staff
WHERE EXISTS (SELECT * FROM customer
WHERE customer.first_name = staff.first_name
AND customer.last_name = staff.last_name);

SELECT * FROM customer, customer as staff
WHERE customer.first_name = staff.first_name
AND customer.last_name = staff.last_name;

SELECT COUNT(*) FROM film WHERE EXISTS
(SELECT film_id FROM inventory
WHERE inventory.film_id = film.film_id
GROUP BY film_id HAVING COUNT(*) >= 2);

select count(*) from film where  exists
 ( select count(*) from inventory , film
	where inventory.film_id = film.film_id 
    group by inventory.film_id having count(*) >8);

select count(*) from inventory , film
	where inventory.film_id = film.film_id group by film.film_id
    having count(*) >2;

SELECT inventory.film_id,count(*) FROM inventory, film
WHERE inventory.film_id = film.film_id
GROUP BY film_id;

SELECT emp_no, first_name, last_name
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND emp_no IN (SELECT emp_no FROM employees
JOIN titles USING (emp_no) WHERE
title <> 'Manager');

SELECT emp_no, first_name, last_name,title
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager';

use employees;
-- using corelated query
SELECT emp_no, first_name, last_name
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND EXISTS (SELECT emp_no FROM titles
WHERE titles.emp_no = employees.emp_no
AND title <> 'Manager');

use employees;
select birthy from 
(select emp_no, year(birth_date)  as birthy from employees) as xyz; 

-- Nested Query in FROM Clause
 SELECT emp_no, monthly_salary FROM
(SELECT emp_no, salary/12 AS monthly_salary FROM salaries) AS ms
LIMIT 5;

-- alias should be created here ( Otherwise will give an error)


-- we want to find out the average sum a film brings us through rentals
use sakila;

-- gross amount
select avg(newamount) from 
(
	SELECT  film_id,sum(amount) as newamount 
	FROM payment JOIN rental USING (rental_id)
	JOIN inventory USING (inventory_id) JOIN film USING (film_id)
	group by film_id  ) as groupMovie;

use sakila;
show tables;
select payment_id, rental_id, amount from payment;
desc payment;


select 
	case 
    when rental_id =76 then rental_id+10
    when rental_id between 1000 and 1500 then rental_id+100
    else rental_id
    end "newcol",
	rental_id,payment_id, amount from payment;

use employees;
show tables;
select * from current_dept_emp;
select * from employees;
-- select , constraint, joins, group by,
-- data types
-- string function, round

select floor( 192.16) from dual;
select round( 192.48,1) from dual;

select round( 192.439,2) from dual;
select round( 177.439,-2) from dual;
select round( 677.439,-3) from dual;

select mod( 7,2) from dual;
select truncate( 679.429,-1) from dual;
--  200
select 
	case rental_id
    when 76 then rental_id+10
    when 1000 then rental_id+100
    else rental_id
    end "newcol",
	rental_id,payment_id, amount from payment;



SELECT sum(amount),film_id 
FROM payment JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id) group by film_id ;

-- final query
SELECT AVG(gross) FROM
(SELECT SUM(amount) AS gross
FROM payment JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY film_id) AS gross_amount;


-- With subqueries in FROM clauses, you can return a scalar value, a set of column values, 
-- more than one row, or even a whole table

-- we didn't get the data for category table which customer has not rented
SELECT cat.name AS category_name, COUNT(cat.category_id) AS cnt
FROM category AS cat LEFT JOIN film_category USING (category_id)
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
left JOIN customer using (customer_id)
WHERE customer.email = 'WESLEY.BULL@sakilacustomer.org'
GROUP BY category_name ORDER BY cnt DESC;

-- subquery with nested joins
SELECT cat.name AS category_name, cnt
FROM category AS cat
    LEFT JOIN (SELECT cat.name, COUNT(cat.category_id) AS cnt
    FROM category AS cat
    LEFT JOIN film_category USING (category_id)
    LEFT JOIN inventory USING (film_id)
    LEFT JOIN rental USING (inventory_id)
    JOIN customer cs ON rental.customer_id = cs.customer_id
    WHERE cs.email = 'WESLEY.BULL@sakilacustomer.org'
    GROUP BY cat.name) customer_cat USING (name)
    ORDER BY cnt DESC;
    
-- USER VARIABLES
/*
-- save values that are returned from queries.
-- you can easily use a value in a later query.
-- want to save a result for later display.
*/

SELECT title FROM film WHERE film_id = 1;
-- variable here
SELECT @film:=title FROM film WHERE film_id = 1;
show warnings;

-- later on use it
select @film;


-- creating variable with other method
SET @film := (SELECT title FROM film WHERE film_id = 1);
select @film;


-- third mechanism
SELECT title INTO @film FROM film WHERE film_id = 1;
select @film;

SET @counter = 0, @age := 1;

select * from actor where actor_id=@age;

-- SELECT 0, 23 INTO @counter, @age;

-- one of the best example here
SELECT MAX(rental_date) INTO @recent FROM rental
JOIN customer USING (customer_id) WHERE email = 'WESLEY.BULL@sakilacustomer.org';

-- using variables here
SELECT title FROM film JOIN inventory USING (film_id)
JOIN rental USING (inventory_id) JOIN customer USING (customer_id)
WHERE email = 'WESLEY.BULL@sakilacustomer.org' 
AND rental_date = @recent;

use sakila;
-- You should avoid trying to both assign a value to a variable and use the variable as part of a SELECT query. 
 SELECT @fid, @fid:=film.film_id, @fid FROM film, inventory
WHERE inventory.film_id = @fid;

-- getting  result now
SELECT @fid, @fid:=film.film_id, @fid FROM film, inventory
WHERE inventory.film_id = film.film_id LIMIT 20;