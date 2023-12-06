import mysql.connector
import random
from datetime import datetime, timedelta

# MySQL configurations
config = {
    'user': 'root',
    'password': '013626210!',
    'host': 'localhost',
    'database': 'gamepickerdb',
    'raise_on_warnings': True
}

# Initialize the database connection
conn = mysql.connector.connect(**config)
cursor = conn.cursor()

# Set your initial GameID
base_game_id = 1000

# Loop to insert 100 data points
for counter in range(1, 101):
    # Generate a random price between 29.99 and 59.99
    random_price = round(random.uniform(29.99, 59.99), 2)

    # Generate a random date between May 20, 2023, and December 5, 2023
    random_date = datetime(2023, 5, 20) + timedelta(days=random.randint(0, 199))

    # SQL insert statement
    insert_query = """
    INSERT INTO pricehistory (DistributorName, GameID, Amount, DateUpdated, Link)
    VALUES (%s, %s, %s, %s, %s)
    """

    # Data to insert
    data = ('Steam', base_game_id, random_price, random_date, 'https://store.steampowered.com/agecheck/app/1091500/')

    # Execute the insert statement
    cursor.execute(insert_query, data)
    conn.commit()

# Close the database connection
conn.close()
