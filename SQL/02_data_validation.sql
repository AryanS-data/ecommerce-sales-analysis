SELECT COUNT(*) AS Total_Rows
FROM sales;

SELECT *
FROM sales
LIMIT 10

SELECT *
FROM sales
ORDER BY order_date DESC
LIMIT 10;

SELECT
MIN(order_date) AS First_Order,
MAX(order_date) AS Last_Order
FROM sales;

SELECT DISTINCT category
FROM sales;

SELECT DISTINCT region
FROM sales;

SELECT
SUM(order_date IS NULL) AS Missing_Date,
SUM(product_name IS NULL) AS Missing_Product,
SUM(category IS NULL) AS Missing_Category,
SUM(region IS NULL) AS Missing_Region,
SUM(quantity IS NULL) AS Missing_Quantity,
SUM(sales IS NULL) AS Missing_Sales,
SUM(profit IS NULL) AS Missing_Profit
FROM sales;