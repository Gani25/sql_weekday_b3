-- Day 4

/*
arithmetic Opr
Relational opr
Logical Opr
in / not in 
between / not between
*/

use sakila;

select * from actor
where actor_id not in (5,50,1,10);

-- handling null values 
/*
null -> no values / undefined
*/

use world;

select * from country
where indepyear is null;

-- find coutnries which are rulled by another countries
select * from country
where indepyear is not null;


use sakila;
select * from actor;

-- Searching Based On Patterns
/*
LIKE
% -> Percentage
_ -> Underscores
*/

-- find all actors whose first name starts with A
select * from actor 
where first_name like "A%";


-- find all actors whose first name ends with A
select * from actor 
where first_name like "%A";

select * from actor 
where first_name like "%";

select * from actor 
where first_name like "%A%";

-- contains
select * from actor 
where first_name like "%AL%";

select * from actor 
where first_name like "A%E";

select * from actor 
where first_name like "A%E%";



