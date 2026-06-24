CREATE DATABASE Durwang;
USE Durwang;

CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
salary DECIMAL(10,2) CHECK (salary>=10000),
dept_id INT,
joining_date DATETIME DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_department
FOREIGN KEY(dept_id) REFERENCES
departments(dept_id)
);