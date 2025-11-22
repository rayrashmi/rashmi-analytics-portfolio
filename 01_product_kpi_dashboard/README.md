# 📊 Product KPI Dashboard — Mobile App Analytics

## 📌 Project Overview
This project analyzes user engagement and behavior for a mobile application using key product metrics such as DAU, WAU, MAU, retention, activation, and session behavior.  
A Tableau/Power BI dashboard was built to visualize business-critical product KPIs.

## 🎯 Objectives
- Understand user engagement patterns (DAU/WAU/MAU)
- Analyze activation and retention behavior
- Identify churn signals
- Create product insights for growth and UX improvement

## 🧰 Tools Used
- SQL
- Tableau / Power BI
- Python (optional for preprocessing)
- Excel/CSV data

## 🗂 Dataset
Features include:
- user_id  
- event_name  
- event_timestamp  
- platform  
- session_duration  
- signup_date  

Dataset source: Mobile App User Behavior (Kaggle)

## 🔍 Analyses Performed
### **1. Engagement Metrics**
- DAU / WAU / MAU  
- Stickiness Ratio (DAU/MAU)

### **2. Activation Funnel**
- Signup → First Action → Key Feature Use

### **3. Retention Analysis**
- D1, D7, D30 retention  
- Returning vs new users

### **4. Session Metrics**
- Session duration  
- Session frequency  

## 🧠 Key SQL Queries
-- Daily Active Users
SELECT event_date, COUNT(DISTINCT user_id) AS dau
FROM events
GROUP BY 1;

-- Weekly Active Users
SELECT DATE_TRUNC('week', event_date) AS week, COUNT(DISTINCT user_id) AS wau
FROM events
GROUP BY 1;

-- MAU
SELECT DATE_TRUNC('month', event_date) AS month, COUNT(DISTINCT user_id) AS mau
FROM events
GROUP BY 1;

-- Retention (D1 example)
WITH first_visit AS (
  SELECT user_id, MIN(event_date) AS signup_date
  FROM events
  GROUP BY 1
),
activity AS (
  SELECT e.user_id,
         signup_date,
         event_date,
         DATE_DIFF(event_date, signup_date, DAY) AS day_number
  FROM events e
  JOIN first_visit f ON e.user_id = f.user_id
)
SELECT signup_date, day_number, COUNT(DISTINCT user_id)
FROM activity
GROUP BY 1,2;


## 📊 Dashboard Preview

*****

## 📈 Key Insights
- DAU increased **12% MoM**, driven by stronger weekend usage.  
- D1 retention is **45%**, with a steep drop-off on Day 2.  
- Activation funnel shows **30%** of new users don’t complete onboarding.  
- Stickiness ratio (DAU/MAU) = **22%**, within industry average.

## 🏁 Business Recommendations
- Improve onboarding to increase activation & early retention.  
- Introduce push notifications for Day 0–Day 2 engagement.  
- Optimize home-screen UI to boost deeper feature usage.  

