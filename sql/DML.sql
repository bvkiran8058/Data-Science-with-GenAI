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