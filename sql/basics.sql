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

ALTER TABLE employee_table
ADD Emp_sal int not Null

ALTER TABLE employee_table  
ADD emp_address varchar(100) NOT NULL  
AFTER name,  
ADD mobile_no int(100) NOT NULL  
AFTER age ;  