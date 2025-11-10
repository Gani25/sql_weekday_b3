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
