# 🛒 E-Commerce Funnel Analysis

## 📌 Project Overview
This project evaluates how users progress through the e-commerce funnel:  
**View → Add to Cart → Checkout → Payment → Purchase**

The goal is to identify points where users drop off and propose improvements.

## 🎯 Objectives
- Analyze multi-step conversion funnel
- Find the highest drop-off rate
- Create funnel dashboard for business teams
- Recommend UX / product changes

## 🧰 Tools Used
- SQL
- Tableau / Power BI
- Excel/CSV data

## 🗂 Dataset
Events data including:
- user_id
- event_name
- event_timestamp
- product_id
- device
- traffic_source

Dataset source: “E-Commerce Behavior Data” (Kaggle)

## 🔍 Analysis Performed
### **1. Funnel Stages**
- Product View  
- Add to Cart  
- Checkout  
- Payment  
- Purchase  

### **2. Conversion Metrics**
- Stage-to-stage conversion rate  
- Overall funnel conversion  
- Drop-off count by step  

## 🧠 SQL Logic Summary

WITH funnel AS (
  SELECT user_id,
         MAX(CASE WHEN event_name = 'view_product' THEN 1 END) AS viewed,
         MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 END) AS added,
         MAX(CASE WHEN event_name = 'checkout' THEN 1 END) AS checkout,
         MAX(CASE WHEN event_name = 'payment' THEN 1 END) AS payment,
         MAX(CASE WHEN event_name = 'purchase' THEN 1 END) AS purchase
  FROM events
  GROUP BY 1
)
SELECT
  SUM(viewed) AS views,
  SUM(added) AS add_to_cart,
  SUM(checkout) AS checkout,
  SUM(payment) AS payment,
  SUM(purchase) AS purchases
FROM funnel;


## 📊 Funnel Dashboard Preview

****************

## 📈 Key Insights
- Biggest drop-off: **Add to Cart → Checkout (35%)**
- Mobile Web users convert 22% worse than Mobile App users  
- Organic traffic has highest purchase conversion (3.2× paid ads)

## 🏁 Business Recommendations
- Show shipping cost earlier to reduce checkout abandonment  
- Improve mobile web performance  
- Target high-performing organic channels  

