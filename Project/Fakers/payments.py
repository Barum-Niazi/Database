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

# Get existing data for seasons
cursor.execute("SELECT ID FROM seasons")
season_ids = [row[0] for row in cursor.fetchall()]

# Generate fake data for payments table
for _ in range(1000):
    season_id = random.choice(season_ids)
    date = fake.date_between(
        start_date='-1y', end_date='today').strftime('%Y-%m-%d')
    bank = random.choice(['HBL', 'UBL', 'Alfalah', 'Meezan Bank'])
    account = fake.unique.random_number(digits=10)
    amount = random.randint(50000, 10000000)
    description = fake.text(max_nb_chars=128)

    query = f"INSERT INTO payments (Season, [Date], Bank, Account, Amount, Description) " \
            f"VALUES ({season_id}, '{date}', '{bank}', '{account}', {amount}, '{description}')"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
