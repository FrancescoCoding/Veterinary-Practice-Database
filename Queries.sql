-- Ensuring that we are using the vet appointments DB
USE vet_appointments
GO

-- a. List all appointments made for chihuahuas. Output the Pet’s name and breed.
SELECT Pet.pet_name, Pet.pet_breed
FROM Owner
LEFT JOIN Pet ON Owner.owner_id = Pet.owner_id
LEFT JOIN Appointments ON Pet.pet_name = Appointments.pet_name
WHERE Pet.pet_breed = 'Chihuahua'

-- b. List all the appointment dates for William with Vet “Steve Rogers”. Output the pet's name, the appointment date and the vet's name.
SELECT Pet.pet_name, Appointments.appointment_date, Vet.vet_name
FROM Owner
LEFT JOIN Pet ON Owner.owner_id = Pet.owner_id
LEFT JOIN Appointments ON Pet.pet_name = Appointments.pet_name
LEFT JOIN Vet ON Appointments.vet_id = Vet.vet_id
WHERE Pet.pet_name = 'William' AND Vet.vet_name = 'Steve Rogers'

-- c. List all appointments in January. Output the appointment date, the pet’s name and the vet it is with.
SELECT Appointments.appointment_date, Pet.pet_name, Vet.vet_name
FROM Appointments
LEFT JOIN Pet ON Appointments.pet_name = Pet.pet_name
LEFT JOIN Vet ON Appointments.vet_id = Vet.vet_id
WHERE Appointments.appointment_date LIKE '%2022-01-%'

-- d. List the number of appointments for every vet. Output the vet names and the total number of appointments for all the vets.
SELECT Vet.vet_name, COUNT(Appointments.appointment_date) AS total_appointments
FROM Vet
LEFT JOIN Appointments ON Vet.vet_id = Appointments.vet_id
GROUP BY Vet.vet_name

-- e. List the pets that have multiple visits to the vet. Output all information for pets with more than 1 appointment. This includes all their treatment information.
SELECT Pet.*, Appointments.treatment
FROM Appointments
INNER JOIN Pet ON Appointments.pet_name = Pet.pet_name
WHERE Pet.pet_name IN(
    -- Subquery of Joint table
    SELECT pet_name	
    FROM Appointments
    GROUP BY pet_name, owner_id
    HAVING COUNT(pet_name) > 1
);

-- f. List all pet names and owner names with annual check-ups in date ascending order.
SELECT Appointments.appointment_date, Pet.pet_name, Owner.owner_name, Appointments.reason
FROM Pet
LEFT JOIN Appointments ON Pet.pet_name = Appointments.pet_name
LEFT JOIN Owner ON Pet.owner_id = Owner.owner_id
WHERE Appointments.reason = 'Annual Check-Up'
ORDER BY Appointments.appointment_date ASC