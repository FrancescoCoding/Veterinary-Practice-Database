-- Ensuring that we are using the vet appointments DB
USE vet_appointments
GO

-- Populating the Owner table
INSERT INTO Owner(owner_id, owner_name, owner_address, owner_phone)
VALUES
('N0001', 'Simon Blackquill', '87 Elpis Drive, Aberdeen', '01224 496476'),
('N0002', 'Phoenix Wright', '3 Ishgard Close, Aberdeen', '01224 496390'),
('N0003', 'Athena Cykes', '23 Thavnair Road, Inverurie', '01224 496180'),
('N0004', 'Maya Fey', '11 Sharlayan Street, Dyce', '01224 496853'),
('N0005', 'Miles Edgeworth', '57 Tempest Avenue, Westhill', '01224 496398'),
('N0006', 'Franziska von Karma', '8 Amaurot Lane, Portlethen', '01224 496094')

-- Populating the Pet table
INSERT INTO Pet(pet_name, pet_age, pet_type, pet_breed, owner_id)
VALUES
('Rory', 9, 'Cat', 'Ragdoll', 'N0001'),
('Hades', 14, 'Cat', 'Persian', 'N0001'),
('Maddie', 11, 'Dog', 'Chihuahua', 'N0002'),
('Wease', 11, 'Dog', 'Chihuahua', 'N0002'),
('Phoebe', 1, 'Dog', 'Chihuahua', 'N0002'),
('Chip', 3,'Guinea Pig', NULL, 'N0003'),
('Dale', 3, 'Guinea Pig', NULL, 'N0003'),
('Evie', 5, 'Cat', 'Tortoiseshell', 'N0004'),
('Izzy', 3, 'Cat', 'Mixed', 'N0004'),
('Henry', 4, 'Dog', 'Husky', 'N0005'),
('William', 14, 'Horse', 'Appaloosa', 'N0006')

-- Populating the Vet table
INSERT INTO Vet(vet_id, vet_name, vet_specialty)
VALUES
('V001', 'Natasha Romanova', 'Feline'),
('V002', 'Bruce Banner', 'Dentistry'),
('V003', 'Tony Stark', 'Canine'),
('V004', 'Peter Parker', 'Small Animal Care'),
('V005', 'Steve Rogers', 'Equine')

-- Populating the Appointments table
INSERT INTO Appointments(pet_name, owner_id, vet_id, room_number, appointment_date, reason, diagnosis, treatment, prescription, cost)
VALUES
('Rory', 'N0001', 'V001', 4, '2022-01-11', 'Injured from cat fight', 'Scratches and wounds', 'Antibiotics and stitches', 'Painkillers', 150),
('Hades', 'N0001', 'V001', 5, '2022-01-15', 'Vaccinations', NULL, 'Vaccinations', NULL, 50),
('Maddie', 'N0002', 'V002', 2, '2022-01-10', 'Annual Check-Up', NULL, 'Clean teeth', NULL, 100),
('Wease', 'N0002', 'V002', 2, '2022-01-10', 'Annual Check-Up', NULL, 'Clean teeth', NULL, 100),
('Phoebe', 'N0002', 'V003', 1, '2022-02-02', 'Puppy Check-Up', NULL, 'Vaccinations, flea and wormer', NULL, 80),
('Chip', 'N0003', 'V004', 3, '2022-01-05', 'Not eating', 'Fussy', 'Offer different food', NULL, 30),
('Evie', 'N0004', 'V001', 2, '2022-01-11', 'Car accident', 'Broken Leg', 'Surgery and rest', 'Painkillers and cone for head', 450),
('Evie', 'N0004', 'V001', 2, '2022-02-08', 'Follow-up', 'Healing Well', 'Continue Treatment Plan', NULL, 30),
('Henry', 'N0005', 'V003', 2, '2021-12-26', 'Ate chocolate', 'Chocolate Poisoning', 'Stomach Pumped', 'Painkillers and laxatives', 300),
('William', 'N0006', 'V005', 1, '2022-01-27', 'Vaccinations', NULL, 'Vaccinations', NULL, 75),
('William', 'N0006', 'V005', 1, '2022-02-03', 'Injury', 'Kicked, caused lameness', 'Box Rest', 'Painkillers', 85),
('William', 'N0006', 'V005', 1, '2022-02-07', 'Follow-up', 'Healed', 'Back to usual management', NULL, 60)