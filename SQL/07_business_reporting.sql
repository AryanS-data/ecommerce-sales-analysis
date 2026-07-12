USE ecommerce_sales;

-- Summary
SELECT
    COUNT(*) AS Total_Orders,
    SUM(quantity) AS Total_Items_Sold,
    ROUND(SUM(sales),2) AS Total_Revenue,
    ROUND(SUM(profit),2) AS Total_Profit,
    ROUND(AVG(sales),2) AS Average_Order_Value,
    COUNT(DISTINCT product_name) AS Total_Products,
    COUNT(DISTINCT category) AS Total_Categories,
    COUNT(DISTINCT region) AS Total_Regions
FROM sales;

-- Category Performance
SELECT
    category,
    COUNT(*) AS Orders,
    SUM(quantity) AS Units_Sold,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin
FROM sales
GROUP BY category
ORDER BY Revenue DESC;

-- Region Performance
SELECT
    region,
    COUNT(*) AS Orders,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin
FROM sales
GROUP BY region
ORDER BY Revenue DESC;

-- Products Losing Money
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY Profit;

-- High Revenue, Low Profit
SELECT
    product_name,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin
FROM sales
GROUP BY product_name
HAVING SUM(sales) > 5000
ORDER BY Profit_Margin ASC;

-- Revenue Distribution
SELECT
    category,
    ROUND(
        SUM(sales)*100/
        (SELECT SUM(sales) FROM sales),
        2
    ) AS Revenue_Share
FROM sales
GROUP BY category
ORDER BY Revenue_Share DESC;

-- Top Performing Region
SELECT
    region,
    ROUND(SUM(sales),2) AS Revenue
FROM sales
GROUP BY region
ORDER BY Revenue DESC
LIMIT 1;

-- Best Selling Category
SELECT
    category,
    SUM(quantity) AS Units
FROM sales
GROUP BY category
ORDER BY Units DESC
LIMIT 1;

-- Product Portfolio
SELECT

CASE

WHEN sales <200 THEN 'Low Value'

WHEN sales BETWEEN 200 AND 500
THEN 'Medium Value'

ELSE 'High Value'

END AS Product_Class,

COUNT(*) AS Products

FROM sales

GROUP BY Product_Class;

-- Final Report
SELECT

'Total Revenue' AS KPI,
ROUND(SUM(sales),2) AS Value

FROM sales

UNION ALL

SELECT

'Total Profit',
ROUND(SUM(profit),2)

FROM sales

UNION ALL

SELECT

'Average Order Value',
ROUND(AVG(sales),2)

FROM sales

UNION ALL

SELECT

'Orders',
COUNT(*)

FROM sales;