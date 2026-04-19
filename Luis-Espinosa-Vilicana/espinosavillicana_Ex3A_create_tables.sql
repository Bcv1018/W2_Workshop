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

CREATE TABLE Services (
    -- Unique ID for every single walk/session
    Session_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    
    -- Link to the Customer (Who pays?)
    Customer_ID INT UNSIGNED NOT NULL,
    
    -- Link to the Pet (Who was walked?)
    Pet_ID INT UNSIGNED NOT NULL,
    
    -- Using DATE or DATETIME is better than just a string
    Service_Date DATETIME NOT NULL,
    
    -- DECIMAL(10,2) is the standard for currency (e.g., 25.50)
    -- Avoid using FLOAT for money as it can cause rounding errors
    Session_Rate DECIMAL(10,2) NOT NULL,
    Session_Qty INT UNSIGNED DEFAULT 1,
    Total_Cost DECIMAL(10,2) NOT NULL,
    
    -- Status helps track if the walk was completed or cancelled
    Payment_Status ENUM('Pending', 'Paid', 'Cancelled') DEFAULT 'Pending',
    
    -- Foreign Key constraints
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Info(Customer_ID) ON DELETE CASCADE,
    FOREIGN KEY (Pet_ID) REFERENCES Pet_Info(Pet_ID) ON DELETE CASCADE
) ENGINE=InnoDB;