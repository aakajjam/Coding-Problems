import mysql.connector as mariadb
import os


class MariaDBRobot:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self._db_con = None

    def connect(self, host, port, user, password, db, platform, charset):
        # Path to the certificate and logic for choosing the correct one, depending on the topology platform
        cwd = os.path.dirname(__file__)
        cert = None
        if platform == "gcp":
            cert = cwd + "/../Certificate/test_chain_2022.pem"
            print(cert)
        elif platform == "aws":
            cert = cwd + "/../Certificate/test_chain_2022.pem"
            print(cert)
        else:
            print("No proper certificate is found")

        # Connect to MariaDB Platform
        if charset == "utf8":
            self._db_con = mariadb.connect(
                user=user,
                password=password,
                host=host,
                port=int(port),
                database="",
                ssl_ca=cert,
                charset="utf8"
            )
        else:
            self._db_con = mariadb.connect(
                user=user,
                password=password,
                host=host,
                port=int(port),
                database="",
                ssl_ca=cert
            )

    """ Use when a result is expected from the query, e.g. select query. """
    def select(self, query):
        # Get Cursor
        cur = self._db_con.cursor()
        cur.execute(query)
        return cur.fetchall()

    """ Use when there is no result, e.g. create, update, insert queries. """
    def exec(self, query):
        # Get Cursor
        cur = self._db_con.cursor()
        cur.execute(query)

    def connect_without_ssl(self, host, port, user, password, db, charset):

        # Connect to MariaDB Platform
        if charset == "utf8":
            self._db_con = mariadb.connect(
                user=user,
                password=password,
                host=host,
                port=int(port),
                database="",
                charset="utf8"
            )
        else:
            self._db_con = mariadb.connect(
                user=user,
                password=password,
                host=host,
                port=int(port),
                database=""
            )
