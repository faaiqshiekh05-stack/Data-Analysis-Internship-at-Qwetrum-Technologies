# Task 01 - SQL for Data Analysis

## Objective

The goal of this task is to use SQL to analyze data from a relational database and answer business questions using SQL queries.

## Tools Used

* MySQL Workbench
* SQL

## Dataset

The database contains two related tables:

### Customers

* CustomerID
* CustomerName
* City

### Orders

* OrderID
* CustomerID
* Product
* Quantity
* Price
* OrderDate

The tables are connected using the **CustomerID** field.

## Tasks Completed

### 1. Database Setup

Created a database named `Task01_SQL` and created the Customers and Orders tables.

### 2. Data Insertion

Inserted sample customer and order records into the tables.

### 3. JOIN Query

Used an INNER JOIN to combine customer and order information.

### 4. GROUP BY and Aggregate Functions

Used SUM(), AVG(), and COUNT() functions to calculate sales metrics and order statistics.

### 5. Subquery

Created a subquery to identify customers whose total sales are above the average sales value.

### 6. Window Function

Used the RANK() window function to rank customers based on total sales.

## Business Questions Answered

### Question 1

Which customer generated the highest sales?

**Answer:** Ahmed

### Question 2

How many orders were placed?

**Answer:** 6 Orders

### Question 3

What is the average order value?

**Answer:** Approximately 58,416.67

### Question 4

Which product generated the highest revenue?

**Answer:** Laptop

### Question 5

Which city generated the highest sales?

**Answer:** Karachi

## Key SQL Concepts Used

* CREATE DATABASE
* CREATE TABLE
* INSERT INTO
* INNER JOIN
* GROUP BY
* SUM()
* AVG()
* COUNT()
* Subqueries
* Window Functions (RANK)

## Conclusion

This project demonstrates how SQL can be used to manage relational data, perform aggregations, answer business questions, and generate meaningful insights directly from a database.
