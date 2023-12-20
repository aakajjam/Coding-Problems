# Our Feature File for BDD Test Cases

Feature: Verify if Books are added and deleted using Library API
  @library # This is a tag
  Scenario: Verify AddBook API functionality
    Given The Book details which needs to be added to the Library
    When We execute the AddBook PostAPI method
    Then Book is successfully added
    And Verify status code of the response should be 200
    # The And step is treated like the code for the step: Then Book is successfully added


  @library # This is a tag
  Scenario Outline:
    Given The Book details with <isbn> and <aisle>
    When We execute the AddBook PostAPI method
    Then Book is successfully added
    Examples:
      | isbn  | aisle |
      | fdfee | 8948  |
      | powr  | 76333 |

# For running the actual testing associated with the BDD test steps we may need a runner file.

  # If you use the And step, this will be treated as part of the Then step, becuase you are using conjunction with then

# Do we need two runner files one for hooks and one for step implementations or just one?