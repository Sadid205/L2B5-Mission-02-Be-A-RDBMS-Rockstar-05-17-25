-- Create a foreign key constraint on department_id in the students table referencing departments(id).
CREATE TABLE students(
    id  SERIAL PRIMARY KEY,
    name    VARCHAR(50),
    department_id INT REFERENCES departments(department_id) ON DELETE CASCADE,
    last_login  DATE
);

ALTER TABLE students
ADD constraint fk_students_departments
FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL;


create TABLE departments(
    department_id  SERIAL PRIMARY KEY,
    title    VARCHAR(10)
);


CREATE TABLE courses(
    id  SERIAL PRIMARY KEY,
    title VARCHAR(50)
);

ALTER TABLE departments
ALTER COLUMN name TYPE VARCHAR(50);

INSERT INTO departments (title) VALUES
('CS'),
('Business'),
('Mech Eng'),
('Elec Eng'),
('Civil Eng'),
('Biotech'),
('Psychology'),
('Math'),
('Physics'),
('Chemistry');



INSERT INTO students(name,department_id,last_login) VALUES
('Arif Rahman', 1, '2025-05-01'),
('Bithi Akter', 2, '2025-05-02'),
('Chowdhury Hasan', 3, '2025-05-03'),
('Dipa Saha', 4, '2025-05-04'),
('Emran Hossain', 5, '2025-05-05'),
('Farzana Ahmed', 6, '2025-05-06'),
('Gazi Mahmud', 7, '2025-05-07'),
('Hasan Karim', 8, '2025-05-08'),
('Ishrat Jahan', 9, '2025-05-09'),
('Jahidul Islam', 10, '2025-05-10');






INSERT INTO courses(title) VALUES
('Introduction to Programming'),
('Calculus I'),
('Physics for Engineers'),
('Organic Chemistry'),
('Genetics'),
('Shakespearean Literature'),
('World History'),
('Microeconomics'),
('Cognitive Psychology'),
('Ethics and Philosophy'),
('International Relations'),
('Social Research Methods'),
('Marketing Principles'),
('Mechanical Engineering Basics'),
('Human Anatomy'),
('Constitutional Law'),
('Music Theory'),
('Painting Techniques'),
('Educational Psychology'),
('Data Analysis');


SELECT * FROM students;

-- Retrieve students who have logged in within the last 30 days.
SELECT * FROM students
WHERE last_login BETWEEN ( CURRENT_DATE - INTERVAL '30 days') AND CURRENT_DATE;

SELECT min(last_login),max(last_login) FROM students;

-- Extract the login month from the last_login and group students by month.
SELECT extract(MONTH FROM last_login) as month_number,TO_CHAR(last_login,'Month') as month_name,count(*) as total_students FROM students
GROUP BY month_number,TO_CHAR(last_login,'Month')
ORDER BY month_number;


-- Count how many students logged in per month and show only those months where login count is more than 3.
SELECT extract(MONTH FROM last_login) as month_number,TO_CHAR(last_login,'Month') as month_name,count(*) as total_logged_in FROM students
GROUP BY month_number,month_name
HAVING count(*) > 3
ORDER BY month_number;


-- Try inserting a student with a department_id that doesn’t exist and observe the behavior.
INSERT INTO students(name,department_id,last_login) VALUES
('korim',60,'2025-05-02');

-- Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.
DELETE FROM departments
WHERE department_id = 5;

SELECT * FROM students;
DROP TABLE students;
DROP TABLE departments;
SELECT * FROM students WHERE department_id = 6;

-- Join students and departments using INNER JOIN to display each student's department name.
SELECT students.*,departments.title as department_name FROM students
INNER JOIN departments ON students.department_id=departments.department_id;

-- Use a LEFT JOIN to show all students including those without a department.
SELECT * FROM students
LEFT JOIN departments ON students.department_id=departments.department_id;

-- Use a RIGHT JOIN to show all departments including those without students.

SELECT * FROM students
RIGHT JOIN departments ON students.department_id=departments.department_id;
-- Perform a FULL JOIN to get all records from both students and departments.
SELECT * FROM students
FULL JOIN departments ON students.department_id=departments.department_id;

-- Create a cross-product of all students and courses using CROSS JOIN.
SELECT * FROM students
CROSS JOIN courses;



ALTER TABLE departments
RENAME COLUMN id to department_id;



-- Use NATURAL JOIN between tables that have a shared column like department_id.


SELECT * FROM students
JOIN departments USING(department_id);

SELECT * FROM students
NATURAL JOIN departments;


SELECT * FROM students;
SELECT * FROM departments;

ALTER TABLE departments
RENAME COLUMN name to title;
