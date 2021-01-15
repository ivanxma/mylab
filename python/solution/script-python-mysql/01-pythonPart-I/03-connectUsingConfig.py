import mysql.connector
import sys

_pass = ''
if len(sys.argv) > 1 :
	_pass = sys.argv[1]

config = {
	'user': 'root',
	'password': _pass,
	'host': '127.0.0.1',
	'database': 'mysql',
	'raise_on_warnings': True,
}

cnx = mysql.connector.connect(**config)
cnx.close()
