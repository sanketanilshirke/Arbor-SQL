-- Step 1: Create database
create database aug25;

-- Step 2: Use the database
use aug25;

-- Step 3: Create employees table
create table employees (
    employee_id int primary key,
    employee_name varchar(100),
    salary decimal(10,2),
    department varchar(50),
    hire_date date,
    is_manager boolean
);

-- true = 1
-- false = 0


-- Step 4: Insert records
insert into employees (employee_id, employee_name, salary, department, hire_date, is_manager boolean ) values     yy/mm/dd-- 
(1, 'John Doe', 60000.00, 'IT', '2022-01-15', true),
(2, 'Jane Smith', 75000.00, 'HR', '2023-04-20', false),
(3, 'Bob Johnson', 50000.00, 'Marketing', '2023-08-10', false),
(4, 'Alice Williams', 90000.00, 'IT', '2022-11-05', true),
(5, 'Charlie Brown', 65000.00, 'Finance', '2023-02-28', false),
(6, 'Diana Miller', 80000.00, 'Marketing', '2023-06-15', false),
(7, 'Ethan Davis', 55000.00, 'IT', '2023-10-01', false),
(8, 'Fiona Moore', 70000.00, 'Finance', '2023-12-12', false),
(9, 'George Wilson', 95000.00, 'HR', '2023-05-25', true),
(10, 'Hannah Lee', 48000.00, 'Marketing', '2024-01-08', false);

select * from employees;
------------------------------------------------------------------------------------------------------------------------
-- Question 1: Find employees with a salary greater than ₹50,000
select * from employees where salary > 50000;

-- Question 2: Identify employees hired before '2023-01-01'
select * from employees where hire_date < '2023-01-01';

-- Question 3: List employees with a salary between $40,000 and $60,000
select * from employees where salary between 40000 and 60000;
select * from employees where Salary > 40000 and salary < 60000;

-- Question 6: List employees whose department is 'IT'
select * from employees where department ='IT';

-- Question 7: Find employees not working in the 'HR' department  (!=   or  <>) 
select * from employees where department != 'HR';

-- Question 8: Identify employees with a salary equal to $70,000
select * from employees where salary = 70000;

-- Question 9: List employees hired after '2022-06-01' and not in the 'Finance' department
select * from employees where hire_date > '2022-06-01' and department != 'Finance';




















































