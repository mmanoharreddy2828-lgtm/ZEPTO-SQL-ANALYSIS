drop table if exists zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category Varchar(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outofstock BOOLEAN,
quantity Integer
);

--data exploration

Select COUNT (*)FROM zepto;
---sample data
SELECT*FROM zepto
LIMIT 10;

--NULL VALUES
SELECT * FROM zepto
WHERE NAME IS null 
 or
 category IS null 
 or
 mrp IS null 
 or
 discountpercent IS null 
 or
 availablequantity IS null 
 or
 discountedsellingprice IS null 
 or
 weightingms IS null 
 or
 outofstock IS null 
 or
 quantity IS null 

 --diff product category
 SELECT DISTINCT CATEGORY FROM ZEPTO
 ORDER BY CATEGORY;

 --OUTOF STOCK VS IN STOCK 
 SELECT outofstock, COUNT(sku_id) from zepto
 group by outofstock;

 ---product names present multiple times 
 SELECT name, count(sku_id)as "number of SKUs" 
 FROM zepto
 GROUP BY name
 HAVING count (sku_id)>1
 ORDER BY count(sku_Id) DESC;

 --data cleaning
 -- prices is zero

 SELECT * FROM zepto
 Where mrp =0;

 DELETE FROM zepto
WHERE mrp = 0;


-- converting to rupees of products

update zepto
SET mrp =mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

 SELECT mrp,discountedsellingprice FROM zepto



 --- find the top 10 based on  discountpercentage
 SELECT DISTINCT name, mrp,discountpercent 
 FROM zepto
 ORDER BY discountpercent DESC
 LIMIT 10;


 ---products with high mrp without stock

 SELECT DISTINCT name,mrp FROM zepto
 WHERE outofstocK = TRUE and mrp >300
 ORDER BY mrp DESC;

-- TOTAL  INVENTORY WEIGHT PER CATEGORY
SELECT category,
SUM(weightingms * availablequantity) AS total_weight
From zepto
GROUP BY category
ORDER BY total_weight;


 