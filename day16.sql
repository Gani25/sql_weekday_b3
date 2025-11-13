-- day 16

use sprk_morning;


select * from department;

select * from employee;

-- find all department in which we don't have any employees

-- check in which deprt ment we have employee
select distinct dept_id from employee;
-- all department where atleast 1 employee exists

select * from department
where dept_id not in 
(
	select distinct dept_id from employee
);


-- find all employees who earns more than average salary in
-- their company
explain analyze
select * from employee
where salary > (select avg(salary) from employee);

-- correlated subquery
-- inner query will be dependent on outer query

-- find all employees who earns more than average salary in
-- their department

select avg(salary) from employee
where dept_id = 1;

select * from employee where salary > 4325 and dept_id = 1;

select * from employee where dept_id = 1;


select avg(salary) from employee
where dept_id = 2;

select * from employee where salary > 3857.1429 and dept_id = 2;

select * from employee where dept_id = 2;

select * from employee e1
where salary > 
(select avg(salary) from employee e2
	where e2.dept_id = e1.dept_id);
    

explain analyze
select * from employee e1
where salary > 
(select avg(salary) from employee e2
	where e2.dept_id = e1.dept_id);
    
-- find number of employees in each department
select * from department;

select count(*) from employee
where dept_id = 1;
select count(*) from employee
where dept_id = 2;


select *,
(select count(*) from employee e
where e.dept_id = d.dept_id
) num_of_employees
from department d;



select *,
(select count(*) from employee e
where e.dept_id = d.dept_id
) num_of_employees
from department d
having num_of_employees = 0;

SELECT 
    *
FROM
    (SELECT 
        *,
            (SELECT 
                    COUNT(*)
                FROM
                    employee e
                WHERE
                    e.dept_id = d.dept_id) num_of_employees
    FROM
        department d) dept_with_count
WHERE
    num_of_employees = 0;