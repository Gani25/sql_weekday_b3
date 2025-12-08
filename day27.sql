-- Window Functions

use sprk_morning;

show tables;

select * from employee;

drop table if exists employee;

create table employee
(
	emp_id int primary key auto_increment,
    emp_name varchar(100) not null,
    department varchar(100) not null,
    salary int not null
);

-- Sample data for employee table
-- emp_id will be auto-generated

INSERT INTO employee (emp_name, department, salary) VALUES
-- HR
('Pranjal Sharma',   'HR',         9500),
('Suresh Iyer',   'Sales',      9000),
('Meena Rao',     'Sales',      9800),
('Rohan Mehta',   'HR',         9500),
('Farhan Ali',    'Marketing',  5500),
('Riya Kapoor',   'Marketing',  7800),
('Ashutosh Mehta',   'HR',         9500),
('Neha Singh',    'HR',         9800),


-- IT
('Sneha Patel',   'IT',         8000),
('Shruti Roy',     'Sales',      10000),
('Suresh Iyer',   'Sales',      9000),
('Anuj Gupta',    'IT',         9500),
('Pooja Nair',    'IT',         9800),
('Sanjay Sharma',     'Sales',      10000),

-- Sales
('Rahul Jain',    'Sales',      2500),
('Kiran Desai',   'Sales',      7500),


('Priya Verma',   'HR',         7200),
('Neha Shinde',    'HR',         9800),
('Shoaib Khan',   'HR',         9500),
('Amit Sharma',   'HR',         5400),

('Rahul Deshpande',    'Sales',      3500),

-- Finance
('Arjun Yadav',   'Finance',    5800),
('Deepa Menon',   'Finance',    8300),
('Vikas Kumar',   'IT',         6000),
('Kunal Joshi',   'Finance',    9500),
('Swati Kulkarni','Finance',    9700),

-- Operations
('Manish Agarwal','Operations', 5100),
('Shilpa D',      'Operations', 7200),
('Nitin B',       'Operations', 9100),
('Komal C',       'Operations', 9700),

-- Marketing
('Gaurav Jain',   'Marketing',  9300),
('Isha S',        'Marketing',  9700);


select * from employee;

-- find highest salary in the whole organization

select *, max(salary) over() as max_sal_org from employee;


-- find highest salary in each department

select *, max(salary) over(partition by department) 
as max_sal_dept from employee;
select *, max(salary) over(partition by department) 
as max_sal_dept from employee
order by department desc;


select *, avg(salary) over(partition by department) 
as avg_sal_dept from employee;


select *, count(*) over(partition by department) 
as total_emp_dept from employee;

select *, sum(salary) over(partition by department) 
as total_sal_dept,count(*) over(partition by department) 
as total_emp_dept,sum(salary) over() as total_salaries 
from employee;

-- ranking functions
/*
row_number(),
rank(),
dense_rank(),
cum_dist(),
percent_rank(),
ntile()
*/

UPDATE `sprk_morning`.`employee` SET `emp_id` = '40' WHERE (`emp_id` = '4');
UPDATE `sprk_morning`.`employee` SET `emp_id` = '45' WHERE (`emp_id` = '24');
UPDATE `sprk_morning`.`employee` SET `emp_id` = '35' WHERE (`emp_id` = '2');
UPDATE `sprk_morning`.`employee` SET `emp_id` = '42' WHERE (`emp_id` = '5');
UPDATE `sprk_morning`.`employee` SET `emp_id` = '48' WHERE (`emp_id` = '8');


select row_number() over() as `sr no.`, emp_id,
emp_name, department,salary from employee;


select row_number() over() as `sr no.`, emp_id,
emp_name, department,salary from employee
where department in ("Sales","HR");


select row_number() over(partition by department) 
as `sr no.`, emp_id,
emp_name, department,salary from employee;


select row_number() over(partition by department) 
as `sr no.`, emp_id,
emp_name, department,salary from employee
where department = "Sales";