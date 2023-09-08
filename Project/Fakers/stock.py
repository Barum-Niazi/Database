from faker import Faker
import pyodbc
import random
from datetime import datetime, timedelta

# Database connection parameters
DRIVER_NAME = 'SQL Server'
SERVER_NAME = 'DESKTOP-3K7AOVF'
DATABASE_NAME = 'project_db'

# Set up Faker
fake = Faker()

# Set up connection string
connection_string = f'DRIVER={{{DRIVER_NAME}}};SERVER={SERVER_NAME};DATABASE={DATABASE_NAME};Trust_Connection=yes;'

# Set up database connection
conn = pyodbc.connect(connection_string)
cursor = conn.cursor()

# Get existing data for parties and varieties
cursor.execute("SELECT NAME FROM parties")
party_names = [row[0] for row in cursor.fetchall()]
cursor.execute("SELECT ID FROM varieties")
variety_ids = [row[0] for row in cursor.fetchall()]

# Generate fake data for stock table
season_id = 1  # Assuming a constant season ID for all stock entries

for _ in range(1000):
    date = fake.date_between(
        start_date='-1y', end_date='today').strftime('%Y-%m-%d')
    party_name = random.choice(party_names)
    variety_id = random.choice(variety_ids)
    quantity = random.randint(10, 1000)
    price = random.randint(100, 1000)
    expiry_date = (datetime.strptime(date, '%Y-%m-%d') +
                   timedelta(days=365)).date()  # in case of expired stock i just do - in the expiry_ddate

    query = f"INSERT INTO stock (Season, [DATE], Party, Variety, Quantity, Price, Expiry) " \
            f"VALUES ({season_id}, '{date}', '{party_name}', {variety_id}, {quantity}, {price}, '{expiry_date}')"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
