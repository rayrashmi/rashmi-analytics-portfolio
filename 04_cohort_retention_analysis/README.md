# 🔄 Cohort Retention Analysis — Customer Lifecycle Insights

## 📌 Project Overview
This project performs cohort-based retention analysis using transactional retail data to understand long-term customer behavior.

## 🎯 Objectives
- Build acquisition cohorts  
- Calculate month-over-month retention  
- Visualize churn patterns  
- Identify high-retention cohorts  

## 🧰 Tools Used
- Python (Pandas, NumPy, Matplotlib, Seaborn)
- Jupyter Notebook
- SQL (for cohort preparation)
- CSV dataset

## 🗂 Dataset
Columns:
- CustomerID  
- InvoiceDate  
- InvoiceNo  
- Quantity  
- UnitPrice  
- Country  

Source: Online Retail II Dataset

## 🔍 Analysis Performed
- Cohort grouping by acquisition month  
- Cohort index (0 = first month)  
- Retention matrix  
- Heatmap visualization  

## 📜 Notebook
See: `cohort_analysis.py`

## 🖼 Visualization
> ****

## 📈 Key Insights
- First-month retention: **43%**  
- Cohort retention stabilizes around Month 4 at ~18%  
- Users acquired via promotions show **lower long-term retention**  

## 🏁 Business Recommendations
- Improve onboarding for early churn prevention  
- Launch loyalty program for high-retention cohorts  
- Reduce dependency on discount-driven acquisition  
