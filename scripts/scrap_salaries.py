import requests
from bs4 import BeautifulSoup
import pandas as pd

def extract_salary_data(url):

    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.content, "html.parser")

    players = []
    list_items = soup.find_all('li', class_='list-group-item')  # Target the list items

    for item in list_items:
        name_a_tag = item.find('a')
        if name_a_tag:  # Check if 'a' tag exists (to avoid empty list items)
            name = name_a_tag.text.strip().split('\n')[0].strip()  # Extract name, handling potential newlines
            team_small_tag = item.find('small')
            team_text = team_small_tag.text.strip() if team_small_tag else None
            if team_text:
                team = team_text.split(',')[0].strip()  # Extract team
            else:
                team = None

            salary_span = item.find('span', class_='medium')
            if salary_span:
                salary_str = salary_span.text.strip().replace(',', '').replace('$', '')
                salary = int(salary_str) if salary_str.isdigit() else None
            else:
                salary = None

            players.append({
                'name': name,
                'team': team,
                'salary': salary
            })
    return players


if __name__ == "__main__":
    url = "https://www.spotrac.com/nfl/rankings/player/_/year/2023/sort/cap_base"
    salary_data = extract_salary_data(url)

    if salary_data:
        df = pd.DataFrame(salary_data)  # Create DataFrame from the list of dictionaries
        print(df)  # Print the DataFrame

        # Store DataFrame to CSV
        csv_filename = "nfl_salaries_2023.csv"
        df.to_csv(csv_filename, index=False)  # Set index=False to avoid writing row indices
        print(f"Data saved to {csv_filename}")
    else:
        print("No data extracted.")