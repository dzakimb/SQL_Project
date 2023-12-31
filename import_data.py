# Import pandas and sqlalchemy as Connectors
import pandas as pd
from sqlalchemy import create_engine


# Create an engine to connect to mysql
db_user = 'yourusername'
db_password = 'yourpassword'
db_host = 'localhost'  # e.g., 'localhost' or '127.0.0.1'
db_port = '3300'  # e.g., 3306
db_name = 'yourdbname'

# Create a MySQL connection using SQLAlchemy
engine = create_engine(f'mysql+mysqlconnector://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')

# Import data using pandas
df = pd.read_csv('supermarket_sales.csv')
print(df.head())

# Export it to the engine
df.to_sql('supermarket', engine, if_exists='replace', index=False)
