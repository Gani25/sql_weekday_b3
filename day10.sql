use sprk_morning;

show tables;

create table my_table_1
(
	id int,
    value varchar(20)
);

select * from my_table_1;

insert into my_table_1 values
(10,"Ten"),
(1,"One"),
(3,"Three"),
(2,"Two"),
(4,"Four"),
(6,"Six");


select * from my_table_1;



create table my_table_2
(
	id int,
    data varchar(20)
);

select * from my_table_2;

insert into my_table_2 values
(1,"One"),
(2,"Two - 2"),
(3,"Three"),
(8,"Eight"),
(12,"Twelve"),
(6,"Six - 6"),
(20,"Twenty");

select * from my_table_1;
select * from my_table_2;

-- Inner Join based on id column
select * from my_table_1
join my_table_2
on my_table_1.id = my_table_2.id;

-- Inner Join based on id column
select * from my_table_1
inner join my_table_2
on my_table_1.id = my_table_2.id;

select my_table_1.id as T1ID, value as T1Value,
my_table_2.id as T2ID, data as T2Data
 from my_table_1
inner join my_table_2
on my_table_1.id = my_table_2.id;


select t1.id T1ID, value T1Value,
t2.id T2ID, data T2Data
from my_table_1 t1
inner join my_table_2 t2
on t1.id = t2.id;


-- comapre with value and data

SELECT 
    t1.id T1ID, value T1Value, t2.id T2ID, data T2Data
FROM
    my_table_1 t1
        INNER JOIN
    my_table_2 t2 ON value = data;

-- Left Join


select t1.id T1ID, value T1Value,
t2.id T2ID, data T2Data
from my_table_1 t1
left join my_table_2 t2
on t1.id = t2.id;

select t1.id T1ID, value T1Value,
t2.id T2ID, data T2Data
from my_table_1 t1
left join my_table_2 t2
on value = data;


-- right Join


select t1.id T1ID, value T1Value,
t2.id T2ID, data T2Data
from my_table_1 t1
right join my_table_2 t2
on t1.id = t2.id;

select t1.id T1ID, value T1Value,
t2.id T2ID, data T2Data
from my_table_1 t1
right join my_table_2 t2
on value = data;