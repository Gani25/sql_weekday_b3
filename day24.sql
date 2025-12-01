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

select * from orderdetails;

-- create a function which will accept productCode, 
-- return totalQuantity sold

select sum(quantityOrdered) from orderdetails
where productCode = "S18_1749";

select * from products;

-- input -> varchar, return int
delimiter $

create function total_product_sold(prodCode varchar(100))
returns int 
deterministic
begin

	declare prod_qty_sold int;

	select sum(quantityOrdered) into prod_qty_sold from orderdetails
	where productCode = prodCode;
    
    
    return prod_qty_sold;

end $

delimiter ;

select total_product_sold("S18_1749");

select productCode, productName, quantityInStock, 
total_product_sold(productCode) qty_sold
from products
order by qty_sold desc;