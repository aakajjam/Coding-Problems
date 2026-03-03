# Import the requests library
import requests

# Set the string to a variable called url
url = 'https://api.skysql.com/provisioning/v1/versions?topology=standalone'

# Set the headers to a variable called
headers = {'X-API-Key': 'skysql.1zzz.m21zb6wu.zszj0jpDF7UtWkUlTaH1kA0UOgwyworkURHu.987979de'}

# Verify the response code
response = requests.get(url=url, headers=headers)
print(response.status_code)

# Show the JSON body content
actual_response = response.json()
print(actual_response)


# Expected response
expected_response = [
    {
        "id": "e16d560f-3abb-45ef-bde5-f373acc610d6",
        "name": "11.4.2-1-9",
        "version": "11.4.2-1",
        "topology": "standalone",
        "product": "server",
        "display_name": "MariaDB Server 11.4.2-1",
        "is_major": True,
        "release_date": "0001-01-01T00:00:00Z",
        "release_notes_url": "https://mariadb.com/kb/en/mariadb-11-4-2-release-notes/"
    },
    {
        "id": "bc87a51c-8882-4ed2-b374-ea2314ced1a0",
        "name": "10.6.18-13-3",
        "version": "10.6.18-13",
        "topology": "standalone",
        "product": "server",
        "display_name": "Enterprise Server 10.6.18-13",
        "is_major": True,
        "release_date": "0001-01-01T00:00:00Z",
        "release_notes_url": "https://mariadb.com/docs/server/release-notes/mariadb-enterprise-server-10-6/10-6-18-13/"
    },
    {
        "id": "fc050dca-0d1c-4713-b57f-2025659cbb44",
        "name": "10.5.25-19-3",
        "version": "10.5.25-19",
        "topology": "standalone",
        "product": "server",
        "display_name": "Enterprise Server 10.5.25-19",
        "is_major": True,
        "release_date": "0001-01-01T00:00:00Z",
        "release_notes_url": "https://mariadb.com/docs/server/release-notes/mariadb-enterprise-server-10-5/10-5-25-19/"
    },
    {
        "id": "9477def1-ead2-4777-a1c7-13fc8cac9f59",
        "name": "10.4.31-21-1",
        "version": "10.4.31-21",
        "topology": "standalone",
        "product": "server",
        "display_name": "Enterprise Server 10.4.31-21",
        "is_major": True,
        "release_date": "0001-01-01T00:00:00Z",
        "release_notes_url": "https://mariadb.com/docs/server/release-notes/mariadb-enterprise-server-10-4/10-4-31-21/"
    },
    {
        "id": "9cb86c81-5087-40af-8b72-c97efa710876",
        "name": "10.11.8-1-5",
        "version": "10.11.8-1",
        "topology": "standalone",
        "product": "server",
        "display_name": "MariaDB Server 10.11.8-1",
        "is_major": True,
        "release_date": "0001-01-01T00:00:00Z",
        "release_notes_url": "https://mariadb.com/kb/en/mariadb-10-11-8-release-notes/"
    }
]

if expected_response == actual_response:
    print("Test passed")

else:
    print("Test failed")
