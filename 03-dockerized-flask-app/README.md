# 03 - Dockerized Flask App

## What this does
A Python Flask app fully containerized with Docker.
Runs with Redis using docker-compose — two containers, one command.

## Project Structure
- app.py — Flask web app with two endpoints
- Dockerfile — instructions to build the container image
- docker-compose.yml — defines flask + redis multi-container setup
- requirements.txt — Python dependencies

## Endpoints
- GET / → returns status, message, time, hostname
- GET /health → returns healthy — used by Kubernetes later

## Commands used

Build image:
docker build -t flask-app .

Run single container:
docker run -d -p 5001:5000 --name my-flask-app flask-app

Run with docker-compose:
docker compose up -d

Check running containers:
docker compose ps

See logs:
docker logs my-flask-app

Stop everything:
docker compose down

## Key concepts learned
- Dockerfile — recipe to build an image
- Image — packaged app, not running yet
- Container — running instance of image
- Port mapping — laptop port maps to container port
- docker-compose — run multiple containers with one command
- depends_on — control container start order
- Docker networking — containers talk to each other internally
