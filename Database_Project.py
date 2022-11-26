import mysql.connector

# https://stackoverflow.com/questions/56442939/how-to-get-python-mysql-connection-username-and-password
# how to find the username and password for sql database in python
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="akshay",
  database = "Student_Scores"
)

print(mydb)

mycursor = mydb.cursor()

#mycursor.execute("CREATE DATABASE Student_Scores")

#mycursor.execute("SHOW DATABASES")

#for d in mycursor:
  #print(d)

mycursor.execute("SHOW TABLES")
for x in mycursor:
  print(x)

# mycursor.execute("CREATE TABLE Students (name VARCHAR(255), score VARCHAR(255))")

sql = "INSERT INTO Students (name, score) VALUES (%s,%s)"
val = [
  ("Person1", "50"), ("Person2", "23"),
  ("Person3", "66"), ("Person4","89"),
  ("Person5", "90"), ("Person6","39"),
  ("Person7", "82"), ("Person8", "78"),
  ("Person9", "70"), ("Person10","34")
  ]

#mycursor.executemany(sql,val)
#mydb.commit()

mycursor.execute("SELECT * FROM Students")
fetch = mycursor.fetchall()
#for line in fetch:
  #line.strip('('')',',')
for x in fetch:
  print(x)

print(mycursor.rowcount)



