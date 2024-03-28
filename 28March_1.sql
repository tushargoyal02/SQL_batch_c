use sakila;

show tables;

describe  actor;

select * from film_category;
desc film_category;


create table product(pid int, pname varchar(20));
insert into product values(1,"tv"),(2,"mobile"),(3,"abc");

create table orders(oid int , amount int, pid int);
insert into orders values(1,100,1),(2,200,3),(3,500,1),
(4,800,90);

select * from product;
select * from orders;

select oid, amount, orders.pid,pname
from orders join product
where(orders.pid = product.pid);

select oid, amount, orders.pid,pname
from orders join product
using (pid);


desc film_actor;