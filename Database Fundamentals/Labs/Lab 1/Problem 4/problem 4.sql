--creating the database
CREATE DATABASE Airlines

--Use the database
USE Airlines

--CREATING THE TABLES 

CREATE TABLE Airline
(
ID INT PRIMARY KEY,
[NAME] VARCHAR(100),
[Address] VARCHAR(50),
Contact_Person CHAR(15)
)

--Create table Airline phone
CREATE TABLE Airline_Phones
(
Airline_ID INT FOREIGN KEY REFERENCES Airline(ID) ,
Phone CHAR(11),
PRIMARY KEY (Airline_ID,Phone)
)


--Creating the table Aircraft
CREATE TABLE Aircraft
(
ID INT PRIMARY KEY,
[Model] VARCHAR(100),
Capacity INT,
Airline_ID INT FOREIGN KEY REFERENCES Airline(ID)
)

--create table crew 
CREATE TABLE Crew
(
ID INT PRIMARY KEY,
Major_Pilot VARCHAR(100),
Assistant_Pilot VARCHAR(100),
Host1 VARCHAR(100),
Host2 VARCHAR(100),
Aircraft_ID INT FOREIGN KEY REFERENCES Aircraft(Id),
)

--Create table Employee

CREATE TABLE Employee
(
ID INT PRIMARY KEY,
[Name] VARCHAR(100),
[Address] VARCHAR(100),
[Position] VARCHAR(100),
Gender binary,
Airline_ID INT FOREIGN KEY REFERENCES Airline(ID)
)

CREATE TABLE Employee_Qualification
(
Emp_ID INT,
Qualification VARCHAR(100),
PRIMARY KEY (Emp_ID,Qualification)
)

--Create Table Route

CREATE TABLE [Route]
(
ID INT PRIMARY KEY,
Origin VARCHAR(100),
Destination VARCHAR(100),
Distance INT,
[Classification] VARCHAR(100),
CONSTRAINT CHECK_CONS CHECK ([Classification] ='domestic' OR [Classification] = 'international')
)

--Create table Aircraft_routes

CREATE TABLE Aircraft_Routes
(
Aircraft_ID INT FOREIGN KEY REFERENCES Aircraft(Id),
Route_ID INT FOREIGN KEY REFERENCES [Route](Id),
Number_Of_Passenger INT,
Price_Per_Passenger INT,
Departuare_Time Datetime,
Arrival_Time Datetime,
Spent_Time Time,
PRIMARY KEY (Aircraft_ID,Route_ID,Departuare_Time)
)

--Create Table Transaction

CREATE TABLE Transactions
(
ID INT PRIMARY KEY,
Transaction_Date Datetime,
[Description] VARCHAR(100),
Amount_of_money int,
Airline_ID INT FOREIGN KEY REFERENCES Airline(ID)
)
