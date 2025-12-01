use classicmodels;


select * from customers;
-- input -> int
-- return -> varhcar(100)

delimiter $

create function get_customer_info(custNum int)
returns varchar(100)
deterministic
begin

	declare customerContactName varchar(100);
    
    select concat(contactFirstName," ", contactLastName) 
    into customerContactName from customers
    where customerNumber = custNum;
    
    return customerContactName;

end $

delimiter ;

select get_customer_info(103);
select get_customer_info(112);
select get_customer_info(113);

select *, get_customer_info(customerNumber) contactName from orders;