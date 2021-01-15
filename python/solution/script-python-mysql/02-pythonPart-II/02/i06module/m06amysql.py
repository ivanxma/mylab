import mysql.connector


def connect(_user, _pass, _db):
   config = {
       'user': _user,
        'password': _pass,
        'host': '127.0.0.1',
        'database': _db,
        'raise_on_warnings': True,
   }
   _conn = mysql.connector.connect(**config)
   return _conn
	
