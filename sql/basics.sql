-- Create database
create database Customerdb;
CREATE DATABASE employeedb;
-- Show databse
show databases;
-- You can use SQL command USE to select a particular database.
use employeedb;

show databases like "%schema";
show databases like "%c%db";

use employeedb; 

-- MySQL DROP Database=============
CREATE DATABASE testdb_copy;  
SHOW DATABASES;  
drop database testdb_copy;
-- Create Table=======================
use employeedb;
CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
); 
SHOW TABLES;  
describe employee_table;
-- Adding new column with help of ALTER and ADD
ALTER TABLE employee_table
ADD Emp_sal int not Null;

ALTER TABLE employee_table  
ADD emp_address varchar(100) NOT NULL  
AFTER name,  

ADD mobile_no int(100) NOT NULL  
AFTER age ;  

-- Modifying column with help of ALTER and MODIFY
ALTER TABLE employee_table  
MODIFY name varchar(50) NULL;  

-- Dropping column with help of ALTER and DROP
ALTER TABLE employee_table 
DROP COLUMN age; 

-- adding again
ALTER TABLE employee_table
add column age int not null
after name;
describe employee_table;

-- rename column in table with ALTER and CHANGE
ALTER TABLE employee_table
change column age emp_age int(10) not null;

-- rename table name with ALTER and RENAME
ALTER TABLE employee_table
rename Employee_Details;

SHOW tables;
describe Employee_Details;

-- Inserting data into tables
create table PEOPLE(
id int not null auto_increment,
name varchar(50) not null,
occupation varchar(50) not null,
age int,
primary key (id)
);

INSERT INTO People (id, name, occupation, age)   
VALUES (101, 'Peter', 'Engineer', 32); 

select * FROM PEOPLE;
INSERT INTO People VALUES  
(102, 'Joseph', 'Developer', 30),  
(103, 'Mike', 'Leader', 28),  
(104, 'Stephen', 'Scientist', 45);

INSERT INTO People (name, occupation)   
VALUES ('Stephen', 'Scientist'), ('Bob', 'Actor'); 

show databases;
use employeedb;
show tables;
describe people;

alter table people
add column joining_date date;
describe people;

select * from people;

insert into People values(107,'Ojus','Engineer',27,'2018-09-04');

insert into People values(108,'Pramod','Engineer',27,'2024-12-01');

update people 
set joining_date = '2024/03/11'
where id = 102;

UPDATE People    
SET Joining_Date = '2025/09/01'    
WHERE id =106;

SET SQL_SAFE_UPDATES = 0;

UPDATE People    
SET Joining_Date = '2025/09/11'    
WHERE name ='Stephen';

delete from people where name = 'Stephen';