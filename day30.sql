use sprk_morning;

select * from employee;

show indexes from employee;

desc employee;
alter table employee
modify emp_id int;


desc employee;

alter table employee
drop constraint `PRIMARY`;

desc employee;

show indexes from employee;

select * from employee;

explain select * from employee where emp_id = 48;
explain analyze select * from employee where emp_id = 48;
explain select * from employee where emp_id = 1000;

explain analyze select * from employee where emp_id in(30,1,48);


alter table employee
add constraint primary key(emp_id);



explain select * from employee where emp_id = 48;
explain select * from employee where emp_id = 1000;
explain select * from employee where emp_id in(30,1,48);
explain analyze select * from employee where emp_id in(30,1,48);

select * from employee;


select * from employee where department = "Sales";

explain select * from employee where department = "Sales";
explain analyze select * from employee where department = "Sales";

show indexes from employee;

create index dept_idx on employee(department);
show indexes from employee;


explain select * from employee where department = "Sales";
explain analyze select * from employee where department = "Sales";
explain analyze select * from employee where department in ("Sales","HR");
explain  select * from employee where department in ("Sales","HR");

select * from employee;

-- composite index
INSERT INTO `sprk_morning`.`employee` (`emp_id`, `emp_name`, `department`, `salary`) VALUES ('8', 'Meena Rao', 'IT', '1500');
INSERT INTO `sprk_morning`.`employee` (`emp_id`, `emp_name`, `department`, `salary`) VALUES ('60', 'Meena Rao', 'Marketing', '12000');

select * from employee
where emp_name = "Meena Rao" and department = "Sales"; 


explain select * from employee
where emp_name = "Meena Rao" and department = "Sales"; 

drop index dept_idx on employee;


show indexes from employee;

-- composite -> combination of 2 or more columns

create index name_dept_idx on employee(emp_name, department);


show indexes from employee;

show create table employee;


explain select * from employee
where emp_name = "Meena Rao" and department = "Sales"; 


explain select * from employee
where emp_name = "Meena Rao"; 

select * from employee
where emp_name = "Meena Rao"; 

explain select * from employee
where department = "HR"; 

drop index name_dept_idx on employee;

show indexes from employee;

drop index `PRIMARY` on employee;

show indexes from employee;

select * from employee;
alter table employee
modify emp_id int unique not null;

desc employee;

show indexes from employee;

show create table employee;


alter table employee
modify emp_id int;

desc employee;

alter table employee
drop constraint emp_id;


desc employee;

create unique index emp_id_un_idx on employee(emp_id);


show create table employee;
show indexes from employee;

