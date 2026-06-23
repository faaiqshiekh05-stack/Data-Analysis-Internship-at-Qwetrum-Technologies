-- Create and select database
CREATE DATABASE Task01_SQL;
USE Task01_SQL;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    City TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Product TEXT,
    Quantity INTEGER,
    Price REAL,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert customer data
INSERT INTO Customers VALUES
(1,'Ali','Lahore'),
(2,'Ahmed','Karachi'),
(3,'Sara','Islamabad'),
(4,'Ayesha','Faisalabad');

-- Insert order data
INSERT INTO Orders VALUES
(101,1,'Laptop',1,80000,'2024-01-10'),
(102,2,'Phone',2,50000,'2024-01-12'),
(103,1,'Mouse',3,1500,'2024-01-15'),
(104,3,'Laptop',1,80000,'2024-01-20'),
(105,4,'Keyboard',2,3000,'2024-01-22'),
(106,2,'Laptop',1,80000,'2024-01-25');

-- JOIN: Show customers with their orders
SELECT
    c.CustomerName,
    o.Product,
    o.Quantity,
    o.Price
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- GROUP BY: Total sales by customer
SELECT
    c.CustomerName,
    SUM(o.Quantity * o.Price) AS TotalSales
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

-- Subquery: Customers above average sales
SELECT CustomerName, TotalSales
FROM (
    SELECT
        c.CustomerName,
        SUM(o.Quantity * o.Price) AS TotalSales
    FROM Customers c
    JOIN Orders o
    ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerName
) SalesData
WHERE TotalSales > (
    SELECT AVG(TotalSales)
    FROM (
        SELECT SUM(Quantity * Price) AS TotalSales
        FROM Orders
        GROUP BY CustomerID
    ) AvgSales
);

-- Window Function: Rank customers by sales
SELECT
    c.CustomerName,
    SUM(o.Quantity * o.Price) AS TotalSales,
    RANK() OVER (
        ORDER BY SUM(o.Quantity * o.Price) DESC
    ) AS SalesRank
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

-- Business Question 1: Top customer by sales
SELECT
    c.CustomerName,
    SUM(o.Quantity * o.Price) AS TotalSales
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC
LIMIT 1;

-- Business Question 2: Total number of orders
SELECT COUNT(*) AS TotalOrders
FROM Orders;

-- Business Question 3: Average order value
SELECT
    AVG(Quantity * Price) AS AvgOrderValue
FROM Orders;

-- Business Question 4: Highest revenue product
SELECT
    Product,
    SUM(Quantity * Price) AS Revenue
FROM Orders
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 1;

-- Business Question 5: City with highest sales
SELECT
    c.City,
    SUM(o.Quantity * o.Price) AS TotalSales
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY TotalSales DESC
LIMIT 1;