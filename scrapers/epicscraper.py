import mysql.connector
import requests
from bs4 import BeautifulSoup
import datetime
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
current_date = datetime.date.today()
sql_formatted_date = current_date.strftime('%Y-%m-%d')
# List of game links
game_links = [
    "https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077",
    "https://epicgamesdb.info/p/1891e44daa4a4b95959f458644c600f2/bioshock-infinite-complete-edition",
    "https://epicgamesdb.info/p/2ae6edb2223c4f8c97e9839b5b6497bb/hades",
    "https://epicgamesdb.info/p/2d837b8ee87b434a99a80fca0e4eb960/skyrim",
    'https://epicgamesdb.info/p/dd845909e1504c048c14499eab60ec62/borderlands-3',
    "https://epicgamesdb.info/p/9b7c69a2abdd45f390b1781ddc5de30a/dying-light--definitive-edition-upgrade",
    'https://epicgamesdb.info/p/a85bd01b67184c4c83f03f05404e07a8/battlefield-2042'
]

current_date = datetime.date.today()
sql_formatted_date = current_date.strftime('%Y-%m-%d')
for link in game_links:
    response = requests.get(link)
    soup = BeautifulSoup(response.content, 'html.parser')
    
    price_div = soup.find('div', class_='current-price')  # Adjust this based on the structure of the page

    if price_div:
        price = float(price_div.text.strip().replace("$", ""))  # Convert price text to a float
        distributor = "Epic Games"  # Hardcoded for this example

        cursor.execute("SELECT GameID FROM currentPrice WHERE Link = %s", (link,))
        game_id = cursor.fetchone()

        if game_id:
            # Insert scraped price into priceHistory table
            insert_history_query = """INSERT INTO priceHistory (GameID, DistributorName, Amount, DateUpdated, Link)
                                      VALUES (%s, %s, %s, CURDATE(), %s)"""
            cursor.execute(insert_history_query, (game_id[0], distributor, price,link))

            # Update or insert the scraped price into the currentPrice table
            cursor.execute("SELECT Amount FROM currentPrice WHERE GameID = %s AND DistributorName = %s", (game_id[0], distributor))
            current_price_row = cursor.fetchone()

            if current_price_row:
                update_query = """UPDATE currentPrice SET Amount = %s, DateUpdated = CURDATE() WHERE GameID = %s AND DistributorName = %s"""
                cursor.execute(update_query, (price, game_id[0], distributor))
            else:
                insert_current_query = """INSERT INTO currentPrice (GameID, DistributorName, Amount, DateUpdated, Link)
                                          VALUES (%s, %s, %s, CURDATE(), %s)"""
                cursor.execute(insert_current_query, (game_id[0], distributor, price, link))
        else:
            print(f"Game not found for link: {link}")
    else:
        print(f"Failed to fetch price for link: {link}")

conn.commit()
cursor.close()
conn.close()