use Company_SD
/*
1-Display the Department id, name and id and the name of its manager.
*/
Select D.dnum Dept_Id,D.dname Dept_Name,E.fname+' '+E.lname Manager_Name,E.ssn Manger_Id
from Employee E
inner join Departments D
on D.MGRSSN=E.SSN
/*
2-Display the name of the departments and the name of the projects under its
--control.
*/
Select Dname Department_Name,Pname Project_name 
From Departments D
inner join Project P
on D.Dnum=P.Dnum

/*
3-Display the full data about all the dependence associated with 
the name of the employee they depend on him/her

*/

select D.Essn,D.Dependent_name, D.Sex,D.Bdate,E.Fname+' '+E.Lname Employee_Name
From Dependent D
inner join Employee E
on D.ESSN=E.SSN
/*
4-Display the Id, name and location of the projects in Cairo or Alex city
*/
Select Pnumber,Pname,plocation 
from Project 
where City in ('alex','Cairo')
/*
5-Display the Projects full data of the projects with a name starts with "a" letter
*/
select*from Project 
where Pname like 'A%'

/*
6-display all the employees in department 30 whose salary from 1000 to 2000 LE
monthly
*/
select*from Employee
where Dno=30 and Salary between 1000 and 2000
/*
7-Retrieve the names of all employees in department 10 who works more than or
equal 10 hours per week on "AL Rabwah" project
*/
select Fname + ' '+ Lname Emp_Name
from Employee where ssn in 
(
  select Essn from Works_for where Pno in
  (
  select pnumber from Project where Pname='AL Rabwah' and Hours>=10
  ) 
)

/*
8-Find the names of the employees who directly supervised with Kamel Mohamed
*/
select*from Employee 
where Superssn in (
select SSN from Employee 
where Fname='Kamel' and Lname='Mohamed'
)
/*
9-Retrieve the names of all employees and the names of the projects they are
--working on, sorted by the project name
*/
select E.Fname+ ' ' +E.Lname Employee_name ,P.Pname
from Employee E
left join
Project P
on E.Dno=P.Dnum
order by P.pname

select*from Project
select*from Works_for

/*
-10 For each project located in Cairo City , find the project number, the controlling
department name ,the department manager last name ,address and birthdate
*/
select *from Project
select*from Employee
select*From Departments
E.Lname,E.Adress,E.birthdate
Select P.pnumber,p.dum from  p
where City='Cairo'
inner join Departments


/*
11-Display All Data of the mangers
*/
select*from Employee
where SSN in 
(
select mgrssn 
from Departments
)
/*
12-Display All Employees data and the data of their dependents even if they have no
dependents
*/
select*from Employee E left join Dependent D
on E.SSN=D.ESSN

----------- Data Manipulation------------------
/*
1-Insert your personal data to the employee
table as a new employee in department
number 30, SSN = 102672, Superssn = 112233, salary=3000
*/
INSERT INTO Employee (Dno,SSN,Superssn,Salary)
VALUES (30,102672,112233,3000)

/*
2-Insert another employee with personal data your friend as new employee in
department number 30, SSN = 102660, but don’t enter any value for salary or
manager number to him
*/
INSERT INTO Employee (Fname,Lname,SSN,Address,Sex,DNO)
VALUES ('Haitham','Saady',102660,'Qena_Qus','M',30)
/*

3-Upgrade your salary by 20 % of its last value.
*/
UPDATE Employee
SET Salary=Salary*1.20



