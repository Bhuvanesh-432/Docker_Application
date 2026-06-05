# 🌱 GreenLeaf Gardens - 3 Tier Application Deployment on AWS EKS

## Project Overview

GreenLeaf Gardens is a 3-tier containerized web application deployed on Amazon EKS using Kubernetes.

Architecture:

Frontend (Nginx)
↓
Backend (Flask API)
↓
MySQL Database

---

## Technologies Used

- AWS EC2
- AWS EKS
- AWS ECR
- AWS EBS CSI Driver
- Docker
- Kubernetes
- Nginx
- Python Flask
- MySQL
- eksctl
- kubectl

---

## Project Structure

Docker_Application/

├── backend/

│ ├── Dockerfile

│ ├── app.py

│ └── requirements.txt

├── frontend/

│ ├── Dockerfile

│ ├── nginx.conf

│ └── html files

├── mysql/

│ ├── Dockerfile

│ └── init.sql

├── kubernetes/

│ ├── backend/

│ │ ├── backend-deployment.yaml

│ │ └── backend-service.yaml

│ ├── frontend/

│ │ ├── frontend-deployment.yaml

│ │ └── frontend-service.yaml

│ └── mysql/

│ ├── mysql-deployment.yaml

│ ├── mysql-service.yaml

│ └── mysql-pvc.yaml

└── docker-compose.yml

---

## Docker Images

### Backend

821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-backend:latest

### Frontend

821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-frontend:latest

### MySQL

821263771829.dkr.ecr.eu-north-1.amazonaws.com/greenleaf-mysql:latest

---

## Create EKS Cluster

```bash
eksctl create cluster \
--name greenleaf-cluster \
--region eu-north-1 \
--nodegroup-name workers \
--node-type t3.medium \
--nodes 2
```

---

## Configure kubectl

```bash
aws eks update-kubeconfig \
--region eu-north-1 \
--name greenleaf-cluster
```

---

## Install EBS CSI Driver

```bash
eksctl utils associate-iam-oidc-provider \
--region eu-north-1 \
--cluster greenleaf-cluster \
--approve
```

```bash
eksctl create addon \
--name aws-ebs-csi-driver \
--cluster greenleaf-cluster \
--region eu-north-1 \
--force
```

---

## Deploy Kubernetes Resources

### MySQL

```bash
kubectl apply -f kubernetes/mysql/
```

### Backend

```bash
kubectl apply -f kubernetes/backend/
```

### Frontend

```bash
kubectl apply -f kubernetes/frontend/
```

---

## Verify Deployment

```bash
kubectl get pods -n greenleaf
```

```bash
kubectl get svc -n greenleaf
```

```bash
kubectl get pvc -n greenleaf
```

---

## Application Output

Dashboard Features:

- Products
- Customers
- Orders
- Employees
- Projects
- Revenue

---

## Load Balancer URL

```text
http://<AWS-LoadBalancer-DNS>
```

---

## Kubernetes Resources

### Deployments

- frontend
- backend
- mysql

### Services

- frontend-service (LoadBalancer)
- backend-service (ClusterIP)
- mysql-service (ClusterIP)

### Storage

- PersistentVolumeClaim
- AWS EBS Volume

---

## Screenshots

### Dashboard Successfully Running

(Add project screenshots here)

---

## Author

Bhuvanesh

AWS | Docker | Kubernetes | DevOps Engineer
