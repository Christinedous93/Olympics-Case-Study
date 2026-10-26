
import pandas as pd
df = pd.read_csv("Olympics.csv",sep=";")

print (df.head())
print(df.info())
print(df.describe())
print(df.isnull().sum())
print(df.Height.head(20))
print(df.Weight.sort_values(ascending=False).head(20))
print(df.duplicated().sum())
import numpy as np
df['Age'] = df['Age'].replace(0, np.nan)
df['Height'] = df['Height']/10
df['Weight'] = df['Weight']/10
df['Age'] = df['Age'].fillna(df.groupby('Sport')['Age'].transform('mean'))
print(df.Age.head(20))
df['Height'] = df['Height'].fillna(df.groupby(['Sport','Sex'])['Height'].transform('mean'))
print(df.Height.head(20))
df['Weight'] = df['Weight'].fillna(df.groupby(['Sport','Sex'])['Weight'].transform('mean'))
print(df.Weight.head(20))
noc_country = df[['NOC','Country']].drop_duplicates()
df['Country'] = df['Country'].fillna(df['NOC'].map(noc_country.set_index('NOC')['Country']))
df['Medal'] = df['Medal'].fillna('No Medal')
print(df.isnull().sum())
df['Weight'].dtype
df.isnull().sum()
print(df[df['Weight'].isnull()][['Sport','Sex','Weight']])
df['Weight'] = df['Weight'].fillna(df.groupby(['Sport','Sex'])['Weight'].transform('mean'))
print(df['Weight'].isnull().sum())
df['Weight'] = df['Weight'].fillna(df['Weight'].mean())
print(df['Weight'].isnull().sum())
df['Height'] = df['Height'].fillna(df['Height'].mean())
print(df['Height'].isnull().sum())
print(df[df['Country'].isnull()][['NOC','Country']])
df.loc[df['NOC'] == 'TUV', 'Country'] = 'Tuvalu'
df.loc[df['NOC'] == 'ROT', 'Country'] = 'Refugee Olympic Team'
df.loc[df['NOC'] == 'UNK', 'Country'] = 'Unknown'
print(df['Country'].isnull().sum())
df.to_csv("Olympics_Cleaned.csv", index=False)
df.to_excel("Olympics_Cleaned.xlsx", index=False)