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
CREATE TABLE Services(
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

INSERT INTO CustomerInfo (Name, Address, PhoneNumber, PaymentMethod) VALUES
('Liz',           '123 Cool St, San Jose, CA',         '123-123-1234', 'Cash'),
('Carlos Mendez', '456 Oak Ave, Stockton, CA',          '209-555-0101', 'Credit Card'),
('Sarah Johnson', '789 Pine Rd, Fresno, CA',            '559-555-0202', 'Venmo'),
('Mike Thompson', '321 Elm St, Sacramento, CA',         '916-555-0303', 'Cash'),
('Emily Davis',   '654 Maple Dr, Modesto, CA',          '209-555-0404', 'Credit Card'),
('James Wilson',  '987 Cedar Ln, Oakland, CA',          '510-555-0505', 'Zelle'),
('Maria Garcia',  '147 Birch Blvd, San Francisco, CA',  '415-555-0606', 'Cash'),
('David Lee',     '258 Walnut St, Bakersfield, CA',     '661-555-0707', 'Credit Card'),
('Ashley Brown',  '369 Spruce Ave, Riverside, CA',      '951-555-0808', 'Venmo'),
('Chris Martinez','741 Willow Ct, Long Beach, CA',      '562-555-0909', 'Zelle'),
('Jennifer Taylor','852 Ash St, Anaheim, CA',           '714-555-1010', 'Cash');

INSERT INTO PetInfo (CustomerID, PetName, PetBreed, PetColor) VALUES
(1,  'Cupcake', 'Cane Corso',          'Black'),
(2,  'Bruno',   'German Shepherd',     'Brown and Black'),
(3,  'Bella',   'Golden Retriever',    'Golden'),
(4,  'Max',     'Bulldog',             'White'),
(5,  'Luna',    'Poodle',              'Cream'),
(6,  'Rocky',   'Rottweiler',          'Black and Tan'),
(7,  'Daisy',   'Labrador Retriever',  'Yellow'),
(8,  'Duke',    'Doberman',            'Black and Rust'),
(9,  'Rosie',   'Beagle',              'Tricolor'),
(10, 'Bear',    'Siberian Husky',      'Grey and White'),
(11, 'Coco',    'Chihuahua',           'Brown');


INSERT INTO ServicesCharges (CustomerID, PetID, SessionDate, SessionRate, SessionQty) VALUES
(1,  1,  '2026-04-15 10:30:00', 25.00, 1),
(2,  2,  '2026-04-15 11:00:00', 25.00, 2),
(3,  3,  '2026-04-15 01:30:00', 30.00, 1),
(4,  4,  '2026-04-16 09:00:00', 25.00, 3),
(5,  5,  '2026-04-16 10:00:00', 30.00, 1),
(6,  6,  '2026-04-16 11:30:00', 25.00, 2),
(7,  7,  '2026-04-17 08:00:00', 30.00, 1),
(8,  8,  '2026-04-17 09:30:00', 25.00, 2),
(9,  9,  '2026-04-17 11:00:00', 30.00, 3),
(10, 10, '2026-04-18 10:00:00', 25.00, 1),
(11, 11, '2026-04-18 11:30:00', 30.00, 2);

select * from customerinfo;
SELECT * from petinfo;
SELECT * from servicescharges;
