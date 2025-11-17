-- return (display {select}/ store in a variable)

select left("SPRK TECH",2);

use sakila;
#-----------------------------------------------------------------------
# String Functions
#-----------------------------------------------------------------------
select *, left(first_name,1) from actor;
select *, left(first_name,1), right(first_name,3) from actor;
select *, left(first_name,1), left(last_name,1) from actor;
select *, concat(left(first_name,1), left(last_name,1)) from actor;

set @brand = "sprk";

select @brand, length(@brand);

set @brand = "     sprk technologies          ";

select @brand, length(@brand), ltrim(@brand), length(ltrim(@brand)),
rtrim(@brand), length(rtrim(@brand)), 
trim(@brand), length(trim(@brand));

set @brand = "Full Stack Java Development";


select replace(@brand, " ","-");
select replace(@brand, "Java",".Net");
select lower(replace(@brand, " ","-"));

set @brand = "sPRk TecHNoLogy";


select @brand;

select @brand, substring(@brand,1,6);
select @brand, substring(@brand,1,1);
select @brand, upper(substring(@brand,1,1));


select @brand, substring(@brand,2);
select @brand, upper(substring(@brand,1,1)),lower(substring(@brand,2));
select @brand, concat(
	upper(substring(@brand,1,1)),
    lower(substring(@brand,2))
);

#-----------------------------------------------------------------------
# Maths Functions
#-----------------------------------------------------------------------


use world;

select * from country;
select indepyear, abs(indepyear) from country
where indepyear is not null
order by indepyear;

select round(12.2258,2),round(12.2258);
select round(12.6258,2),round(12.6258);


# nearest uppest whole number
select ceil(12.2258);
select floor(12.2258);

select pi();

select sqrt(81);
select sqrt(90);

select mod(11,3) as remainder;

select radians(180);

-- 180 deg Radian 3.141592653589793

select sin(90);
select sin(radians(90));

select degrees(3.141592653589793);

#-----------------------------------------------------------------------
# Date Functions
#-----------------------------------------------------------------------

select now();

select now(), adddate(now(), interval 7 day);
select now(), adddate(now(), interval 1 month);
select now(), adddate(now(), interval 28 day);
select now(), adddate(now(), interval 1 year);
select now(), adddate(now(), interval -1 year);

select now(), subdate(now(), interval 1 year);
select now(), addtime(now(), "0:20:00");
select now(), addtime(now(), "1:00:00");

