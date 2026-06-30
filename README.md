# DevOps Learning Journey

A hands-on, project-based path through core DevOps tooling — Linux, Docker, CI/CD, Kubernetes, Terraform, Observability, and Security scanning. Each folder is a real, working project, not a tutorial copy-paste.

## Projects

### 01 — Linux Server Health Check
Bash script monitoring disk, memory, CPU, and network — with automated alerting logic via awk.
[View project](./01-linux-server-healthcheck)

### 03 — Dockerized Flask App
Python Flask app fully containerized with Docker and docker-compose, running alongside Redis.
[View project](./03-dockerized-flask-app)

### 05 — Kubernetes Deployment
Flask app deployed on Kubernetes (Minikube) with 2 replicas, NodePort service, and demonstrated self-healing by manually killing a pod and watching it auto-recover.
[View project](./05-kubernetes-deployment)

### 06 — Terraform Infrastructure
Infrastructure as Code provisioning an EC2 instance using Terraform, tested against LocalStack to simulate AWS locally.
[View project](./06-terraform-infrastructure)

### 07 — Observability
Flask app instrumented with prometheus-client, scraped by Prometheus every 15s, visualized in a live Grafana dashboard.
[View project](./07-observability)

### CI/CD Pipeline
GitHub Actions pipeline (`.github/workflows/ci.yml`) that builds the Docker image, scans it for vulnerabilities with Trivy, runs the container, and hits both endpoints to verify health — on every push.

## What this demonstrates
- Linux fundamentals and shell scripting
- Git branching workflow with Pull Requests
- Containerization with Docker and docker-compose
- Automated CI/CD with GitHub Actions (including a deliberate fail/fix cycle proving the pipeline catches real bugs)
- Container orchestration with Kubernetes, including self-healing
- Infrastructure as Code with Terraform
- Observability with Prometheus and Grafana
- Security scanning with Trivy integrated into CI

## Tech stack
Linux · Bash · Git · Docker · Docker Compose · GitHub Actions · Kubernetes · Minikube · Terraform · Prometheus · Grafana · Trivy · Python · Flask
