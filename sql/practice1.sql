-- Database name: companydb
Create database companydb;
use companydb;

/*
Tables to create:
employees
departments
projects
*/
/*
employees table
| Column       | Datatype      | Constraints                 |
| ------------ | ------------- | --------------------------- |
| emp_id       | INT           | Primary Key, Auto Increment |
| emp_name     | VARCHAR(50)   | NOT NULL                    |
| job_title    | VARCHAR(50)   | NOT NULL                    |
| salary       | DECIMAL(10,2) | NOT NULL                    |
| dept_id      | INT           | —                           |
| joining_date | DATE          | —                           |

*/
Create table employees(
emp_id int not null auto_increment,
emp_name varchar(50) not null,
job_title varchar(50) not null,
salary decimal(10,2) not null,
dept_id int not null,
joining_date date,
primary key (emp_id)
);

describe employees;

/*
departments table
| Column    | Datatype    | Constraints |
| --------- | ----------- | ----------- |
| dept_id   | INT         | Primary Key |
| dept_name | VARCHAR(50) | NOT NULL    |
| location  | VARCHAR(50) | —           |
*/

create table departments(
dept_id int,
dept_name varchar(50) not null,
location varchar(50)
);

/*
projects table
| Column       | Datatype     | Constraints                 |
| ------------ | ------------ | --------------------------- |
| project_id   | INT          | Primary Key, Auto Increment |
| project_name | VARCHAR(100) | NOT NULL                    |
| start_date   | DATE         | —                           |
| end_date     | DATE         | —                           |
| emp_id       | INT          | —                           |
*/

create table projects(
project_id int auto_increment,
project_name varchar(100) not null,
start_date date,
end_date date,
emp_id int,
primary key (project_id)
);
show tables;
-- Rename the table employees to employee_details
alter table employees
rename employee_details;

-- Add a new column email (VARCHAR(100)) to the employee_details table.
alter table employee_details
add column email varchar(100);

-- Modify the data type of salary column to DECIMAL(12,2)
alter table employee_details
modify column salary decimal(12,2);

describe employee_details;

-- Drop the column job_title from employee_details
alter table employee_details
drop column job_title;

-- Add it back again with the same name and datatype.
alter table employee_details
add column job_title varchar(50)
after emp_name;

-- Rename the column emp_name to employee_name
alter table employee_details
rename column emp_name to employee_name;

/*
Drop the table projects.
Recreate it again with the same structure.
used same query to recreate*/

drop table projects;
show tables;
describe employee_details;
select * from employee_details;
-- 2 Insert Records
insert into employee_details values
(1, 'Arjun Mehta', 'Software Engineer', 75000, 1, '2022-06-15', 'arjun@mehta.com'),
(2, 'Sneha Reddy', 'HR Executive', 55000, 2, '2022-02-01', 'sneha@reddy.com');

insert into employee_details (employee_name, job_title, salary, dept_id, joining_date, email)
values ('Rahul Nair', 'Data Analyst', 67000, 1, '2021-12-10', 'rahul@nair.com');

INSERT INTO employee_details (employee_name, job_title, salary, dept_id, joining_date, email)
VALUES
('Priya Das', 'Marketing Manager', 85000, 3, '2020-08-05', 'priya@das.com'),
('Dev Patel', 'Accountant', 50000, 4, '2024-01-20', 'dev@patel.com');

INSERT INTO departments
VALUES
(1, 'IT', 'Bangalore'),
(2, 'Human Resources', 'Hyderabad'),
(3, 'Marketing', 'Mumbai'),
(4, 'Finance', 'Delhi');

INSERT INTO departments (dept_id, dept_name, location)
VALUES
(5, 'Operations', 'Chennai');

INSERT INTO projects (project_id, project_name, start_date, end_date, emp_id)
VALUES
(1, 'Website Redesign', '2023-01-15', '2023-06-30', 1),
(2, 'Recruitment Drive', '2023-03-01', '2023-04-30', 2),
(3, 'Data Migration', '2022-11-01', '2023-02-15', 3),
(4, 'Ad Campaign', '2023-05-10', '2023-09-01', 4),
(5, 'Budget Planning', '2024-01-01', '2024-03-31', 5);

SELECT * FROM employee_details;
SELECT * FROM departments;
SELECT * FROM projects;

-- Data retrieval
-- Display only employee_name and salary columns.
select employee_name, salary
from employee_details;

-- Show employees who joined after 2023-01-01.
select * from employee_details
where joining_date > '2023-01-01';

-- List employees whose salary is greater than 60000.
select * from employee_details
where salary > 60000;

-- Display employees sorted by their salary in descending order.
select * from employee_details
order by salary desc;

-- Show only distinct department IDs.
select distinct dept_id 
from employee_details;

-- Retrieve the top 3 highest paid employees.
SELECT * FROM employee_details
ORDER BY salary DESC
LIMIT 3;

-- Find all employees whose names start with “A”.
select * from employee_details
where employee_name like "A%";

-- Retrieve all employees working in department ID 1.
select * from employee_details
where dept_id = 1;

-- List all employees with NULL joining dates.
select * from employee_details
where joining_date is null;

-- 4. Updating Data
-- Update the salary of one employee to 90000.
SET SQL_SAFE_UPDATES = 0;

update employee_details
set salary = 90000
where employee_name = 'Arjun Mehta';

-- Change the dept_id of all employees working in IT to 3.
update employee_details
set dept_id = 3
where job_title = 'IT';

-- Increase every employee’s salary by 10%
update employee_details
set salary = salary * 1.10;

-- 5. Deleting Data
-- Delete all employees with salary less than 40000.
delete from employee_details
where salary < 40000;

-- Delete all data from employee_details but keep the structure.
delete from employee_details;

-- Delete the entire departments table.
drop table departments;
show tables;

-- Bonus Alter Challenges
-- Add a new column manager_id in employee_details.
alter table employee_details
add column manager_id int;

describe employee_details;

alter table employee_details
drop email;

-- Add a column performance_rating (INT) with a default value.
alter table employee_details
add column performance_rating int default 3;