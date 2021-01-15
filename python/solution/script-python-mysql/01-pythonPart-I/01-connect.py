import mysql.connector
import sys

if len(sys.argv) > 1 :
	_pass = sys.argv[1]
else :
	_pass = ''
cnx = mysql.connector.connect(user='root', password=_pass, host='127.0.0.1', port=3306, database='mysql')

cnx.close()

