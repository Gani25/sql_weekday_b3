-- joins


use sprk_morning;

show tables;


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

insert into student values
(1,"Demo 1","1234", 1004),
(1,"Demo 1","1234", 1001),
(2,"Demo 2","454545", 1001);
select * from student;
select * from course;

select distinct name from student;
select count(distinct name) total_students from student;


-- find all students who have bought which course

select * from student st
join course cou
on st.cid = cou.cid;


select st.*,cname, cduration from student st
join course cou
on st.cid = cou.cid
order by roll_no;


select cname, cduration, st.* from course cou
join student st
on st.cid = cou.cid
order by roll_no;


insert into course values
(1005,"Power BI","30 days"),
(1000,"Linux","15 days");



select * from course;

-- find all courses in which we don't have any students

select cou.* from course cou
left join student st 
on cou.cid = st.cid
where roll_no is null;

select * from student;

truncate table student;

desc student;
/*
Error Code: 1828. Cannot drop column 'cid': 
needed in a foreign key constraint 
'student_ibfk_1'

*/
alter table student
drop cid;

show create table student;

alter table student
drop constraint student_ibfk_1;

show create table student;

alter table student
drop cid;

desc student;



-- add constraint (alter)

alter table student
add constraint primary key(roll_no);

desc student;

alter table student
modify roll_no int auto_increment;

desc student;

-- with modify column we can do same thing
/*alter table student
modify roll_no int primary key auto_increment;*/

-- add unique on phone

insert into student (name,phone) values
("Shubham Kokate","12345 12345"),
("Abhishek Sharma","55555 12345"),
("Rohan Yadav","12345 68989"),
("Shruti Shinde","12345 55555"),
("Pranjal Gupta","12345 11111");

select * from student;
select * from course;

create table fact_student_course
(
	order_id int primary key auto_increment,
    student_id int not null,
    course_id int not null,
    purchase_date datetime not null default current_timestamp
);

desc fact_student_course;

alter table fact_student_course
add constraint fk_roll_no foreign key(student_id)
references student(roll_no);


desc fact_student_course;
show create table fact_student_course;

alter table fact_student_course
add constraint fk_cid foreign key(course_id)
references course(cid);

desc fact_student_course;