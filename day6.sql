-- DDL
create database sprk_morning_1;
use sprk_morning_1;

create table student
(
	roll_no int,
    first_name varchar(30),
    last_name varchar(30),
    phone varchar(15),
    enrollement_time datetime
);

describe student;

show create table student;

-- Values 
insert into student values 
(1,"SPRK","Tech","1234","2024-10-25 13:10:50");

insert into student values 
(1,"SPRK","Tech","1234","2024-10-25 13:10:50");

select * from student;