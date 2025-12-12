-- Создание базы данных
CREATE DATABASE kiosk_delivery;

-- ===== HUB TABLES =====

CREATE TABLE Hub_Suppliers (
    supplier_id INT PRIMARY KEY
);

CREATE TABLE Hub_Kiosks (
    kiosk_id INT PRIMARY KEY
);

CREATE TABLE Hub_Products (
    product_id INT PRIMARY KEY
);

CREATE TABLE Hub_Cities (
    city_id INT PRIMARY KEY
);

-- ===== LINK TABLES =====

CREATE TABLE Lnk_Deliveries (
    delivery_id INT PRIMARY KEY,
    supplier_id INT NOT NULL REFERENCES Hub_Suppliers(supplier_id),
    kiosk_id INT NOT NULL REFERENCES Hub_Kiosks(kiosk_id),
    product_id INT NOT NULL REFERENCES Hub_Products(product_id),
    delivery_date DATE
);

-- ===== SATELLITE TABLES =====

CREATE TABLE Sat_Suppliers (
    supplier_id INT NOT NULL REFERENCES Hub_Suppliers(supplier_id),
    supplier_name VARCHAR(200),
    contact_person VARCHAR(150),
    phone_number VARCHAR(20),
    city_id INT NOT NULL REFERENCES Hub_Cities(city_id)
);

CREATE TABLE Sat_Kiosks (
    kiosk_id INT NOT NULL REFERENCES Hub_Kiosks(kiosk_id),
    kiosk_name VARCHAR(150),
    address TEXT,
    manager_name VARCHAR(150)
);

CREATE TABLE Sat_Products (
    product_id INT NOT NULL REFERENCES Hub_Products(product_id),
    product_name VARCHAR(200),
    description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE Sat_Cities (
    city_id INT NOT NULL REFERENCES Hub_Cities(city_id),
    city_name VARCHAR(100),
    region VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE Sat_Deliveries (
    delivery_id INT NOT NULL REFERENCES Lnk_Deliveries(delivery_id),
    status VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2)
);
