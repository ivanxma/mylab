from flask import Flask, render_template, request
app = Flask(__name__)

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
	return '<p><span>Register not Implemented</span></p>'

@app.route("/Logon", methods=["POST","GET"])
def logon():
	return '<p><span>Logon not Implemented</span></p>'

if __name__ == "__main__":
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

