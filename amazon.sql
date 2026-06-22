CREATE DATABASE amazon;
USE amazon;

-- 1.Show all records from the dataset.
SELECT * FROM amazon;

-- 2.Display only product names and prices.
SELECT ProductName, UnitPrice FROM amazon;

-- 3.Find all products with price greater than 500.
SELECT * FROM amazon WHERE UnitPrice > 500;

-- 4.List products where category is 'Electronics'.
SELECT * FROM amazon WHERE Category = 'Electronics';

-- 5.Count total number of records in the dataset.
SELECT COUNT(*) FROM amazon;

-- 6.Find the minimum product price.
SELECT MIN(UnitPrice) FROM amazon;

-- 7.Find the maximum product price.
SELECT MAX(UnitPrice) FROM amazon;

-- 8.Calculate the average product price.
SELECT AVG(UnitPrice) FROM amazon;

-- 9. Show all unique categories.
SELECT DISTINCT Category FROM amazon;

-- 10.Count how many products are in each category.
SELECT Category, COUNT(*) FROM amazon GROUP BY Category;

-- 11.List products sorted by price in ascending order.
SELECT * FROM amazon ORDER BY UnitPrice ASC;

-- 12.List products sorted by price in descending order.
SELECT * FROM amazon ORDER BY UnitPrice DESC;

-- 13.Show top 10 most expensive products.
SELECT * FROM amazon ORDER BY UnitPrice DESC LIMIT 10;

-- 14.Show 5 cheapest products.
SELECT * FROM amazon ORDER BY UnitPrice ASC LIMIT 5;

-- 15.Find products with rating greater than 4.
SELECT * FROM amazon WHERE Rating > 4;

-- 16.Count how many products have rating less than 3.
SELECT COUNT(*) FROM products WHERE rating < 3;

-- 17.Display products where price is between 100 and 1000.
SELECT * FROM product WHERE price BETWEEN 100 AND 1000;

-- 18.Find products where category is either 'Electronics' or 'Clothing'.
SELECT * FROM products 
WHERE category IN ('Electronics', 'Clothing');

-- 19.Show products whose name starts with 'A'.
SELECT * FROM products WHERE product_name LIKE 'A%';

-- 20.Show products whose name ends with 's'.
SELECT * FROM products WHERE product_name LIKE '%s';

-- 21.Find products containing the word 'Phone'.
SELECT * FROM products WHERE product_name LIKE '%Phone%';

-- 22.Count number of products in each rating group.
SELECT rating, COUNT(*) FROM products GROUP BY rating;

-- 23.Show average rating per category.
SELECT category, AVG(rating) FROM products GROUP BY category;

-- 24.Find total number of reviews for each category.
SELECT category, SUM(reviews) FROM products GROUP BY category;

-- 25.Display category with highest average price.
SELECT category 
FROM products 
GROUP BY category 
ORDER BY AVG(price) DESC 
LIMIT 1;

-- 26.Show category with lowest average rating.
SELECT category 
FROM products 
GROUP BY category 
ORDER BY AVG(rating) ASC 
LIMIT 1;

-- 27.Count number of products with discount applied.
SELECT COUNT(*) FROM products WHERE discount IS NOT NULL;

-- 28.Show products where discount is greater than 20%.
SELECT * FROM products WHERE discount > 20;

-- 29.Find average discount by category.
SELECT category, AVG(discount) FROM products GROUP BY category;

-- 30.Display products with NULL values in any column.
SELECT * FROM products 
WHERE product_name IS NULL 
   OR price IS NULL 
   OR category IS NULL;

-- 31.Count how many records have NULL ratings.
SELECT COUNT(*) FROM products WHERE rating IS NULL;

-- 32.Replace NULL ratings with 0 and display results.
SELECT product_name, COALESCE(rating, 0) AS rating 
FROM products;

-- 33.Show products added after a specific date.
SELECT * FROM products 
WHERE date_added > '2023-01-01';

-- 34.Count number of products added each year.
SELECT YEAR(date_added), COUNT(*) 
FROM products 
GROUP BY YEAR(date_added);

-- 35.Display month-wise product additions.
SELECT MONTH(OrderDate) AS Month, COUNT(*)
FROM amazon
GROUP BY MONTH(OrderDate);

-- 36.Find the total revenue (price * quantity if available).
SELECT SUM(UnitPrice * Quantity) AS Total_Revenue FROM amazon;

-- 37.Show top 5 categories by total revenue.
SELECT Category, SUM(UnitPrice * Quantity) AS Revenue
FROM amazon
GROUP BY Category
ORDER BY Revenue DESC
LIMIT 5;

-- 38.Display products with highest number of reviews.
SELECT ProductName, SUM(Quantity) AS TotalSold
FROM amazon
GROUP BY ProductName
ORDER BY TotalSold DESC
LIMIT 1;

-- 39.Show products with lowest number of reviews.
SELECT ProductName, SUM(Quantity) AS TotalSold
FROM amazon
GROUP BY ProductName
ORDER BY TotalSold ASC
LIMIT 1;

-- 40.Count number of products per brand.
SELECT Brand, COUNT(*) FROM amazon GROUP BY Brand;

-- 41.Find most expensive product in each category.
SELECT Category, MAX(UnitPrice) FROM amazon GROUP BY Category;

-- 42.Find cheapest product in each category.
SELECT Category, MIN(UnitPrice) FROM amazon GROUP BY Category;

-- 43.Show average price for each brand.
SELECT Brand, AVG(UnitPrice) FROM amazon GROUP BY Brand;

-- 44.List brands having more than 10 products.
SELECT Brand, COUNT(*) 
FROM amazon 
GROUP BY Brand
HAVING COUNT(*) > 10;

-- 45.Find categories having average rating above 4.
SELECT Category, AVG(Quantity) AS Avg_Quantity
FROM amazon
GROUP BY Category
HAVING AVG(Quantity) > 4;

-- 46.Display products where price is above average price.
SELECT * FROM amazon
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM amazon);


-- 47. Show products where rating is below average rating.
SELECT * FROM amazon
WHERE Quantity < (SELECT AVG(Quantity) FROM amazon);

-- 48.Rank products based on price (highest to lowest).
SELECT ProductName, UnitPrice,
RANK() OVER (ORDER BY UnitPrice DESC) AS Price_Rank
FROM amazon;

-- 49.Show cumulative count of products by category.
SELECT Category,
COUNT(*) OVER (PARTITION BY Category) AS Category_Count
FROM amazon;

-- 50.Find duplicate product names if any.
SELECT ProductName, COUNT(*)
FROM amazon
GROUP BY ProductName
HAVING COUNT(*) > 1;