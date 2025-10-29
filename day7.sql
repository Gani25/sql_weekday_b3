use sprk_morning_1;

show tables;

select * from student;

insert into student values
(null, null, null, null, null);

select * from student;

drop table student;

select now();
select current_timestamp;
-- Table with constraints
create table student
(
	roll_no int primary key auto_increment,
    name varchar(50) not null,
    phone varchar(15) not null unique,
    addmission_date datetime not null default now(),
    last_update datetime on update now()
);

describe student;

show create table student;

describe student;

insert into student (phone,name) values
("12345 12345","Pranjal Sharma");

select * from student;
-- multiple rows insert 

insert into student (phone,name) values
("98765 98765","Rajeev Gupta"),
("54321 54321","Sweta Gupta"),
("32132 32132","Rohan Yadav");

select * from student;
-- Error Code: 1364. Field 'name' doesn't have a default value
insert into student (phone) values
("98765 12345");


insert into student (phone,name) values
("12345 67890","Abdul Gani");

select * from student;

/*
Error Code: 1062. Duplicate entry '12345 67890' 
for key 'student.phone'
*/
insert into student (phone,name) values
("12345 67890","Abdul Gani");

insert into student (phone,name) values
("99999 88888","Abdul Gani");

select * from student;

insert into student (phone,name, roll_no) values
("99999 77777","Ojas Headau",20);

select * from student;

insert into student (phone,name, roll_no) values
("77777 77777","Om Headau",6);

select * from student;