-- Run this script in MySQL (or let the application auto-create it on first login)
CREATE DATABASE IF NOT EXISTS login_db;
USE login_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL
);

-- Insert sample users (ignore if already present)
INSERT IGNORE INTO users (username, password, full_name) VALUES
('admin', 'admin123', 'System Administrator'),
('saurabh', 'pass123', 'Saurabh Sharma');
