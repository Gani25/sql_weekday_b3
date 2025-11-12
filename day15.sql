-- subquery day 15

use sprk_morning;

select * from employee;

-- find all employees who earns highest salary in their department

-- find max salary in each department
select distinct dept_id from employee;
select dept_id, max(salary) from employee
group by dept_id;


select * from employee;
/*
1	6000
2	10000
3	10000
4	9500
5	7700
8	1800
11	1500
*/

select * from employee
where dept_id = 1 and salary = 6000;

select * from employee
where (dept_id, salary) in 
	(
		select dept_id, max(salary) from employee
        group by dept_id
	);
    select * from employee;
-- subquery in from clause

select * from employee;
-- find all employee who are with us for past 5 years

-- year of experience
-- current year - joining year

/*
Error Code: 1054. Unknown column 'experience' in 'where clause'

*/
select *, year(now()) - year(joining_date) as experience 
from employee;

select * from 
	(
		select *, year(now()) - year(joining_date) as experience 
		from employee
    ) as emp_with_experience
where experience >= 5;


-- find max and min salaried employee in company 
select * from employee;

select min(salary) from employee;
select max(salary) from employee;

select * from my_table_1
union
select * from my_table_2;
select * from my_table_1
union all
select * from my_table_2;

select id,data from my_table_1
union all
select * from my_table_2;

select data, id from my_table_1
union all
select * from my_table_2;


select min(salary) from employee
union
select max(salary) from employee;

select * from employee 
where salary in 
(
select min(salary) from employee
union
select max(salary) from employee
);

select * from employee 
where salary in 
(
(select min(salary) from employee),
(select max(salary) from employee)
);

-- Find Department and count number of employees in that department
select * from department;
