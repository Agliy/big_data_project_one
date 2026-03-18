import sys
import pandas as pd
print('arguments', sys.argv)
month = int(sys.argv[1])
if month < 1 or month > 12:
    
    raise ValueError(f"Invalid month: {month}. Month must be between 1 and 12.")
else:
    print(f"Processing data for month: {month}")
    
    df = pd.DataFrame({"day": [1, 2], "num_passengers": [3, 4]})
    df['month'] = month
    print(df.head())



# df.to_parquet(f"output_{month}.parquet")

print(f"Hello pipeline, month={month}")