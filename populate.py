import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="361311172000",
  database="flights"
)
mycursor = mydb.cursor()


'''
# Populating Delay Causes
df = pd.read_csv("scraping/delay_types-final.csv", delimiter=";")
sql = "INSERT INTO Delay_Causes (id_delay,cause) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)


# Populating Aircraft Types
df = pd.read_csv("scraping/aircraft_types-final.csv", delimiter=";")
sql = "INSERT INTO Aircraft_Types (id_type,description) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)


# Populating Manufacturer
df = pd.read_csv("scraping/manufacturers-final.csv", delimiter=",")
sql = "INSERT INTO Manufacturer (id_manufacturer,Name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)


# Populating Aircraft Models
df = pd.read_csv("scraping/aircraft_models-final.csv", delimiter=";")
sql = "INSERT INTO Aircraft_Models (id_model,model,Manufacturer_id) VALUES (%s,%s,%s)"
val = [(x[0],x[2],x[1]) for x in df.values.tolist()]
mycursor.executemany(sql,val)


# Populating Engine Types
df = pd.read_csv("scraping/engine_types-final.csv", delimiter=";")
sql = "INSERT INTO Engine_Types (id_type,name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)


# Populating States
df = pd.read_csv("scraping/states-final.csv", delimiter=";")
sql = "INSERT INTO States (abreviation,name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
'''


# Populating Cities
df = pd.read_csv("scraping/cities-final.csv", delimiter=";")
sql = "INSERT INTO Cities (id_city,name,States_abrev) VALUES (%s,%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)

# Populating Companies
# Populating Airports
# Populating Routes
# Populating Aircrafts
# Populating Flights



mydb.commit()
