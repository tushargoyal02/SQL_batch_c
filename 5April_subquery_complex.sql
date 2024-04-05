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