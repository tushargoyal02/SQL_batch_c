-- windows function

# aggregate function => 



create database regex;
use regex;
drop table if exists employees;
create table employees(id int primary key auto_increment,
dept varchar(20), salary int);

insert into employees(dept, salary) values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),
("marketing",200),("marketing",400),
("dsa",150),("dsa",120),
("dsa",40),("dsa",90),("dsa",500),
("hr",200),("hr",200),("hr",50),("marketing",200);

select * from employees;
select sum(salary) from employees;

select id,dept,salary,2870 from employees;

select id,dept,salary,(select sum(salary) from employees)
 from employees;

select dept,sum(salary) from employees
group by dept;

select id,dept,salary,
sum(salary) over()
from employees;

select id,dept,salary,
max(salary) over(),
avg(salary) over()
from employees;


select id,dept,salary,
sum(salary) over(),
sum(salary) over(partition by dept)
from employees;


select id,dept,salary,
sum(salary) over(order by salary),
sum(salary)  over()
from employees;



select id,dept,salary,
sum(salary) over(partition by dept order by salary),
sum(salary)  over()
from employees;






select id,dept,salary, sum(salary) over(),
avg(salary)  over()
  from employees;

/*
CREATE TABLE Sales(  
    Employee_Name VARCHAR(45) NOT NULL,  
    Year INT NOT NULL,  
            Country VARCHAR(45) NOT NULL,  
    Product VARCHAR(45) NOT NULL,  
    Sale DECIMAL(12,2) NOT NULL,  
    PRIMARY KEY(Employee_Name, Year)  ;
    
INSERT INTO Sales(Employee_Name, Year, Country, Product, Sale)  
VALUES('Joseph', 2017, 'India', 'Laptop', 10000),  
('Joseph', 2018, 'India', 'Laptop', 15000),  
('Joseph', 2019, 'India', 'TV', 20000),  
('Bob', 2017, 'US', 'Computer', 15000),  
('Bob', 2018, 'US', 'Computer', 10000),  
('Bob', 2019, 'US', 'TV', 20000),  
('Peter', 2017, 'Canada', 'Mobile', 20000),  
('Peter', 2018, 'Canada', 'Calculator', 1500),  
('Peter', 2019, 'Canada', 'Mobile', 25000);  
);  

*/




select avg(salary) from employees where dept="dsa";
select id,dept, salary ,
min(salary)  over(),
avg(salary)  over(),
avg(salary)  over(partition by dept)
from employees;

alter table employees rename column depat to dept;
select dept, avg(salary) from employees group by dept;
select * from employees;

select id,dept, salary ,
avg(salary)  over(partition by dept ),
sum(salary)  over(partition by dept order by salary) 
from employees;


select id,dept, salary ,
sum(salary)  over(partition by dept ) deptTotal,
sum(salary)  over(partition by dept order by salary) as rollingTotal 
from employees;

-- windows : aggregate
-- aggregate for every row
select id, dept,salary,
avg(salary) over() as avgsalary
from employees;

select id, dept,salary,
avg(salary) over(partition by salary) as avgsalary
from employees;
select id, dept,salary,
avg(salary) over(partition by dept) as avgsalary
from employees;

select id, dept,salary,
sum(salary) over(order by salary) as rollingSum,
sum(salary) over(partition by dept) as PartitionSum
from employees;

select dept,sum(salary)
from employees group by dept;

select id, dept,salary,
sum(salary) over(partition by dept) as PartitionSum,
avg(salary) over(partition by dept order by salary) as rollinSumDept
from employees;



-- window function 
-- perform aggregat on groups of rows but produce	result for each row

-- help to see aggregate value along side the data

-- empno, department, salary

-- select avg() over() from table
-- over() will create an empty window mean all the record



SELECT 
    id, 
    dept, 
    salary, 
    AVG(salary) OVER(PARTITION BY dept) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT 
    id, 
    dept, 
    salary, 
    min(salary) OVER(PARTITION BY dept order by salary desc) AS dept_min,
    max(salary) OVER(PARTITION BY dept) AS company_min
FROM employees;




-- order by sum

SELECT 
    id, 
    dept, 
    salary, 
    SUM(salary) OVER(PARTITION BY dept ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY dept) AS total_dept_salary
FROM employees;

-- windows functions
select id, dept, salary,
row_number()  over(partition by dept)  from employees;

-- ranking
select id, dept, salary,
rank()  over(partition by dept order by salary desc)  from employees;

select id, dept, salary,
rank()  over(partition by dept order by salary desc),
dense_rank()  over(partition by dept order by salary desc)  from employees;

select id, dept, salary,
lead(salary,2)  over(partition by dept order by salary)
from employees;

select id, dept, salary,
lag(salary,1)  over(partition by dept order by salary)
from employees;

select id, dept, salary,
salary - lead(salary,1)  over(partition by dept order by salary)
from employees;


select id, dept,salary,
ntile(3) over(partition by dept)
from employees;




select * from employees;
select id,dept,salary,
rank() over( partition by dept order by salary desc),
dense_rank() over( partition by dept order by salary desc),
row_number() over( partition by dept order by salary desc)
from employees;


# rank, dense rank and rownumber
insert into employees(dept,salary) values("marketing",200);
insert into employees(dept,salary) values("hr",200),("hr",200),("hr",50),("marketing",200);
select id, dept,salary,
rank() over( partition by dept order by salary desc),
dense_rank() over( partition by dept order by salary ),
row_number() over( partition by dept order by salary )
from employees;

select id, dept,salary,
rank() over(partition by dept order by salary),
dense_rank() over(partition by dept order by salary) as ranking
from employees;



-- 
/*

rank() over( order by salary desc)
rank() over(partition by col order by salary desc)
*/
select count(*) from employees;

select id, dept, salary,
ntile(4) over(partition by dept)
from employees;

select id, dept, salary,
ntile(4) over(order by salary)
from employees;

select id, dept, salary,
ntile(4) over(partition by dept order by salary)
from employees;

select id, dept, salary,
first_value(salary) over(partition by dept )
from employees;



select id, dept, salary,
lag(salary) over(partition by dept order by salary desc),
lead(salary) over(partition by dept order by salary desc)
from employees;

select date_add(curdate(), interval 1 day) from dual;

select id, dept, salary,
first_value(id) over(partition by dept order by salary)
from employees;