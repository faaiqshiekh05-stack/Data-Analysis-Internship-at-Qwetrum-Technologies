-- ================================
-- 1. Select database
-- ================================
USE ecommercedb;

-- ================================
-- 2. View all tables in database
-- ================================
SHOW TABLES;

-- ================================
-- 3. Check structure of HR dataset
-- ================================
DESCRIBE hr_dataset;

-- ================================
-- 4. Fix column name issue (garbled encoding)
-- Rename ï»¿Age → Age
-- ================================
ALTER TABLE hr_dataset
CHANGE `ï»¿Age` Age INT;

-- Verify structure after fix
DESCRIBE hr_dataset;

-- ================================
-- 5. Count total records in dataset
-- ================================
SELECT 
    COUNT(*) AS total_rows
FROM hr_dataset;

-- ================================
-- 6. Attrition distribution (Yes / No)
-- ================================
SELECT 
    Attrition,
    COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY Attrition;

-- ================================
-- 7. Attrition rate (percentage of employees who left)
-- ================================
SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS attrition_rate_percent
FROM hr_dataset;

-- ================================
-- 8. Attrition by Department
-- ================================
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS attrition_rate
FROM hr_dataset
GROUP BY Department;

-- ================================
-- 9. Attrition by Job Role (highest risk roles first)
-- ================================
SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_dataset
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- ================================
-- 10. Average income based on attrition status
-- ================================
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
FROM hr_dataset
GROUP BY Attrition;

-- ================================
-- 11. Relationship between overtime and attrition
-- ================================
SELECT 
    OverTime,
    Attrition,
    COUNT(*) AS total_employees
FROM hr_dataset
GROUP BY OverTime, Attrition;

-- (Duplicate query removed for cleanliness)