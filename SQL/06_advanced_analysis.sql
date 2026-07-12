USE ecommerce_sales;

-- percentage of total revenue from each category
SELECT
    category,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(
        SUM(sales) * 100 /
        (SELECT SUM(sales) FROM sales),
    2) AS Revenue_Percentage
FROM sales
GROUP BY category
ORDER BY Revenue DESC;

-- Ranking
SELECT
    product_name,
    SUM(sales) AS Revenue,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS Product_Rank
FROM sales
GROUP BY product_name;

SELECT
    region,
    SUM(sales) AS Revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS Region_Rank
FROM sales
GROUP BY region;

-- Individual orders that generated more than the average order value
SELECT *
FROM sales
WHERE sales >
(
SELECT AVG(sales)
FROM sales
);

-- Profitability Classification
SELECT
product_name,
sales,
profit,

CASE

WHEN profit<50
THEN 'Low Profit'

WHEN profit BETWEEN 50 AND 150
THEN 'Medium Profit'

ELSE 'High Profit'

END AS Profit_Category

FROM sales;

-- Revenue Classification
SELECT
product_name,
sales,

CASE

WHEN sales<200
THEN 'Low Revenue'

WHEN sales BETWEEN 200 AND 600
THEN 'Medium Revenue'

ELSE 'High Revenue'

END AS Revenue_Category

FROM sales;

-- Running Revenue
SELECT

order_date,

sales,

SUM(sales)
OVER
(
ORDER BY order_date
)
AS Running_Revenue

FROM sales;

-- Monthly Revenue Growth
SELECT

DATE_FORMAT(order_date,'%Y-%m') AS Month,

SUM(sales) Revenue

FROM sales

GROUP BY Month

ORDER BY Month;

-- Top Product in Each Category
WITH RankedProducts AS
(
SELECT

category,

product_name,

SUM(sales) Revenue,

RANK()
OVER
(
PARTITION BY category
ORDER BY SUM(sales) DESC
)
AS Ranking

FROM sales

GROUP BY category,product_name
)

SELECT *

FROM RankedProducts

WHERE Ranking=1;

-- Summary
SELECT

COUNT(*) Total_Orders,

SUM(sales) Total_Revenue,

SUM(profit) Total_Profit,

AVG(sales) Average_Order_Value,

SUM(quantity) Items_Sold

FROM sales;