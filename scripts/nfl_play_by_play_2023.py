# This script demonstrates how to fetch NFL play-by-play data using the nfl_data_py library.
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Note: The data fetched here is already available in your Snowflake instance.
# Use this script as a guide to pull additional data from nfl_data_py if needed.

# import nfl_data_py as nfl
# import pandas as pd

# # Specify the year for which to fetch data
# years = [2023]  # Only 2023 season

# # Fetch all columns available in the play-by-play dataset and convert to a list
# pbp_columns = list(nfl.see_pbp_cols())

# # Import Play-by-Play Data for 2023
# print("Fetching play-by-play data for the 2023 season...")
# pbp_data = nfl.import_pbp_data(years=years, columns=pbp_columns)

# # Save the dataset to a CSV file
# output_file = "nfl_play_by_play_2023.csv"
# print(f"Saving data to {output_file}...")
# pbp_data.to_csv(output_file, index=False)

# print("Play-by-play data saved successfully!")
