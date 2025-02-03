import requests
import csv

# Function to get injury details for a player
def get_injury_details(injury_ref):
    response = requests.get(injury_ref)
    
    if response.status_code != 200:
        print(f"Failed to fetch injury data for {injury_ref}")
        return None, None, None, None, None  # Handle request failure

    injury_data = response.json()
    
    # Extract fields safely
    source = injury_data.get('source', {})
    details = injury_data.get('details', {})
    
    athlete_ref = injury_data.get('athlete', {}).get('$ref', '')
    position = get_player_position(athlete_ref)
    injury_context = get_injury_context(details)
    player_name = get_player_name(injury_data.get('longComment', ''))  # Extract player name
    
    return source, details, position, injury_context, player_name

# Function to extract player's position from athlete reference
def get_player_position(athlete_ref):
    if athlete_ref:
        athlete_response = requests.get(athlete_ref)
        if athlete_response.status_code == 200:
            athlete_data = athlete_response.json()
            return athlete_data.get('position', {}).get('abbreviation', 'Unknown')
    return 'Unknown'

# Function to infer injury context (game or practice) from longComment
def get_injury_context(details):
    long_comment = details.get('longComment', '').lower() if details else ''
    
    if 'practice' in long_comment:
        return 'Practice'
    elif 'game' in long_comment:
        return 'Game'
    return 'Unknown'

# Function to extract player's name (first word) from longComment
def get_player_name(long_comment):
    if long_comment:
        return long_comment.split()[0]  # Get first word (assumed to be player name)
    return 'Unknown'

# Function to get injury data for a team in a specific year
def get_team_injuries(team_id, year):
    url = f"https://sports.core.api.espn.com/v2/sports/football/leagues/nfl/teams/{team_id}/injuries?season={year}"
    response = requests.get(url)
    
    if response.status_code != 200:
        print(f"Failed to fetch team injuries for team {team_id} in year {year}")
        return None  # Handle API failures gracefully
    
    return response.json()

# Write data to CSV
def write_to_csv(data, filename="injury_data.csv"):
    with open(filename, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        # Write headers including player name
        writer.writerow(['year', 'team_id', 'player_name', 'injury_status', 'injury_type', 'injury_details', 'fantasy_status', 'position', 'injury_context'])
        
        for row in data:
            writer.writerow(row)

# Iterate through all teams (1 to 32) and multiple years
injury_data_list = []
years = [2021, 2022, 2023, 2024, 2025]  # Define the years to query

for year in years:
    for team_id in range(1, 33):  # Assuming 32 NFL teams
        team_injuries = get_team_injuries(team_id, year)
        
        if not team_injuries or 'items' not in team_injuries:
            continue  # Skip if API response is invalid
        
        for injury in team_injuries['items']:
            injury_ref = injury.get('$ref', '')
            
            if not injury_ref:
                continue  # Skip if missing reference
            
            source, details, position, injury_context, player_name = get_injury_details(injury_ref)
            
            # Extract injury information safely
            injury_status = details.get('fantasyStatus', {}).get('description', 'N/A') if details else 'N/A'
            injury_type = details.get('type', 'N/A') if details else 'N/A'
            injury_details = details.get('detail', 'N/A') if details else 'N/A'
            fantasy_status = details.get('fantasyStatus', {}).get('abbreviation', 'N/A') if details else 'N/A'
            
            # Append data for CSV
            injury_data_list.append([year, team_id, player_name, injury_status, injury_type, injury_details, fantasy_status, position, injury_context])

# Write collected data to CSV file
write_to_csv(injury_data_list)
print("Injury data has been saved to 'injury_data.csv'.")
