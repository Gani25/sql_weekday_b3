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