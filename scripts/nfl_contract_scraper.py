import requests
from bs4 import BeautifulSoup
import pandas as pd

# Base URL
base_url = "https://overthecap.com/contract-history/"

# List of positions
positions = [
    "quarterback", "running-back", "fullback", "wide-receiver", "tight-end",
    "left-tackle", "left-guard", "center", "right-guard", "right-tackle",
    "interior-defensive-line", "edge-rusher", "linebacker", "safety",
    "cornerback", "kicker", "punter", "long-snapper"
]

# Headers for the request (dictionary, not a list)
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36"
}

# Loop through each position and scrape data
for position in positions:
    url = f"{base_url}{position}"
    print(f"Scraping data for: {position} ({url})")

    try:
        # Send a GET request
        response = requests.get(url, headers=headers)

        # Check for a successful request
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')

            # Find the table with class 'position-table sortable'
            table = soup.find('table', {'class': 'position-table sortable'})

            if table:
                # Extract table headers
                table_headers = [header.text.strip() for header in table.find('thead').find_all('th')]

                # Extract table rows
                rows = []
                for row in table.find('tbody').find_all('tr'):
                    cells = [cell.text.strip() for cell in row.find_all('td')]
                    rows.append(cells)

                # Create a DataFrame
                df = pd.DataFrame(rows, columns=table_headers)

                # Save to a CSV file
                file_name = f"{position.replace('-', '_')}_contracts.csv"
                df.to_csv(file_name, index=False)
                print(f"Data for {position} saved to '{file_name}'")
            else:
                print(f"No table found for {position}.")
        else:
            print(f"Failed to fetch data for {position}. Status code: {response.status_code}")
    except Exception as e:
        print(f"An error occurred while scraping {position}: {e}")
