USE ecommerce_sales;

-- Top 10 Products by Revenue
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Revenue
FROM sales
GROUP BY product_name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Bottom 10 Products by Revenue
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Total_Revenue
FROM sales
GROUP BY product_name
ORDER BY Total_Revenue ASC
LIMIT 10;

-- Top Products by Profit
SELECT
    product_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY product_name
ORDER BY Total_Profit DESC
LIMIT 10;

--  Lowest Profit Products
SELECT
    product_name,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY product_name
ORDER BY Total_Profit ASC
LIMIT 10;

-- Best Selling Products (Quantity)
SELECT
    product_name,
    SUM(quantity) AS Units_Sold
FROM sales
GROUP BY product_name
ORDER BY Units_Sold DESC
LIMIT 10;

-- Revenue per Unit
SELECT
    product_name,
    ROUND(SUM(sales) / SUM(quantity),2) AS Revenue_Per_Unit
FROM sales
GROUP BY product_name
ORDER BY Revenue_Per_Unit DESC
LIMIT 10;

-- Profit Margin by Product
SELECT
    product_name,
    ROUND((SUM(profit) / SUM(sales)) * 100,2) AS Profit_Margin
FROM sales
GROUP BY product_name
HAVING SUM(sales) > 0
ORDER BY Profit_Margin DESC
LIMIT 10;