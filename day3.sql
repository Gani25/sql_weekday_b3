use sakila;

show tables;

select * from actor;

-- find actos whose first_name is either 
-- ED, Johnny, Sidney, CUBA
select * from actor
where first_name = "ED" 
or first_name = "Johnny"
or first_name = "CUBA"
or first_name = "Sidney";

-- find actos whose first_name is either 
-- ED, Johnny, Sidney, CUBA
-- as well as their id should be less than 
-- or equal to 100

/*WRONG RESULT SINCE
sidney is only comapring with <= 100
*/
select * from actor
where first_name = "ED" 
or first_name = "Johnny"
or first_name = "CUBA"
or first_name = "Sidney"
and actor_id <= 100;

select * from actor
where (first_name = "ED" 
or first_name = "Johnny"
or first_name = "CUBA"
or first_name = "Sidney")
and actor_id <= 100;

select * from actor
where first_name = "Penelope" 
and last_name = "Mhatre";

select * from actor
where first_name = "Penelope" 
or last_name = "Mhatre"
or last_name = "Chase";


-- find actos whose first_name is either 
-- ED, Johnny, Sidney, CUBA
select * from actor
where first_name in ("ED","Johnny","CUBA","Sidney");



-- find actos whose first_name is either 
-- ED, Johnny, Sidney, CUBA
-- actor_id <= 100
select * from actor
where first_name in ("ED","Johnny","CUBA","Sidney")
and actor_id <= 100;

select * from actor
where first_name in ("ED","Johnny",
"CUBA","Sidney", "Abdul Gani")
and actor_id <= 100;

-- find actors except first_name = Penelope

select * from actor
where not first_name = "Penelope";

select * from actor
where not first_name = "Abdul";

-- find actors whose id is in range 20 to 25

select * from actor;
select * from actor
where actor_id >= 20 and actor_id <= 25;

-- find actors whose id is in range 20 to 25
-- as well as 100 to 110

select * from actor
where (actor_id >= 20 and actor_id <= 25)
or (actor_id >= 100 and actor_id <= 110);

-- between
select * from actor
where actor_id between 20 and 25;

select * from actor
where actor_id between 20 and 25
or actor_id between 100 and 110;

-- in / between -> not in / not between

select * from actor
where first_name not in
("ED","Johnny","CUBA","Sidney");

select * from actor
where actor_id not between 20 and 25;


-- limit
select * from rental
limit 5;
-- limit
select * from rental
limit 15;

-- limit offset
select * from rental
limit 10 offset 5;

select * from rental
limit 5,10;

select * from rental
limit 5, 10;
