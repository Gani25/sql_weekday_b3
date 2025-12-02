
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

drop function get_product_count;
drop function get_product_quantities_ordered;
drop function total_product_sold;
drop function if exists total_product_sold;
drop function if exists get_customer_info;


-- triggers
select * from orderdetails;
select * from products;

use sprk_morning;

show tables;

drop table if exists employee;

create table employee
(
	emp_id int primary key auto_increment,
	first_name varchar(100),
	last_name varchar(100),
	acc_created_at timestamp default current_timestamp,
	acc_updated_at timestamp on update current_timestamp
);

insert into employee(first_name,last_name) values
("roHIt","SHArma"),
("ABHisHEK","GUPTA");

select * from employee;
set @name="sHrUTi";

select @name;
select @name, concat(upper(substring(@name,1,1)), lower(substring(@name,2)));

delimiter $

drop trigger if exists change_case_employee $
create trigger change_case_employee
before insert on employee
for each row
begin
	-- update first_name and last_name before inserting into sentence case
    -- insert -> values new
    
    set new.first_name = concat(
		upper(
			substring(trim(new.first_name),1,1)
		),
        lower(
			substring(trim(new.first_name),2)
		)
    );
    
     set new.last_name = concat(
		upper(
			substring(trim(new.last_name),1,1)
		),
        lower(
			substring(trim(new.last_name),2)
		)
    );

end $

delimiter ;

show triggers from sprk_morning;
show triggers;



insert into employee(first_name,last_name) values
("roHIt","SHArma"),
("ABHisHEK","GUPTA");


select * from employee;


insert into employee(first_name,last_name) values
("    Atik","Khan"),
("shruti","    shinde");


select * from employee;
insert into employee(first_name,last_name) values
("    Atik","Khan"),
("shruti","    shinde");


select * from employee;

update employee
set first_name = "shRUTi", last_name = "   guPTa  "
where emp_id = 10;

select * from employee;

-- create for update