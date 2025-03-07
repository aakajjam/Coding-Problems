from python_problems import Problems
import pytest
import mysql.connector

@pytest.fixture
def prob():
    return Problems()

def test_different_words(prob):
    assert prob.words("car", "world") == "These strings are not the same"
    # Dont't say assert prob.words("car", "world"), otherwise this will give a false pass result.
    # assert prob.words("car", "world") is asserting that prob.words("car", "world") is a truthy value,
    # which it is (because it's a non-empty string, either

def test_same_words(prob):
    result = prob.words("hi", "hi")
    assert(result == "These strings are the same")

def test_wordString(prob):
   first_word = prob.wordString("Python")
   second_word = prob.wordString("Python")

   assert(first_word is second_word)


# Write a Python unit test program to check if a database connection is successful.
#@pytest.mark.parametrize("host, database, user, password, query", [
#    ("localhost", "Analytics", "root", "root", " ")
#])
#def test_Connection(prob, host, database, user, password, query):
#    assert(prob.successfulConnection(host, database, user, password, query))

@pytest.fixture()
def db_connection():
    db_connection = mysql.connector.connect(host='localhost', database='Analytics', user='root', password='root')
    return db_connection

def test_Connection(prob, db_connection):
    assert(prob.successfulConnection(db_connection))

# Write a Python unit test program to check if a database query returns the expected results.
@pytest.mark.parametrize("query", ["SELECT screen_name, COUNT(*) FROM data GROUP BY screen_name ORDER BY COUNT(*) DESC"])
def test_executeQuery(prob, db_connection, query):
    # Using the provided db_connection fixture

    cursor = db_connection.cursor() # Create the cursor object using db_connection
    cursor.execute(query)
    expected_values = cursor.fetchall()  # Fetch the results

    cursor.close()
    actual_values = prob.successfulConnection(db_connection, query=query)

    assert(expected_values == actual_values)


