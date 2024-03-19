
use sakila;

show tables;

select  * from actor;

select * from  sakila.actor;

select  actor_id from actor;

-- projection
select actor_id, first_name 
fRom  ACTor;

-- where clause ke through    =
select actor_id, first_name from actor
where actor_id=2;

select * from actor;

select actor_id, first_name from actor
where first_name='NICK';

select actor_id, first_name from actor
where last_name='CHASE';

select * from actor where actor_id>10;

-- between operator
use sakila;

select * from actor
where actor_id between 2 and 5;

-- in operator
select * from actor
where actor_id in (2,3,7,11);

select * from actor
where first_name in ('NICK','ED','ZERO');

select * from actor 
where first_name='ED';

-- like operator  ( pattern chizo ko search)
select * from actor 
where first_name like 'SA%';

select * from actor 
where first_name like '%ED';

select * from actor 
where first_name like '%E%';

--   _
select * from actor 
where first_name like '_E%';
-- difference between database and filesystem
-- Database vs dbms
-- SQL vs dbms
-- what is advantage & disadvantage of dbms

