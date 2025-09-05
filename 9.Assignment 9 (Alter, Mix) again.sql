-- Create Database
CREATE DATABASE SampleDB;
USE SampleDB;

-- Create Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT
);

-- Insert 30 Rows
INSERT INTO Employee VALUES
(1, 'John', 'Doe', 50000),
(2, 'Jane', 'Smith', 60000),
(3, 'David', 'Johnson', 55000),
(4, 'Emily', 'Brown', 70000),
(5, 'Michael', 'Davis', 80000),
(6, 'Sophia', 'Anderson', 48000),
(7, 'William', 'Jones', 75000),
(8, 'Olivia', 'Miller', 62000),
(9, 'Daniel', 'Taylor', 53000),
(10, 'Ava', 'Wilson', 45000),
(11, 'Matthew', 'Moore', 68000),
(12, 'Ella', 'White', 52000),
(13, 'Christopher', 'Martin', 72000),
(14, 'Grace', 'Thomas', 59000),
(15, 'Andrew', 'Jackson', 90000),
(16, 'Madison', 'Hill', 48000),
(17, 'Joshua', 'Carter', 67000),
(18, 'Abigail', 'Perez', 58000),
(19, 'Logan', 'Hall', 85000),
(20, 'Sophie', 'Evans', 50000),
(21, 'Jackson', 'Wright', 77000),
(22, 'Lily', 'Harris', 63000),
(23, 'Aiden', 'Clark', 49000),
(24, 'Chloe', 'Lopez', 71000),
(25, 'Carter', 'Baker', 72000),
(26, 'Aubrey', 'Green', 55000),
(27, 'Ethan', 'Allen', 68000),
(28, 'Zoe', 'Lee', 59000),
(29, 'Mason', 'King', 80000),
(30, 'Emma', 'Garcia', 62000),
-- Additional 30 Rows
(31, 'Noah', 'Smith', 55000),
(32, 'Avery', 'Jones', 70000),
(33, 'Elijah', 'Wilson', 48000),
(34, 'Grace', 'Hill', 55000),
(35, 'Aria', 'Garcia', 72000),
(36, 'Liam', 'Taylor', 60000),
(37, 'Scarlett', 'Thomas', 53000),
(38, 'Lucas', 'Miller', 78000),
(39, 'Isabella', 'Brown', 52000),
(40, 'Henry', 'Moore', 67000),
(41, 'Aiden', 'Evans', 49000),
(42, 'Aria', 'Wright', 59000),
(43, 'Jackson', 'Johnson', 70000),
(44, 'Ava', 'Davis', 55000),
(45, 'Ethan', 'Allen', 68000),
(46, 'Chloe', 'Perez', 72000),
(47, 'Oliver', 'Harris', 59000),
(48, 'Sophie', 'Clark', 63000),
(49, 'Logan', 'Lopez', 55000),
(50, 'Lily', 'Baker', 71000),
(51, 'Mia', 'Green', 80000),
(52, 'Carter', 'King', 62000),
(53, 'Ella', 'Garcia', 55000),
(54, 'Matthew', 'Thomas', 90000),
(55, 'Avery', 'Hill', 48000),
(56, 'Sophia', 'Carter', 67000),
(57, 'Jackson', 'White', 58000),
(58, 'Aria', 'Hall', 85000),
(59, 'Aiden', 'Smith', 50000),
(60, 'Emma', 'Wilson', 77000);


select * from Employee;

-- UPDATE--
set sql_safe_updates = 0;

-- 1. Write a SQL query to update John Doe's salary to 55000.
update employee set salary=55000 where firstname='john' and lastname='doe';

-- 2. Write a SQL query to increase all salaries by 10%.
update employee set salary=salary * 1.10 ;

-- 3. Write a SQL query to update salaries for employees with a salary below 55000 to 55000.
update employee set salary = 55000 where salary <55000;

-- 4. Write a SQL query to update Jane Smith's last name to 'Johnson'.
update employee set lastname ='johnson' where firstname='jane' and lastname='smith';

-- 5. Write a SQL query to double the salary for employees with an ID greater than 15.
update employee set salary= salary * 2 where employeeid>15;

-- 6. Update the salary of employees with 'son' in their last name to 60000.
update employee set salary = 60000 where lastname like '%son%';

-- 7. Update the salary of employees with 'Evans' in their last name to 58000.
update employee set salary = 58000 where lastname = 'Evans';

-- 8. Update the last name of employees with 'Lee' in their last name to 'Lewis'.
update employee set lastname = 'lewis' where lastname like '%lee%';
-------------------------------------------------------------------------------------------------------------
--  DELETE --
select * from Employee;

-- 1. Write a SQL query to delete the employee with ID 10.
delete from employee where employeeid=10;

-- 2. Write a SQL query to delete all employees with a salary less than 40000.
delete from employee where salary < 40000;

-- 3. Write a SQL query to delete all rows from the Employee table.
delete from employee;

-- 4. Write a SQL query to delete employees with a last name starting with 'A'.
delete from employee where lastname like 'a%';

-- 5. Write a SQL query to delete employees with an even EmployeeID.
delete from employee where employeeid % 2 = 0;

-- 6. Write a SQL query to delete employees with an odd EmployeeID
delete from employee where employeeid % 2 = 1;

-- 3. Delete employees with a salary between 60000 and 70000.
delete from employee where salary between 60000 and 70000;

-- 5. Delete employees with a last name ending with 'son'.
delete from employee where lastname like '%son';
------------------------------------------------------------------------------------------------------------
-- 6. Retrieve the details of employees whose first name contains 'a' and last name contains 'o'
select * from employee where firstname like '%a%' and lastname like '%o%';
------------------------------------------------------------------------------------------------------------

-- ALTER --
select * from Employee;

-- 1. Add a new column called 'Birthdate' of type DATE to the Employee table.
alter table employee add column Birthdate DATE;

-- 2. Drop the 'Salary' column from the Employee table.
alter table employee drop column salary;

-- 3. Rename the 'FirstName' column to 'First_Name' in the Employee table.
alter table employee rename column firstname to first_name;

-- 4. Add a new column called 'Department' of type VARCHAR(50) to the Employee table.
alter table employee add column Department VARCHAR(50);

-- 5. Rename the 'Birthdate' column to 'DOB' in the Employee table.
alter table employee rename column Birthdate to DOB;

-- 6. Change the datatype of First_Name column from VARCHAR(50) to VARCHAR(100).
alter table employee modify column first_name VARCHAR(100);

-- 7. Add a NOT NULL constraint to the LastName column.
alter table employee modify column lastname varchar(100) not null;

-- 8. Add a UNIQUE constraint on the First_Name column.

-- 9. Make Department column mandatory (NOT NULL) after adding it.
update employee set department = 'Unknown' where department is null;
alter table employee modify column department varchar(50) not null;

-- 10. Drop the 'LastName' column from the Employee table.
alter table employee drop column lastname;

