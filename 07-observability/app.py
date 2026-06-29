from flask import Flask, jsonify, Response
from prometheus_client import Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST
import time
import datetime
import os

app = Flask(__name__)

# Prometheus metrics
REQUEST_COUNT = Counter(
    'flask_request_count',
    'Total number of requests',
    ['method', 'endpoint', 'status']
)

REQUEST_LATENCY = Histogram(
    'flask_request_latency_seconds',
    'Request latency in seconds',
    ['endpoint']
)

@app.route("/")
def home():
    start = time.time()
    
    response = jsonify({
        "status": "running",
        "message": "Hello from monitored Flask app!",
        "time": str(datetime.datetime.now()),
        "hostname": os.uname().nodename
    })
    
    latency = time.time() - start
    REQUEST_COUNT.labels(method='GET', endpoint='/', status='200').inc()
    REQUEST_LATENCY.labels(endpoint='/').observe(latency)
    
    return response

@app.route("/health")
def health():
    REQUEST_COUNT.labels(method='GET', endpoint='/health', status='200').inc()
    return jsonify({"status": "healthy"}), 200

@app.route("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
