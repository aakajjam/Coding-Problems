import requests
from pytest_csv_params.decorator import csv_params

# Define the header
headers = {'X-API-Key': 'skysql.1zzz.m21zb6wu.zszj0jpDF7UtWkUlTaH1kA0UOgwyworkURHu.987979de'}

# Provide the decorator tag for CSV files and add the absolute path as the parameters
@csv_params("C:/Users/aksha/PycharmProjects\pythonProject5/testswaggerURLsGETCalls.csv")
def test_get_calls(url):
    response = requests.get(url=url, headers=headers)
    assert response.status_code == 200

    print(response.json())
    # Use the pytest -s -v test_api.py to see the printed json information in the terminal
    # Otherwise running the test will not print anything