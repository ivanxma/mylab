from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
@app.route("/main")
def main():
#	return "Hello World!"
	return render_template('index.html')

@app.route("/showSignUp")
def showSignUp():
	return render_template('signup.html')

if __name__ == "__main__":
#	app.run()
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

