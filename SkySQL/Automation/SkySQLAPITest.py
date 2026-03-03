# Import the requests library
import requests

# Set the string to a variable called url
url = 'https://api.skysql.com/provisioning/v1/providers'

# Set the headers to a variable called
headers = {'X-API-Key': 'skysql.1zzz.m21zb6wu.zszj0jpDF7UtWkUlTaH1kA0UOgwyworkURHu.987979de'}

# Verify the response code
response = requests.get(url=url, headers=headers)
print(response.status_code)

# Show the JSON body content
actual_response = response.json()
print("This is the actual response", actual_response)

# Expected response
expected_response = [
    {
        "id": "123e4567-e89b-12d3-a456-426614174000",
        "name": "azure",
        "display_name": "Microsoft Azure",
        "volume_size_min_gb": 8,
        "volume_size_max_gb": 2000
    },
    {
        "id": "305a4ea3-a85b-4707-a7f8-4f20dd3c4929",
        "name": "gcp",
        "display_name": "Google Cloud",
        "volume_size_min_gb": 8,
        "volume_size_max_gb": 2000
    },
    {
        "id": "5a9c1675-ca54-4b3b-9da9-2ea617e45969",
        "name": "aws",
        "display_name": "Amazon AWS",
        "volume_size_min_gb": 8,
        "volume_size_max_gb": 2000,
        "iops_per_gb": 1,
        "iops_min": 100
    }
]

# Check whether the test passed or failed
if expected_response == actual_response:
    print("Test passed")

else:
    print("Test failed")

