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
mydb.commit()


# Populating Aircraft Types
df = pd.read_csv("scraping/aircraft_types-final.csv", delimiter=";")
sql = "INSERT INTO Aircraft_Types (id_type,description) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Manufacturer
df = pd.read_csv("scraping/manufacturers-final.csv", delimiter=";")
sql = "INSERT INTO Manufacturer (id_manufacturer,Name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Aircraft Models
df = pd.read_csv("scraping/aircraft_models-final.csv", delimiter=";")
sql = "INSERT INTO Aircraft_Models (id_model,model,Manufacturer_id) VALUES (%s,%s,%s)"
val = [(x[0],x[2],x[1]) for x in df.values.tolist()]
mycursor.executemany(sql,val)
mydb.commit()


# Populating Engine Types
df = pd.read_csv("scraping/engine_types-final.csv", delimiter=";")
sql = "INSERT INTO Engine_Types (id_type,name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating States
df = pd.read_csv("scraping/states-final.csv", delimiter=";")
sql = "INSERT INTO States (abreviation,name) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Cities
df = pd.read_csv("scraping/cities-final.csv", delimiter=";")
sql = "INSERT INTO Cities (id_city,name,States_abrev) VALUES (%s,%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Companies
df = pd.read_csv("scraping/companies-final.csv", delimiter=";")
sql = "INSERT INTO Companies (id_company,name,Cities_id) VALUES (%s,%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Airports
df = pd.read_csv("scraping/airports-final.csv", delimiter=";")
sql = "INSERT INTO Airports (cod,Cities_id) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Routes
df = pd.read_csv("scraping/routes-final.csv", delimiter=";")
sql = "INSERT INTO Routes (id_route,Departure_Airport_id,Arrival_Airport_id) VALUES (%s,%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()


# Populating Aircrafts
df = pd.read_csv("scraping/aircrafts-final.csv", delimiter=";")
df = df.where(pd.notnull(df), None)
sql = "INSERT INTO Aircrafts (N_Number,Companys_id,Aircraft_Models_id,Engine_Types_id,Aircraft_Types_id,year) VALUES (%s,%s,%s,%s,%s,%s)"
val = [x[1:] for x in df.values.tolist()]
mycursor.executemany(sql,val)
mydb.commit()
'''

'''
# Populating Flights
months = [  '2019-01 - final.csv',
            '2019-02 - final.csv',
            '2019-03 - final.csv',
            '2019-04 - final.csv',
            '2019-05 - final.csv',
            '2019-06 - final.csv',
            '2019-07 - final.csv',
            '2019-08 - final.csv',
            '2019-09 - final.csv',
            '2019-10 - final.csv',
            '2019-11 - final.csv',
            '2019-12 - final.csv',
            '2020-01 - final.csv',
            '2020-02 - final.csv',
            '2020-03 - final.csv',
            '2020-04 - final.csv',
            '2020-05 - final.csv']

for month in months:
    df = pd.read_csv("scraping/"+month, delimiter=";")
    df = df.where(pd.notnull(df), None)
    sql = "INSERT INTO Flights (id_flight,Aircrafts_id,Route_id,Date,Arrival_time,Departure_time,Delay_time,Delay_Causes_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    val = df.values.tolist()
    mycursor.executemany(sql,val)
    mydb.commit()
'''

df = pd.read_csv("scraping/test.csv", delimiter=";")
df = df.where(pd.notnull(df), None)
sql = "INSERT INTO Flights (id_flight,Aircrafts_id,Route_id,Date,Arrival_time,Departure_time,Delay_time,Delay_Causes_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)
mydb.commit()