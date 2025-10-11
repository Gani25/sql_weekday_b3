-- day 2
use sakila;

show tables;

select * from actor;
select * from customer;
select customer_id,first_name, last_name 
from customer;

select customer_id as id,first_name, last_name 
from customer;

/*
Arithmetic Operator -> Numeric Column / Values
1. *
2. /
3. DIV
4. %
5. Mod
6. +
7. -
*/
select 11 / 3 ;

select 11 / 3 as decimal_quotient, 
11 div 3 as integer_quotient;
select 11%3 as Remainder, 
11 mod 3 as Keyword_Remainder;
select 11 MOD 3 as Remainder;
select 11 DIV 3 as integer_quotient;

show tables;
select * from film;
select film_id, title, rental_rate as USD_rate,
rental_rate * 84 as INR_rate
from film;

select film_id, title, rental_rate as USD_rate,
rental_rate * 84 as INR_rate,
rental_rate * 84 + 0.1 * rental_rate * 84  
as INR_rate_tax,  0.1 * rental_rate * 84  as tax
from film;

/*
Relational Operator -> True / False
1. Greater Than -- >
2. Less Than -- <
3. Greater Than or Equal To-- >=
4. Less Than Or Equal To -- <=
5. Equal To -- =
6. Not Equal To -- != / <>
*/
/*
Filter ROWS/Data -> where clause
*/

select * from actor;
select * from actor
where actor_id < 10;

select * from actor
where actor_id < 11;
select * from actor
where actor_id <= 10;

select * from actor
where actor_id = 5;
select * from actor
where actor_id = 500;

select * from actor
where actor_id != 5;

select * from actor
where first_name = "penelope";

select * from actor
where first_name != "penelope";

/*
Logical Operator -> 
(When we have more than one conditions)
and
or 
not
*/

-- find all actor whose first name is Penelope
select * from actor
where first_name = "Penelope";
-- find all actor whose first name is Penelope
-- and their id is less than 100
select * from actor
where first_name = "Penelope" and
actor_id < 100;
-- find all actor whose first name is Penelope
-- and their id is less than 100
-- and his last_name is Pinkett
select * from actor
where first_name = "Penelope" and
actor_id < 100
and last_name = "Pinkett";

-- if any 1 condition is false in and opr no result
select * from actor
where first_name = "Penelope" and
actor_id < 100
and last_name = "Mhatre";
