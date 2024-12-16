# This script demonstrates how to fetch NFL player stats by game data using the nfl_data_py library.
# Reference: nfl_data_py GitHub repo - https://github.com/nflverse/nfl_data_py
# Note: The data fetched here is already available in your Snowflake instance.
# Use this script as a guide to pull additional data from nfl_data_py if needed.

# import nfl_data_py as nfl
# import pandas as pd

# # Specify the year for the NFL season
# season_year = [2023]

# # Import seasonal data
# print("Fetching seasonal data...")
# seasonal_data = nfl.import_seasonal_data(years=season_year, s_type='REG')

# # Import weekly data for detailed stats
# print("Fetching weekly data...")
# weekly_data = nfl.import_weekly_data(years=season_year)

# # Import roster information
# print("Fetching seasonal rosters...")
# roster_data = nfl.import_seasonal_rosters(years=season_year)

# # Merge datasets for comprehensive information (optional)
# print("Merging data...")
# combined_data = pd.merge(weekly_data, roster_data, on="player_id", how="left")

# # Save the dataset to a CSV file
# output_file = "nfl_players_stats_2023-24.csv"
# print(f"Saving data to {output_file}...")
# combined_data.to_csv(output_file, index=False)

# print("Data saved successfully!")

