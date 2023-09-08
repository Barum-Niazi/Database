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

# Generate fake data for parties table
party_names = [fake.unique.company() for _ in range(100)]
party_contact_nos = [fake.unique.phone_number()[:13]
                     for _ in range(100)]  # Limit the length to 13 characters
party_addresses = [fake.unique.address() for _ in range(100)]

for name, contact_no, address in zip(party_names, party_contact_nos, party_addresses):
    query = f"INSERT INTO parties (Name, ContactNo, Address) VALUES ('{name}', '{contact_no}', '{address}')"
    cursor.execute(query)
# Generate fake data for varieties table
product_types = [fake.random_element(
    elements=('Cotton Seed', 'Mung Bean', 'Wheat Seed', 'Bajra Seed')) for _ in range(100)]
variety_names = [fake.unique.name()[:20] for _ in range(100)]
variety_sizes = [fake.random_element(
    elements=('5 KG', '10 KG', '20 KG')) for _ in range(100)]
variety_rates = [fake.random_int(min=100, max=1000) for _ in range(100)]

for product_type, name, size, rate in zip(product_types, variety_names, variety_sizes, variety_rates):
    query = f"INSERT INTO varieties (Type, Name, Size, Rate) VALUES ('{product_type}', '{name}', '{size}', {rate})"
    cursor.execute(query)

# Commit the changes
conn.commit()

# Close the connection
conn.close()
