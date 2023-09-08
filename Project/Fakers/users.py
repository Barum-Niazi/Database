from faker import Faker
import pyodbc
import bcrypt

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

# Generate fake data for users table
for _ in range(100):
    id = fake.unique.random_number(digits=15)
    name = fake.name()
    password = fake.password()
    hashed_password = bcrypt.hashpw(
        password.encode(), bcrypt.gensalt()).decode()
    email = fake.email()
    contact_no = fake.unique.phone_number()[:13]
    address = fake.address()
    image = 0
    rank = 0

    query = f"INSERT INTO users (ID, Name, Password, Email, ContactNo, Address, Image, Rank) " \
            f"VALUES ('{id}', '{name}', '{hashed_password}', '{email}', '{contact_no}', '{address}', {image}, {rank})"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
