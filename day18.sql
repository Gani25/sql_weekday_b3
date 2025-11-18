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


