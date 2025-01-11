
# This script demonstrates how to fetch NFL play-by-play data using the nfl_data_py library.
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Note: The data fetched here is already available in your Snowflake instance.
# Use this script as a guide to pull additional data from nfl_data_py if needed.

import nfl_data_py as nfl
import pandas as pd

# # Specify the year for which to fetch data
years = [2020, 2021, 2022, 2023, 2024]

# # Import Play-by-Play Data for 2023
print("Fetching weekly data since 2020...")
seasonal_data = nfl.import_seasonal_data(years=years, s_type='REG')

# # Save the dataset to a CSV file
output_file = "nfl_seasonal_2020_2024.csv"
print(f"Saving data to {output_file}...")
seasonal_data.to_csv(output_file, index=False)

print("Seasonal data saved successfully!")