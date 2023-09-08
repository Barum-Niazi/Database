from faker import Faker
import pyodbc

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

# Get existing data for users
cursor.execute("SELECT ID, Rank FROM users")
user_data = cursor.fetchall()

# Generate fake data for logs table
for _ in range(100):
    user = fake.random_element(elements=user_data)
    user_id, rank_id = user[0], user[1]
    details = fake.sentence(nb_words=10)

    query = f"INSERT INTO logs ([User], Details, Rank) VALUES ('{user_id}', '{details}', {rank_id})"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
