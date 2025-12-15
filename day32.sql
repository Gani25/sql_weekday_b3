use sprk_morning;

select * from employee;

drop table if exists employee;

create table employee
(
	emp_id int primary key auto_increment,
    name varchar(100) not null,
    details json
);


desc employee;

select * from employee;

-- insert into JSON without using any JSON Functions

insert into employee (name, details) 
values 
("Ashish Verma",
'
{
	"department":"IT",
    "age":30,
    "salary":2500.55
}
'
);

select * from employee;

-- arrays and nested objects
insert into employee (name, details) 
values 
("Rohini Sable",
'
{
	"department":"HR",
    "age":26,
    "salary":3200.55,
    "skills":["Excel","Onboarding","Retention"],
    "address":{
		"city":"Panvel",
        "state":"Maharashtra",
        "pincode":"410 208"
    }
}
'
);


select * from employee;

select *, details->"$.age" as emp_age from employee;
select *, details->"$.age" as emp_age,
details->"$.skills" as emp_skills 
from employee;

select *, details->"$.age" as emp_age,
details->>"$.skills" as emp_skills 
from employee;

select *, details->"$.age" as emp_age,
details->>"$.address" as emp_address_unquoted, 
details->"$.address" as emp_address 
from employee;

-- insert with json functions (simplest and recommended)
-- arrays and nested objects
insert into employee (name, details) 
values 
("Shruti Sharma",
json_object(
	"department","HR",
    "age",26,
    "salary",3200.55,
    "skills",json_array("Core Java","React","Spring Boot","Microservices"),
    "address",json_object(
		"city","Panvel",
        "state","Maharashtra",
        "pincode","410 208"
    )
)
);

select * from employee;