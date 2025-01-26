import nfl_data_py as nfl
import pandas as pd

print("Fetching team description data")
team_data = nfl.import_team_desc()

teams = team_data[['team_id', 'team_name', 'team_abbr', 'team_nick', 'team_conf', 'team_division']]

output_file = "seeds/nfl_teams_2023.csv"
print(f"Saving data to {output_file}...")
teams.to_csv(output_file, index=False)
print("Team data saved successfully!")