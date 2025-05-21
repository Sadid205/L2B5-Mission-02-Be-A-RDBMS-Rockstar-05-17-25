-- Active: 1747413813562@@127.0.0.1@5432@ph2
-- CREATE DATABASE ph2;
CREATE Table employees(
    emp_no SERIAL PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    hire_date DATE
);

SELECT * FROM employees;
EXPLAIN ANALYSE
SELECT * FROM employees WHERE last_name = 'Jones';

CREATE INDEX idx_employees_last_name
on employees(last_name);
CREATE INDEX idx_hash_employees_last_name
on employees USING HASH(last_name);
SHOW data_directory;