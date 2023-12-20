Feature: Github API Validation


  Scenario: Session Manager check
    Given I have Github auth credentials
    When I hit getRepo API of Github
    Then Verify status code of the response should be 200



    # If we want our status code to be 404, we don't have to write a new step definition
    # We can make our code generic:
    # In our stepimplementation file, instead of hard coding the status code, we can create a variable for it
    # For ex: our status code variable is called statusCode
    # Putting statusCode variable like this {statusCode} in our step definition file will be referenced to our actual status code in BDD test
    # We can reuse the status code anywhere
    # Therefore any BDD step with status code validation would be pointed to our code that checks our status codes

  # Qestion for Logesh or Sukanya:
  # Even though we reuse the code, do we have to change the steps in our then string in our step implementation
  # that is if the steps are written differently?


# We can reuse this code for any test checking for a status code since we made it generic, we may need to change the steps in the then tag (keep statusCode:d)
#@then('Verify status code of the response should be {statusCode:d}')
#def step_impl(context, statusCode):
#  print(context.response.status_code)
#  assert context.response.status_code == statusCode