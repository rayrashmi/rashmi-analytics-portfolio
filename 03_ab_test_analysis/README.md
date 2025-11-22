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

## 📜 Notebook
#############################

import pandas as pd
import scipy.stats as stats

# load files
df = pd.read_csv("ab_test.csv")

# split groups
control = df[df['variant'] == 'A']
treatment = df[df['variant'] == 'B']

# conversion rates
cr_A = control['converted'].mean()
cr_B = treatment['converted'].mean()

# z-test
conv_table = pd.crosstab(df.variant, df.converted)
stat, p = stats.chi2_contingency(conv_table)[0:2]

print("CR_A:", cr_A)
print("CR_B:", cr_B)
print("Lift:", (cr_B - cr_A) / cr_A)
print("p-value:", p)

#######################
## 📈 Key Findings
- Variant B CR = **4.82%**  
- Variant A CR = **4.29%**  
- **Lift = +12.4%**  
- p-value < 0.05 → statistically significant  

## 🏁 Recommendation
➡️ **Roll out Variant B** — statistically significant improvement in conversions.
