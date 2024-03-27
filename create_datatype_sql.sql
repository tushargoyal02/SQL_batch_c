
--  data type of SQL
-- numeric  string data,  date time

-- INT[(width)] [UNSIGNED] [ZEROFILL]
-- 4 byte,
--  2^32
--  –2,147,483,648 to 2,147,483,647  ( 4 byte storage)


-- INT[(width)] [UNSIGNED] [ZEROFILL]

-- The width parameter specifies the display width, 
-- which can be read by applications as part of the column metadata. 
-- 18,446,744,073,709,551,615 unsigned big int 
-- 8 byte
-- unsigned
create table test3(id int unsigned);
insert into test3 values(-77355);
select * from test3;
describe  test3;
#100  =>  -49  to  50
# 0 to 100

CREATE TABLE test_bigint (id BIGINT UNSIGNED);

-- int => id 100   => id+50 => big int
INSERT INTO test_bigint VALUES (18446744073709551615);
select * from test_bigint;

-- -- 18,446,744,073,709,551,600 is less than 18,446,744,073,709,551,615
INSERT INTO test_bigint VALUES (184467440737095516*100);

-- tinyint, smallint, mediumint
-- 1 byte => 8  2(8)
-- boolean  => Tinyint
-- 2**8  => 256 ( unsigned)    =>  -128 to 127
create table abc(id tinyint);
insert into abc values(False);
select * from abc;



-- 0 to 256 unsigned,  -127 to 128 
drop table test_bool;
CREATE TABLE test_bool (i BOOL);
insert into test_bool values(True),(False);

select * from test_bool;
INSERT INTO test_bool  VALUES (1),(0),(-128),(127);

-- mediumint : 3byte small : 2 byte, tiny:1 byte
-- int : 4 byte,  big int 8 byte

-- acid property in RDBMS
-- how acid property are implement in RDBMS
-- Constraints

-- varchar and char
-- varchar
-- maximun varchar
-- ( The maximum value of width is 65,535 characters. )


create table ep2(name1 char(25) );
insert into ep2 values(" XU");
select name1, length(name1) from ep2;

-- variable character
create table ep_var(name1 varchar(3) );
insert into ep_var values("Xfa        ");
select name1, length(name1) from ep_var;


create table ep_var1(eid int check(eid>2) );
insert into ep_var1 values(1);

create table 
ep_var2(gender char(1) check(gender in ("M","F","O") ) );
insert into ep_var2 values("G");
select * from ep_var2;

create table  test123( dob datetime);
insert into test123 values("20-05-13 16:04:25");
select * from test123;


create table  test1234( dob timestamp);
insert into test1234 values("20-05-13 16:04:25");
select * from test1234;

create table 
ep_var4(age int, gender char(1), 
check(age>10 or gender in ("M","F","O") ) );

insert into ep_var4 values(12, "M");
select * from ep_var4;

drop table ep_var4;
truncate table ep_var4;

-- delete dml
delete from ep_var4 where age=3;

select * from ep_var4 order by age;
-- update dml
update ep_var4 set age=11 where age=6;

update ep_var4 set age=11 limit 1;

delete from ep_var4 order by age	;
select * from ep_var4;
drop table ep_var4;
-- VARCHAR retains trailing spaces up to the specified column width and will truncate the excess, producing a warning. 
-- CHAR values are right-padded to the column width, and the trailing spaces aren’t preserved.

-- 1 character - 1 byte
drop table test;
create  table test(name varchar(3));
insert into test values("z    ");
select name,length(name) from test;

drop tables test;
create  table test(name char(3));
insert into test values(" z");
select name,length(name) from test;


use sakila;
select first_name, replace(first_name, "EN","Y") from actor;

select first_name, substr(first_name, 3) from actor;

select first_name, substr(first_name, -2,2) from actor;
select first_name, instr(first_name, "e") from actor;

select first_name,length(first_name),  rpad(first_name,5 ,"#") from actor;

select first_name,last_name, concat(first_name,' ', last_name,actor_id)
from actor;

select first_name,last_name, concat_ws('-',first_name,last_name,actor_id)
from actor;

select length("hey") ;

select length("大");


select char_length("大");

select trim("     heyllo  "), length( trim("     heyllo  ")) ; 

select trim( leading ' ' from "     heyllo  ");

select trim( trailing  ' ' from "     heyllo        ");

select trim( both 'o' from "     hey          llooooo ");