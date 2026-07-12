CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;

CREATE TABLE sales (
    order_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    sales DOUBLE,
    profit DOUBLE
);

DESCRIBE sales;

LOAD DATA LOCAL INFILE 'C:/Users/Windows Pc/Desktop/A/Ecommerce Sales Analysis/Dataset/Clean_data.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@order_date,
product_name,
category,
region,
quantity,
sales,
profit)
SET order_date = STR_TO_DATE(@order_date,'%d-%m-%Y');