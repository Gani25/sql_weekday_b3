use sprk_morning;

show tables;

drop table if exists my_table_1;
drop table if exists my_table_2;
drop table if exists food_item;
drop table if exists variations;

select * from employee;

-- views
select *, (year(now())-year(date_of_birth)) age
from employee;

create view emp_with_age
as 
select *, (year(now())-year(date_of_birth)) age
from employee;

show tables;

select * from emp_with_age;


select * from emp_with_age
where age >= 35;

create view emp_above_35 as
select * from emp_with_age
where age >= 35;

select * from emp_above_35;

create view emp_abstracted
as
select emp_id, emp_name, dept_id, age 
from emp_with_age;


select *, date_of_birth from emp_abstracted;

show tables;

create view emp_view as
select * from employee;

select * from emp_with_age;

insert into emp_view
(emp_name, phone, date_of_birth, salary, 
joining_date, dept_id) 
values
("Krutik Sharma","1234567890",
"1980-11-20",15000,"2020-10-15",1);


select * from employee;
select * from emp_with_age;

show tables;

select * from emp_above_35;

drop view if exists emp_view;
drop view if exists emp_with_age;

select * from emp_above_35;
drop view if exists emp_above_35;
drop view if exists emp_abstracted;

show tables;