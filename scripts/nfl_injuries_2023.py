import nfl_data_py as nfl
import pandas as pd

print("Fetching injuries data")

years = [2023]
data = nfl.import_injuries(years)

output_file = "seeds/nfl_injuries_2023.csv"
print(f"Saving data to {output_file}...")
data.to_csv(output_file, index=False)
print("Injury data saved successfully!")