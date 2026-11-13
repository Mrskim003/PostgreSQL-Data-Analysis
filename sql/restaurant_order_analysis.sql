
-- ==========================================
-- RESTAURANT ORDER ANALYSIS
-- Database: PostgreSQL
-- Tool: pgAdmin 4
-- ==========================================


-- 1. COMBINING THE TWO TABLES

CREATE TABLE combined_orders AS
SELECT *
FROM order_details
JOIN menu_items
ON order_details.item_id = menu_items.menu_item_id;


-- 2. VIEWING THE COMBINED DATASET

SELECT *
FROM combined_orders;


-- 3. MOST EXPENSIVE MEAL

SELECT menu_item_id, item_name, price
FROM combined_orders
ORDER BY price DESC
LIMIT 1;


-- 4. LEAST EXPENSIVE MEAL

SELECT menu_item_id, item_name, price
FROM combined_orders
ORDER BY price ASC
LIMIT 1;


-- 5. TOTAL SALES

SELECT SUM(price) AS total_sales
FROM combined_orders;


-- 6. TOTAL AMOUNT SPENT PER ORDER

SELECT order_id, SUM(price) AS total_order
FROM combined_orders
GROUP BY order_id
ORDER BY order_id ASC;


-- 7. CREATING A TABLE OF ORDER TOTALS

CREATE TABLE order_totals2 AS
SELECT order_id, SUM(price) AS total_order
FROM combined_orders
GROUP BY order_id
ORDER BY order_id ASC;


-- 8. VIEWING THE ORDER TOTALS TABLE

SELECT *
FROM order_totals2;


-- 9. HIGHEST ORDER

SELECT order_id, total_order
FROM order_totals2
ORDER BY total_order DESC
LIMIT 1;


-- 10. LOWEST ORDER

SELECT order_id, total_order
FROM order_totals2
ORDER BY total_order ASC
LIMIT 1;


-- 11. MOST EXPENSIVE PRICE IN EACH CATEGORY

SELECT category, MAX(price) AS most_expensive
FROM combined_orders
GROUP BY category;


-- 12. CHEAPEST PRICE IN EACH CATEGORY

SELECT category, MIN(price) AS cheapest
FROM combined_orders
GROUP BY category;


-- 13. TOTAL SALES PER CATEGORY

SELECT category, SUM(price) AS category_total
FROM combined_orders
GROUP BY category
ORDER BY category_total ASC;


-- 14. AVERAGE MEAL PRICE PER CATEGORY

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM combined_orders
GROUP BY category;
