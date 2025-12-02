
-- how many product customer have purchased -> count
-- total quantity of products customer have purchased -> sum(quantityOrdered)


use classicmodels;

select * from orders;
select * from orderdetails;

select orderNumber from orders
where customerNumber = 363;


select * from orderdetails
where orderNumber in (10100, 10192, 10322) ;

select count(*) from orderdetails
where orderNumber in (10100, 10192, 10322) ;

select sum(quantityOrdered) from orderdetails
where orderNumber in (10100, 10192, 10322) ;


select sum(quantityOrdered) from orderdetails
where orderNumber in (
select orderNumber from orders
where customerNumber = 363
) ;

delimiter $

create function get_product_count(custNum int)
returns int 
deterministic
begin
	declare prod_count int;
    
		select count(*) into prod_count from orderdetails
	where orderNumber in (
		select orderNumber from orders
		where customerNumber = custNum
	) ;	
    
    return prod_count;
end $

delimiter ;



delimiter $

create function get_product_quantities_ordered(custNum int)
returns int 
deterministic
begin
	declare prod_count int;
    
		select sum(quantityOrdered) into prod_count from orderdetails
	where orderNumber in (
		select orderNumber from orders
		where customerNumber = custNum
	) ;	
    
    return prod_count;
end $

delimiter ;


select get_product_count(363);
select get_product_quantities_ordered(363);

select * from customers;
select customerNumber, customerName,get_product_quantities_ordered(customerNumber),
get_product_count(customerNumber)
from customers;