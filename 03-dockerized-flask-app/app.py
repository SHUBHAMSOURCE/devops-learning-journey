from flask import Flask, jsonify
import datetime
import os

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "status": "running",
        "message": "Hello from inside a Docker container!",
        "time": str(datetime.datetime.now()),
        "hostname": os.uname().nodename
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
