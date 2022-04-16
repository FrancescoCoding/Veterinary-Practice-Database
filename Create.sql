use master

---- If the database already exists this will drop it
if exists (select name from sys.databases where name = N'vet_appointments')
    DROP DATABASE vet_appointments;
GO

-- Creating the database
CREATE DATABASE vet_appointments;
GO

-- Ensuring that we are using the vet appointments DB
USE vet_appointments;
GO

-- Creating the Owner table
IF OBJECT_ID('Owner', 'U') IS NOT NULL
	DROP TABLE Owner;
GO

CREATE TABLE Owner 
(
owner_id VARCHAR(5) NOT NULL,
owner_name VARCHAR(50) NOT NULL,
owner_address VARCHAR(100) NOT NULL,
owner_phone VARCHAR(15) NOT NULL,

CONSTRAINT PK_owner PRIMARY KEY(owner_id),
CONSTRAINT CHK_owner_id CHECK(owner_id LIKE 'N[0-9][0-9][0-9][0-9]')
)

-- Creating the Pet table
IF OBJECT_ID ('Pet', 'U') IS NOT NULL
    DROP TABLE Pet;
Go

CREATE TABLE Pet
(
    owner_id VARCHAR(5) NOT NULL,
    pet_name VARCHAR(50) NOT NULL,
    pet_age INT NOT NULL,
    pet_type VARCHAR(50) NOT NULL,
    pet_breed VARCHAR(50) NULL,

    CONSTRAINT PK_Pet PRIMARY KEY (pet_name, owner_id),
    CONSTRAINT FK_Pet_Owner FOREIGN KEY(owner_id) REFERENCES Owner(owner_id)
)

-- Creating the veterinary table
IF OBJECT_ID('Vet', 'U') IS NOT NULL
	DROP TABLE Vet;
GO

CREATE TABLE Vet(
    vet_id VARCHAR(4) NOT NULL,
    vet_name VARCHAR(50) NOT NULL,
    vet_specialty VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Vet PRIMARY KEY(vet_id),
    CONSTRAINT CHK_vet_id CHECK(vet_id LIKE 'V[0-9][0-9][0-9]')
)

-- Creating the Appointment table
IF OBJECT_ID('Appointments', 'U') IS NOT NULL
	DROP TABLE Appointments
GO

CREATE TABLE Appointments
(
    owner_id VARCHAR(5) NOT NULL,
    vet_id VARCHAR(4) NOT NULL,
    pet_name VARCHAR(50) NOT NULL,
    appointment_date DATE NULL,
    room_number INT NULL,
    reason VARCHAR(50) NOT NULL,
    prescription VARCHAR(50) NULL,
    diagnosis VARCHAR(50) NULL,
    treatment VARCHAR(50) NULL,
    cost MONEY NULL,

    CONSTRAINT FK_Appointments_Owner FOREIGN KEY(owner_id) REFERENCES Owner(owner_id),
    CONSTRAINT FK_Appointments_Pet FOREIGN KEY(pet_name, owner_id) REFERENCES Pet(pet_name, owner_id),
    CONSTRAINT FK_Appointments_Vet FOREIGN KEY(vet_id) REFERENCES Vet(vet_id),
)