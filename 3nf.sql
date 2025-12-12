-- Создание базы данных
CREATE DATABASE kiosk_delivery;

-- Таблица городов
CREATE TABLE Cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    region VARCHAR(100),
    country VARCHAR(100)
);

-- Таблица поставщиков
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(200),
    contact_person VARCHAR(150),
    phone_number VARCHAR(20),
    city_id INT NOT NULL REFERENCES Cities(city_id)
);

-- Таблица товаров
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Таблица розничных киосков
CREATE TABLE Kiosks (
    kiosk_id INT PRIMARY KEY,
    kiosk_name VARCHAR(150),
    address TEXT,
    city_id INT NOT NULL REFERENCES Cities(city_id),
    manager_name VARCHAR(150)
);

-- Таблица поставок
CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    supplier_id INT NOT NULL REFERENCES Suppliers(supplier_id),
    kiosk_id INT NOT NULL REFERENCES Kiosks(kiosk_id),
    delivery_date DATE
);

-- Таблица товаров в поставках
CREATE TABLE DeliveryItems (
    delivery_item_id INT PRIMARY KEY,
    delivery_id INT NOT NULL REFERENCES Deliveries(delivery_id),
    product_id INT NOT NULL REFERENCES Products(product_id),
    quantity INT,
    unit_price DECIMAL(10, 2)
);
