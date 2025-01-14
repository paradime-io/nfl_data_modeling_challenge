# This script fetches information for NFL IDs
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Use this script as a guide to pull additional data from nfl_data_py if needed.

import nfl_data_py as nfl
import pandas as pd


# Import ID Data
print("Fetching ID data...")
team_data = nfl.import_ids()

# Save the dataset to a CSV file
output_file = "nfl_ids.csv"
print(f"Saving data to {output_file}...")
team_data.to_csv(output_file, index=False)

print("ID data saved successfully!")