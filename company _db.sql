CREATE DATABASE company_db;

USE company_db;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    joining_date DATE
);
ALTER TABLE employees
ADD phone VARCHAR(15);
ALTER TABLE employees
MODIFY salary DECIMAL(12,2);
ALTER TABLE employees
DROP phone;

DROP TABLE employees;

TRUNCATE TABLE employees;

RENAME TABLE employees TO staff;

INSERT INTO staff
(emp_id, emp_name, email, salary, department, joining_date)
VALUES
(101,'Rahul','rahul@gmail.com',45000,'IT','2023-01-10');

INSERT INTO staff VALUES
(102,'Amit','amit@gmail.com',40000,'HR','2023-02-01'),
(103,'Priya','priya@gmail.com',50000,'IT','2023-03-15');

UPDATE staff
SET salary = 55000
WHERE emp_id = 103;

DELETE FROM staff
WHERE emp_id = 102;


DELETE FROM staff;

SELECT * FROM staff;


SELECT emp_name, salary
FROM staff;
SELECT *
FROM staff
WHERE department = 'IT';

SELECT *
FROM staff
ORDER BY salary DESC;

SELECT *
FROM staff
LIMIT 5;

SELECT department, AVG(salary)
FROM staff
GROUP BY department;

SELECT * FROM staff;