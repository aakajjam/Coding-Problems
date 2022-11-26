import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="akshay",
  database="New_Patient"
)

mycursor = mydb.cursor()
#mycursor.execute("CREATE DATABASE New_Patient")
mycursor.execute("SHOW DATABASES")

for x in mycursor:
  print(x)

#mycursor.execute("CREATE TABLE Patient (name VARCHAR(255), address VARCHAR(255))")

mycursor.execute("SHOW TABLES")

for x in mycursor:
  print(x)

#mycursor.execute("CREATE TABLE customers (id int AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), address VARCHAR(255))")

#mycursor.execute("ALTER TABLE Patient ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY")

sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("John", "Highway 21")
mycursor.execute(sql, val)

mydb.commit() # It is required to make the changes, otherwise no changes are made to the table

print(mycursor.rowcount, "record inserted.")

sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = [("Peter", "Lowstreet 4"), ("Amy", "Apple st 652"), ("Hannah", "Mountain 21"), ("Sandy", "Ocean blvd 2"), ("Akshay", "Lives on Mars 1")]

mycursor.executemany(sql, val)
mydb.commit()

print(mycursor.rowcount, "was inserted")

sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("Michelle", "Blue Village")
mycursor.execute(sql, val)

mydb.commit()

print("1 record inserted, ID:", mycursor.lastrowid)

# Select from a table

mycursor.execute("SELECT * FROM customers")

#myresult = mycursor.fetchall()
#for x in myresult:
#  print(x)

myresult = mycursor.fetchone()
print(myresult)

