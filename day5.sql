-- day 5
/*
Functions: Block of sql statement which we can 
reuse again and again
1. In mysql functions are scalar function -> 
always return single values
*/

-- aggregate functions (NUMERIC COLUMNS)
/*
1. sum()
2. min()
3. max()
4. count()
5. avg()

*/

select "SPRK";
use world;

show tables;
select * from country;

-- find total population of world
select sum(population) as total_population from country;

-- ERROR - Invalid use of group by
select *, sum(population) as total_population from country;

-- find maximum population of world
select max(population) as max_pop from country;

select * from country
where population = 1277558000;

-- ERROR
select * from country
where population = max(population);


-- find minimum population of world
select min(population) as min_pop from country;

select * from country
where population = 0;


-- calculate total_rows in country table -> 
-- number of countries in world


-- result is wrong -> as we have 239 rows but showing only 192
select count(indepyear) from country;
select * from country
where indepyear is not null;

select count(*) from country;

-- avg = sum / number of rows
select avg(population) from country;
select avg(population), sum(population) / count(*)
from country;
