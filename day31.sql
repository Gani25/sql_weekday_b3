use sprk_morning;
-- exception/error handling

-- exit handler

drop procedure if exists show_tables;
show tables;
delimiter $

create procedure show_tables()
begin
	declare exit handler for 1146 
    select "Table Not Found" as error_message;
    
	select * from course;
    
    select * from employee;
    
    select * from students;
    
    select * from department;
    
    select * from fact_student_course;
	
end $

delimiter ;

call show_tables();


-- exit handler

drop procedure if exists show_tables;
show tables;
delimiter $

create procedure show_tables()
begin
	declare continue handler for 1146 
    select "Table Not Found" as error_message;
    
	select * from course;
    
    select * from employee;
    
    select * from students;
    
    select * from department;
    
    select * from sprk;
    
    select * from fact_student_course;
	
end $

delimiter ;

call show_tables();


drop procedure if exists show_tables;
show tables;
delimiter $

create procedure show_tables()
begin
	declare error_msg text;
	declare error_code int;
	declare continue handler for 1146
	begin
		get diagnostics condition 1 
        error_msg = message_text,
        error_code = mysql_errno;
        
        select error_msg, error_code;
    end ;
	
	select * from course;
    
    select * from employee;
    
    select * from students;
    
    select * from department;
    
    select * from sprk;
    
    select * from fact_student_course;
	
end $

delimiter ;

call show_tables();


select * from employee;
truncate table employee;
alter table employee
add email varchar(100) unique not null after emp_name;

alter table employee
modify emp_id int primary key auto_increment;
select * from employee;
desc employee;

delimiter $

drop procedure if exists insert_employee $
create procedure insert_employee
(
	e_name text,
    emp_email text,
    dept text,
    sal int 
)
begin
	declare msg text;
	declare exit handler for 1062
    begin
		get diagnostics condition 1
        msg = message_text;
        
        select msg as error_msg;
    end ;
    
    	declare exit handler for 1048
    begin
		get diagnostics condition 1
        msg = message_text;
        select msg as error_msg;
    end ;
    

	insert into employee(emp_name, email,department,salary)
    values (e_name, emp_email, dept, sal);
    
    select * from employee;

end $

delimiter ;

call insert_employee("Demo 1","demo1@gmail.com","HR",2500);

/*
Error Code: 1062. Duplicate entry 'demo1@gmail.com' for key 'employee.email'
Error Code: 1048. Column 'department' cannot be null

*/
call insert_employee("Demo 1","demo1@gmail.com","HR",2500);
call insert_employee("Demo 2","demo2@gmail.com",null,2500);
call insert_employee("Demo 3","demo3@gmail.com","",2500);
call insert_employee("Demo 4","demo4@gmail.com","     ",2500);