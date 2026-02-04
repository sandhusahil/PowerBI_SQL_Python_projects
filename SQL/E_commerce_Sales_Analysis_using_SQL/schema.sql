-- ============================================
-- E-commerce Database Schema
-- ============================================

-- Customers Dimension Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    segment VARCHAR(50)
);

-- Products Dimension Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price NUMERIC(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(50),
    
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Fact Table: Order Items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount NUMERIC(5,2),
    
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
        
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
