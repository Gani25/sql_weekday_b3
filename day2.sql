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