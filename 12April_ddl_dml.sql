-- create a table
-- id , name, status , SecondaryName
-- int, varchar 20, boolean, palindrome 


use sakila;
drop table test123;

create table test123( id int, name varchar(20), status bool,
secondaryName varchar(20), 
constraint sakila_test123_secName_check
check ( reverse(secondaryname)= name  ));

insert into test123 values(10, "saras", True,"saras2");
select * from test123;


drop table student2;
create table student2(regsiterationN int,
 sname varchar(20), sid int,
 constraint sakila_std_sid_fk 
 foreign key (sid) references student_hobby2(sid) );
 
 
 insert into student2 values(10, "tushar",1);
 insert into student2 values(11, "aman",2);
 insert into student2 values(12, "raj",3);
 select * from student2;
 desc student2;

desc student_hobby2;
create table if not exists student_hobby2(sid int primary key, hobby varchar(20));
insert into student_hobby2 values(1, "crickey");
insert into student_hobby2 values(2, "tennis");
select * from student_hobby2;
-- insert palindrome questino

create database test1;
use test1;
drop table product;
create table product(pid int primary key, pname varchar(20),amount int);

desc product;
drop table orders;
create table orders(oid int, city varchar(20),	product_id int,
constraint test_orders_pk_oid primary key(oid),
constraint test_fk foreign key(product_id) references product(pid));

insert into orders values(1,"Jaipur",10);
delete from orders;
select * from orders;

-- firstly
insert into product values(10,"abc",600);
select * from product;
delete from product;

drop table abc;
create table abc(id int primary key auto_increment, gender char(2));
insert into abc(gender) values("XX");
select * from abc;

show tables;
select * from abc;  

delete from abc where id=1;

-- all the record  ( rollback  / undo )
delete from abc;

-- drop  ( DDL)
drop table abc;
show tables;

-- drop vs delete vs truncate
create table abc(id int primary key auto_increment, gender char(2));
insert into abc(gender) values("XX");
select * from abc;
-- ddl 
truncate table abc;
select * from abc;
-- update,  insert bulk data, alter
-- TCL 
-- DCL