from flask import Flask, render_template, request
import mysql.connector
from mysql.connector import errorcode


app = Flask(__name__)
config = {
       'user': 'root',
        'password': '',
        'host': '127.0.0.1',
	'port': 3306,
        'database': 'pycon2016tw',
        'raise_on_warnings': True,
}


@app.route("/")
@app.route("/main")
def main():
	return render_template('03-index.html')

@app.route("/showRegistration")
def showRegistration():
	return render_template('03-registration.html')

@app.route("/showLogon")
def showLogon():
	return render_template('03-logon.html')

@app.route("/Register", methods=["POST","GET"])
def register():
   try:
        _name = request.form['inputName']
        _password = request.form['inputPassword']

        # validate the values
        if _name and _password:
		conn = mysql.connector.connect(**config)
                cursor = conn.cursor()

                cursor.callproc("sp_user", [ _name, _password])
                if len(list(cursor.stored_results())) is 0:
                        conn.commit()
                        return 'Message:User created successfully!'
                else:
                        data = []
                        for result in cursor.stored_results():
                                data.append(str(result.fetchall()))
			return '<p><span>Error:' + str(data) + '</span></p>'
	else:
		return '<p>Please Enter the required fields!!</p>'
   except Exception as e:
        return '<p><span>DB Error' + str(e) +'</spand></p>'
   finally:
	try:
        	cursor.close()
	except NameError:
		myerror=1
	try:
        	conn.close()
	except NameError:
		myerror=1




@app.route("/Logon", methods=["POST","GET"])
def logon():
	return '<p><span>Logon not Implemented</span></p>'

if __name__ == "__main__":
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

