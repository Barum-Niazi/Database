from faker import Faker
import pyodbc
import random

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

# Get existing data for seasons and parties
cursor.execute("SELECT ID FROM seasons")
season_ids = [row[0] for row in cursor.fetchall()]
cursor.execute("SELECT Name FROM parties")
party_names = [row[0] for row in cursor.fetchall()]

# Generate fake data for expenses table
for _ in range(4900):
    season_id = random.choice(season_ids)
    expense_type = 'cash'
    party_name = random.choice(party_names)
    date = fake.date_between(
        start_date='-1y', end_date='today').strftime('%Y-%m-%d')
    amount = random.randint(0, 1000000)
    description = fake.text(max_nb_chars=128)

    query = f"INSERT INTO expenses (Season, Type, Party, [Date], Amount, Description) " \
            f"VALUES ({season_id}, '{expense_type}', '{party_name}', '{date}', {amount}, '{description}')"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
