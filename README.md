# Nexvion — AI-Powered E-Commerce DevOps & Cloud-Native Delivery Platform

Nexvion is a frontend e-commerce application integrated into a production-style DevOps and cloud-native delivery platform.

The primary objective is to establish an automated, secure, observable, scalable, and repeatable software delivery ecosystem around the existing e-commerce application.

The platform integrates source control, automation, containerization, CI/CD, infrastructure automation, Kubernetes, monitoring, centralized logging, DevSecOps practices, AI-assisted troubleshooting, and cloud deployment into one connected workflow.

---

## Project Overview

The Nexvion application provides:

- Product catalogue
- Product browsing and filtering
- Product search
- Product sorting
- Shopping cart management
- Login and registration
- LocalStorage-based account and cart persistence
- Checkout and payment demo functionality
- Order confirmation

The application is used as the workload for demonstrating the complete DevOps lifecycle.

---

## Architecture

### Integrated DevOps Workflow

GitHub → Jenkins → Docker → Docker Hub → Kubernetes/K3s → Prometheus/Grafana → ELK → AI-Assisted Incident Analysis

### Cloud Deployment Workflow

GitHub → Jenkins → Docker Image → Docker Hub → AWS EC2 → K3s Kubernetes → Nexvion Application

---

## Technology Stack

| Category | Technologies |
|---|---|
| Application | HTML, CSS, JavaScript |
| Operating System | Linux / Ubuntu |
| Version Control | Git, GitHub |
| Scripting | Bash |
| Web Server / Reverse Proxy | Nginx |
| Containerization | Docker, Docker Compose |
| CI/CD | Jenkins |
| Container Registry | Docker Hub |
| Infrastructure as Code | Terraform |
| Configuration Management | Ansible |
| Orchestration | Kubernetes, K3s |
| Package Management | Helm |
| Monitoring | Prometheus, Grafana |
| Logging | Elasticsearch, Logstash, Kibana |
| Security | Trivy, Kubernetes Secrets |
| Cloud | AWS EC2 |
| AI-Assisted Operations | Incident Analysis Workflow |

---

## Application Structure

### Pages

- `index.html` — Home page
- `products.html` — Product listing and filtering page
- `payment.html` — Checkout and payment page

### CSS

- `style.css`
- `products.css`
- `payment.css`

### JavaScript

- `script.js`
- `payment.js`

### Assets

- `logo.png`

---

## Application Features

- Product catalogue with 12 products
- Product images with fallback placeholders
- Category filters
- Price filter
- Stock filter
- Product sorting
- Product search
- Shopping cart with quantity controls
- Login and registration
- Logout
- LocalStorage account and cart persistence
- Separate payment page
- Phone number validation
- PIN validation
- Card number validation
- CVV validation
- Card expiry validation
- UPI validation
- Cash on Delivery option
- Order confirmation

### Authentication and Payment

Authentication and payment functionality are implemented as frontend demo features using LocalStorage.

For a production e-commerce application, a backend authentication service and a real payment gateway would be required.

---

# Phase 1 — Version Control, Bash & Web Serving

The project source code is maintained using Git and GitHub.

### Git Workflow

The repository follows a branch-based development structure:

- `main` — Main branch
- `develop` — Development branch
- `feature/*` — Feature development branches

Separate feature branches were used for the major DevOps implementation phases.

### Bash Automation

Reusable Bash scripts were created for:

- Environment setup
- Application deployment
- Health checks
- Application backup
- Cleanup

Scripts are located under:

`scripts/setup.sh`

`scripts/deploy.sh`

`scripts/health-check.sh`

`scripts/backup.sh`

`scripts/cleanup.sh`

### Nginx

Nginx was configured as a reverse proxy for the local Nexvion application.

The configuration provides controlled access to the application and forwards requests to the application server.

---

# Phase 2 — Containerization

Nexvion was containerized using Docker and Nginx.

### Docker

A Dockerfile was created to package the application into a lightweight Nginx-based container image.

Docker Compose was also configured to run the containerized application.

### Docker Artifacts

`docker/Dockerfile`

`docker/docker-compose.yml`

The Docker image is published to Docker Hub as:

`purvaawankhede/nexvion`

---

# Phase 3 — CI/CD with Jenkins

Jenkins was used to implement an automated CI/CD pipeline.

### Pipeline Flow

Checkout → Install Dependencies → Build → Test → Security Checks → Docker Build → Image Scan → Push Image → Deploy → Health Check

### CI/CD Pipeline

The Jenkins pipeline performs:

1. Source checkout
2. Application validation
3. Build verification
4. Basic testing
5. Trivy filesystem vulnerability and secret scanning
6. Docker image build
7. Trivy container image scanning
8. Docker Hub authentication
9. Docker image push
10. Container deployment
11. Application health check

The Jenkins pipeline was successfully executed.

---

# Phase 4 — Infrastructure Automation

Infrastructure and configuration automation were implemented using Terraform and Ansible.

### Terraform

Terraform configuration was structured using reusable module-based configuration.

The Terraform implementation defines Nexvion environment configuration using Infrastructure-as-Code principles.

### Ansible

Ansible was used for configuration management and environment setup.

The configuration includes:

- Required system packages
- Docker service
- User management
- Application directory creation
- Application configuration
- Nginx service

Artifacts are located under:

`terraform/`

`ansible/`

---

# Phase 5 — Kubernetes & Helm

Nexvion was deployed using Kubernetes.

### Kubernetes Resources

The Kubernetes implementation includes:

- Namespace
- Deployment
- Service
- ConfigMap
- Secret
- Ingress
- RollingUpdate strategy

The application deployment uses multiple replicas for availability.

### Kubernetes Deployment

The Nexvion deployment uses:

- Replicas: 2
- Container Port: 80
- Image: `purvaawankhede/nexvion:latest`
- Strategy: RollingUpdate

### Helm

A Helm chart was created for packaging the Nexvion Kubernetes deployment.

The chart is located under:

`helm/ecommerce/`

It contains:

- `Chart.yaml`
- `values.yaml`
- Kubernetes resource templates

---

# Phase 6 — Monitoring & Observability

Prometheus and Grafana were configured for Kubernetes and Nexvion observability.

### Monitoring Areas

The monitoring dashboard includes visibility for:

- Nexvion pod count
- Available replicas
- Pod readiness
- Kubernetes node status
- Application availability
- Pod CPU usage
- Pod memory usage

### Prometheus

Prometheus was deployed using the kube-prometheus-stack Helm chart.

Prometheus was verified as ready and connected to Grafana.

### Grafana

Grafana was configured with a Prometheus data source and a Nexvion Kubernetes health dashboard.

The dashboard provides visibility into the Kubernetes deployment and application availability.

---

# Phase 7 — Centralized Logging with ELK

The ELK stack was configured for centralized logging.

The logging flow is:

Application / Log Source → Logstash → Elasticsearch → Kibana

### Components

- Elasticsearch
- Logstash
- Kibana

Logstash was configured to receive log events and forward them to Elasticsearch using Nexvion-specific log indices.

Centralized log ingestion was successfully tested with Elasticsearch and Logstash.

Kibana remained resource-constrained during startup in the local WSL environment due to limited available system resources. The issue was analyzed and documented as part of the AI-assisted troubleshooting workflow.

---

# Phase 8 — Deployment Strategies

Deployment strategy artifacts were created for controlled application releases.

### Rolling Update

Rolling update behavior was validated on the Nexvion Kubernetes deployment.

The deployment was updated while maintaining running application replicas.

### Blue-Green Deployment

A separate Blue-Green deployment configuration was created with dedicated application and service resources for the green environment.

### Canary Deployment

A Canary deployment configuration was created using a separate deployment and service with a dedicated canary version label.

The Blue-Green and Canary configurations were created as deployment strategy artifacts. The primary live deployment strategy validated during the project was the Kubernetes RollingUpdate strategy.

---

# Phase 9 — DevSecOps & Security

Security checks were integrated into the CI/CD lifecycle.

### Trivy

Trivy is used in Jenkins for:

- Filesystem vulnerability scanning
- Secret detection
- Container image vulnerability scanning

The pipeline checks HIGH and CRITICAL severity findings.

### Kubernetes Secrets

Kubernetes Secret resources are used for sensitive application configuration instead of placing sensitive values directly in the deployment configuration.

### Security Flow

GitHub → Jenkins → Trivy Filesystem Scan → Docker Build → Trivy Image Scan → Deployment

---

# Phase 10 — AI-Assisted Incident Analysis

An AI-assisted incident analysis workflow was documented for troubleshooting operational issues.

### Incident

Kibana did not become ready during the local ELK deployment.

### Observed Symptoms

- Kibana remained in a starting state
- Elasticsearch and Logstash experienced delayed responses
- WSL resources were constrained
- Swap usage increased
- Service initialization and communication became slow

### Analysis

The observed behavior indicated resource pressure in the local WSL/Docker environment.

### Corrective Actions

The ELK configuration was adjusted to:

- Reduce JVM heap allocation
- Limit Kibana Node.js memory
- Add persistent Elasticsearch storage
- Improve resource handling during startup

### AI-Assisted Troubleshooting Workflow

Incident → Collect Symptoms → Analyze Logs and Resources → Identify Probable Cause → Recommend Corrective Action → Apply Configuration Change → Verify Service Status

---

# Phase 11 — Cloud Deployment

Nexvion was deployed to Amazon Web Services using an EC2 instance running K3s Kubernetes.

### AWS Environment

| Component | Configuration |
|---|---|
| Cloud Provider | AWS |
| Region | `ap-south-1` (Mumbai) |
| Compute | Amazon EC2 |
| Operating System | Ubuntu 24.04 |
| Instance Type | `t3.small` |
| Kubernetes | K3s |
| Container Registry | Docker Hub |

### Cloud Deployment Flow

GitHub → Jenkins → Docker Image → Docker Hub → AWS EC2 → K3s Kubernetes → Nexvion

### K3s Environment

K3s was installed directly on the AWS EC2 instance.

The Kubernetes node reached the `Ready` state.

### Nexvion Kubernetes Deployment

The application was deployed using:

- Namespace: `nexvion`
- Replicas: 2
- Service: `nexvion-service`
- Service Type: NodePort
- Application Port: 80
- NodePort: 31957
- Image: `purvaawankhede/nexvion:latest`

Both Nexvion application pods reached the `Running` state.

The application was successfully accessed from a web browser through the EC2 public IP and Kubernetes NodePort.

This verified the cloud deployment of Nexvion on AWS.

---

# Project Directory Structure

The main project artifacts are organized as follows:

`index.html`

`products.html`

`payment.html`

`style.css`

`products.css`

`payment.css`

`script.js`

`payment.js`

`logo.png`

`scripts/`

`docker/`

`jenkins/`

`terraform/`

`ansible/`

`kubernetes/`

`helm/ecommerce/`

`monitoring/`

`logging/elk/`

`security/`

`ai/incident-analysis/`

`cloud-deployment/`

---

# Final DevOps Platform

The completed implementation connects the major DevOps components into a single delivery ecosystem.

GitHub → Jenkins → Docker → Docker Hub → Kubernetes/K3s → Monitoring & Logging → AI-Assisted Analysis → AWS Cloud

The platform demonstrates an integrated DevOps lifecycle covering:

- Source control
- Automation
- Containerization
- CI/CD
- Infrastructure automation
- Configuration management
- Kubernetes orchestration
- Helm packaging
- Monitoring
- Centralized logging
- DevSecOps
- AI-assisted troubleshooting
- Cloud deployment

---

# Development

This repository is maintained using Git and GitHub with the following branch structure:

- `main` — Main branch
- `develop` — Development branch
- `feature/*` — Feature development branches

Major implementation work was organized into separate feature branches corresponding to the project phases.

---

# Project Outcome

Nexvion was transformed from a frontend e-commerce application into a connected DevOps and cloud-native delivery platform.

The implementation demonstrates how source control, CI/CD, containers, infrastructure automation, Kubernetes, observability, security, troubleshooting, and cloud deployment can be integrated into a repeatable software delivery lifecycle.