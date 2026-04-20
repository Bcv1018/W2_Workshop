DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

CREATE TABLE `Customer Info` (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    PaymentMethod VARCHAR(50)
);

CREATE TABLE `Pet Info` (
    PetID INT PRIMARY KEY,
    CustomerID INT,
    PetName VARCHAR(100) NOT NULL,
    PetBreed VARCHAR(100),
    PetColor VARCHAR(50),
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES `Customer Info`(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Services (
    SessionID INT PRIMARY KEY,
    CustomerID INT,
    PetID INT,
    SessionRate DECIMAL(9,2),
    Duration TIME,
    
    CONSTRAINT fk_services_customer
        FOREIGN KEY (CustomerID)
        REFERENCES `Customer Info`(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_services_pet
        FOREIGN KEY (PetID)
        REFERENCES `Pet Info`(PetID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);