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

# Get existing data for seasons
cursor.execute("SELECT ID FROM seasons")
season_ids = [row[0] for row in cursor.fetchall()]

# Generate fake data for sale table
for _ in range(9000):
    season_id = random.choice(season_ids)
    name = fake.name()
    address = fake.address()
    date = fake.date_between(start_date='-1y', end_date='today')
    contact_no = fake.phone_number()[:13]  # Limit the length to 13 characters
    paid = random.choice([True, False])

    query = f"INSERT INTO sale (Season, Name, Address, [Date], ContactNo, Paid) " \
            f"VALUES ({season_id}, '{name}', '{address}', '{date}', '{contact_no}', '{paid}')"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
