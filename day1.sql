#COMMENT QUERIES
-- COMMENT QUERIES - Single Line Comment

-- List of all database in my mysql server
show databases;

use sakila;

show tables;

select * from actor;

select "SPRK TECH";

select "SPRK TECH" as institute;
select "SPRK TECH" as `institute name`;

select 5;
select 5 as num;
select 5 + 6 ;
select 5 + 6 as addition;

-- Fetch only necessary columns
select * from rental;
select rental_id, rental_date, customer_id from rental;
