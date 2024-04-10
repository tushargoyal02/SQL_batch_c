# constrainst

# DDL

# join, subquery,  # group by, # functions #string, date, number
# scaler function, aggregate functions

#DQL 
#DDL: Data defination language  
#  create, alter, drop, truncate

create  database if not exists april10;
use  april10;

#ddl
create table employee(id int, fname varchar(20) );

describe  employee;
select * from employee;

# DML - insert, update, delete
insert into employee(id, fname) values(1,"abc");

# 0 , ""
insert into employee  values(3,null);
insert into employee(fname)  values("tushar");
select * from employee;

show tables;
drop table employee;

# constraint => set of rule  restrict unwanted data to be insert in table
# not null
drop table xyz;

create table if not exists xyz(id int not null, name varchar(20));
insert into xyz(id, name) values(null,"abc");
select * from xyz;

-- default 
create table if not exists 
xyz2(id int not null , name varchar(20) default "regex");

insert into xyz2(id) values(1);
select * from xyz2;

# unique

show tables;


drop table xyz, xyz2;
create table 
yash(id int, email varchar(20) default "abc@gmail.com" unique  );

desc yash;
insert into yash(id, email) values(4,null);
select * from yash;

-- drop table house;
create table house( id int, amount int check (amount>1000) );
insert into house values(1, null);
select * from house;


create table student(id int primary key, name varchar(20),
email varchar(20) unique);

insert into student(id,name,email) values(1,"tushar","tushar@gmail.com");
insert into student(id,name,email) values(1,"tushar2","t2@gmail.com");

-- type of keys
-- database, table, rdbms,  dbms vs rdbms
-- type of sQL language ( DQL , DML, dcl, tcl, ddl definations)
-- SQL zoo -> 