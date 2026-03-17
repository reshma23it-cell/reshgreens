CREATE DATABASE company_db;
USE company_db;
CREATE TABLE department (
    dept_id INT PRIMARY KEY IDENTITY(1,1),
    dept_name VARCHAR(50),
    location VARCHAR(50)
);  
CREATE TABLE employee (
    emp_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY IDENTITY(1,1),
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    dept_id INT
);

CREATE TABLE skills (
    skill_id INT PRIMARY KEY IDENTITY(1,1),
    skill_name VARCHAR(50) NOT NULL,
    category VARCHAR(50)
);
SELECT name FROM sys.databases;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

EXEC sp_rename 'employee', 'staff';

INSERT INTO employee
(first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES
('Alice','Green','alice.green@company.com','2024-01-10',62000,4,'Female');

INSERT INTO project (project_name, budget, dept_id)
VALUES
('Mobile App',60000,2),
('Training Program',25000,1);

INSERT INTO department (dept_name, location)
VALUES ('Sales','Boston');

INSERT INTO employee (first_name,email)
VALUES ('Tom','tom@company.com');

SELECT * FROM employee;

SELECT 
emp_id AS "Employee ID",
first_name AS "Name",
email AS "Email Address"
FROM employee;

SELECT *
FROM employee
WHERE hire_date > '2023-01-01';

SELECT *
FROM project
WHERE budget > 40000
ORDER BY budget DESC;

SELECT DISTINCT location
FROM department;

ALTER TABLE employee
ADD phone_number VARCHAR(15);

UPDATE employee
SET salary = 65000
WHERE first_name = 'John'
AND last_name = 'Doe';

UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;

ALTER TABLE employee
DROP COLUMN phone_number;


SELECT * FROM employee
WHERE salary BETWEEN 60000 AND 80000;


SELECT * FROM employee
WHERE first_name LIKE 'J%';


SELECT * FROM project
WHERE dept_id IN (1,2);


SELECT * FROM employee
WHERE email IS NOT NULL;


SELECT * FROM department
WHERE location NOT IN ('New York','Chicago');


SELECT * FROM employee
WHERE YEAR(hire_date)=2023;

SELECT SUM(salary) FROM employee;

SELECT AVG(budget) FROM project;

SELECT MAX(salary) FROM employee;

SELECT COUNT(*) FROM employee
WHERE dept_id=2;

SELECT MIN(budget) FROM project;


SELECT e.first_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;


SELECT d.dept_name, COUNT(e.emp_id)
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


SELECT p.project_name, d.dept_name
FROM project p
JOIN department d
ON p.dept_id = d.dept_id;


SELECT CONCAT(first_name,' ',last_name) AS "Full Name"
FROM employee;


SELECT UPPER(dept_name)
FROM department;


SELECT LEFT(email,3)
FROM employee;


SELECT ABS(-50000);


SELECT ROUND(AVG(salary),2)
FROM employee;


SELECT *
FROM employee
ORDER BY hire_date DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


SELECT *
FROM employee
ORDER BY emp_id
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;

SELECT first_name,
CASE 
WHEN salary >=70000 THEN 'High'
ELSE 'Low'
END AS Salary_Level
FROM employee;

SELECT project_name,
CASE
WHEN budget >=60000 THEN 'Large'
WHEN budget >=40000 THEN 'Medium'
ELSE 'Small'
END AS Budget_Type
FROM project;

DELETE FROM employee
WHERE salary < 60000;

DROP TABLE project;
