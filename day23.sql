use classicmodels;

select * from customers;

-- in customerNumber 
-- creditLimit > 100000 -> customerNumber: {num}, Memership: Gold
-- customer number: 114, Membership: Gold

delimiter $
drop procedure if exists customer_status $
create procedure customer_status(custNum int)
begin

	-- variable of procedure
	declare credLimit int;
    
    select creditLimit into credLimit from customers
    where customerNumber = custNum;
    
    if credLimit >= 100000 then 
		select customerName, 
        concat("Customer Number: ",custNum, " Membership: Gold") as cust_status 
         from customers where customerNumber = custNum;
	else 
		select customerName, 
        concat("Customer Number: ",custNum, " Membership: Non Active") as cust_status 
         from customers where customerNumber = custNum;
	end if;
end $

delimiter ;

select * from customers;
call customer_status(114);
call customer_status(103);

-- 100000 -> GOLD
-- between 50000 to 99999 -> SILVER
-- below 50000-> BRONZE

