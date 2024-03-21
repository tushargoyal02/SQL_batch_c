
-- single row functions
-- string, numbers, date

use sakila;

select * from address;

desc address;

select count(address_id)  from address;
select * from address;


select count(address2)  from address;

select address_id,address2,ifnull(address2,"ab")
  from address;
-- not accepted null values
select  count(address2) from address;

-- handles null value 
select count( ifnull(address2,"ab") )
  from address;
  
select * from payment;

select  customer_id, staff_id,
nullif( customer_id, staff_id) from payment;

--
select * from payment;

-- if(condition, True, False)
--  if ( condition, True, if(condition,True,FAlse) )
select amount,
if(amount>2,"50%OFF",if(amount>1, "30%OFF","No Discount"  ))
from payment;

-- case statement
/* if( col>2)
case expression
	when  2.99       then  "50% off"
    when  1.99	      then   "30%OFF"
end

*/

select amount,
case amount
	when 2.99 then "50% OFF"
    when 1.99 then "30% OFF"
    else "No discount"
    end "Coupon"
    from payment;
    
    
select amount,
case 
	when amount>2 then "50% OFF"
    when 1.99 then "30% OFF"
    else "No discount"
    end "Coupon"
    from payment;

select * from payment;
# 100 1 to 100  => 10% off ( total amount)
# 151-250 =>  25%off  ( amount)
# 1% discount ( amount show karoge)
