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




