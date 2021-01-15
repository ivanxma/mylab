from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
	return "Hello World!"

if __name__ == "__main__":
#	app.run()
	app.run(host="0.0.0.0", port=int("8080"),debug=True)

