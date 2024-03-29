drop database test1;
create database test1;
use test1;

create table product(id int, pname varchar(20));
insert into product values(1,"tv"),(2,"mobile"),(3,"abc");

create table orders(oid int , amount int, pid int);
insert into orders values(1,100,1),(2,200,3),(3,500,1),
(4,800,90);

select * from product;
select * from orders;
-- cross join  / cartesian ( m*n
select oid, amount,pname, orders.pid, product.pid
from orders  join product; 

-- inner join
select oid, amount,pname, orders.pid, product.pid
from orders  join product
where(product.pid=orders.pid); 

-- inner  - method 2
select oid, amount,pname, orders.pid, product.pid
from orders inner join product
on(product.pid=orders.pid);

-- method 3  - using keyword only if column is same
select oid, amount,pname
from orders  join product
using(pid);

select oid, amount,orders.pid,pname 
from orders right join product
on(product.pid=orders.pid);

-- natural join
select oid,amount,pname,orders.pid, product.id
from orders natural join product;

select * from product;



use sakila;
select * from actor;

select * from film_actor;

select * from film;


select  actor.actor_id, first_name,film.film_id,title
from actor join film_actor
join film 
where(actor.actor_id=film_actor.actor_id) and 
(film_actor.film_id = film.film_id);


select * from film;
select * from language;



select  a.actor_id, first_name, f.film_id,title
from actor as a join film_actor as fa
join film as f
where(a.actor_id=fa.actor_id) and 
(fa.film_id = f.film_id);





-- self join
drop database abc;
create database abc;
use abc;

create table employee( eid int, name varchar(20),
salary int, managerid int);

insert into employee values(1,"tushar",200, null),
(2,"aman",100,1), (3,"abhishek",50,4),
(4,"mayank",25,2);

select * from employee;





