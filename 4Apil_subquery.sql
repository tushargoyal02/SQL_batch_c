
create database april;
use april;

create table salary(id int, amount int);

insert into salary values(1,10),(2,30), (3,40),(4,9),(5,200),(6,600),(7,66);

select amount from salary where id=3;

select * from salary where amount>40;

select * from salary where amount>(select amount from salary where id=3);


-- single row subquery
-- =, !=. >,<

select avg(amount) from salary;

select id, amount, (select avg(amount) from salary) from salary;

-- multi row subquery   => =,<, >
-- in , any , all
select amount from salary where id=2 or id=3;

--  in operator
select * from salary where 
amount not in ( select amount from salary where id=2 or id=3);

-- andar ke output pr match   in  =>  =any
select * from salary where 
amount <all ( select amount from salary where id=2 or id=3 or id=1);

-- 10,30 and 40
select * from salary;

insert into salary values(55,200);



(select * from salary order by amount desc);


select max(amount) from salary;

select max(amount) from salary where amount<
(select max(amount) from salary where 
amount<(select max(amount) from salary)  );


