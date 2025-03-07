"""
# Chapter 5: Unit Testing Classes
# --------------------------------------------------------------------------------
# Imports
# --------------------------------------------------------------------------------

import pytest
from accum import Accumulator
# Removed unreolved referece option since 'from accum import Accumulator was giving an error'
# Link to enable or disable is this https://www.geeksforgeeks.org/how-to-fix-unresolved-reference-issue-in-pycharm/

# --------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------

# Verifies that the new instance of the Accumulator class has a starting count of zero.
def test_accumulator_init():
    accum = Accumulator()
    assert accum.count == 0

# Verifies that the add() method adds one to the internal count when it is called with no other arguments.
def test_accumulator_add_one():
    accum = Accumulator()
    accum.add()
    assert accum.count == 1

# Verifies that the add() method adds 3 to the count when it is called with the argument of 3.
def test_accumulator_add_three():
    accum = Accumulator()
    accum.add(3)
    assert accum.count == 3

# Verifies that the count increases appropriately with multiple add() calls.
def test_accumulator_add_twice():
    accum = Accumulator()
    accum.add()
    accum.add()
    assert accum.count == 2

# Verifies that the count attribute cannot be assigned directly because it is a read-only property.
# Notice how we use pytest.raises to verify the AttributeError.
def test_accumulator_cannot_set_count_directly():
    accum = Accumulator()
    with pytest.raises(AttributeError, match=r"can't set attribute") as exc_info:
        accum.count = 10
    # print(f"This is the error message: {exc_info.value}") - Just for reference
    # match= parameter needs to match the value string that comes from pytest.raises(AttributeError), so printing {exc_info} provides that information
"""


# Chapter 6: Fixtures
# --------------------------------------------------------------------------------
# Imports
# --------------------------------------------------------------------------------

import pytest
from accum import Accumulator
# Removed unreolved referece option since 'from accum import Accumulator was giving an error'
# Link to enable or disable is this https://www.geeksforgeeks.org/how-to-fix-unresolved-reference-issue-in-pycharm/

# --------------------------------------------------------------------------------
# Tests
# --------------------------------------------------------------------------------

# This function returns a new Accumulator object - the function does not assign the object to a global variable
# A fixture should ALWAYS return a value
@pytest.fixture
def accum():
    return Accumulator()

# Verifies that the new instance of the Accumulator class has a starting count of zero.
def test_accumulator_init(accum):
    # This accum in the paranthesis comes from the function def accum()
    # This accum in the paranthesis the same as accum = Accumulator()
    assert accum.count == 0

# Verifies that the add() method adds one to the internal count when it is called with no other arguments.
def test_accumulator_add_one(accum):
    accum.add()
    assert accum.count == 1

# Verifies that the add() method adds 3 to the count when it is called with the argument of 3.
def test_accumulator_add_three(accum):
    accum.add(3)
    assert accum.count == 3

# Verifies that the count increases appropriately with multiple add() calls.
def test_accumulator_add_twice(accum):
    accum.add()
    accum.add()
    assert accum.count == 2

# Verifies that the count attribute cannot be assigned directly because it is a read-only property.
# Notice how we use pytest.raises to verify the AttributeError.
def test_accumulator_cannot_set_count_directly(accum):
    with pytest.raises(AttributeError, match=r"can't set attribute") as exc_info:
        accum.count = 10
    # print(f"This is the error message: {exc_info.value}") - Just for reference
    # match= parameter needs to match the value string that comes from pytest.raises(AttributeError), so printing {exc_info} provides that information
