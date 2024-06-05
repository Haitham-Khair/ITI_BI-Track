
--Create the database 
Create Database Musicana_Records

--use the Musicana_Records database
USE Musicana_Records

--now we will start creating our tables 

--Create table Album 
CREATE TABLE Album
(
Id INT PRIMARY KEY,
Title VARCHAR(22),
Copyright_Date DATETIME,
Musician_id INT FOREIGN KEY REFERENCES Musician(id)
)

--Create table Song
CREATE TABLE Song
(
Title VARCHAR(33) PRIMARY KEY,
Author VARCHAR(22),
Album_id INT FOREIGN KEY REFERENCES Album(id)
)

--Create table Musician 
CREATE TABLE Musician
(
Id INT PRIMARY KEY,
Phone CHAR(11),
City VARCHAR(22),
Street VARCHAR(22)
)

--CREATE TABLE INSTRUEMTNS 
CREATE TABLE Instruments
(
[key] INT PRIMARY KEY,
[Name] VARCHAR(22)
)
CREATE TABLE Musician_Song
(
Song_Title VARCHAR(33),
Musician_id INT,
FOREIGN KEY(Song_Title) REFERENCES Song(title),
FOREIGN KEY(Musician_id ) REFERENCES Musician(id),
PRIMARY KEY(Song_Title,Musician_id)
)
--Create table muscian_instument

CREATE TABLE Musician_Instruments
(
Musican_id INT FOREIGN KEY REFERENCES Musician(id),
Instrument_id INT FOREIGN KEY REFERENCES Instruments([key]),
PRIMARY KEY(musican_id,instrument_id)
)
