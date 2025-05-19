CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10,2),
    hire_date DATE
);


CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
)

INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Finance'),
('Marketing'),
('Sales'),
('IT'),
('Customer Support'),
('Operations'),
('Legal'),
('Research & Development'),
('Administration');

INSERT INTO employees (employee_name,department_id,salary,hire_date) VALUES
('Alice Johnson', 1, 55000.00, '2022-03-15'),
('Bob Smith', 2, 62000.00, '2021-07-22'),
('Charlie Brown', 3, 48000.00, '2023-01-10'),
('David Lee', 4, 75000.00, '2020-11-05'),
('Emma Davis', 5, 68000.00, '2019-06-30'),
('Frank Wilson', 6, 52000.00, '2022-09-18'),
('Grace Miller', 7, 59000.00, '2021-12-25'),
('Henry Clark', 8, 71000.00, '2020-04-14'),
('Isabella White', 9, 77000.00, '2018-08-08'),
('Jack Harris', 10, 53000.00, '2023-02-20'),
('Liam Scott', 1, 56000.00, '2022-05-10'),
('Sophia Green', 2, 63000.00, '2021-08-15'),
('Ethan Baker', 3, 49000.00, '2023-02-05'),
('Olivia Adams', 4, 76000.00, '2020-12-12'),
('Noah Carter', 5, 69000.00, '2019-07-25'),
('Mia Thompson', 6, 53000.00, '2022-10-30'),
('Lucas Martinez', 7, 60000.00, '2021-11-18'),
('Ava Robinson', 8, 72000.00, '2020-05-22'),
('William Walker', 9, 78000.00, '2018-09-14'),
('Emily Hall', 10, 54000.00, '2023-03-08'),
('James Allen', 1, 57000.00, '2022-06-20'),
('Charlotte Young', 2, 64000.00, '2021-09-10'),
('Benjamin King', 3, 50000.00, '2023-03-15'),
('Amelia Wright', 4, 77000.00, '2020-01-05'),
('Daniel Scott', 5, 70000.00, '2019-08-30'),
('Ella Lewis', 6, 54000.00, '2022-11-25'),
('Matthew Hill', 7, 61000.00, '2021-12-10'),
('Harper Nelson', 8, 73000.00, '2020-06-18'),
('Alexander Perez', 9, 79000.00, '2018-10-22'),
('Sofia Turner', 10, 55000.00, '2023-04-01'),
('Ryan Collins', 1, 58000.00, '2022-07-15'),
('Zoe Edwards', 2, 65000.00, '2021-10-05'),
('Nathan Morris', 3, 51000.00, '2023-04-20'),
('Lily Stewart', 4, 78000.00, '2020-02-10'),
('Samuel Rogers', 5, 71000.00, '2019-09-15'),
('Hannah Reed', 6, 55000.00, '2022-12-05'),
('Mason Cook', 7, 62000.00, '2021-01-20'),
('Chloe Bailey', 8, 74000.00, '2020-07-30'),
('Jacob Foster', 9, 80000.00, '2018-11-10'),
('Victoria Sanders', 10, 56000.00, '2023-05-05');


SELECT * FROM employees
INNER JOIN departments ON employees.department_id=departments.department_id;
SELECT * FROM employees
INNER JOIN departments USING(department_id);

SELECT department_name,round(avg(salary)) as avg_salary FROM employees
INNER JOIN departments USING(department_id)
GROUP BY department_name;
SELECT department_name,count(employee_id) FROM employees
INNER JOIN departments USING(department_id)
GROUP BY department_name;

SELECT department_name,round(avg(salary)) as avg_salary from employees
INNER JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1


SELECT extract(YEAR from hire_date) as hire_year,count(*) FROM employees
GROUP BY hire_year;
