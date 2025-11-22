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
