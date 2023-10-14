import mysql.connector
import requests
from bs4 import BeautifulSoup

# MySQL configurations
config = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'database': 'gamepickerdb',
    'raise_on_warnings': True
}

# Connect to MySQL
conn = mysql.connector.connect(**config)
cursor = conn.cursor()

# List of game links
game_links = [
    "https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077",
    # ... add all the links you want to check
]

for link in game_links:
    response = requests.get(link)
    soup = BeautifulSoup(response.content, 'html.parser')
    
    price_div = soup.find('div', class_='current-price')  # Adjust this based on the structure of the page
    print(price_div)
    # if price_div:
    #     price = float(price_div.text.strip().replace("$", ""))  # Convert price text to a float
    #     distributor = "Steam"  # Hardcoded for this example

    #     cursor.execute("SELECT GameID FROM games WHERE Link = %s", (link,))
    #     game_id = cursor.fetchone()

    #     if game_id:
    #         # Insert scraped price into priceHistory table
    #         insert_history_query = """INSERT INTO priceHistory (GameID, DistributorName, Amount, DateUpdated)
    #                                   VALUES (%s, %s, %s, CURDATE())"""
    #         cursor.execute(insert_history_query, (game_id[0], distributor, price))

    #         # Update or insert the scraped price into the currentPrice table
    #         cursor.execute("SELECT Amount FROM currentPrice WHERE GameID = %s AND DistributorName = %s", (game_id[0], distributor))
    #         current_price_row = cursor.fetchone()

    #         if current_price_row:
    #             update_query = """UPDATE currentPrice SET Amount = %s, DateUpdated = CURDATE() WHERE GameID = %s AND DistributorName = %s"""
    #             cursor.execute(update_query, (price, game_id[0], distributor))
    #         else:
    #             insert_current_query = """INSERT INTO currentPrice (GameID, DistributorName, Amount, DateUpdated, Link)
    #                                       VALUES (%s, %s, %s, CURDATE(), %s)"""
    #             cursor.execute(insert_current_query, (game_id[0], distributor, price, link))
    #     else:
    #         print(f"Game not found for link: {link}")
    # else:
    #     print(f"Failed to fetch price for link: {link}")

conn.commit()
cursor.close()
conn.close()