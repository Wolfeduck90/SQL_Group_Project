-- E-commerce Database Creation Script
-- Author: Jessica Anne Kean  
-- Date: 2025-04-20
-- Description: This script creates an e-commerce database with multiple tables,
--              defined relationships, and constraints for optimal performance.

-- Step 1: Create database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Step 2: Create the `brand` table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the brand
    name VARCHAR(50) NOT NULL                -- Brand name
);

-- Step 3: Create the `product` table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the product
    name VARCHAR(100) NOT NULL,                -- Product name
    base_price DECIMAL(10, 2) NOT NULL,        -- Product base price
    brand_id INT,                              -- Foreign key linking to the `brand` table
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id) ON DELETE SET NULL
);

-- Step 4: Create the `product_category` table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the category
    name VARCHAR(50) NOT NULL                   -- Category name
);

-- Step 5: Create the `product_item` table
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the item
    product_id INT NOT NULL,                        -- Foreign key linking to the `product` table
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- Step 6: Create the `product_image` table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the image
    product_item_id INT NOT NULL,            -- Foreign key linking to the `product_item` table
    image_url VARCHAR(255) NOT NULL,         -- URL or file reference for the image
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id) ON DELETE CASCADE
);

-- Step 7: Create the `product_variation` table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the variation
    product_id INT NOT NULL,                     -- Foreign key linking to the `product` table
    size_option_id INT NOT NULL,                 -- Foreign key linking to the `size_option` table
    color_id INT NOT NULL,                       -- Foreign key linking to the `color` table
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id) ON DELETE SET NULL,
    FOREIGN KEY (color_id) REFERENCES color(color_id) ON DELETE SET NULL
);

-- Step 8: Create the `color` table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the color
    name VARCHAR(30) NOT NULL                -- Color name
);

-- Step 9: Create the `size_category` table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the size category
    name VARCHAR(50) NOT NULL                        -- Name of the size category
);

-- Step 10: Create the `size_option` table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the size option
    size_category_id INT NOT NULL,                -- Foreign key linking to `size_category`
    value VARCHAR(20) NOT NULL,                   -- Size value (e.g., S, M, L, 42)
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id) ON DELETE CASCADE
);

-- Step 11: Create the `product_attribute` table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the attribute
    product_id INT NOT NULL,                     -- Foreign key linking to the `product` table
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

-- Step 12: Create the `attribute_category` table
CREATE TABLE attribute_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the category
    name VARCHAR(50) NOT NULL                   -- Category name
);

-- Step 13: Create the `attribute_type` table
CREATE TABLE attribute_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique identifier for the type
    name VARCHAR(50) NOT NULL                   -- Type name (e.g., text, number, boolean)
);
