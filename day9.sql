drop database if exists sprk_morning;

create database sprk_morning;

use sprk_morning;

/*
Table employee -> empId PK AUTO_INCREMENT,
first_name, last_name
*/
create table employee
(
	emp_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null
);

desc employee;

-- add 2 columns
-- onboard_date, last_update

alter table employee
add onboarding_date datetime 
default current_timestamp;

desc employee;
-- add not null
alter table employee
modify onboarding_date timestamp not null
default current_timestamp;

desc employee;

alter table employee
add last_update timestamp 
on update current_timestamp;

desc employee;

alter table employee
add email varchar(50) 
not null unique after last_name;

desc employee;

select * from employee;

insert into employee(first_name, last_name, email)
values 
("Rohit","Sharma","rohit12@gmail.com"),
("John","Doe","john877@gmail.com"),
("Shweta","Gupta","shweta65@gmail.com"),
("Abhishek","Yadav","abhi1222@gmail.com"),
("Abhishek","Mhatre","abhi7878@gmail.com");

select * from employee;

alter table employee 
add gender enum("Male","Female","Others")
after email;

desc employee;

select * from employee;

update employee set gender = "Male"
where emp_id = 1;

select * from employee;


update employee set gender = "Male"
where emp_id = 2;

select * from employee;

create table course
(
	cid int primary key auto_increment,
    
    cname varchar(30) not null,
    
    cduration varchar(30) not null
);

insert into course values 
(1001,"Python","30 Days"),
(1002,"SQL","35 Days"),
(1003,"Excel","25 Days"),
(1004,"Java","45 Days");

select * from course;

-- create student and apply foreign key(row level)

create table student
(
	roll_no int not null,
    name varchar(50) not null,
    phone varchar(15) not null,
    cid int,
    foreign key (cid) references course(cid)
);

desc student;

insert into student values
(1,"Demo 1","1234", null);
/*

Error Code: 1452. Cannot add or update a child row: 
a foreign key constraint fails 
(`sprk_morning`.`student`, CONSTRAINT `student_ibfk_1` 
FOREIGN KEY (`cid`) REFERENCES `course` (`cid`))

*/
insert into student values
(2,"Demo 2","454545", 1009);


insert into student values
(2,"Demo 2","454545", 1002);

select * from student;

insert into student values
(3,"Demo 3","11556", 1004);

update student
set cid = 1003
where roll_no = 1;

select * from course;
select * from student;