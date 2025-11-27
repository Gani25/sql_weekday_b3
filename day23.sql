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
        concat("Customer Number: ",custNum, " Membership: Gold") as cust_status, creditLimit
         from customers where customerNumber = custNum;
	elseif credLimit between 50000 and 99999 then 
		select customerName, 
        concat("Customer Number: ",custNum, " Membership: SILVER") as cust_status, creditLimit
         from customers where customerNumber = custNum;
	else
		select customerName, 
        concat("Customer Number: ",custNum, " Membership: BRONZE") as cust_status, creditLimit 
         from customers where customerNumber = custNum;
	end if;
end $

delimiter ;

select * from customers;

call customer_status(114);
call customer_status(103);
call customer_status(112);


-- coupon based on number of time customer orders
select customerNumber, count(*) from orders
group by customerNumber;

-- sorting based on procedure
-- sort -> input: column name, sort direction


delimiter $
drop procedure if exists sort_customers $
create procedure sort_customers
(
	columnName varchar(255),
    sort_dir varchar(10)
)
begin

	if sort_dir is null or trim(sort_dir) = "" then
		set sort_dir = "ASC";
	end if;
	
	set @select_query = concat(
			"select * from customers order by ", columnName," ", sort_dir);
	
    prepare stmnt from @select_query;
    execute stmnt;

	deallocate prepare stmnt;

end $

delimiter ;


delimiter $
drop procedure if exists sort_customers_natural_order $
create procedure sort_customers_natural_order
(
	columnName varchar(255)
)
begin
	call sort_customers(columnName, null);
end $

delimiter ;



call sort_customers("customerNumber","DESC");
call sort_customers("creditLimit","DESC");
call sort_customers_natural_order("creditLimit");
call sort_customers_natural_order("country");