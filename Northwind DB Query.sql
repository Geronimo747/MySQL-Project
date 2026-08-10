select * from customers;

SELECT CustomerName, City, Country FROM Customers;

SELECT CustomerName, City FROM Customers; 

SELECT ProductID, ProductName FROM Products;

select distinct country from customers;

Select distinct city from customers;


select distinct country from customers;

SELECT * FROM products WHERE price > 50.00;

select firstname, lastname, birthdate from employees;

select customername, address, city from customers;

select distinct city from suppliers;

select count(distinct city) from customers;

select * from customers where country = 'USA'  or country = 'UK';

select * from orders order by orderdate desc; 

select * 
from products 
where price between 20 and 50
order by price desc; 

select * from customers 
where country = 'USA'  and 
city = 'Portland'  or city = 'Kirkland'
order by customername asc;

select * from customers
where country = 'UK'
or city = 'London'
order by customername desc;

select count(customers) from customers where country = 'USA'; 

select * from customers
where customerid >= 15;

select * from products 
where categoryid = 1 or categoryid = 2 
order by productname asc;

select * from orders
where orderdate < '1996-08-27' or orderdate > '1997-02-21';

-- city starts with a
select customername, city
from customers
where city LIKE 'A%';
-- city end with a
select customername, city
from customers
where city LIKE '%a';
-- name of the product contains Choco
select *
from products
where productname like '%Choco%';

-- name of the product contains choco making all porductnames lower case for the where search 
select *
from products
where lower(productname) like '%choco%';
-- searches for cutomer name that second letter is 'r'
select customername
from customers
where customername like '_r%';
-- searches for contact name that starts with letter 'A' and ends with 'o'
SELECT contactname FROM Customers
WHERE ContactName LIKE 'A%o';

select * from suppliers
where country like '%land%';

select * from employees
where firstname like '_n%'

select * from products  
where categoryid in(1, 2)  
order by productname asc; 

select * from customers  
where country ='USA' and
city in('Portland' , 'Kirkland') 
order by customername asc; 

SELECT Customername, Country FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);
-- When select statement is used inside another select statement, its called subquery.
-- Country names from suppliers table are used to filter customers table.
-- customers that are from the same countries as the suppliers:

select * from customers
WHERE city IN( 'Berlin', 'Paris', 'Madrid');

select * from orders
where shipperid in(1,3);

-- take customerid from orders and filter the customers
select * from customers
where customerid in (select customerid from orders);

-- customers never placed order
Select * From customers
Where CustomerID not In (Select CustomerID From Orders);

-- Returns the first number of rows based on x in this case 3 
SELECT * FROM Customers
LIMIT 3;

SELECT * from products p 
JOIN suppliers s on p.supplierid = s.supplierid; 
--or same but differnet setup
SELECT * from products  
JOIN suppliers on products.supplierid = suppliers.supplierid; 
--This one only returns products table with suppliername columns added
SELECT products.*, suppliers.suppliername from products  
JOIN suppliers on products.supplierid = suppliers.supplierid;

select products.*, categories.categoryname from products
join categories on products.categoryid = categories.categoryid

-- Using Alias to give column temporay name
select count(customerid) as "UK Customers"
from customers
where country = 'UK';

select products.*, categories.categoryname from products
join categories on products.categoryid = categories.categoryid
where categories.categoryname = 'Meat/Poultry';

select * from orders
order by orderdate desc 
limit 1;

select * from products
order by price desc
limit 1;

select avg(quantity) from order_details;

select sum(quantity) from order_details;

select orders.orderid, orders.orderdate, customers.customername, employees.firstname as "Employees First Name", employees.lastname as "Employees Last Name" from orders
join employees on orders.employeeid = employees.employeeid
join customers on orders.customerid = customers.customerid;

select products.productname, categories.categoryname, suppliers.suppliername From products
Join categories on products.categoryid = categories.categoryid
join suppliers on products.supplierid = suppliers.supplierid;

select orders.* , customers.customername from orders
join customers on orders.customerid = customers.customerid
where EXTRACT(year from orders.orderdate) = 1996;
