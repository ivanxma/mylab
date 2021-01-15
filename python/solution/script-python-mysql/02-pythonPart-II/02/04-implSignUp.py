from flask import Flask, render_template, request, json

app = Flask(__name__)

@app.route("/")
@app.route("/main")
def main():
#	return "Hello World!"
	return render_template('index.html')

@app.route("/showSignUp")
def showSignUp():
	return render_template('04-signup.html')

@app.route("/signUp", methods=["POST", "GET"])
def signUp():
	_name = request.form['inputName']
	_email = request.form['inputEmail']
	_password = request.form['inputPassword']

	# validate the values
	if _name and _email and _password:
		return json.dumps({'html':'<span>All fields good !!</span>'})
	else:
		return json.dumps({'html':'<span>Enter the required fields!!</span>'})


if __name__ == "__main__":
#	app.run()
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

