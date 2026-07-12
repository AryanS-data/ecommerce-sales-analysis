USE ecommerce_sales;
DESCRIBE sales;

SELECT
SUM(sales) AS Total_Revenue
FROM sales;

SELECT
SUM(profit) AS Total_Profit
FROM sales;

SELECT
SUM(quantity) AS Total_Items_Sold
FROM sales;

SELECT
ROUND(AVG(sales),2) AS Average_Order_Value
FROM sales;

SELECT
COUNT(*) AS Total_Orders
FROM sales;

SELECT
COUNT(DISTINCT product_name) AS Total_Products
FROM sales;

SELECT
COUNT(DISTINCT category) AS Categories
FROM sales;

SELECT
COUNT(DISTINCT region) AS Regions
FROM sales;


-- --Performance by Category

SELECT
    category,
    ROUND(SUM(sales),2) AS Total_Revenue
FROM sales
GROUP BY category
ORDER BY Total_Revenue DESC;

SELECT
    category,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY category
ORDER BY Total_Profit DESC;

SELECT
    category,
    SUM(quantity) AS Items_Sold
FROM sales
GROUP BY category
ORDER BY Items_Sold DESC;

SELECT
    category,
    COUNT(*) AS Total_Orders
FROM sales
GROUP BY category
ORDER BY Total_Orders DESC;


-- --Performance by Region

SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Revenue
FROM sales
GROUP BY region
ORDER BY Total_Revenue DESC;

SELECT
    region,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY region
ORDER BY Total_Profit DESC;

SELECT
    region,
    SUM(quantity) AS Total_Items
FROM sales
GROUP BY region
ORDER BY Total_Items DESC;

SELECT
    region,
    COUNT(*) AS Orders_Count
FROM sales
GROUP BY region
ORDER BY Orders_Count DESC;