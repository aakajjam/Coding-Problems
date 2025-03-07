
import mysql.connector
class Problems():
    # Write a python test assuming you have two String referenecs named strOne and strTwo
    # You only want it to pass if the two Strings contain the same characters
    def words(self, strOne, strTwo):
        if strOne == strTwo:
            return "These strings are the same"
        else:
            return "These strings are not the same"

    def sameOrNot(self, first, second):
        return sorted(first) == sorted(second)

    # Write a python unit test case to assert that a given method returns the expected value
    def term(self, term) -> str:
        return term

    # Write a JUnit test assuming you have two StringBuffer references named sbOne and sbTwo and
    # you only want it to pass if the two references point to the same StringBuffer object.
    def wordString(self, word) -> str:
        return word

    # Write a Python unit test program to check if a database connection is successful.
    #def successfulConnection(self, host, database, user, password):
    #    conn = mysql.connector.connect(host=host, database=database, user=user, password=password)
    #    return conn.is_connected()  # This will return either True or False

    # Write a Python unit test program to check if a database query returns the expected results.
    #def executeQuery(self, query):
    #    conn = mysql.connector.connect(host='localhost', database='Analytics', user='root', password='root')
    #    cursor = conn.cursor()

    #    cursor.execute(query) # This will contain the query
    #    screen_name = cursor.fetchall()
    #    return screen_name
    #    conn.close()

    def successfulConnection(self, db_connection, query=''):
        if query: # If a query is given in the test
            cursor = db_connection.cursor()
            cursor.execute(query)  # This will contain the query
            screen_name = cursor.fetchall()
            db_connection.close()
            return (screen_name)

        elif db_connection.is_connected() == False: # If the connection to the database fails
            raise Exception("Connection Failed")

        return True # If the connection to the database is True
        # We give db_connection in as our parameter in the test code
        # The code above will check(or assert) if the db_connection object is True

    # db_connection here is a parameter
    # This parameter will come from the pytest fixture method called def db_connection
    # def db_connection method will return an object called db_connection which we can then use for making the cursor and executing the query




