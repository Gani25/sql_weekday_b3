use sprk_morning;

show triggers;

select * from employee;
-- whenever update happens on employee table
-- store old values and new updated values in another table
-- employee_history along with one more column status

-- copy table with like
-- copy the structure with all constraints without data
create table employee_history
like employee;


desc employee_history;
select * from employee_history;

-- I want to table structure without any constraints
drop table if exists employee_history;

create table employee_history
as select * from employee;


desc employee_history;

select * from employee_history;
truncate table employee_history;


alter table employee_history
modify acc_created_at timestamp;


desc employee_history;


alter table employee_history
modify acc_updated_at timestamp;


desc employee_history;

alter table employee_history
add status varchar(100) after last_name;


select * from employee_history;

delimiter $

create trigger emp_history_trigger
after update on employee
for each row
begin
	
    insert into employee_history values
    (old.emp_id, old.first_name, old.last_name, "Before Update",
    old.acc_created_at, old.acc_updated_at );	
    insert into employee_history values 
    (new.emp_id, new.first_name, new.last_name, "After Update",
    new.acc_created_at, new.acc_updated_at );
    
end $

delimiter ;


select * from employee;

update employee
set first_name = "Virat"
where emp_id = 1;

UPDATE `sprk_morning`.`employee` SET `last_name` = 'Gupta' WHERE (`emp_id` = '6');


select * from employee;
select * from employee_history;

desc employee;

create table employee_profile
(
	r_id int primary key auto_increment,
    emp_id int,
    message varchar(100)
);

delimiter $

create trigger emp_reminder
after insert on employee
for each row

begin

	if new.first_name is null or new.last_name is null then
		insert into employee_profile(emp_id, message) values
        (new.emp_id, "Please complete your profile..");
	end if;

end $

delimiter ;

show triggers;

select * from employee;

insert into employee(first_name, last_name) values
( null,null );

select * from employee;
select * from employee_profile;

delimiter $

create trigger delete_reminder
after update on employee
for each row
begin
	if new.first_name is not null and new.last_name is not null then
		delete from employee_profile
        where emp_id = new.emp_id;
	end if;
end $

delimiter ;


select * from employee;

update employee
set first_name = "Anjali"
where emp_id = 11;

select * from employee;
select * from employee_profile;


update employee
set last_name = "Verma"
where emp_id = 11;


select * from employee;
select * from employee_profile;

