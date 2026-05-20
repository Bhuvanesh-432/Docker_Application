-- Gardening Company Database Initialization
CREATE DATABASE IF NOT EXISTS gardening_db;
USE gardening_db;

-- Products Table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    description TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Customers Table
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Order Items Table
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Employees Table
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE,
    salary DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Garden Projects Table
CREATE TABLE IF NOT EXISTS garden_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    customer_id INT,
    assigned_employee_id INT,
    project_type VARCHAR(50),
    status ENUM('planning','in_progress','completed','on_hold') DEFAULT 'planning',
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (assigned_employee_id) REFERENCES employees(id)
);

-- =====================
-- SEED DATA
-- =====================

INSERT INTO products (name, category, price, stock, description) VALUES
('Rose Bush (Red)', 'Flowers', 15.99, 150, 'Classic red rose bush, blooms May-October'),
('Lavender Plant', 'Herbs', 8.99, 200, 'Fragrant lavender, drought-resistant'),
('Topsoil Premium Mix', 'Soil & Compost', 24.99, 300, '40L bag premium topsoil blend'),
('Garden Fork', 'Tools', 34.99, 80, 'Heavy-duty stainless steel fork'),
('Drip Irrigation Kit', 'Irrigation', 59.99, 60, 'Complete drip system for 50m²'),
('Sunflower Seeds', 'Seeds', 4.99, 500, 'Giant sunflower variety pack'),
('Ceramic Planter (Large)', 'Pots & Planters', 44.99, 75, 'Hand-painted ceramic, 40cm diameter'),
('Organic Compost', 'Soil & Compost', 18.99, 250, '25L bag premium organic compost'),
('Pruning Shears', 'Tools', 22.99, 120, 'Professional bypass pruning shears'),
('Tomato Seedlings (6 pack)', 'Vegetables', 12.99, 180, 'Mixed heritage tomato varieties');

INSERT INTO employees (name, role, department, email, phone, hire_date, salary) VALUES
('Priya Sharma', 'Head Gardener', 'Operations', 'priya@greenleaf.com', '9876543210', '2020-03-15', 65000.00),
('Arjun Mehta', 'Landscape Designer', 'Design', 'arjun@greenleaf.com', '9876543211', '2021-06-01', 58000.00),
('Sunita Rao', 'Sales Manager', 'Sales', 'sunita@greenleaf.com', '9876543212', '2019-01-10', 72000.00),
('Karan Patel', 'Field Technician', 'Operations', 'karan@greenleaf.com', '9876543213', '2022-04-20', 42000.00),
('Meena Nair', 'Customer Relations', 'Support', 'meena@greenleaf.com', '9876543214', '2021-09-05', 48000.00),
('Ravi Kumar', 'Nursery Manager', 'Operations', 'ravi@greenleaf.com', '9876543215', '2018-07-12', 55000.00);

INSERT INTO customers (name, email, phone, address) VALUES
('Ananya Krishnan', 'ananya@email.com', '9123456789', '12 MG Road, Bengaluru'),
('Rohan Desai', 'rohan@email.com', '9123456790', '45 Park Street, Mumbai'),
('Kavita Joshi', 'kavita@email.com', '9123456791', '7 Civil Lines, Delhi'),
('Sanjay Iyer', 'sanjay@email.com', '9123456792', '23 Anna Salai, Chennai'),
('Neha Gupta', 'neha@email.com', '9123456793', '88 Jubilee Hills, Hyderabad');

INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 124.95, 'delivered'),
(2, 89.97, 'shipped'),
(3, 234.50, 'processing'),
(4, 67.98, 'pending'),
(5, 189.99, 'delivered');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 3, 15.99), (1, 4, 1, 34.99), (1, 6, 5, 4.99),
(2, 7, 1, 44.99), (2, 9, 2, 22.99),
(3, 5, 2, 59.99), (3, 3, 3, 24.99), (3, 8, 2, 18.99),
(4, 10, 2, 12.99), (4, 6, 6, 4.99), (4, 2, 3, 8.99),
(5, 7, 2, 44.99), (5, 4, 2, 34.99), (5, 9, 1, 22.99);

INSERT INTO garden_projects (title, customer_id, assigned_employee_id, project_type, status, start_date, end_date, budget, description) VALUES
('Rooftop Garden Design', 1, 2, 'Rooftop Garden', 'in_progress', '2025-01-10', '2025-03-30', 85000.00, 'Full rooftop transformation with raised beds'),
('Lawn Renovation', 2, 1, 'Lawn Care', 'completed', '2024-11-01', '2024-12-15', 35000.00, 'Complete lawn renovation and irrigation'),
('Kitchen Herb Garden', 3, 6, 'Kitchen Garden', 'planning', '2025-02-15', '2025-04-01', 15000.00, 'Raised bed kitchen herb garden setup'),
('Corporate Office Landscaping', 4, 2, 'Commercial', 'in_progress', '2025-01-20', '2025-05-30', 250000.00, 'Full office campus landscaping project'),
('Balcony Container Garden', 5, 1, 'Container Garden', 'completed', '2024-10-05', '2024-10-25', 12000.00, 'Beautiful balcony container garden');
