-- 1.Create a new database named EmployeeManagement to store employee-related records for a company.
create database EmployeeManagement;

-- 2.Drop the existing database EmployeeManagement to remove all employee records permanently.
drop database EmployeeManagement;

-- 3.Recreate the EmployeeManagement database to ensure a fresh start before creating new tables.
create database EmployeeManagement;


-- 4.Create a table named EmployeeDetails inside the EmployeeManagement database with the following columns:
	-- 	EmpID(Integer, Primary Key) - Unique identifier for each employee
	-- 	FirstName(VARCHAR(50)) - Employee's first name
	-- 	LastName(VARCHAR(50)) - Employee's last name
	-- 	Salary(DECIMAL(10,2)) - Monthly salary of the employee
	-- 	DateOfJoining(DATE) - Date when the employee joined the company   // YYYY-MM-DD
use EmployeeManagement;
create table EmployeeDetails (EmpID int primary key, FirstName varchar(50), LastName varchar(50), Salary decimal(10,2), DateOfJoining date);


-- 5.Create a table named Departments inside the EmployeeManagement database with the following columns:
	-- 	DepthId(Integer, Primary Key) - Unique identifier for each department
	-- 	DepthName(VARCHAR(50)) - Name of the department
	-- 	Location(VARCHAR(100)) - Location where the department operates
create table Departments (DepthId int primary key, DepthName varchar(50), Location varchar(100));


-- 6.Drop the EmployeeDetails table from the EmployeeManagement database to remove all employee data permanently.
drop table EmployeeDetails;

-- 7.Drop the Departments table from the EmployeeManagement database to delete department records.
drop table Departments;



-- 8.Insert 10 records into the EmployeeDetails table with sample employee data, ensuring a mix of different departments, salaries, and joining dates.
create table EmployeeDetails (EmpID int primary key, FirstName varchar(50), LastName varchar(50), Salary decimal(10,2), DateOfJoining date);

insert into EmployeeDetails (EmpID, FirstName, LastName, Salary, DateOfJoining) values
(1, 'Amit', 'Patil', 55000.22, '2022-01-15'),
(2, 'Sneha', 'Deshmukh', 45000, '2021-06-10'),
(3, 'Vikas', 'Kumar', 60000, '2020-03-20'),
(4, 'Neha', 'Rao', 70000, '2023-02-12'),
(5, 'Rajesh', 'Gupta', 40000, '2019-11-05'),
(6, 'Pooja', 'Sharma', 75000, '2021-12-18'),
(7, 'Arjun', 'Mehta', 50000, '2022-08-25'),
(8, 'Meera', 'Joshi', 65000, '2020-10-07'),
(9, 'Karan', 'Singh', 80000, '2019-04-22'),
(10, 'Divya', 'Kapoor', 47000, '2023-05-01');

select * from EmployeeDetails;




-- 9.Insert 5 records into the Departments table, ensuring each department has a unique DepthId and assign meaningful names such as IT, HR, Finance, Sales, and Operations.
create table Departments (DepthId int primary key, DepthName varchar(50), Location varchar(100));

insert into Departments (DepthId, DepthName, Location) values
(1, 'IT', 'Mumbai'),
(2, 'HR', 'Delhi'),
(3, 'Finance', 'Bangalore'),
(4, 'Sales', 'Chennai'),
(5, 'Operations', 'Hyderabad');

select * from Departments;




-- 10.A new employee, "Rohit Sharma," has joined the company in the IT department. Insert his details into the EmployeeDetails table, ensuring his salary is 60,000
insert into EmployeeDetails (EmpID, FirstName, LastName, Salary, DateOfJoining) values (11, 'Rohit', 'Sharma', 60000, '2023-08-01');
select * from EmployeeDetails;


-- 11.Insert A new employee into the EmployeeDetails table with the following information:
	-- 	Name: "Anjali Mehta"
	-- 	Salary: Rs 50,000
	-- 	Date of Joining: 2023-07-10
	-- 	Department ID: Assign a valid department ID that corresponds to Finance
insert into EmployeeDetails (EmpID, FirstName, LastName, Salary, DateOfJoining) values (12, 'Anjali', 'Mehta', 50000, '2023-07-10');
select * from EmployeeDetails;


-- 12.To quickly onboard multiple employees, insert three new employees in a single query into the EmployeeDetails table with different departments and salaries.
insert into EmployeeDetails (EmpID, FirstName, LastName, Salary, DateOfJoining) values
(13, 'Ramesh', 'Yadav', 52000, '2023-09-15'),
(14, 'Kavita', 'Nair', 61000, '2022-12-05'),
(15, 'Sunil', 'Khan', 58000, '2021-04-20');
select * from EmployeeDetails;


-- 13.The company is expanding its research division. Insert a new department named Research and Development into the Departments table With DepthID = 6 and Location = Pune.
insert into Departments (DepthId, DepthName, Location) values (6, 'Research and Development', 'Pune');
select * from departments;


 


