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
student_id int,
name varchar(60) not null,
course varchar(50) not null,
admission_date date,
email varchar(100) unique);
describe students;
alter table students 
add constraint student_id primary key (student_id);

-- 2. Insert 5 dummy records.
-- Insert 5 dummy records into students
INSERT INTO students (name, course, admission_date, email)
VALUES
  ('Aarav Mehta',     'Computer Science', '2022-08-15', 'aarav.mehta@example.com'),
  ('Priya Sharma',    'Mechanical Engg',  '2021-07-10', 'priya.sharma@example.com'),
  ('Rohan Iyer',      'Electrical Engg',  '2023-01-05', 'rohan.iyer@example.com'),
  ('Sneha Kapoor',    'Civil Engg',       '2020-09-20', 'sneha.kapoor@example.com'),
  ('Vikram Nair',     'Information Tech', '2022-11-30', 'vikram.nair@example.com');
