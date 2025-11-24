-- cascade

use sprk_morning;

show tables;

select * from employee;
select * from department;

/*
Error Code: 1451. 
Cannot delete or update a parent row: 
a foreign key constraint fails 
(`sprk_morning`.`employee`, 
CONSTRAINT `dept_fk` FOREIGN KEY (`dept_id`) 
REFERENCES `department` (`dept_id`))
*/
delete from department 
where dept_id = 1;


-- on delete cascade, on update cascade

drop table employee;
drop table department;


create table department
(
	did int primary key auto_increment,
    dname varchar(50) not null
    
);

create table employee
(
	emp_id int primary key auto_increment,
    emp_name varchar(50) not null,
    dept_id int,
    foreign key(dept_id) references department(did) 
    on delete cascade 
    on update cascade
);

INSERT INTO `sprk_morning`.`department` (`dname`) VALUES ('IT');
INSERT INTO `sprk_morning`.`department` (`dname`) VALUES ('Sales');
INSERT INTO `sprk_morning`.`department` (`dname`) VALUES ('HR');
INSERT INTO `sprk_morning`.`department` (`dname`) VALUES ('Admin');

select * from department;

INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Rohit Mehta', '1');
INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Shruti Shinde', '1');
INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Rohan Deshmukh', '4');
INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Pranjali Sharma', '2');
INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Ajit Gupta', '4');
INSERT INTO `sprk_morning`.`employee` (`emp_name`, `dept_id`) VALUES ('Abdul Memon', '1');

select * from employee;

select * from department;

delete from department
where did = 1;

select * from department;
select * from employee;

update department
set did = 100 
where did = 4;


select * from department;
select * from employee;