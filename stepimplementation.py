
import requests
from behave import *
from payLoad import *
from utilities.resources import *
from utilities.configurations import *


@given('The Book details which needs to be added to the Library')
def step_impl(context):
    context.url = getConfig()['API']['endpoint'] + ApiResources.addBook
    context.headers = {"Content-Type": "application/json"}
    context.payLoad = addBookPayload("madffs", "3443")


@when('We execute the AddBook Post API method')
def step_impl(context):
    context.response = requests.post(context.url, json=context.payload, headers=context.headers)


@then('Book is successfully added')
def step_impl(context):
    print(context.response.json())
    response_json = context.response.json()
    context.bookID = response_json['ID']
    print(context.bookID)
    assert response_json["Msg"] == "successfully added"

################################################################################

@given('The Book details with {isbn} and {aisle}')
def step_impl(context, isbn, aisle):
    # We give isbn and aisle because the @given line is sending us the parameters isbn and aisle from our feature file
    context.url = getConfig()['API']['endpoint'] + ApiResources.addBook
    context.headers = {"Content-Type": "application/json"}
    context.payLoad = addBookPayload(isbn, aisle)

# This is the same as the given @given('The Book details which needs to be added to the Library')
    # The difference here is that we give the isbn and aisle from the BDD examples instead of hard coding them
    # See the BookAPI.feature file for reference

#################################################################################

@given('I have Github auth credentials')
def step_impl(context):
    context.session = requests.session()
    context.session.auth = auth = ("akshaymusic101@gmail.com", getPassword())

@when('I hit getRepo API of Github')
def step_impl(context):
    context.response = context.session.get(ApiResources.githubRepo)

@then('Verify status code of the response should be {statusCode:d}') # The :d means that our status code variabe is an int
def step_impl(context, statusCode):
    print(context.response.status_code)
    assert context.response.status_code == statusCode


# If we want to reuse code make sure to maintain consistency in variable names so they can be used in other areas as well

