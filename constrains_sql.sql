-- group
-- join
-- subquery  => single row, multi row subquery
-- join => inner, outer join, self, natural join
-- join + groupby
-- set operation
-- datatypes
-- date, datetime, timestamp ( 1970 -2038 )

-- constraint
--  set of rules & regulations => invalid data
-- declaration of table
use regex1;
create table employee01(id int);
insert into employee01 values(10),(20),(null),(30);
select id,id+5 from employee01;


create table employee02(id int not null);
insert into employee02 values(10),(20);
insert into employee02 values(10);
select id,id+5 from employee02;


drop table employee02;
create table employee02(id int, salary int default 0);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,null);
select * from employee02;


drop table employee02;
create table employee02(id int, salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,1002);
insert into employee02(id,salary) values(22,null);
select * from employee02;

-- primary key
drop table employee02;
create table employee02(id int primary key, salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(null,1002);
insert into employee02(id,salary) values(11,100);
select * from employee02;


drop table employee02;
create table employee02(id int primary key,fname varchar(20),
salary int, 
constraint regex_emp_salary_uk unique(salary) );
insert into employee02 values(10,'a',99),(20,'b',99);


create table student (
    student_id int,
    sname varchar(50),
    fee int not null,
    college varchar(50) default 'regex',
    phone int,
    constraint pk_student primary key(student_id, sname),
    constraint pk_student primary key(student_id, sname),
    constraint uq_phone unique (phone)
);