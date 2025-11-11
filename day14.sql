-- subquery

use sprk_morning;

show tables;
drop table if exists employee;

create table department
(
	dept_id int primary key auto_increment,
    dept_name varchar(50) not null,
    location varchar(60) not null
);

insert into department(dept_name, location) values
("IT","Pune"),
("HR","Pune"),
("IT","Mumbai"),
("IT","Banglore"),
("HR","Nashik"),
("Admin","Mumbai"),
("Marketing","Mumbai"),
("Sales","Mumbai"),
("Sales","Delhi"),
("Learning And Development","Mumbai"),
("HR","Delhi");



select * from department;

create table employee
(
	emp_id int primary key auto_increment,
    emp_name varchar(60) not null,
    phone varchar(15) not null unique,
    salary int not null,
    dept_id int not null,
    constraint dept_fk foreign key(dept_id) 
    references department(dept_id)
);

show create table employee;
-- new column date_of_birth before salary column
alter table employee 
add date_of_birth date after phone;

alter table employee 
add joining_date date after salary;
select * from department;
select * from employee;

insert into employee 
(emp_name, phone, date_of_birth, salary, joining_date, dept_id)
values
("Shubham Kokate","+91 12345 12345","1985-10-25",1500,"2023-11-20",11),
("Shubhangi Sharma","+91 55555 12345","1999-01-20",1800,"2024-10-18",8);

INSERT INTO employee (emp_name, phone, date_of_birth, salary, joining_date, dept_id) VALUES
('Amit Sharma', '9876500011', '1990-03-12', 5000, '2018-07-15', 1),
('Priya Nair', '9876500012', '1988-09-22', 2000, '2017-04-10', 2),
('Rahul Mehta', '9876500013', '1995-01-08', 8000, '2020-03-05', 3),
('Sneha Kulkarni', '9876500014', '1992-06-18', 6000, '2019-11-20', 4),
('Arjun Verma', '9876500015', '1998-12-04', 3000, '2022-05-02', 5),
('Neha Singh', '9876500016', '1993-07-29', 2000, '2018-09-01', 1),
('Rohit Deshmukh', '9876500017', '1989-02-14', 2000, '2016-12-10', 2),
('Kiran Patil', '9876500018', '1996-10-25', 3000, '2021-02-17', 3),
('Sana Shaikh', '9876500019', '1994-05-05', 6000, '2019-08-09', 4),
('Vikas Yadav', '9876500020', '1987-11-30', 7000, '2015-03-25', 5),
('Raj Malhotra', '9876500021', '1991-04-14', 4000, '2018-01-18', 1),
('Pooja Sawant', '9876500022', '1993-08-20', 1000, '2017-06-12', 2),
('Mohit Khanna', '9876500023', '1994-12-11', 9500, '2020-09-28', 3),
('Janhavi Deshpande', '9876500024', '1992-03-02', 9500, '2019-10-03', 4),
('Aditya Rao', '9876500025', '1999-01-19', 2500, '2023-01-15', 5),
('Simran Kaur', '9876500026', '1990-06-06', 6000, '2018-04-22', 1),
('Harshil Shah', '9876500027', '1988-07-12', 3000, '2016-01-30', 2),
('Vaishnavi More', '9876500028', '1997-09-09', 4000, '2021-11-05', 3),
('Imran Siddiqui', '9876500029', '1989-10-28', 6000, '2019-03-10', 4),
('Sagar Pawar', '9876500030', '1986-12-17', 7000, '2015-07-07', 5),
('Manoj Mishra', '9876500031', '1991-02-21', 4500, '2018-02-14', 1),
('Rutuja Gokhale', '9876500032', '1993-05-27', 5200, '2017-08-19', 2),
('Nikhil Bhandari', '9876500033', '1995-03-16', 3900, '2020-06-01', 3),
('Meera Joshi', '9876500034', '1992-11-03', 5900, '2019-04-18', 4),
('Faizan Qureshi', '9876500035', '1998-07-24', 3200, '2022-03-21', 5),
('Kavita Jadhav', '9876500036', '1991-09-14', 4450, '2018-05-11', 1),
('Shantanu Gupta', '9876500037', '1987-04-08', 3800, '2016-10-09', 2),
('Trupti Patankar', '9876500038', '1996-02-10', 3350, '2021-07-12', 3),
('Zoya Ansari', '9876500039', '1993-12-30', 6400, '2019-02-22', 4),
('Devendra Rane', '9876500040', '1988-08-05', 7700, '2015-09-17', 5);


select * from employee;

-- joins
select e.*,dept_name,location  from employee e
join department d
on e.dept_id = d.dept_id;

-- find all deparment in which We don't have any employee
-- left join ? department
select d.* from department d
left join employee e
on d.dept_id = e.dept_id
where emp_id is null;

-- subquery
-- find all employee who earns highest salary

-- highest salary -> max(salary)

select max(salary) from employee;

-- max -> 9500

select * from employee
where salary = 9500;


INSERT INTO employee (emp_name, phone, date_of_birth, salary, joining_date, dept_id) VALUES
('Harshil More', '9876500041', '1986-07-12', 10000, '2022-01-30', 2),
('Vaishnavi Shah', '9876500042', '2000-09-09', 10000, '2024-11-05', 3);


-- highest salary -> max(salary)

select max(salary) from employee;

-- max -> 10000

select * from employee
where salary = 10000;
-- subquery
select * from employee
where salary = (select max(salary) from employee);


-- Find all employees who earns second highest salary in company

-- max(salary)
select max(salary) from employee;
-- max(salary) excluding first max(salary)
select max(salary) from employee
where salary < (select max(salary) from employee);

select * from employee
where salary = 
	(
		select max(salary) from employee
		where salary < 
			(
				select max(salary) from employee
			)
    );



-- Find all employees who earns third highest salary in company

-- max(salary)
select max(salary) from employee;
-- max(salary) excluding first max(salary)
select max(salary) from employee
where salary < (select max(salary) from employee);

select * from employee
where salary = 
	(
		select max(salary) from employee
		where salary < 
			(
				select max(salary) from employee
                where salary < (select max(salary) from employee)
			)
    );


-- Find all employees who earns second highest salary in company as well as thir departments

