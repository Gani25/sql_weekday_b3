-- day 13

-- joins ->
/*
1. Natural Join
2. Cross Join
3. Self Join
4. Outer Join
*/

use sprk_morning;

show tables;

select * from my_table_1;
select * from my_table_2;
/*
Natural Join is a type of join which will
automatically join multiple table based on 
common column names
It doesnot require any conditions
Natural Inner Join / Natural Join
Left Join
Right Join
*/

select * from my_table_1
natural join my_table_2;

select * from my_table_1
natural left join my_table_2;

alter table my_table_1
rename column value to data;

select * from my_table_1;
select * from my_table_2;

select * from my_table_1
natural join my_table_2;

select * from my_table_1
natural left join my_table_2;


create table food_item
(
	name varchar(50),
    price int
);

select * from food_item;
insert into food_item values
("Veg Burger",60),
("Pizza",250),
("Sandwich",80),
("Pav Bhaji",100);


create table variations
(
	toppings varchar(50),
    extra_amount int
);

insert into variations values
("Simple",0),
("Cheese",35),
("Butter",20),
("Butter Cheese",50);

select * from food_item;
select * from variations;

-- cross join
/*
Cartesian Join -> combines all rows from one table
into another table
It doesn't require any conditions
*/

-- menu

select * from food_item
cross join variations;


select concat(toppings," ", name) as menu,
price + extra_amount as amount
from food_item
cross join variations
order by name, amount;

-- self join
/*
There will be only one table
*/
drop table if exists employee;
create table employee
(
	emp_id int,
    emp_name varchar(100),
    manager_id int
);

insert into employee values
(1,"Rohit Yadav", 10),
(2,"Pranjal Shinde",9),
(3,"Rohini Sable", 1),
(4,"Shubham Kokate", 7),
(5,"Sakshi Mokal",9),
(6,"Ketan Kadam", 1),
(7,"Supriya Shinde", null),
(8,"Salman Khan",4),
(9,"John Doe",4),
(10,"Rakesh Sharma", null);

select * from employee;

alter table employee
add constraint primary key (emp_id);

desc employee;

alter table employee
add constraint fk_emp_id foreign key(manager_id)
references employee(emp_id);

desc employee;
show create table employee;

-- find all employee name and their manager names

select * from employee;
select * from employee e1
join employee e2
on e1.manager_id = e2.emp_id;

select e1.emp_id, e1.emp_name, 
e2.emp_name manager_name 
from employee e1
join employee e2
on e1.manager_id = e2.emp_id;


select e1.emp_id, e1.emp_name, 
 ifnull(e2.emp_name,"Owner") manager_name 
from employee e1
left join employee e2
on e1.manager_id = e2.emp_id;

-- do self join on classic models
select * from classicmodels.employees;

-- find emp_id, emp name, reporting_emp_name, 
-- current-emp designation, reporting_emp_designation