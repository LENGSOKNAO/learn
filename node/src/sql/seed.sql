USE nodeDB;

-- Admin user (password: admin123)
INSERT INTO users (first_name, last_name, username, email, password, role, status)
VALUES ('Admin', 'User', 'admin', 'admin@example.com', '$2b$10$8K1p/a0dL1LXMIgoEDFrwOfMQkfAjkMBcGmF0xPJ0iFq3X7qYqYqy', 'admin', 'active');

-- Categories
INSERT INTO categories (name, slug, description) VALUES
('Electronics', 'electronics', 'Electronic devices and accessories'),
('Clothing', 'clothing', 'Apparel and fashion items'),
('Home & Garden', 'home-garden', 'Home improvement and garden supplies'),
('Books', 'books', 'Books and publications');

-- Sample Products
INSERT INTO products (name, slug, description, price, category_id, stock, sku, featured) VALUES
('Wireless Headphones', 'wireless-headphones', 'Noise cancelling bluetooth headphones', 79.99, 1, 50, 'WH-001', TRUE),
('USB-C Hub', 'usb-c-hub', '7-in-1 USB-C hub with HDMI', 34.99, 1, 100, 'USB-001', FALSE),
('Cotton T-Shirt', 'cotton-tshirt', 'Premium cotton t-shirt', 24.99, 2, 200, 'CT-001', TRUE);