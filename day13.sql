-- day 13

-- joins ->
/*
1. Natural Join
2. Cross Join
3. Self Join
4. Outer Join
*/

use sprk_morning;

show tables;

select * from my_table_1;
select * from my_table_2;
/*
Natural Join is a type of join which will
automatically join multiple table based on 
common column names
It doesnot require any conditions
Natural Inner Join / Natural Join
Left Join
Right Join
*/

select * from my_table_1
natural join my_table_2;

select * from my_table_1
natural left join my_table_2;

alter table my_table_1
rename column value to data;

select * from my_table_1;
select * from my_table_2;

select * from my_table_1
natural join my_table_2;

select * from my_table_1
natural left join my_table_2;


create table food_item
(
	name varchar(50),
    price int
);

select * from food_item;
insert into food_item values
("Veg Burger",60),
("Pizza",250),
("Sandwich",80),
("Pav Bhaji",100);


create table variations
(
	toppings varchar(50),
    extra_amount int
);

insert into variations values
("Simple",0),
("Cheese",35),
("Butter",20),
("Butter Cheese",50);

select * from food_item;
select * from variations;

-- cross join
/*
Cartesian Join -> combines all rows from one table
into another table
It doesn't require any conditions
*/

-- menu

select * from food_item
cross join variations;


select concat(toppings," ", name) as menu,
price + extra_amount as amount
from food_item
cross join variations
order by name, amount;

