-- constraints -> column Level

use sprk_morning_1;

show tables;

select * from student;

-- how to modify structure of table

-- rollno, name,... 

alter table student 
add gender varchar(50);

select * from student;

alter table student
drop gender;

select * from student;

alter table student
add gender varchar(50) first;

select * from student;

alter table student
drop gender;

select * from student;

alter table student
add gender varchar(50) after name;

select * from student;
-- we have gender column and I want default value to be Male

alter table student 
modify gender varchar(50) default "Male";

select * from student;

describe student;

insert into student(name,phone) values
("Rohan Triphati","11111 22222");

select * from student;

-- add email column -> after gender -> not null, unique

-- ERROR
alter table student
add email varchar(255) unique not null after gender;
/*
Error Code: 1062. Duplicate entry '' for key 'student.email'
*/


alter table student
add email varchar(255) not null after gender;

select * from student;

-- syntax for update
/*
update table_name
set column_1 = Value_1
where unique_column = value
*/

update student
set email = "pranjal12@gmail.com"
where roll_no = 1;

select * from student;

update student
set email = "rajeev86@gmail.com"
where roll_no = 2;


select * from student;
update student 
set gender = "Female", email = "swetag12@yahoo.com"
where roll_no = 3;

select * from student;

-- multi row update
-- 2, 4, 5,6,7,20 --> in 
update student
set gender = "Male"
where roll_no in (2,4,5,6,7,20);

select * from student;

update student
set gender = "Female"
where roll_no = 1;

select * from student;

update student
set email = "rohanyad111@gmail.com"
where roll_no = 4;

update student
set email = "abdul3d@gmail.com"
where roll_no = 5;
update student
set email = "om1234@gmail.com"
where roll_no = 6;

update student
set email = "ojas1999@gmail.com"
where roll_no = 20;

update student
set email = "abdddd@gmail.com"
where roll_no = 7;

update student
set email = "rohan7410@gmail.com"
where roll_no = 21;

select * from student;

alter table student
modify email varchar(255) not null unique;

describe student;

truncate student;

select * from student;

insert into student (name, gender, email, phone ) values
("Demo 1","Female","Demo@gmail.com","12324");

select * from student;

drop table student;

show tables;

drop database sprk_morning_1;

show databases;
