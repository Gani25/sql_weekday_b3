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