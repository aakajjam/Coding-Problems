# Chapter 10: API Testing
"""
import pytest
import requests

@pytest.mark.duckduckgo
@pytest.mark.api
def test_duckduckgo_instant_answer_api():
    # Arrange
    url = "https://api.duckduckgo.com/?q=python+programming&format=json"

    # Act
    response = requests.get(url)
    body = response.json()

    # Assert
    assert response.status_code == 200
    print(body)
    assert '' in body['AbstractText']
"""