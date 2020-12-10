import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("../ut-archive.csv")
print("=====================")
print(df.head(5))

# Analyze the infinite 
x, y = [], []
for index, row in df.iterrows():
    failure = False
    for key in df.keys():
        if key == "qor": 
            if row[key] == float("inf"):
                failure = True
        
    if failure:
        print(df.loc[index, :].values.tolist())
    

print(x); de
plt.scatter(x, y, alpha=0.5)
plt.yscale('log')
plt.savefig("raytracer-compile-runtime.png")