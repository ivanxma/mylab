from __future__ import print_function

import mysql.connector
from mysql.connector import errorcode
import sys
_pass=''
if len(sys.argv) > 1:
	_pass=sys.argv[1]

DB_NAME = 'employees'

operation = 'SELECT * from employees limit 10'

config = {
	'user': 'root',
	'password': _pass,
	'host': '127.0.0.1',
	'database': 'employees',
	'raise_on_warnings': True,
}

cnx = mysql.connector.connect(**config)

cursor = cnx.cursor()

try:
  for result in cursor.execute(operation, multi=True):
     if result.with_rows:
        print("rows producted by statement '{}':".format(result.statement))
        row = cursor.fetchone()
        while row:
           print(row)
           row = cursor.fetchone()
     else:
        print("Number of rows affeted by statement '{}':{}".format(result.statement, result.rowcount))
except mysql.connector.Error as err:
        print(err.msg)

cursor.close()
cnx.close()


