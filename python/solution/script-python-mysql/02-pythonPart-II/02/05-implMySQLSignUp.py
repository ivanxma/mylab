from flask import Flask, render_template, request, json
import mysql.connector
from mysql.connector import errorcode

config = {
       'user': 'root',
        'password': '',
        'host': '127.0.0.1',
        'database': 'bucketlist',
        'raise_on_warnings': True,
}


app = Flask(__name__)

@app.route("/")
@app.route("/main")
def main():
	return render_template('index.html')

@app.route("/showSignUp")
def showSignUp():
	return render_template('05-signup.html')

@app.route("/signUp", methods=["POST", "GET"])
def signUp():
   try:
	_name = request.form['inputName']
	_email = request.form['inputEmail']
	_password = request.form['inputPassword']

	# validate the values
	if _name and _email and _password:
		conn = mysql.connector.connect(**config)
		cursor = conn.cursor()

		cursor.callproc("sp_createUser", [ _name, _email, _password])
		if len(list(cursor.stored_results())) is 0:
			conn.commit()
			return json.dumps({'message':'User created successfully!'})
		else:
			data = []
			for result in cursor.stored_results():
				data.append(str(result.fetchall()))
				
			return json.dumps({'error': str(data) + '/[rs:' + str(len(list(cursor.stored_results())))})
	else:
		return json.dumps({'html':'<span>Enter the required fields!!</span>'})

   except Exception as e:
	return json.dumps({'DB Error':str(e)})
   finally:
	cursor.close()
	conn.close()

if __name__ == "__main__":
#	app.run()
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

