-- day28

-- window fn continued

use sprk_morning;

select * from employee;

-- rank employees based on salary from highest to lowest

select *, rank() over(order by salary desc) as sal_rank
from employee;


select *, dense_rank() over(order by salary desc) as sal_rank
from employee;

-- find 2nd highest salaried employee
/*
ERROR
Error Code: 3594. You cannot use the alias 'sal_rank' of an 
expression containing a window function in this context.'

*/
select *, dense_rank() over(order by salary desc) as sal_rank
from employee
having sal_rank = 2; -- ERROR

-- subquery in from clause

select * from
(
	select *, dense_rank() over(order by salary desc) as sal_rank
	from employee
) emp_with_rank
where sal_rank = 2;


select * from
(
	select *, dense_rank() over(order by salary desc) as sal_rank
	from employee
) emp_with_rank
where sal_rank = 3;

-- common table expression cte -> store resultset in temporary table
with emp_rank as
(select *, dense_rank() over(order by salary desc) as sal_rank
from employee)
select * from emp_rank
where sal_rank = 2;

-- give rank to employees based on department highest to lowest

select *, 
dense_rank()over(
	partition by department order by salary desc
) as emp_salary_rank
from employee;

-- find second highest salaried employee in each department

with emp_dept_rank as
(
	select *, 
	dense_rank()
	over(
		partition by department 
		order by salary desc
    ) as emp_salary_rank
	from employee
)
select * from emp_dept_rank
where emp_salary_rank = 2;


with emp_dept_rank as
(
	select *, 
	dense_rank()
	over(
		partition by department 
		order by salary desc
    ) as emp_salary_rank
	from employee
)
select * from emp_dept_rank
where emp_salary_rank = 1;

-- value functions
/*
lead()
lag()
first_value()
last_value()
nth_value()
*/

-- New Tables


create table train_schedule
(
	train_id int,
    station varchar(100),
    train_time time
);

truncate table train_schedule;
insert into train_schedule values
(102,"Kalyan","10:20:00"),
(101,"Vashi","7:50:00"),
(101,"CST","8:45:00"),
(101,"Panvel","7:15:00"),
(102,"CST","11:55:00"),
(101,"Kharghar","7:30:00"),
(102,"Thane","10:50:00"),
(102,"Kurla","11:05:00"),
(102,"Byculla","11:46:00"),
(101,"Kurla","8:10:00"),
(103,"Virar","14:03:00"),
(103,"Churchgate","12:10:00"),
(103,"Andheri","13:05:00"),
(103,"Dadar","12:30:00");


select * from train_schedule;
select *, 
ifnull(
	lead(station) over(partition by train_id order by train_time)
    ,"End Of Train"
)
next_station 
from train_schedule;


select *, 
ifnull(
	lead(station) over(partition by train_id order by train_time)
    ,"End Of Train"
)
next_station,
ifnull(
	lead(train_time) over(partition by train_id order by train_time)
    ,"END"
)
next_station_time,
ifnull(
	lag(station) over(partition by train_id order by train_time)
    ,"Start Of Train"
)
prev_station,
ifnull(
	lag(train_time) over(partition by train_id order by train_time)
    ,"START"
)
prev_station_time

from train_schedule;

select * from train_schedule;
select *, first_value(station) over(partition by train_id
order by train_time) 
as start_station
from train_schedule;

select *, nth_value(station,2) over(partition by train_id
order by train_time) 
as start_station
from train_schedule;