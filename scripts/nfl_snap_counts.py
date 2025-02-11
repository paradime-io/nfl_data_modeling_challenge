# This script fetches information for 2023 snap counts in the NFL
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Use this script as a guide to pull additional data from nfl_data_py if needed.

import nfl_data_py as nfl
import pandas as pd

# Limit to 2023
years = [2023]  # Only 2023 season

# Import Snap Count Data for 2023
print("Fetching snap count data...")
team_data = nfl.import_snap_counts(years=years)

# Save the dataset to a CSV file
output_file = "nfl_snap_counts_2023.csv"
print(f"Saving data to {output_file}...")
team_data.to_csv(output_file, index=False)

print("Snap counts data saved successfully!")