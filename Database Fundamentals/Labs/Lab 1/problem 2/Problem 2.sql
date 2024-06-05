--Create Databae Real_Stats_Firm
CREATE DATABASE Real_State_Firmm
GO
--Use the Database
USE Real_State_Firm
GO

--Create Sales_office table
CREATE TABLE Sales_Office 
(
Num INT PRIMARY KEY,
[Location] VARCHAR(333),
)

--Create Employee Table
CREATE TABLE Employee
(
Id INT PRIMARY KEY,
[Name] VARCHAR(22),
Sales_id INT ,
CONSTRAINT FK_ES FOREIGN KEY (Sales_id) REFERENCES Sales_Office (Num)
)

--Create table office_manager
CREATE TABLE Office_Manager
(
Office_id INT,
Emp_id INT,
primary key(office_id,Emp_id),
CONSTRAINT FK_OS FOREIGN KEY (Office_id) REFERENCES Sales_Office(Num),
CONSTRAINT FK_OE FOREIGN KEY (Emp_id) REFERENCES Employee(Id)
)
--Create table property 
CREATE TABLE Property
(
Id INT PRIMARY KEY,
Zib CHAR(10),
City VARCHAR(33),
Street VARCHAR(33),
Sales_id INT FOREIGN KEY REFERENCES Sales_Office(Num)
)
--Create table Owner
CREATE TABLE [Owner]
(
Id INT PRIMARY KEY,
[Name] VARCHAR(22)
)
--Create table property_owner
CREATE TABLE Property_Owner
(
Own_id INT FOREIGN KEY REFERENCES [Owner](Id),
prop_id INT FOREIGN KEY REFERENCES Property(Id),
PRIMARY KEY(Own_id,prop_id)
)


