USE lana_dog_walking;

INSERT INTO `Customer Info` (CustomerID, Name, Address, PhoneNumber, PaymentMethod) VALUES
(1, 'John Smith', '123 Oak St, San Mateo, CA', '650-111-1001', 'Credit Card'),
(2, 'Emily Johnson', '456 Pine Ave, San Mateo, CA', '650-111-1002', 'Cash'),
(3, 'Michael Brown', '789 Maple Rd, San Mateo, CA', '650-111-1003', 'Debit Card'),
(4, 'Sarah Davis', '321 Elm St, San Mateo, CA', '650-111-1004', 'PayPal'),
(5, 'David Wilson', '654 Cedar Ln, San Mateo, CA', '650-111-1005', 'Credit Card'),
(6, 'Laura Martinez', '987 Birch Blvd, San Mateo, CA', '650-111-1006', 'Cash'),
(7, 'James Anderson', '159 Spruce Dr, San Mateo, CA', '650-111-1007', 'Debit Card'),
(8, 'Olivia Thomas', '753 Redwood Way, San Mateo, CA', '650-111-1008', 'Credit Card'),
(9, 'Daniel Lee', '852 Willow St, San Mateo, CA', '650-111-1009', 'PayPal'),
(10, 'Sophia White', '951 Aspen Ct, San Mateo, CA', '650-111-1010', 'Cash');

INSERT INTO `Pet Info` (PetID, CustomerID, PetName, PetBreed, PetColor) VALUES
(1, 1, 'Buddy', 'Golden Retriever', 'Golden'),
(2, 2, 'Luna', 'Labrador', 'Black'),
(3, 3, 'Charlie', 'Beagle', 'Brown'),
(4, 4, 'Max', 'German Shepherd', 'Black/Tan'),
(5, 5, 'Bella', 'Poodle', 'White'),
(6, 6, 'Rocky', 'Bulldog', 'Brindle'),
(7, 7, 'Daisy', 'Cocker Spaniel', 'Golden'),
(8, 8, 'Milo', 'Husky', 'Gray/White'),
(9, 9, 'Coco', 'Chihuahua', 'Tan'),
(10, 10, 'Bailey', 'Border Collie', 'Black/White');

INSERT INTO Services (SessionID, CustomerID, PetID, SessionRate, Duration) VALUES
(1, 1, 1, 25.00, '01:00:00'),
(2, 2, 2, 30.00, '01:30:00'),
(3, 3, 3, 22.50, '00:45:00'),
(4, 4, 4, 35.00, '02:00:00'),
(5, 5, 5, 28.00, '01:15:00'),
(6, 6, 6, 26.50, '01:00:00'),
(7, 7, 7, 24.00, '00:50:00'),
(8, 8, 8, 40.00, '02:30:00'),
(9, 9, 9, 20.00, '00:40:00'),
(10, 10, 10, 32.00, '01:20:00');
