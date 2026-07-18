Global Fashion Retail Analysis - SQL Queries 
 Database: fashion_retail.db 
Tables: transactions, stores, products, employees, customers

Query 1: Revenue by store
Purpose: Identify top and bottom performing stores by total revenue
SELECT s."StoreName", SUM(t."LineTotal") AS revenue
FROM transactions t
JOIN stores s ON t."StoreID" = s."StoreID"
GROUP BY s."StoreName"
ORDER BY revenue DESC;
 

Query 2: Revenue by product category
Purpose: Identify which product categories drive the most revenue
SELECT p."Category", SUM(t."LineTotal") AS revenue
FROM transactions t
JOIN products p ON t."Product ID" = p."Product ID"
GROUP BY p."Category"
ORDER BY revenue DESC;
 

Query 3: Top 10 customers by spend
Purpose: Identify highest-value customers for loyalty/retention targeting
SELECT c."Name", c."Country", SUM(t."LineTotal") AS total_spend
FROM transactions t
JOIN customers c ON t."Customer ID" = c."Customer ID"
GROUP BY c."Name", c."Country"
ORDER BY total_spend DESC
LIMIT 10;
 

Query 4: Employee performance ranking
Purpose: Rank employees by total sales generated
SELECT e."Name", e."Position", SUM(t."LineTotal") AS total_sales
FROM transactions t
JOIN employees e ON t."EmployeeID" = e."Employee ID"
GROUP BY e."Name", e."Position"
ORDER BY total_sales DESC
LIMIT 15;
 
Query 5: Revenue concentration by country
Purpose: Assess geographic revenue risk/dependency
SELECT c."Country", SUM(t."LineTotal") AS revenue,
       ROUND(100.0 * SUM(t."LineTotal") / (SELECT SUM("LineTotal") FROM transactions), 2) AS pct_of_total
FROM transactions t
JOIN customers c ON t."Customer ID" = c."Customer ID"
GROUP BY c."Country"
ORDER BY revenue DESC;
 

