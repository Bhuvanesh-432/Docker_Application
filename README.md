# 🌿 GreenLeaf Gardens — Dockerized 3-Tier Application with Kubernetes

A fully containerized Company Management Portal for a Gardening Business, built using **Docker, Kubernetes, MySQL, Flask, Nginx, and AWS ECR**.

---

## 📌 Project Overview

GreenLeaf Gardens is a modern 3-tier web application designed for managing gardening products, customers, orders, employees, and landscaping projects.

The application follows a microservices-based architecture:

* **Frontend:** Nginx + HTML/CSS/JavaScript
* **Backend:** Python Flask REST API
* **Database:** MySQL 8.0
* **Containerization:** Docker
* **Container Registry:** AWS ECR
* **Orchestration:** Kubernetes

---

## 🏗️ Architecture

```text
                    ┌──────────────────┐
                    │    Frontend      │
                    │ Nginx + HTML/CSS │
                    │    Port : 80     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ Flask Backend API│
                    │    Port : 5000   │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │    MySQL 8.0     │
                    │    Port : 3306   │
                    └──────────────────┘
```

---

## ☸️ Kubernetes Architecture

```text
Kubernetes Cluster
│
├── MySQL Deployment
│   ├── MySQL Pod
│   ├── Persistent Volume Claim
│   └── MySQL Service
│
├── Backend Deployment
│   ├── Flask API Pods
│   └── Backend Service
│
└── Frontend Deployment
    ├── Nginx Pods
    └── LoadBalancer Service
```

---

## 🚀 Features

### 📊 Dashboard

* Live business statistics
* Revenue tracking
* Product inventory overview
* Customer insights

### 🌱 Products

* Add products
* View inventory
* Delete products

### 👥 Customers

* Customer management
* Contact information tracking

### 📦 Orders

* Order management
* Order status tracking

### 🧑‍🌾 Employees

* Employee directory
* Department management

### 🏡 Garden Projects

* Landscaping project tracking
* Project lifecycle monitoring

---

## 🐳 Docker Deployment

### Clone Repository

```bash
git clone https://github.com/Bhuvanesh-432/Docker_Application.git

cd Docker_Application
```

### Build and Run Containers

```bash
docker compose up --build -d
```

### Verify Containers

```bash
docker ps
```

### Access Application

```text
http://<SERVER-IP>
```

---

## 📦 AWS ECR Deployment

### Login to ECR

```bash
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 821263771829.dkr.ecr.eu-north-1.amazonaws.com
```

### Build Images

```bash
docker build -t greenleaf-frontend ./frontend

docker build -t greenleaf-backend ./backend

docker build -t greenleaf-mysql ./mysql
```

### Push Images

```bash
docker push 821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-frontend:latest

docker push 821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-backend:latest

docker push 821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-mysql:latest
```

---

## ☸️ Kubernetes Deployment

### Deploy Resources

```bash
kubectl apply -f kubernetes/mysql-secret.yaml

kubectl apply -f kubernetes/mysql-pvc.yaml

kubectl apply -f kubernetes/mysql-deployment.yaml

kubectl apply -f kubernetes/mysql-service.yaml

kubectl apply -f kubernetes/backend-deployment.yaml

kubectl apply -f kubernetes/backend-service.yaml

kubectl apply -f kubernetes/frontend-deployment.yaml

kubectl apply -f kubernetes/frontend-service.yaml
```

### Verify Deployment

```bash
kubectl get pods

kubectl get services

kubectl get deployments
```

---

## 📂 Project Structure

```text
Docker_Application/
│
├── frontend/
│   ├── Dockerfile
│   ├── nginx.conf
│   ├── index.html
│   ├── style.css
│   └── script.js
│
├── backend/
│   ├── Dockerfile
│   ├── app.py
│   ├── database.py
│   └── requirements.txt
│
├── mysql/
│   ├── Dockerfile
│   └── init.sql
│
├── kubernetes/
│   ├── mysql-secret.yaml
│   ├── mysql-pvc.yaml
│   ├── mysql-deployment.yaml
│   ├── mysql-service.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── frontend-deployment.yaml
│   └── frontend-service.yaml
│
├── docker-compose.yml
├── README.md
└── .gitignore
```

---

## 🔗 API Endpoints

| Method   | Endpoint       | Description            |
| -------- | -------------- | ---------------------- |
| GET      | /api/health    | Health Check           |
| GET      | /api/dashboard | Dashboard Statistics   |
| GET/POST | /api/products  | Manage Products        |
| GET/POST | /api/customers | Manage Customers       |
| GET/POST | /api/employees | Manage Employees       |
| GET      | /api/orders    | View Orders            |
| GET/POST | /api/projects  | Manage Garden Projects |

---

## 🗄️ Database Tables

* products
* customers
* orders
* order_items
* employees
* garden_projects

---

## 🛠️ Technology Stack

| Component        | Technology                   |
| ---------------- | ---------------------------- |
| Frontend         | HTML, CSS, JavaScript, Nginx |
| Backend          | Python Flask                 |
| Database         | MySQL 8.0                    |
| Containerization | Docker                       |
| Orchestration    | Kubernetes                   |
| Registry         | AWS ECR                      |
| Version Control  | Git & GitHub                 |

---

## 📚 Learning Outcomes

* Docker Image Creation
* Multi-Container Applications
* Docker Compose
* AWS Elastic Container Registry (ECR)
* Kubernetes Deployments
* Kubernetes Services
* Persistent Volumes
* Secrets Management
* Container Networking

---

### 👨‍💻 Author

Bhuvanesh Thangaraj

GitHub: https://github.com/Bhuvanesh-432

---

Built with ❤️ using Docker, Kubernetes, Flask, MySQL, and AWS ECR.
