DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

-- Creating table for CustomerInfo

CREATE TABLE CustomerInfo (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Address VARCHAR(255),
    Payment VARCHAR(50),
    PhoneNumber VARCHAR(20)
);

-- Creating table for PetInfo
CREATE TABLE PetInfo (
	PetID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CustomerID INT NOT NULL,
    PetName VARCHAR(100),
    PetBreed VARCHAR(100),
    PetColor VARCHAR(50),
    CONSTRAINT fk1 FOREIGN KEY (CustomerID) REFERENCES customerinfo(CustomerID) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
    
-- Creating table for Services
CREATE TABLE Services (
	SessionID INT PRIMARY KEY AUTO_INCREMENT,
    PetID INT NOT NULL,
    SessionRate DECIMAL (8, 2) NOT NULL,
    SessionQty INT NOT NULL,
    Cost DECIMAL (10, 2) GENERATED ALWAYS AS (SessionRate * SessionQty) STORED,
    CONSTRAINT fk2 FOREIGN KEY (PetID) REFERENCES petinfo(PetID)
);