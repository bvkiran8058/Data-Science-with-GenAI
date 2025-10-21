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