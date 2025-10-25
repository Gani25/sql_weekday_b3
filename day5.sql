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

select * from country;
-- Find all the continent in world
-- distinct
select distinct continent from country;

select count(distinct continent) as number_of_continents 
from country;

-- Find number of countries in each continent
-- continent , count()
select * from country
order by continent;

select * from country
where continent = "Asia";
select continent, count(*) from country
where continent = "Asia";

select continent, count(*) from country
where continent = "North America";
-- group by

select continent, count(*) from country
group by continent;

select name, count(*) from country
group by name;

select continent, sum(population), count(*), max(population) from country
group by continent;

select * from country
where continent = "North America" and
population = 278357000;


-- find all the continent which have more than 40 countries

select continent, count(*) as total_countries from country
group by continent
having total_countries > 40;



