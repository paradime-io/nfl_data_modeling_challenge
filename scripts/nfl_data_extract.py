import nfl_data_py as nfl
import pandas as pd

# Define parameters
current_season = [2024]
historical_years = [2020, 2021, 2022, 2023, 2024]

# Player Stats Extraction
print("=== Extracting Raw Player Statistics ===")
seasonal_data = nfl.import_seasonal_data(years=current_season, s_type='REG')
weekly_data = nfl.import_weekly_data(years=current_season)
roster_data = nfl.import_seasonal_rosters(years=current_season)

seasonal_data.to_csv("raw_nfl_seasonal_data_2024.csv", index=False)
weekly_data.to_csv("raw_nfl_weekly_data_2024.csv", index=False)
roster_data.to_csv("raw_nfl_roster_data_2024.csv", index=False)

# Play-by-Play Extraction
print("\n=== Extracting Raw Play-by-Play Data ===")
pbp_columns = list(nfl.see_pbp_cols())
pbp_data = nfl.import_pbp_data(years=current_season, columns=pbp_columns)
pbp_data.to_csv("raw_nfl_play_by_play_2024.csv", index=False)

# Combine and Draft Extraction
print("\n=== Extracting Raw Combine and Draft Data ===")
combine_data = nfl.import_combine_data(historical_years)
teams_data = nfl.import_team_desc()
draft_data = nfl.import_draft_picks(historical_years)

combine_data.to_csv("raw_nfl_combine_data_2020_2024.csv", index=False)
teams_data.to_csv("raw_nfl_teams_data.csv", index=False)
draft_data.to_csv("raw_nfl_draft_picks_2020_2024.csv", index=False)

print("\nRaw data extraction complete!")
