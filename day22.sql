-- stored procedure with (out) params

use classicmodels;

show tables;

select * from products;

-- in productLine varchar(), out count (int) of that productLine

select count(*) from products
where productLine = "Motorcycles";

delimiter $

create procedure countByCategory(
	category varchar(100),
    out totalProduct int
)
begin
	
    select count(*) into totalProduct
    from products 
    where productLine = category;
    
end $

delimiter ;

select @motorcycleCount;


call countByCategory ("Motorcycles",@motorcycleCount);

select @motorcycleCount;

call countByCategory ("Classic Cars",@classiccarsCount);

select @classiccarsCount;


delimiter $
drop procedure if exists countByProductLine $
create procedure countByProductLine()
begin
	
    select productLine, count(*) totalProducts
    from products 
    group by productLine;
    
end $

delimiter ;

call countByProductLine();

-- inout

select * from customers;
select * from orders;

delimiter $

create procedure countByCustomerNumber(
	inout value_data int 
)
begin
	select count(*) into value_data
    from orders
    where customerNumber = value_data;

end $

delimiter ;

set @cust_data = 103;
select @cust_data;

call countByCustomerNumber(@cust_data);

select @cust_data;
	

set @cust_data = 112;
select @cust_data;

call countByCustomerNumber(@cust_data);

select @cust_data;

-- store procedure which will accept column name and sorting order