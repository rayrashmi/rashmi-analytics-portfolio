-- Monthly Revenue
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(sales) AS revenue
FROM orders
GROUP BY 1;

-- Top 10 customers by revenue
SELECT customer_id, SUM(sales) AS revenue
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Churn customers (no orders in last 90 days)
SELECT customer_id
FROM orders
GROUP BY 1
HAVING MAX(order_date) < CURRENT_DATE - INTERVAL '90 days';

-- Profitability by product
SELECT product_id,
       SUM(sales - cost) AS profit
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

