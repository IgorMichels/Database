import mysql.connector
import pandas as pd

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="361311172000",
  database="flights"
)
mycursor = mydb.cursor()




# Populating Delay Causes
df = pd.read_csv("scraping/delay_types-final.csv", delimiter=";")
sql = "INSERT INTO Delay_Causes (id_delay,cause) VALUES (%s,%s)"
val = df.values.tolist()
mycursor.executemany(sql,val)






mydb.commit()
