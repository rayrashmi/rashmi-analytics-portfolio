#  A/B Test Experiment — Conversion Rate Optimization

## 📌 Project Overview
This project analyzes an A/B experiment designed to increase conversion rate on a landing page.  
Variant B introduces a simplified layout and new CTA.

## 🎯 Objectives
- Measure conversion lift between Variant A and Variant B  
- Conduct statistical significance testing  
- Recommend whether to roll out the change  

## 🧰 Tools Used
- Python (Pandas, SciPy)
- Jupyter Notebook
- CSV dataset

## 🗂 Dataset
Columns:
- user_id  
- variant (A/B)  
- converted (0/1)  
- device  
- timestamp  

Source: Kaggle A/B Testing Dataset

## 🔍 Statistical Tests Used
- **Chi-Square test**  
- **z-test for proportions**  
- **Effect size (Cohen’s h)**  
- **Confidence interval (95%)**

## 📜 Notebook : ab_test.py

## 📈 Key Findings
- Variant B CR = **4.82%**  
- Variant A CR = **4.29%**  
- **Lift = +12.4%**  
- p-value < 0.05 → statistically significant  

## 🏁 Recommendation
➡️ **Roll out Variant B** — statistically significant improvement in conversions.
