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

select *, details ->"$.age" from employee;
select *, details ->"$.skills" from employee;
select *, details ->"$.skills[0]" from employee;
select *, details ->"$.address" from employee;
select *, details ->"$.address.pincode" from employee;


select *, Json_extract(details,"$.age")  from employee;
select *, Json_extract(details,"$.skills")  from employee;
select *, Json_extract(details,"$.skills[0]")  from employee;

select *, Json_extract(details,"$.address.pincode")  from employee;

-- where age is 30
select * from employee
where details->"$.age" = 30;

select * from employee
where details->"$.age" < 30;

-- update

select * from employee;

update employee
set details = json_set(details, "$.age",35)
where emp_id = 3;

select * from employee;

update employee
set details = json_set(details, "$.skills",json_array("Python","Excel","PowerBI"))
where emp_id = 1;

select * from employee;

update employee
set details = json_set(details, "$.skills[1]","Java")
where emp_id = 1;

select * from employee;

update employee
set details = json_array_append(details, "$.skills","Spring Boot")
where emp_id = 1;

select * from employee;

update employee
set details = json_remove(details, "$.skills")
where emp_id = 1;

select * from employee;

update employee
set details = json_remove(details, "$.address.pincode")
where emp_id = 2;

select * from employee;

update employee
set details = '{}'
where emp_id = 1;

select * from employee;

update employee
set details = Json_object()
where emp_id = 2;


select * from employee;

delete from employee
where details -> "$.age" = 35;

select * from employee;