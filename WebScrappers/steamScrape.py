import mysql.connector
import requests
from bs4 import BeautifulSoup
from datetime import datetime
from datetime import date
# MySQL configurations
config = {
    'user': 'root',
    'password': '013626210!',
    'host': 'localhost',
    'database': 'gamepickerdb',
    'raise_on_warnings': True
}

# Connect to MySQL
conn = mysql.connector.connect(**config)
cursor = conn.cursor()

# List of game links
game_links = [
    "https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/",
    "https://store.steampowered.com/app/1091500/Cyberpunk_2077/",
    "https://store.steampowered.com/app/8870/BioShock_Infinite/",
    "https://store.steampowered.com/app/686810/Hell_Let_Loose/",
    # "https://store.steampowered.com/app/671860/BattleBit_Remastered/"
    # "https://store.steampowered.com/app/374320/DARK_SOULS_III/"
    # "https://store.steampowered.com/app/1245620/ELDEN_RING/"
    # "https://store.steampowered.com/app/1086940/Baldurs_Gate_3/"
    # "https://store.steampowered.com/app/1517290/Battlefield_2042/"
    # "https://store.steampowered.com/app/367520/Hollow_Knight/"
    # "https://store.steampowered.com/app/239140/Dying_Light/"
    # "https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/"
    # "https://store.steampowered.com/app/397540/Borderlands_3/"
    # "https://store.steampowered.com/app/1145360/Hades/"
]

for link in game_links:
    response = requests.get(link)
    soup = BeautifulSoup(response.content, 'html.parser')
    gameName = soup.find('div', class_='apphub_AppName')
    description = soup.find('div', class_='game_description_snippet')
    price_div = soup.find('div', class_='game_purchase_price')  # Adjust this based on the structure of the page
    discount_div= soup.find('div', class_='discount_final_price')
    discount_ogprice_div = soup.find('div', class_='discount_original_price')  # Adjust this based on the structure of the page

    picture_link = soup.find('img', class_='game_header_image_full')['src']
    date_div = soup.find('div', class_='date')
    dev_row = soup.find('div', class_='dev_row')
    developer = ""

    # Find the developer value within the dev_row
    app_tags = soup.find_all('a', class_='app_tag')
    cursor.execute("SELECT GameID FROM currentprice WHERE Link = %s", (link,))
    game_id = cursor.fetchone()
    genre_names = set()
    distributor = "Steam"  
    

    price = float(discount_ogprice_div.text.strip().replace("$", "")) if discount_ogprice_div is not None else float(price_div.text.strip().replace("$", ""))
    # price = float(price_div.text.strip().replace("$", ""))  # Convert price text to a float
    if(discount_div != None):
        discount= float(discount_div.text.strip().replace("$", ""))    
    # print(price)
    # print(discount)

    if game_id == None:
        if dev_row:
            developer_div = dev_row.find('div', class_='summary')
            if developer_div:
                developer = developer_div.text.strip()

        distributor = "Steam"  # Hardcoded for this example
        gameName = gameName.text.strip()
        description = description.text.strip()
        date_format = '%b %d, %Y'
        date_div_datetime = datetime.strptime(date_div.text.strip(), date_format)
        formatted_date = date_div_datetime.strftime('%Y-%m-%d')
        date_object = datetime.strptime(formatted_date, '%Y-%m-%d')

        date_only = date_object.date()
        for tag in app_tags:
            genre_names.add(tag.text.strip())
        genre_names_tuple = tuple(genre_names)
        cursor.execute("SELECT GenreID FROM genre WHERE GenreName IN %s" % str(genre_names_tuple))
        genre_ids = cursor.fetchall()
        genreID = int(genre_ids[0][0])
        # query = "INSERT INTO game (GameName, ReleaseDate, Developer, GenreID, Description, Link, OriginalPrice) VALUES(%s,%s,%s,%d,%s,%s,%f)"
        # values = (gameName, formatted_date, developer, genreID, description, link, float(price))
        # cursor.execute(query,(gameName, formatted_date, developer, genreID, description, picture_link, float(price)))
        
        game_data = {
        'GameName': gameName,
        'ReleaseDate': date_only,
        'Developer': developer,
        'GenreID': genreID,
        'Description': description,
        'Link': picture_link,
        'OriginalPrice': price
        }
        query = ("INSERT INTO game (GameName, ReleaseDate, Developer, GenreID, Description, Link, OriginalPrice) "
         "VALUES (%(GameName)s, %(ReleaseDate)s, %(Developer)s, %(GenreID)s, %(Description)s, %(Link)s, %(OriginalPrice)s)")

        cursor.execute(query, game_data)

        gameID = cursor.lastrowid
        print(gameID)
        game_data = {
        'GameID': gameID,
        'DistributorName': "Steam",
        'Amount': price,
        'Link':link
        }
        insert_history_query = """INSERT INTO priceHistory (GameID, DistributorName, Amount, DateUpdated, Link)
                                VALUES (%(GameID)s, %(DistributorName)s, %(Amount)s, CURDATE(), %(Link)s)"""

        cursor.execute(insert_history_query,game_data)

        game_data = {
        'GameID': gameID,
        'DistributorName': "Steam",
        'Amount': price,
        "Link": link
        }
        insert_current_query = """INSERT INTO currentPrice (GameID, DistributorName, Amount, DateUpdated, Link)
                                        VALUES (%(GameID)s, %(DistributorName)s, %(Amount)s, CURDATE(), %(Link)s)"""
        cursor.execute(insert_current_query, game_data)

    else:
        if price > discount:
            price = discount
        insert_history_query = """INSERT INTO priceHistory (GameID, DistributorName, Amount, DateUpdated, Link)
                                      VALUES (%s, %s, %s, CURDATE(), %s)"""
        cursor.execute(insert_history_query, (game_id[0], distributor, price, link))

            # Update or insert the scraped price into the currentPrice table
        cursor.execute("SELECT Amount FROM currentPrice WHERE GameID = %s AND DistributorName = %s",
                           (game_id[0], distributor))
        current_price_row = cursor.fetchone()

        if current_price_row:
            update_query = """UPDATE currentPrice SET Amount = %s, DateUpdated = CURDATE() WHERE GameID = %s AND DistributorName = %s"""
            cursor.execute(update_query, (price, game_id[0], distributor))
        else:
            insert_current_query = """INSERT INTO currentPrice (GameID, DistributorName, Amount, DateUpdated, Link)
                                        VALUES (%s, %s, %s, CURDATE(), %s)"""
            cursor.execute(insert_current_query, (game_id[0], distributor, price, link))




    #     else:
    #         print(f"Game not found for link: {link}")
    # else:
    #     print(f"Failed to fetch price for link: {link}")

conn.commit()
cursor.close()
conn.close()
