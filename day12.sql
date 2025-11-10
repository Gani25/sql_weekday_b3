use sprk_morning;

show tables;

select * from student;
select * from course;
select * from fact_student_course; # transactions

insert into fact_student_course 
(student_id, course_id) values 
(1,1001),
(5,1001),
(1,1000),
(2,1005),
(5,1000),
(2,1001),
(2,1003);

select * from fact_student_course;
select distinct student_id from fact_student_course;
select distinct course_id from fact_student_course;


-- find all the information of student who have bought
-- which course

select s.*, c.*, 
fsc.order_id, fsc.purchase_date 
from student s
join fact_student_course fsc
on s.roll_no = fsc.student_id
join course c 
on fsc.course_id = c.cid;


select s.*, c.*, 
fsc.order_id, fsc.purchase_date 
from student s
join fact_student_course fsc
on s.roll_no = fsc.student_id
join course c 
on fsc.course_id = c.cid
where roll_no = 2;


select * from student s
left join fact_student_course fsc
on s.roll_no = fsc.student_id;


select s.* from student s
left join fact_student_course fsc
on s.roll_no = fsc.student_id
where student_id is null;



select c.* from course c
left join fact_student_course fsc
on cid = course_id
where course_id is null;


use classicmodels;

show tables;

select * from customers;
select * from orders;
select * from orderdetails;
select * from products;

/*
Find customer details and 
which product they have purchased
*/
select c.customerNumber,   customerName companyName,
concat(contactFirstName," ",contactLastName) contactName,
phone, status, quantityOrdered, priceEach,
productName, quantityInStock, buyPrice, MSRP
from customers c
join orders o on c.customerNumber = o.customerNumber
join orderdetails odtl on o.orderNumber = odtl.orderNumber
join products p on odtl.productCode = p.productCode;

-- find which product is not sold yet!
select * from products;
select * from orderdetails;

select * from products p
left join orderdetails od
on p.productCode = od.productCode
order by ordernumber;


select p.* from products p
left join orderdetails od
on p.productCode = od.productCode
where ordernumber is null;
