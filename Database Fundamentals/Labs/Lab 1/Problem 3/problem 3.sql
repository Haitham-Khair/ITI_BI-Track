--Creating the Database
CREATE DATABASE Hospital

--using the database
USE Hospital

--creating the tables

--Create table ward
CREATE TABLE Ward
(
ID INT PRIMARY KEY,
[NAME] VARCHAR(100)
)

--Creating table cosultant 

CREATE TABLE Consultant
(
ID INT PRIMARY KEY,
[NAME] VARCHAR(100)
)
--Create Table patient
CREATE TABLE Patient 
(
ID INT PRIMARY KEY,
[NAME] VARCHAR(100),
BirthDate Date,
Ward_id INT,
Consult_id INT,
CONSTRAINT FK_PW FOREIGN KEY  (Ward_id)REFERENCES Ward(ID),
CONSTRAINT FK_PC FOREIGN KEY (Consult_id)REFERENCES Consultant(ID)
)

--create table patient consultant
CREATE TABLE Patient_Consultant
(
Patient_id INT FOREIGN KEY REFERENCES Patient(ID),
Consult_id INT FOREIGN KEY REFERENCES Consultant(ID),
PRIMARY KEY(Patient_id,Consult_id)
)

--Create table Nurse
CREATE TABLE Nurse
(
ID INT PRIMARY KEY,
[NAME] VARCHAR(100),
Ward_id INT FOREIGN KEY REFERENCES Ward(Id)
)

--Create Table ward_supervisor
CREATE TABLE Ward_Supervisor
(
Nurse_ID INT  FOREIGN KEY REFERENCES Nurse(Id) ,
Word_ID INT FOREIGN KEY REFERENCES Ward(Id),
PRIMARY KEY(Nurse_ID,Word_ID)
)

--Create Table Drug

CREATE TABLE Drug
(
Code_NUM INT PRIMARY KEY,
Recommendation_Dosage VARCHAR(100)
)

--Create Table Drug_Brand

CREATE TABLE Drug_Brands
(
Code_NUM INT FOREIGN KEY REFERENCES Drug (Code_NUM),
Brand_Name VARCHAR(100),
PRIMARY KEY(Code_NUM,Brand_Name)
)

--Create Table Nurse_patient_drug
CREATE TABLE Nurse_Patient_Drug
(
Patient_ID INT  FOREIGN KEY REFERENCES Patient(Id) ,
Nurse_ID INT  FOREIGN KEY REFERENCES Nurse(Id) ,
Code_NUM INT FOREIGN KEY REFERENCES Drug (Code_NUM),
Date_Time DATETIME,
Dosage varchar(100),
PRIMARY KEY(Patient_ID,Nurse_ID,Code_NUM,Date_Time)
)

