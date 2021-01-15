import mysql.connector
from mysql.connector import errorcode
import sys

_pass=''
_db='test'
if len(sys.argv) > 1 :
	_pass = sys.argv[1]
if len(sys.argv) > 2 :
	_db = sys.argv[2]

try:
  cnx = mysql.connector.connect(user='root', host='127.0.0.1', port=3306,
				password=_pass,
                                database=_db)

  print("connect success")
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)
else:
  print ("Finally - close connection")
  cnx.close()
