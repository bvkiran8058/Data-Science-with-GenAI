-- 🏛️ Section A — Database & Schema
-- 1. Create a database named collegeDB.
CREATE DATABASE collegeDB;
-- 2. Create another database named sales_management with a custom character set utf8mb4.
create database sales_management
character set utf8mb4;
-- 3. Display all databases and verify creation.
show databases;
-- 4. Delete the sales_management database.
drop database sales_management;
-- 5. Create a schema called library_schema (if your RDBMS supports it).
create schema library_schema;
show schemas;

-- 📋 Section B — CREATE TABLE
/*
1️⃣ Table: students
Column	Datatype	Constraint
student_id	INT	Primary Key, Auto Increment
name	VARCHAR(60)	NOT NULL
course	VARCHAR(40)	NOT NULL
admission_date	DATE	—
email	VARCHAR(100)	UNIQUE

1. Create the table using proper constraints.
*/
use collegedb;
create table students(
student_id int auto_increment,
name varchar(60) not null,
course varchar(50) not null,
admission_date date,
email varchar(100) unique, 
primary key (student_id));
describe students;

-- 2. Insert 5 dummy records.
INSERT INTO students (name, course, admission_date, email)
VALUES
  ('Aarav Mehta',     'Computer Science', '2022-08-15', 'aarav.mehta@example.com'),
  ('Priya Sharma',    'Mechanical Engg',  '2021-07-10', 'priya.sharma@example.com'),
  ('Rohan Iyer',      'Electrical Engg',  '2023-01-05', 'rohan.iyer@example.com'),
  ('Sneha Kapoor',    'Civil Engg',       '2020-09-20', 'sneha.kapoor@example.com'),
  ('Vikram Nair',     'Information Tech', '2022-11-30', 'vikram.nair@example.com');

-- 3. Create another table graduates using structure of students (no data).
create table graduates as
select * from students where 1=2;
show tables;

-- 4. Create a temporary table temp_students to store one-day event data.
create temporary table temp_students as
select * from students where 1=2;
select * from temp_students;

/*
2️⃣ Table: departments
Column	Datatype	Constraint
dept_id	INT	Primary Key
dept_name	VARCHAR(50)	NOT NULL
head	VARCHAR(60)	—
*/
-- 1. Create the table.
create table departments(
dept_id int auto_increment,
dept_name varchar(50) not null,
head varchar(60),
primary key (dept_id));

-- 2. Add two sample departments: “Computer Science”, “Mechanical”.
insert into departments (dept_name)
values 
	("Computer Science"),
	("Mechanical");

/*3️⃣ Table: courses
Column	Datatype	Constraint
course_id	INT	Primary Key
course_name	VARCHAR(100)	NOT NULL
dept_id	INT	Foreign Key → departments(dept_id)
duration_months	INT	CHECK (duration_months > 0)
*/
-- 1. Create the table using a foreign key to departments.
create table courses(
course_id int auto_increment,
course_name varchar(100) not null,
dept_id int,
duration_months int check (duration_months > 0),
primary key(course_id),
foreign key(dept_id) references departments(dept_id)
);
describe courses;
-- 2. Insert 3 sample courses.
select * from departments;
insert into courses (course_name, dept_id, duration_months)
values
	('python', (select dept_id from departments where dept_name = "Computer Science"), 6),
    ('thermodynamics', (select dept_id from departments where dept_name="Mechanical"), 8);
select * from courses;

/*
🔧 Section C — ALTER TABLE
On table students
*/
-- 1. Add a column phone_number VARCHAR(15).
alter table students
add column(
phone_number varchar(15)
);
-- 2. Modify course to accept NULL values.
describe students;
alter table students
modify column course varchar(50) not null;
-- 3. Rename column name to student_name.
alter table students
rename column name to student_name;
-- 4. Change datatype of email from VARCHAR(100) to VARCHAR(150).
alter table students
modify column email varchar(150);
-- 5. Drop column admission_date.
alter table students
drop column admission_date;
-- 6. Add a column grade CHAR(2) with a default value 'A'.
alter table students
add column grade varchar(2) default "A";
-- 7. Rename table students → student_details.
rename table students to student_details;
describe student_details;
-- 8. Add a foreign key to dept_id from departments.
alter table student_details
add column dept_id int;
alter table student_details
add constraint dept_id 
foreign key (dept_id) references departments(dept_id);

/*
💣 Section D — DROP, TRUNCATE & RENAME
*/
-- 1. Create a table old_records with any 3 columns.
create table old_records(
record_no int auto_increment,
stu_name varchar(50), 
age int check (age > 18),
primary key(record_no)
);
-- 2. Insert some data.
insert into old_records (stu_name, age)
values
	("John", 19),
    ("Mitchel", 19);
-- 3. Use TRUNCATE to remove all rows — verify that the structure remains
truncate table old_records;
-- 4. Drop table old_records.
drop table old_records;
-- 5. Rename student_details back to students.
rename table student_details to students;

/*
📑 Section E — DDL Constraints Practice
Create a table named employee_data with the following structure:

Column	Datatype	Constraint
emp_id	INT	PRIMARY KEY
emp_name	VARCHAR(50)	NOT NULL
dept_id	INT	FOREIGN KEY REFERENCES departments(dept_id)
salary	DECIMAL(10,2)	CHECK (salary > 0)
hire_date	DATE	DEFAULT (current date)
email	VARCHAR(100)	UNIQUE
*/
use collegedb;
show tables;
create table employee_data(
emp_id int auto_increment,
emp_name varchar(50) not null,
dept_id int,
salary decimal(10,2) check(salary>0),
hire_date date default (curdate()),
email varchar(100) unique,
primary key(emp_id),
foreign key (dept_id) references departments(dept_id)
);
-- 2. Drop the CHECK constraint.
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'employee_data'
  AND CONSTRAINT_TYPE = 'CHECK';
ALTER TABLE employee_data
DROP CHECK employee_data_chk_1;
describe employee_data;
-- 3. Add a new column performance_rating INT DEFAULT 5.
alter table employee_data
add column performance_rating INT DEFAULT 5;
-- 4. Add a UNIQUE constraint on emp_name and dept_id together.
ALTER TABLE employee_data
ADD CONSTRAINT emp_dept_unique
UNIQUE (emp_name, dept_id);
-- 5. Drop the DEFAULT constraint on hire_date.
alter table employee_data
alter column hire_date drop default;

/*
📊 Section F — CREATE VIEW, INDEX, SEQUENCE, SYNONYM
*/

