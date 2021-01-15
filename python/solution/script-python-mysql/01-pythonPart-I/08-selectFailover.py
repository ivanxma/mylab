from __future__ import print_function

import mysql.connector
from mysql.connector import errorcode

DB_NAME = 'employees'

operation = 'SELECT @@hostname, @@port, employees.* from employees limit 10'

config = {
	'raise_on_warnings': True,
	'failover' : [{
		'user': 'root',
		'password': '',
		'host': '127.0.0.1',
		'port': 3306,
		'database': 'employees',
		}, {
		'user': 'root',
		'password': '',
		'host': '127.0.0.1',
		'port': 3316,
		'database': 'employees',
		}]
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


