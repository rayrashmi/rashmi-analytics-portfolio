import pandas as pd
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

