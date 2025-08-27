CREATE TABLE CLIENT (
    idcli INT PRIMARY KEY,
    city VARCHAR(50),
    region VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE PRODUCT (
    idproduct INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    cost_price DECIMAL(10, 2),
    sale_price DECIMAL(10, 2),
    supplier VARCHAR(100)
);

CREATE TABLE DATE (
    idDate INT PRIMARY KEY,
    month INT,
    monthName VARCHAR(20),
    quarter INT,
    year INT
);

CREATE TABLE SALES (
    idproduct INT,
    idDate INT,
    idcli INT,
    delivery_date DATE,
    quantity INT,
    amount DECIMAL(12, 2)
);
SELECT c.country,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN CLIENT c ON s.idcli = c.idcli
GROUP BY c.country
ORDER BY c.country;

-- Total sales by month and year
SELECT d.year,
       d.month,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN DATE d ON s.idDate = d.idDate
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Total sales by year
SELECT d.year,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN DATE d ON s.idDate = d.idDate
GROUP BY d.year
ORDER BY d.year;

-- Grand total sales amount
SELECT SUM(amount) AS grand_total_sales_amount
FROM SALES;

SELECT c.country,
       SUM(s.quantity) AS total_quantity
FROM SALES s
JOIN CLIENT c ON s.idcli = c.idcli
JOIN PRODUCT p ON s.idproduct = p.idproduct
WHERE p.name = '22-inch Screen'
GROUP BY c.country
ORDER BY c.country;

SELECT d.year,
       SUM(s.quantity) AS total_quantity
FROM SALES s
JOIN DATE d ON s.idDate = d.idDate
JOIN PRODUCT p ON s.idproduct = p.idproduct
WHERE p.name = '22-inch Screen'
GROUP BY d.year
ORDER BY d.year;

SELECT c.country,
       d.year,
       SUM(s.quantity) AS total_quantity
FROM SALES s
JOIN CLIENT c ON s.idcli = c.idcli
JOIN DATE d ON s.idDate = d.idDate
JOIN PRODUCT p ON s.idproduct = p.idproduct
WHERE p.name = '22-inch Screen'
GROUP BY c.country, d.year
ORDER BY c.country, d.year;

SELECT SUM(s.quantity) AS grand_total_quantity
FROM SALES s
JOIN PRODUCT p ON s.idproduct = p.idproduct
WHERE p.name = '22-inch Screen';

SELECT c.country,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN CLIENT c ON s.idcli = c.idcli
GROUP BY c.country
ORDER BY c.country;

SELECT d.year,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN DATE d ON s.idDate = d.idDate
GROUP BY d.year
ORDER BY d.year;

SELECT p.name,
       SUM(s.amount) AS total_sales_amount
FROM SALES s
JOIN PRODUCT p ON s.idproduct = p.idproduct
GROUP BY p.name
ORDER BY p.name;
