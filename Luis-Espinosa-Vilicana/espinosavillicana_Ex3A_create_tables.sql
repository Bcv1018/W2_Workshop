DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

CREATE TABLE Customer_Info (
    -- INT UNSIGNED is efficient and prevents negative IDs
    -- AUTO_INCREMENT handles the numbering for you automatically
    Customer_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    
    -- NOT NULL ensures you don't accidentally save a customer without a name
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    
    -- Splitting address fields makes it easier to filter by city or zip later
    Street_Address VARCHAR(255),
    City VARCHAR(100),
    State CHAR(2), -- Using CHAR(2) for state codes (e.g., 'NY') is very efficient
    Zip_Code VARCHAR(10),
    
    -- VARCHAR(15) accommodates formatting like (555) 555-5555
    Phone_Number VARCHAR(15),
    
    -- Payment_Type could be 'Cash', 'Credit', or 'Venmo'
    Payment_Type VARCHAR(30),
    
    -- Automatically records when the customer was added
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE Pet_Info (
    -- Primary Key for the pet
    Pet_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    
    -- Foreign Key: This must match the data type of Customer_ID in the other table
    Customer_ID INT UNSIGNED NOT NULL,
    
    Pet_Name VARCHAR(50) NOT NULL,
    
    -- Using VARCHAR for breed as some names can be long (e.g., German Shorthaired Pointer)
    Pet_Breed VARCHAR(100),
    
    -- Color/Markings help the walker identify the dog quickly
    Pet_Color VARCHAR(50),
    
    -- Added: Notes for important details like "Aggressive toward squirrels" or "Needs leash"
    Special_Notes TEXT,
    
    -- This constraint ensures you can't have a "ghost pet" without an owner
    -- ON DELETE CASCADE means if a customer is deleted, their pets are too
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- We must drop the old version first since we are changing the structure
DROP TABLE IF EXISTS services;

CREATE TABLE services (
    -- Unique ID for every single walk/session
    Session_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    
    -- Link to the Customer (Who pays?)
    Customer_ID INT UNSIGNED NOT NULL,
    
    -- Link to the Pet (Who was walked?)
    Pet_ID INT UNSIGNED NOT NULL,
    
    -- Using DATETIME for precise scheduling
    Service_Date DATETIME NOT NULL,
    
    -- DECIMAL ensures we don't have rounding errors with money
    Session_Rate DECIMAL(10,2) NOT NULL,
    Session_Qty INT UNSIGNED DEFAULT 1,
    
    -- THE FIX: "GENERATED ALWAYS AS" makes MySQL do the math for you.
    -- "STORED" means it saves the result physically so it's fast to read.
    Total_Cost DECIMAL(10,2) GENERATED ALWAYS AS (Session_Rate * Session_Qty) STORED,
    
    -- ENUM forces the status to be one of these three options
    Payment_Status ENUM('Pending', 'Paid', 'Cancelled') DEFAULT 'Pending',
    
    -- These links ensure data integrity (no "orphan" services)
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID) ON DELETE CASCADE,
    FOREIGN KEY (Pet_ID) REFERENCES Pet_Info(Pet_ID) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO customer_info (First_Name, Last_Name, Street_Address, City, State, Zip_Code, Phone_Number, Payment_Type, Created_At)
VALUES 
('John', 'Smith', '123 Sesame St', 'San Francisco', 'CA', '94110', '1234567890', 'Cash', '2026-04-15 10:35:55'),
('Maria', 'Garcia', '456 Mission St', 'San Francisco', 'CA', '94110', '4155551234', 'Venmo', '2026-04-19 09:15:00'),
('David', 'Chen', '789 Market St', 'San Francisco', 'CA', '94103', '4155559876', 'Credit', '2026-04-19 10:05:22'),
('Sarah', 'Johnson', '101 Valencia St', 'San Francisco', 'CA', '94110', '4155554433', 'Cash', '2026-04-19 11:30:45'),
('Luis', 'Martinez', '202 Castro St', 'San Francisco', 'CA', '94114', '4155556677', 'Venmo', '2026-04-19 12:45:10'),
('Elena', 'Rodriguez', '303 Haight St', 'San Francisco', 'CA', '94117', '4155558899', 'Credit', '2026-04-19 14:20:30'),
('Kevin', 'Lee', '404 Lombard St', 'San Francisco', 'CA', '94133', '4155552211', 'Cash', '2026-04-19 15:55:05'),
('Chloe', 'Davis', '505 Geary Blvd', 'San Francisco', 'CA', '94102', '4155557788', 'Venmo', '2026-04-19 16:10:12'),
('Marcus', 'Brown', '606 Folsom St', 'San Francisco', 'CA', '94107', '4155553344', 'Credit', '2026-04-19 17:05:59'),
('Isabella', 'Lopez', '707 Divisadero St', 'San Francisco', 'CA', '94115', '4155550099', 'Cash', '2026-04-19 17:30:40'),
('Jason', 'Wilson', '808 Ocean Ave', 'San Francisco', 'CA', '94112', '4155551122', 'Venmo', '2026-04-19 17:45:15');

INSERT INTO pet_info (Customer_ID, Pet_Name, Pet_Breed, Pet_Color, Special_Notes)
VALUES 
(1, 'Sparky', 'Chihuahua', 'Brown', 'N/A'),
(1, 'Luna', 'Golden Retriever', 'Cream', 'Very friendly, loves tennis balls'),
(2, 'Rocky', 'Boxer', 'Brindle', 'Needs harness for walks'),
(3, 'Bella', 'Poodle', 'White', 'Allergic to chicken treats'),
(4, 'Max', 'Beagle', 'Tri-color', 'Prone to howling at mailmen'),
(4, 'Daisy', 'Beagle', 'Lemon & White', 'Stays close to Max during walks'),
(5, 'Buster', 'French Bulldog', 'Black', 'Short walks only; gets overheated easily'),
(6, 'Coco', 'Labradoodle', 'Chocolate', 'Requires double-knot on leash'),
(7, 'Charlie', 'German Shepherd', 'Black & Tan', 'High energy; needs a long route'),
(8, 'Milo', 'Jack Russell Terrier', 'White & Brown', 'Very fast; do not let off leash'),
(9, 'Bear', 'Newfoundland', 'Black', 'Heavy puller; use gentle leader');

INSERT INTO services (customer_id, pet_id, service_date, session_rate, session_qty, payment_status)
VALUES 
(1, 1, '2026-04-15 10:35:55', 15.00, 1, 'Paid'),
(1, 2, '2026-04-16 09:00:00', 20.00, 1, 'Paid'),
(2, 3, '2026-04-16 11:30:00', 15.00, 1, 'Paid'),
(3, 4, '2026-04-17 08:15:00', 25.00, 1, 'Pending'),
(4, 5, '2026-04-17 10:00:00', 15.00, 1, 'Paid'),
(4, 6, '2026-04-17 10:00:00', 10.00, 1, 'Paid'),
(5, 7, '2026-04-18 13:45:00', 20.00, 1, 'Pending'),
(6, 8, '2026-04-18 15:00:00', 15.00, 1, 'Paid'),
(7, 9, '2026-04-19 09:30:00', 30.00, 1, 'Pending'),
(8, 10, '2026-04-19 11:00:00', 15.00, 1, 'Paid'),
(9, 11, '2026-04-19 14:20:00', 35.00, 1, 'Pending');

SELECT * FROM services;