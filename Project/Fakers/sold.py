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

# Get existing data for sale and stock
cursor.execute("SELECT ID FROM sale")
sale_ids = [row[0] for row in cursor.fetchall()]
cursor.execute("SELECT ID, Price FROM stock")
stock_data = cursor.fetchall()

# Generate fake data for sold table
for _ in range(9000):
    sale_id = random.choice(sale_ids)
    stock_id, rate = random.choice(stock_data)
    quantity = random.randint(1, 100)

    query = f"INSERT INTO sold (Sale, Stock, Quantity, Rate) " \
            f"VALUES ({sale_id}, {stock_id}, {quantity}, {rate})"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
