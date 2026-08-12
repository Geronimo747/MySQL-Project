# <img width="48" height="48" alt="image" src="https://github.com/user-attachments/assets/8879e4ab-b217-41b8-976f-5ab026ff641f" /> SQL Query Examples & Explanations

This document demonstrates common SQL queries used for data retrieval, filtering, sorting, joining tables, and generating business reports. The examples are based on practical exercises completed using the Northwind and World databases. 

---

# Basic Data Retrieval

## Retrieve All Customer Data

### Purpose
Return every column and every record from the Customers table.

```sql
SELECT *
FROM Customers;
```

### Explanation
- `SELECT *` returns all columns.
- `FROM Customers` specifies the source table.
- Useful for viewing all customer information.

---

## Retrieve Customer Names and Cities

### Purpose
Display only customer names and their cities.

```sql
SELECT CustomerName, City
FROM Customers;
```

### Explanation
- Returns selected columns instead of all data.
- Useful for location-based marketing campaigns.

---

## Retrieve Unique Cities

### Purpose
Display a list of customer cities without duplicates.

```sql
SELECT DISTINCT City
FROM Customers;
```

### Explanation
- `DISTINCT` removes duplicate values.
- Helps identify unique customer locations.

---

# Filtering Data

## Products Above £50

### Purpose
Identify high-value products.

```sql
SELECT *
FROM Products
WHERE Price > 50;
```

### Explanation
- `WHERE` filters records.
- Only products with a price greater than £50 are returned.

---

## Customers From USA or UK

### Purpose
Find customers located in either the USA or the UK.

```sql
SELECT *
FROM Customers
WHERE Country IN ('USA', 'UK');
```

### Explanation
- `IN` allows multiple values in a condition.
- Simplifies multiple OR conditions.

---

## Products Between £20 and £50

### Purpose
Retrieve mid-range products.

```sql
SELECT *
FROM Products
WHERE Price BETWEEN 20 AND 50
ORDER BY Price DESC;
```

### Explanation
- `BETWEEN` selects a range of values.
- `ORDER BY Price DESC` sorts results from highest to lowest price.

---

## Portland and Kirkland Customers

### Purpose
Retrieve USA customers located in Portland or Kirkland.

```sql
SELECT *
FROM Customers
WHERE Country = 'USA'
  AND City IN ('Portland', 'Kirkland')
ORDER BY CustomerName ASC;
```

### Explanation
- Combines multiple filtering conditions.
- Results are sorted alphabetically.

---

# Sorting Data

## Recent Orders Report

### Purpose
Display the most recent orders first.

```sql
SELECT *
FROM Orders
ORDER BY OrderDate DESC;
```

### Explanation
- `ORDER BY` sorts data.
- `DESC` sorts from newest to oldest.

---

## Customers From UK or London

### Purpose
Retrieve customers located in the UK or London.

```sql
SELECT *
FROM Customers
WHERE Country = 'UK'
   OR City = 'London'
ORDER BY CustomerName DESC;
```

### Explanation
- `OR` allows either condition to be true.
- Results are sorted in reverse alphabetical order.

---

# SQL JOIN Examples

## Find Supplier for Each Product

### Purpose
Combine products with supplier information.

```sql
SELECT *
FROM Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID;
```

### Explanation
- `INNER JOIN` returns matching records from both tables.
- Links products to their suppliers.

---

## Find Product Categories

### Purpose
Display products alongside their categories.

```sql
SELECT
    Products.ProductName,
    Categories.CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID;
```

### Explanation
- Combines product and category information.
- Useful for inventory reporting.

---

## Meat/Poultry Products

### Purpose
Retrieve all products in the Meat/Poultry category.

```sql
SELECT Products.*, Categories.CategoryName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry';
```

### Explanation
- Uses a join and filter condition.
- Returns only Meat/Poultry products.

---

## Complete Order Overview

### Purpose
Display order, customer, and employee information.

```sql
SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Customers.CustomerName,
    Employees.FirstName,
    Employees.LastName
FROM Orders
INNER JOIN Employees
    ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID;
```

### Explanation
- Combines three related tables.
- Produces a detailed business report.

---

## Product, Category and Supplier Report

### Purpose
Create a complete product information report.

```sql
SELECT
    Products.ProductName,
    Categories.CategoryName,
    Suppliers.SupplierName
FROM Products
INNER JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID;
```

### Explanation
- Demonstrates multiple joins.
- Provides complete product details.

---

# Aggregate Functions

## Product Count by Category

### Purpose
Count products in each category.

```sql
SELECT
    CategoryName,
    COUNT(ProductID) AS ProductCount
FROM Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName;
```

### Explanation
- `COUNT()` totals records.
- `GROUP BY` creates category summaries.

---

## Sales Volume Breakdown

### Purpose
Calculate product sales quantities and value.

```sql
SELECT
    ProductName,
    Price,
    SUM(Quantity) AS Quantity,
    SUM(Quantity * Price) AS Sales
FROM Products p
JOIN Order_Details od
    ON p.ProductID = od.ProductID
GROUP BY ProductName, Price
ORDER BY Quantity DESC;
```

### Explanation
- `SUM()` calculates totals.
- Generates sales performance metrics.

---

# World Database Queries

## Count Cities in USA

### Purpose
Determine how many cities are recorded in the USA.

```sql
SELECT COUNT(City) AS Cities_In_USA
FROM City
WHERE CountryCode = 'USA';
```

### Explanation
- Counts matching city records.

---

## Country With Highest Life Expectancy

### Purpose
Identify the country with the highest life expectancy.

```sql
SELECT Name, LifeExpectancy
FROM Country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1;
```

### Explanation
- Sorts countries by life expectancy.
- Returns the highest result.

---

## Cities Containing "New"

### Purpose
Find cities containing the word "New".

```sql
SELECT
    City.Name AS City_Name,
    Country.Name AS Country_Name
FROM City
JOIN Country
ON City.CountryCode = Country.Code
WHERE City.Name LIKE '%New %';
```

### Explanation
- `LIKE` searches using pattern matching.
- `%` represents any characters.

---

## Top 10 Most Populated Cities

### Purpose
Display the most populated cities.

```sql
SELECT Name
FROM City
ORDER BY Population DESC
LIMIT 10;
```

### Explanation
- Sorts by population.
- Returns the first ten results.

---

## Cities With Population Above 2 Million

### Purpose
Find large cities.

```sql
SELECT *
FROM City
WHERE Population > 2000000;
```

### Explanation
- Filters cities exceeding 2 million residents.

---

## Cities Beginning With "Be"

### Purpose
Find cities starting with specific letters.

```sql
SELECT *
FROM City
WHERE Name LIKE 'Be%';
```

### Explanation
- Searches for city names beginning with "Be".

---

## Cities Between 500k and 1M Population

### Purpose
Identify mid-sized cities.

```sql
SELECT *
FROM City
WHERE Population BETWEEN 500000 AND 1000000;
```

### Explanation
- Returns cities within a specified population range.

---

## Most Populated City

### Purpose
Find the city with the highest population.

```sql
SELECT Name
FROM City
ORDER BY Population DESC
LIMIT 1;
```

### Explanation
- Returns the largest city by population.

---

## Country With Largest Population

### Purpose
Find the world's most populous country.

```sql
SELECT Name
FROM Country
ORDER BY Population DESC
LIMIT 1;
```

### Explanation
- Sorts countries by population size.

---

## Capital of Spain

### Purpose
Retrieve Spain's capital city.

```sql
SELECT City.Name
FROM City
JOIN Country
ON City.ID = Country.Capital
WHERE Country.Name = 'Spain';
```

### Explanation
- Uses a join to match countries to capital cities.

---

## Average Population by Country

### Purpose
Calculate average city population for each country.

```sql
SELECT
    Country.Name,
    ROUND(AVG(City.Population)) AS Average_Population
FROM Country
JOIN City
ON Country.Code = City.CountryCode
GROUP BY Country.Name;
```

### Explanation
- Uses `AVG()` to calculate averages.
- Uses `GROUP BY` to summarize by country.

---

# Key SQL Concepts Demonstrated

- 🔍 `SELECT`
- 🎯 `WHERE`
- 📑 `ORDER BY`
- 📊 `COUNT()`
- ➕ `SUM()`
- 📈 `AVG()`
- 🏷️ `GROUP BY`
- 🔄 `DISTINCT`
- 🤝 `INNER JOIN`
- 🎚️ `BETWEEN`
- 🔎 `LIKE`
- 🔗 Multi-table joins
- 📋 Business reporting queries

---

