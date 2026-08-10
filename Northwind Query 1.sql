select * from 

SELECT * from products p  
JOIN suppliers s on p.supplierid = s.supplierid; 

select *
from orders
inner join customers
on orders.customerid = customers.customerid
order by customers.customerid;

select distinct categoryname, COUNT(products.productid) from categories
inner join products on categories.categoryid = products.categoryid
group by categoryname;

select distinct categoryname, COUNT(products.productid) from categories
join products on categories.categoryid = products.categoryid
group by categoryname;
 
select products.productname, products.price, order_details.quantity from products
inner join order_details on products.productid = order_details.productid;

--Write a query to list the employees who handled each order, along with the order date.
select employees.employeeid, employees.firstname, employees.lastname,  orders.orderid, orders.orderdate from employees
inner join orders on employees.employeeid = orders.employeeid;
--or
select employees.*,  orders.orderid, orders.orderdate from employees
inner join orders on employees.employeeid = orders.employeeid;

select orders.*, shippers.shippername from orders
inner join shippers on orders.shipperid = shippers.shipperid
where shippers.ShipperName = 'Speedy Express';

--Write a query to display all products along with their category names.
select products.*, categories.categoryname from products 
inner join categories on products.categoryid = categories.categoryid; 

--Write a query to list all products and their quantities for each order.
select products.productname, sum(order_details.quantity) from order_details
inner join products on order_details.productid = products.productid
group by productname
order by productname;

--Write a query to list all products and their quantities for each order.
select products.productname, order_details.quantity from order_details
inner join products on order_details.productid = products.productid
order by productname;

-- orders not yet shipped
select o.orderid, s.shipperid
from orders as o
left join shippers as s
on o.shipperid = s.shipperid
where o.orderid is null;
 
--Right join 
SELECT employees.employeeid, Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders -- left table
RIGHT JOIN Employees -- right table
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID desc;

SELECT * from products p  
inner JOIN suppliers s on p.supplierid = s.supplierid; 
 
select products.productname, categories.categoryname from products 
inner join categories on products.categoryid = categories.categoryid
order by productname;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;


-- the total sales by product:
-- sales= price * quantity
select sum(price*quantity) as totalsales, productname
from products as p
join order_details as od
on p.productid = od.productid
group by productname
order by totalsales desc;
 

--Write SQL query to list the number of customers in each city.

select city, count(customers) from customers
group by city;

--Write a query to list each product category and the total quantity of products sold in that category.

select sum(od.quantity) as QuantitySold, c.categoryname
from categories as c
join products as p
on c.categoryid = p.categoryid
join order_details as od 
on p.productid = od.productid
group by c.categoryname
order by categoryname;


--Write a query to list each employee and the number of orders they have handled.

select employees.*, count(orders) from employees
join orders on employees.employeeid = orders.employeeid
group by employees.employeeid
order by employees.employeeid;

select products.productname, products.price, order_details.quantity from products 

inner join order_details on products.productid = order_details.productid; 

select productname, price, sum(quantity) as quantity, sum(quantity * price) as sales
from products as p
join order_details as od
on p.productid = od.productid
group by productname, price
order by quantity desc;
 
