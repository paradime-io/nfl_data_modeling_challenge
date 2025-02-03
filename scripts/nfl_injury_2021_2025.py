import requests
import csv

# Function to get injury details for a player
def get_injury_details(injury_ref):
    response = requests.get(injury_ref)
    injury_data = response.json()
    # Extracting the relevant fields
    source = injury_data.get('source', {})
    details = injury_data.get('details', {})
    
    # Extracting position and injury context if available
    athlete_ref = injury_data.get('athlete', {}).get('$ref', '')
    position = get_player_position(athlete_ref)
    injury_context = get_injury_context(details)
    
    return source, details, position, injury_context

# Function to get position details from athlete reference
def get_player_position(athlete_ref):
    # Query the athlete details to get the position (you can make another API call for this, if needed)
    if athlete_ref:
        athlete_response = requests.get(athlete_ref)
        athlete_data = athlete_response.json()
        return athlete_data.get('position', {}).get('abbreviation', 'Unknown')
    return 'Unknown'

# Function to infer injury context (game or practice) from injury details or long comment
def get_injury_context(details):
    # Look for specific terms that can suggest game or practice
    long_comment = details.get('longComment', '').lower()
    if 'practice' in long_comment:
        return 'Practice'
    elif 'game' in long_comment:
        return 'Game'
    return 'Unknown'

# Function to get injury data for a team and a specific year
def get_team_injuries(team_id, year):
    url = f"https://sports.core.api.espn.com/v2/sports/football/leagues/nfl/teams/{team_id}/injuries?season={year}"
    response = requests.get(url)
    return response.json()

# Write to CSV
def write_to_csv(data, filename="injury_data.csv"):
    with open(filename, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        # Write headers including position and injury context
        writer.writerow(['year', 'team_id', 'player_id', 'injury_status', 'injury_type', 'injury_details', 'fantasy_status', 'position', 'injury_context'])
        for row in data:
            writer.writerow(row)

# Iterate through all teams (e.g., 1 to 32 for NFL) and multiple years
injury_data_list = []

# Define the range of years you want to query
years = [2021, 2022, 2023, 2024, 2025]  # Modify this list to include any range of years you need

for year in years:
    for team_id in range(1, 33):  # Assuming 32 teams (adjust if necessary)
        team_injuries = get_team_injuries(team_id, year)
        
        for injury in team_injuries['items']:
            injury_ref = injury['$ref']
            source, details, position, injury_context = get_injury_details(injury_ref)
            
            # Extract injury information
            player_id = injury_ref.split('/')[-5]  # Assuming the player ID is part of the reference URL
            injury_status = details.get('fantasyStatus', {}).get('description', 'N/A')
            injury_type = details.get('type', 'N/A')
            injury_details = details.get('detail', 'N/A')
            fantasy_status = details.get('fantasyStatus', {}).get('abbreviation', 'N/A')
            
            # Append data for CSV
            injury_data_list.append([year, team_id, player_id, injury_status, injury_type, injury_details, fantasy_status, position, injury_context])

# Write the collected data to a CSV file
write_to_csv(injury_data_list)
print("Injury data has been saved to 'injury_data.csv'.")
