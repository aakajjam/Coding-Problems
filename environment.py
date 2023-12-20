# This is part of Udemy Course: Learn API Automation Testing Python BDD Framework
# This file is made for Hooks specifically - Lecture 54


import requests


def after_scenario(context, scenario):
    if "library" in scenario.tags:

        response_deleteBook = requests.delete('http://216.10.245.166/Library/DeleteBook.php', json={
           "ID": context.bookID
        }, headers={"Content-Type":"application/json"},
                                              )

        assert response_deleteBook.status_code == 200
        res_json = response_deleteBook.json()

        print(res_json["msg"])

