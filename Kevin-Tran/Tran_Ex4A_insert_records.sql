USE lana_dog_walking;

SELECT * FROM customerinfo;

INSERT INTO CustomerInfo (CustomerName, Address, PaymentMethod, PhoneNumber) VALUES
('Aisha Patel', '45 Maple Ave', 'Credit Card', '(212) 555-0198'),
('Carlos Mendoza', '78 River Rd', 'PayPal', '(310) 555-0142'),
('Beatrice Kim', '901 Elm St Apt 3B', 'Cash', '(415) 555-0123'),
('Ethan Wright', '22 Oakwood Dr', 'Apple Pay', '(617) 555-0177'),
('Maya Singh', '150 Harbor Ln', 'Google Pay', '(347) 555-0111'),
('Liam O''Connor', '7 Birch Ct', 'Bank Transfer', '(773) 555-0182'),
('Sofia Rossi', '64 Pine St', 'Check', '(646) 555-0133'),
('Noah Johnson', '300 Cedar Blvd', 'CashApp', '(925) 555-0166'),
('Olivia Brown', '18 Sunset Pkwy', 'Stripe', '(206) 555-0155'),
('Zoe Nguyen', '412 Willow Way', 'Venmo', '(858) 555-0100');

SELECT * FROM petinfo;
INSERT INTO PetInfo (CustomerID, PetName, PetBreed, PetColor) VALUES
(1, 'Buddy', 'Golden Retriever', 'Golden'),
(2, 'Luna', 'Labrador', 'Black'),
(3, 'Max', 'German Shepherd', 'Brown'),
(1, 'Bella', 'Poodle', 'White'),
(4, 'Charlie', 'Bulldog', 'Brindle'),
(5, 'Daisy', 'Beagle', 'Tri-color'),
(2, 'Rocky', 'Boxer', 'Fawn'),
(6, 'Milo', 'Chihuahua', 'Tan'),
(7, 'Coco', 'Shih Tzu', 'Cream'),
(3, 'Bailey', 'Husky', 'Gray/White');



INSERT INTO Services (PetID, SessionRate, SessionQty) VALUES
(1, 25.00, 2),
(2, 30.00, 1),
(3, 22.50, 3),
(4, 28.00, 2),
(5, 35.00, 1),
(6, 20.00, 4),
(7, 27.50, 2),
(8, 18.00, 3),
(9, 24.00, 2),
(10, 32.00, 1);

SELECT * FROM Services;