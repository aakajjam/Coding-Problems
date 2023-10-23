# Import the necessary modules - Use this file for later Analytics

# Import the CSV reader and other necessary modules

import pandas as pd
import matplotlib.pyplot as plt
import csv
import mysql.connector
import numpy as np

# Create a MYSQL connection

conn = mysql.connector.connect(host='localhost', database='Analytics',
                               user='root', password='root')

print(conn.is_connected(), "Connection Successful")
cursor = conn.cursor()

# Read the contents of CSV file and save it to a variable
with open('bquxjob_6ddfd0be_1889d8a79a8.csv') as file_obj:
    # Create reader object by passing the file
    # object to reader method
    reader_obj = csv.reader(file_obj)

"""
    query = "INSERT INTO Data VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

    # Iterate over each row in the csv
    # file using reader object

    for rows in reader_obj:
        # print(rows) # Rubber ducky step
        cursor.execute(query, rows)
        conn.commit()

# Write a query to delete the first row - Use only if the header is inserted into the table as well
row_removal = "DELETE FROM Data WHERE session_id = %s"
first_row = ("session_id",)
cursor.execute(row_removal, first_row)
conn.commit()
"""


cursor.execute("SELECT * FROM Data")
field_names = [fields[0] for fields in cursor.description] # This retrieves the fields of the table
results = cursor.fetchall()
#print(*results, sep="\n")
#print(type(results))

df = pd.DataFrame(results, columns=field_names)
print(df)
#print(type(field_names))

cursor.execute("SELECT screen_name, COUNT(*) FROM data GROUP BY screen_name ORDER BY COUNT(*) DESC")
screen_name_column = [fields[0] for fields in cursor.description]
screen_name_count = cursor.fetchall()
print(*screen_name_count, sep="\n")
print(type(screen_name_count))

conn.close()

dFrame = pd.DataFrame(screen_name_count, columns=screen_name_column)
print(dFrame)
print(type(dFrame))

color = ['orange', 'black', 'green', 'purple']
edgecolor = ['orange','black', 'green', 'purple']

# Bar Graph
plt.bar(dFrame["screen_name"], dFrame["COUNT(*)"], color=color, edgecolor=edgecolor)
plt.title('Bar Graph of Screen Names and COUNT(*)')
plt.xlabel('Screen Name')
plt.ylabel('COUNT(*)')
plt.xticks(rotation=90)
plt.show()

# Pie Chart
y = dFrame["COUNT(*)"]
plt.pie(y)
plt.show()


# Take the stuff from printed results and add it to a new CSV file - In progress
# Compare the original file with the new file - In progress
# Create a bar graph - Done
# Create a pie chart of some data points - In progress


