# # This script demonstrates how to fetch NFL player stats by game data using the nfl_data_py library.
# # Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# # Note: The data fetched here is already available in your Snowflake instance.
# # Use this script as a guide to pull additional data from nfl_data_py if needed.

# import nfl_data_py as nfl
# import pandas as pd

# # Specify the year for the NFL season
# season_year = [2018, 2019, 2020, 2021, 2022, 2023]

# # Import seasonal data
# print("Fetching seasonal data...")
# seasonal_data = nfl.import_seasonal_data(years=season_year, s_type='REG')

# # Import roster information
# print("Fetching seasonal rosters...")
# roster_data = nfl.import_seasonal_rosters(years=season_year)

# # Merge datasets for comprehensive information (optional)
# print("Merging data...")
# combined_data = pd.merge(
#     left = seasonal_data,
#     right = roster_data, 
#     how="left",
#     on=['player_id', 'season'],
# )

# # Save the dataset to a CSV file
# output_file = "nfl_players_stats_2018-2023.csv"
# print(f"Saving data to {output_file}...")
# combined_data.to_csv(output_file, index=False)

# print("Data saved successfully!")

