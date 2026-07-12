USE ecommerce_sales;

-- Monthly Revenue
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS Month,
    ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

-- Monthly Profit
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS Month,
    ROUND(SUM(profit),2) AS Profit
FROM sales
GROUP BY Month
ORDER BY Month;

-- Monthly Orders
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS Month,
    COUNT(*) AS Orders
FROM sales
GROUP BY Month
ORDER BY Month;

-- Best Sales Month
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS Month,
    ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY Month
ORDER BY Revenue DESC
LIMIT 1;

-- Best Profit Month
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS Month,
    ROUND(SUM(profit),2) AS Profit
FROM sales
GROUP BY Month
ORDER BY Profit DESC
LIMIT 1;