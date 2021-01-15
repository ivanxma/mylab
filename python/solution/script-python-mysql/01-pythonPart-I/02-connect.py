from mysql.connector import (connection)
import sys

_pass='';
if len(sys.argv) > 1 :
	_pass=sys.argv[1]

cnx = connection.MySQLConnection(user='root', password=_pass, host='127.0.0.1', port=3306, database='mysql')

cnx.close()

