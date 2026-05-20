# 🌿 GreenLeaf Gardens — Dockerised 3-Tier Application

A fully containerised **Company Management Portal** for a Gardening Business.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Ubuntu EC2 Instance                       │
│                                                             │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐  │
│  │   TIER 1     │    │   TIER 2     │    │   TIER 3     │  │
│  │   MySQL 8.0  │◄───│   Flask API  │◄───│  Nginx +     │  │
│  │  Port: 3306  │    │  Port: 5000  │    │  HTML/CSS/JS │  │
│  │  (internal)  │    │  (internal)  │    │  Port: 80 ✅  │  │
│  └──────────────┘    └──────────────┘    └──────────────┘  │
│                                                             │
│                   Docker Bridge Network                     │
└─────────────────────────────────────────────────────────────┘
```

## Features

- 📊 **Dashboard** — Live stats: products, customers, orders, revenue, active projects
- 🌱 **Products** — Inventory management with CRUD operations
- 👥 **Customers** — Customer directory with contact details
- 📦 **Orders** — Order tracking with status badges
- 🧑‍🌾 **Employees** — Staff directory by department
- 🏡 **Garden Projects** — Project lifecycle management

## Quick Start on Ubuntu EC2

### 1. Install Docker & Docker Compose

```bash
sudo apt-get update
sudo apt-get install -y docker.io docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
```

### 2. Clone the Repository

```bash
git clone https://github.com/Bhuvanesh-432/Docker_Application.git
cd Docker_Application
```

### 3. Build & Run

```bash
docker compose up --build -d
```

### 4. Access the Application

Open your browser: `http://<EC2-PUBLIC-IP>`

> ⚠️ Make sure **port 80** is open in your EC2 Security Group (Inbound Rule: HTTP).

---

## Useful Commands

```bash
# View running containers
docker compose ps

# View logs
docker compose logs -f

# View specific service logs
docker compose logs -f backend
docker compose logs -f mysql

# Stop all services
docker compose down

# Stop and remove volumes (resets DB)
docker compose down -v

# Rebuild a specific service
docker compose up --build backend -d

# Access MySQL directly
docker exec -it greenleaf_mysql mysql -u gardenuser -pgardenpass gardening_db
```

## Project Structure

```
Docker_Application/
├── docker-compose.yml          # Orchestrates all 3 tiers
├── .gitignore
├── README.md
│
├── mysql/                      # TIER 1 — Database
│   ├── Dockerfile
│   └── init.sql                # Schema + seed data
│
├── backend/                    # TIER 2 — Flask REST API
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
│
└── frontend/                   # TIER 3 — Nginx + HTML
    ├── Dockerfile
    ├── nginx.conf              # Reverse proxy to backend
    └── index.html              # Full SPA dashboard
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/health` | Health check |
| GET | `/api/dashboard` | Dashboard stats |
| GET/POST | `/api/products` | Products list / add |
| DELETE | `/api/products/:id` | Delete product |
| GET/POST | `/api/customers` | Customers list / add |
| GET/POST | `/api/employees` | Employees list / add |
| GET | `/api/orders` | Orders with customer names |
| GET/POST | `/api/projects` | Garden projects |

## Database Schema

- `products` — Inventory items (flowers, tools, soil, etc.)
- `customers` — Customer directory
- `orders` — Customer orders with status
- `order_items` — Line items per order
- `employees` — Staff with roles and departments
- `garden_projects` — Landscaping/garden project tracking

---

Built with 🐍 Python (Flask) + 🐬 MySQL + 🐳 Docker
