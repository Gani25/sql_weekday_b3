-- subquery
use sprk_morning;

drop table if exists employee;

select * from department;

/*
2	Sales
3	HR
100	Admin
101	IT
102	Marketing
*/

create table employee
(
	emp_id int primary key auto_increment,
    
    emp_name varchar(100) not null,
    
    salary int not null,
    
    dept_id int not null,
     
	foreign key(dept_id) references department(did)
);


select * from department;
desc employee;
insert into employee(emp_name, salary, dept_id) values
("Rohit Sharma",2500,102),
("Shruti Gupta",5000,100),
("Abhishek Yadav",3200,100),
("Abhishek Pandey",5000,100),
("Rohit Deshmukh",5000,2);

-- find all employees who earns highest salary in organization

select max(salary) from employee;

select * from employee
where salary = 5000;

-- subquery
select * from employee
where salary = (select max(salary) from employee);

-- exists
-- find all department in which we don't have any employee

select dept_id from employee;
select distinct dept_id from employee;

select * from department 
where did not in (select distinct dept_id from employee);

select * from department 
where did in (select distinct dept_id from employee);


-- correlated subquery -> inner query dependent on outer query

select * from department d
where not exists 
(
	select * from employee e 
	where e.dept_id = d.did
);


select * from department d
where exists 
(
	select * from employee e 
	where e.dept_id = d.did
);
-- stored procedure out, inout

select * from employee;

-- procedure -> parameters

-- out 

delimiter $

create procedure emp_info (eid int, out emp_data text)
begin
	
    select concat_ws(" ", "Name =",emp_name, 
		"Salary =",salary,"Deparment Id =",dept_id) into emp_data 
        from employee where emp_id = eid;
end $

delimiter ;

call emp_info(1,@emp_info_var);

select @emp_info_var;

select * from employee;

-- dept_id, count(emp)

-- inout
delimiter $

create procedure count_emp_dept(inout emp_data int)
begin
	
    select count(*) into emp_data from employee
    where dept_id = emp_data;

end $

delimiter ;

select @val;
set @val = 100;

select @val;

call count_emp_dept(@val);

select @val;

select * from employee;
set @val = 2;

select @val;

call count_emp_dept(@val);

select @val;