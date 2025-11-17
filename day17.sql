-- return (display {select}/ store in a variable)

select left("SPRK TECH",2);

use sakila;

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