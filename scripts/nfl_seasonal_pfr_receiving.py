# This script fetches information for receiving in the NFL by year
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Use this script as a guide to pull additional data from nfl_data_py if needed.

import nfl_data_py as nfl
import pandas as pd

# Import Receiving PFR Data
print("Fetching receiving PFR data...")
team_data = nfl.import_seasonal_pfr(s_type='rec')

# Save the dataset to a CSV file
output_file = "nfl_recieving_pfr_yearly.csv"
print(f"Saving data to {output_file}...")
team_data.to_csv(output_file, index=False)

print("Receiving data saved successfully!")