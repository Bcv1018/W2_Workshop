DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

-- CustomerInfo Table
CREATE TABLE CustomerInfo (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    PRIMARY KEY (CustomerID)
);

-- Pet Info Table
CREATE TABLE PetInfo (
    PetID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    PetName VARCHAR(100) NOT NULL,
    PetBreed VARCHAR(100) NOT NULL,
    PetColor VARCHAR(50) NOT NULL,
    PRIMARY KEY (PetID),
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID)
);

-- Services/charges Table
CREATE TABLE Services (
    SessionID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    PetID INT NOT NULL,
    SessionDate DATETIME NOT NULL,
    SessionRate DECIMAL(10,2) NOT NULL,
    SessionQty INT NOT NULL,
    PRIMARY KEY (SessionID),
    CONSTRAINT FK_Services_Customer FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID),
    CONSTRAINT FK_Services_Pet FOREIGN KEY (PetID) REFERENCES PetInfo(PetID)
);
