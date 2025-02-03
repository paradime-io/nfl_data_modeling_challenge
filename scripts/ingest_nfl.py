import nfl_data_py as nfl
import pandas as pd

# Fetch data for the 2023 season
years = [2023]

# Load datasets
pbp_data = nfl.import_pbp_data(years)  # Play-by-play data
player_stats = nfl.import_weekly_data(years)  # Player stats by game
rosters = nfl.import_seasonal_rosters(years)  # Player rosters
schedules = nfl.import_schedules(years)  # Game schedules
injury_data = nfl.import_injuries(years)
draft_data = nfl.import_draft_picks(years)
seasonal_data = nfl.import_seasonal_data(years)

# Save data to CSV (for loading into Snowflake)
pbp_data.to_csv("pbp_data_2023.csv", index=False)
player_stats.to_csv("player_stats_2023.csv", index=False)
rosters.to_csv("rosters_2023.csv", index=False)
schedules.to_csv("schedules_2023.csv", index=False)
injury_data.to_csv("injury_data_2023.csv", index=False)
draft_data.to_csv("draft_data_2023.csv", index=False)
seasonal_data.to_csv("seasonal_data_2023.csv", index=False)