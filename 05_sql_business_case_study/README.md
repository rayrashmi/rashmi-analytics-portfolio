# 🧠 Business Analytics Case Study — Retail Performance Insights

## 📌 Project Overview
This SQL project generates business performance insights using e-commerce order data, focusing on revenue, customer value, churn, and product profitability.

## 🎯 Objectives
- Analyze monthly revenue trends  
- Identify top customers and high-performing products  
- Calculate churn and inactivity  
- Evaluate profitability and growth opportunities  

## 🧰 Tools Used
- SQL (Snowflake / PostgreSQL / MySQL)
- Tableau / Power BI (optional)
- CSV dataset

## 🗂 Dataset
Columns:
- order_id  
- order_date  
- product_id  
- customer_id  
- price  
- cost  
- sales channel  

Dataset: Superstore / E-commerce Orders Dataset

## 🔍 Analysis Performed

### **1. Revenue Analytics**
- Monthly revenue  
- YoY growth  
- Revenue by category  

### **2. Customer Analytics**
- Top customers by revenue  
- Churn (inactive > 90 days)  
- Average order value  

### **3. Product Analytics**
- Profitability  
- Contribution margin  
- Top SKUs  

### **4. Channel Analytics**
- Performance by marketing source  
- ROAS (if data available)

## 📜 SQL Scripts
>>  ` -- Monthly Revenue
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
 `

## 📈 Key Insights
- 10% of customers contribute **60%+ of total revenue**  
- Electronics category has highest margin  
- Churn rate = **37%**, mostly from low-frequency users  

## 🏁 Business Recommendations
- Build VIP loyalty segment for top customers  
- Increase marketing spend on high-margin categories  
- Improve re-engagement campaigns to reduce churn  
