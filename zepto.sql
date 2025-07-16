drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

--data exploration

--count of rows
select count(*) from zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- data cleaning 

--products with price 0 
SELECT * FROM zepto 
WHERE mrp = 0 OR discountSellingPrice = 0;

DELETE FROM zepto 
WHERE mrp = 0; 

--convert prices from paisa to rupees 
UPDATE zepto 
SET mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

SELECT * FROM zepto; 
--data explored and cleaned 

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT name, mrp, discountSellingPrice FROM zepto 
ORDER BY discountSellingprice DESC 
LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock
SELECT name,mrp FROM zepto 
WHERE outOfStock = 'FALSE' AND mrp > 300
ORDER BY mrp;

-- Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountSellingPrice * availableQuality) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT name, mrp, discountPercent FROM zepto 
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC; 

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, ROUND(AVG(discountPercent),2) AS avgDiscount FROM zepto
GROUP BY category
ORDER BY avgDiscount DESC 
LIMIT 5 ; 

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT name, mrp, discountSellingPrice, ROUND(discountSellingPrice/weightInGms,3) AS pricePerGram 
FROM zepto 
WHERE weightInGms >= 100 
ORDER BY pricePerGram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms, 
CASE 
    WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'HIGH'
END AS weightCategory 
FROM zepto
ORDER BY weightInGms; 


-- Q8.What is the Total Inventory Weight Per Category 
SELECT category, SUM(weightInGms*availableQuality) AS totalWeight
FROM zepto 
GROUP BY category 
ORDER BY totalWeight;


