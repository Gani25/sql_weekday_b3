-- stored procedure
-- without parameters

use classicmodels;

delimiter $
create procedure allCustomerData()
begin
	select * from customers;
	select * from orders;
	select * from orderdetails;
	select * from products;
end $
delimiter ;

call allCustomerData();
-- with parameters -> in 


SELECT 
    c.customerNumber,
    customerName CompanyName,
    CONCAT_WS(' ', contactFirstName, contactLastName) contactFullName,
    phone,
    status,
    quantityOrdered,
    priceEach,
    p.productCode,
    productName
FROM
    customers c
        JOIN
    orders o ON c.customerNumber = o.customerNumber
        JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
        JOIN
    products p ON od.productCode = p.productCode
WHERE
    c.customerNumber = 496;


delimiter $

create procedure customerInfo(customerId int)
begin

SELECT 
    c.customerNumber,
    customerName CompanyName,
    CONCAT_WS(' ', contactFirstName, contactLastName) contactFullName,
    phone,
    status,
    quantityOrdered,
    priceEach,
    p.productCode,
    productName
FROM
    customers c
        JOIN
    orders o ON c.customerNumber = o.customerNumber
        JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
        JOIN
    products p ON od.productCode = p.productCode
WHERE
    c.customerNumber = customerId;	
    
    
end $

delimiter ;

call customerInfo(103);
call customerInfo(112);
call customerInfo(496);

