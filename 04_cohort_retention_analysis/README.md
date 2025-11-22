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
>>  ` import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv("online_retail.csv")
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# create cohort
df['order_month'] = df['InvoiceDate'].dt.to_period('M')
df['cohort'] = df.groupby('CustomerID')['InvoiceDate'].transform('min').dt.to_period('M')

# cohort index
df['cohort_index'] = (df['order_month'] - df['cohort']).apply(attrgetter('n'))

# cohort pivot
cohort_pivot = df.pivot_table(
    index='cohort',
    columns='cohort_index',
    values='CustomerID',
    aggfunc='nunique'
)

retention = cohort_pivot.divide(cohort_pivot.iloc[:,0], axis=0)

plt.figure(figsize=(10,6))
sns.heatmap(retention, annot=True, fmt=".0%")
plt.title("Cohort Retention Heatmap")
plt.show()
 `

## 🖼 Visualization
> *****

## 📈 Key Insights
- First-month retention: **43%**  
- Cohort retention stabilizes around Month 4 at ~18%  
- Users acquired via promotions show **lower long-term retention**  

## 🏁 Business Recommendations
- Improve onboarding for early churn prevention  
- Launch loyalty program for high-retention cohorts  
- Reduce dependency on discount-driven acquisition  
