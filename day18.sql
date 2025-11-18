-- day 18

-- Date Functions


select month("2014-10-22");
select monthname("2014-10-22");
select day("2014-10-22");
select quarter("2014-10-22");
select year("2014-10-22");
select dayname("2014-10-22");
select dayname(now());
select yearweek(now());

select date_format(now(),"%y");
select date_format(now(),"%Y");

select date_format(now(),"%d-%b-%Y");
select date_format(now(),"%d-%m-%Y");

select now(), date_format(now(),"%d/%m/%y");
select "2025-11-30 14:15:20", 
date_format("2025-11-30 14:15:20","%d/%m/%y");

select "2025-11-30 14:15:20", 
date_format("2025-11-30 14:15:20","%d/%m/%y %h:%i:%s %p");

select "2025-11-30 14:15:20", 
date_format("2025-11-30 14:15:20","%h:%i:%s %p %d/%m/%Y");

select "2025-11-30 11:25:00", 
date_format("2025-11-30 11:25:00","%h:%i:%s %p %d/%m/%Y");



select "2025-11-30 11:25:00", 
date_format("2025-11-30 11:25:00","%r %d/%m/%Y");

select "2025-11-30 11:25:00", 
date_format("2025-11-30 11:25:00","%r %d/%m/%Y");


select "2025-11-30 09:25:00", 
date_format("2025-11-30 09:25:00","%h:%i:%s %p %d/%m/%Y");

select "2025-11-30 09:25:00", 
date_format("2025-11-30 09:25:00","%l:%i:%s %p %d/%m/%Y");

select extract(month from now()), month(now());
select extract(quarter from now()), quarter(now());

use sprk_morning;

show tables;
select * from employee;
select emp_id, emp_name joining_date,
date_format(joining_date,"(%a)-%d/%M/%Y")
 from employee;
 
-- Calculate Age from DOB in format year and month

select "2010-02-22", 
concat(timestampdiff(year, "2010-02-22", now())," Years") as age_years,
concat(
	timestampdiff(month, "2010-02-22", now())
    - timestampdiff(year, "2010-02-22", now()) * 12
    ," Months") as age_month;
    
    
select "2010-02-22", 
concat(
	timestampdiff(year, "2010-02-22", now())," Years",
    " ",
	timestampdiff(month, "2010-02-22", now())
    - timestampdiff(year, "2010-02-22", now()) * 12
    ," Months"
) as age;


select *, concat(
	timestampdiff(year, date_of_birth, now())," Years",
    " ",
	timestampdiff(month, date_of_birth, now())
    - timestampdiff(year, date_of_birth, now()) * 12
    ," Months"
    ," Months"
) as age from employee;


-- conditional columns values -> case

use classicmodels;

select * from products;
select productCode, productName, productLine, MSRP 
from products;

-- if productLine is Motorcycle then give 10% discount on MSRP
-- if productLine is ClassicCars then give 15% discount on MSRP
-- if productLine is Vintage Cars then give 25% discount on MSRP
-- rest all productLine then give 20% discount on MSRP

select distinct productLine from products;

select productCode, productName, productLine, buyPrice, MSRP, 
case 
	when productLine = "Motorcycles" then MSRP - 0.1*MSRP
	when productLine = "Classic Cars" then MSRP - 0.15*MSRP
	when productLine = "Vintage Cars" then MSRP - 0.25*MSRP
    else MSRP - 0.2 * MSRP
end as discount_price
from products;


select *, MSRP-discount_price as saved_amount from 
(
	select productCode, productName, productLine, buyPrice, MSRP, 
	case 
		when productLine = "Motorcycles" then MSRP - 0.1*MSRP
		when productLine = "Classic Cars" then MSRP - 0.15*MSRP
		when productLine = "Vintage Cars" then MSRP - 0.25*MSRP
		else MSRP - 0.2 * MSRP
		end as discount_price
		from products
) as products_with_discounts;




select *, MSRP-discount_price as saved_amount from 
(
	select productCode, productName, productLine, buyPrice, MSRP, 
	case productLine
		when "Motorcycles" then MSRP - 0.1*MSRP
		when "Classic Cars" then MSRP - 0.15*MSRP
		when "Vintage Cars" then MSRP - 0.25*MSRP
		else MSRP - 0.2 * MSRP
		end as discount_price
		from products
) as products_with_discounts;

-- coalesce

use sprk_morning;

select * from student;

alter table student 
add student_phone varchar(15) after name;
alter table student 
add emergency_phone varchar(15) after student_phone;


select * from student;

update student set emergency_phone = "11111 22222"
where roll_no = 5;

select * from student;

update student set student_phone = "99999 88888"
where roll_no = 2;

alter table student
modify phone varchar(15);
update student
set phone = null
where roll_no = 3;

select * from student;

select roll_no, name, ifnull(coalesce(student_phone, emergency_phone, phone),"Not Found") from student;

