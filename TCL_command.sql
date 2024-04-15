
create database tushar;
use tushar;

create table emp(id int, name varchar(20));
select  @@autocommit;
insert into emp values(2,"akshay");
select * from emp;

# transaction control language
# ddl, dcl, dml
# logical unit of task
# data consistency

select  @@autocommit;
set autocommit=0;

insert into emp values(3,"tiger");
select * from emp;

commit;
# rollback , savepoint, commit

select  @@autocommit;
insert into emp values(5,"joker");


delete from emp;

select * from emp;

commit;
rollback;


insert into emp values(10,"xyz");
select * from emp;
rollback;

create table aman(id int);

set autocommit=1;
select @@autocommit;
start transaction;
insert into emp value(200,"po");

select * from emp;
commit;


#savepoint - checkpoint
set  autocommit=0;

select * from emp;
insert into emp values(3,"a");
insert into emp values(4,"ab");
savepoint emp_sp_happy;
update emp set name="xxxxx" where id=10;

rollback to emp_sp_happy;
select * from emp;


# DCL
#
