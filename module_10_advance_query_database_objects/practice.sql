-- Module 10
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age  INT,
    score INT,
    department_id INT REFERENCES departments(id) ON DELETE SET NULL
);

CREATE TABLE departments(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE course_enrollments(
    id  SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE SET NULL,
    course_title VARCHAR(50),
    enrolled_on  DATE
);

INSERT INTO departments (name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Biology'),
('English Literature'),
('Economics'),
('History'),
('Psychology');


INSERT INTO students (name,age,score,department_id) VALUES
('Alice Johnson', 20, 85, 1),
('Bob Smith', 21, 78, 2),
('Charlie Brown', 22, 90, 3),
('David Wilson', 23, 88, 4),
('Eva Davis', 19, 92, 5),
('Frank Garcia', 20, 75, 6),
('Grace Lee', 21, 80, 7),
('Hannah Clark', 22, 89, 8),
('Isaac Moore', 19, 95, 1),
('James Hall', 20, 83, 2),
('Katherine Adams', 21, 87, 3),
('Liam Thomas', 22, 91, 4),
('Mia Robinson', 23, 85, 5),
('Noah Martinez', 19, 79, 6),
('Olivia Hernandez', 20, 86, 7),
('Peter Young', 21, 88, 8),
('Quincy Wright', 22, 93, 1),
('Rachel King', 23, 82, 2),
('Samuel Walker', 19, 90, 3),
('Tina Allen', 20, 77, 4),
('Umar Green', 21, 85, 5),
('Vera Baker', 22, 78, 6),
('William Carter', 23, 80, 7),
('Xander Nelson', 19, 96, 8),
('Yasmine Rodriguez', 20, 84, 1),
('Zachary Scott', 21, 88, 2),
('Abigail Mitchell', 22, 75, 3),
('Benjamin Perez', 23, 91, 4),
('Cameron Stewart', 19, 79, 5),
('Daniel White', 20, 83, 6),
('Eliza Baker', 21, 90, 7),
('Felix Cooper', 22, 87, 8),
('Gabriella Evans', 23, 81, 1),
('Henry Taylor', 19, 94, 2),
('Isabelle Morgan', 20, 77, 3),
('Jacob Foster', 21, 86, 4),
('Kelsey Reed', 22, 89, 5),
('Leo Parker', 23, 92, 6),
('Mason Edwards', 19, 85, 7),
('Natalie Barnes', 20, 80, 8);

INSERT INTO course_enrollments (student_id,course_title,enrolled_on) VALUES
(1, 'Database Systems', '2025-01-10'),
(2, 'Linear Algebra', '2025-02-12'),
(3, 'Quantum Mechanics', '2025-03-05'),
(4, 'Genetics', '2025-04-08'),
(5, 'Shakespearean Literature', '2025-05-20'),
(6, 'Macroeconomics', '2025-06-15'),
(7, 'World History', '2025-07-22'),
(8, 'Cognitive Psychology', '2025-08-19'),
(9, 'Artificial Intelligence', '2025-09-11'),
(10, 'Statistics', '2025-10-03'),
(11, 'Electromagnetism', '2025-11-28'),
(12, 'Biochemistry', '2025-12-05'),
(13, 'Modern Poetry', '2025-01-17'),
(14, 'Microeconomics', '2025-02-25'),
(15, 'Ancient Civilizations', '2025-03-30'),
(16, 'Behavioral Psychology', '2025-04-12'),
(17, 'Software Engineering', '2025-05-19'),
(18, 'Mathematical Modeling', '2025-06-23'),
(19, 'Astrophysics', '2025-07-27'),
(20, 'Molecular Biology', '2025-08-31'),
(21, 'British Literature', '2025-09-05'),
(22, 'Game Theory', '2025-10-12'),
(23, 'World War II History', '2025-11-18'),
(24, 'Neuroscience', '2025-12-22'),
(25, 'Computer Networks', '2025-01-29'),
(26, 'Differential Equations', '2025-02-14'),
(27, 'Thermodynamics', '2025-03-06'),
(28, 'Ecology', '2025-04-10'),
(29, 'Victorian Novels', '2025-05-15'),
(30, 'Financial Economics', '2025-06-21'),
(31, 'Renaissance History', '2025-07-28'),
(32, 'Social Psychology', '2025-08-26'),
(33, 'Data Science', '2025-09-14'),
(34, 'Combinatorics', '2025-10-09'),
(35, 'Solid State Physics', '2025-11-06'),
(36, 'Marine Biology', '2025-12-03'),
(37, 'Romantic Poetry', '2025-01-15'),
(38, 'Behavioral Economics', '2025-02-20'),
(39, 'Revolutions of the 20th Century', '2025-03-22'),
(40, 'Experimental Psychology', '2025-04-28');

SELECT * FROM students;
SELECT round(avg(score)) FROM students;

-- Retrieve all students who scored higher than the average score.

SELECT * FROM students
WHERE score > (SELECT round(avg(score)) FROM students);

-- Find students whose age is greater than the average age of all students.

SELECT * FROM students
WHERE age > (SELECT round(avg(age)) from students);

-- Get names of students who are enrolled in any course (use IN with subquery).

SELECT * FROM students
JOIN course_enrollments ON students.id = course_enrollments.student_id;

-- Get names of students who are enrolled in any course (use IN with subquery).

SELECT name FROM students
WHERE students.id IN (SELECT student_id FROM course_enrollments);


-- Retrieve departments with at least one student scoring above 90 (use EXISTS).

SELECT name FROM departments
WHERE EXISTS (
    SELECT True
    FROM students
    WHERE students.department_id = departments.id AND students.score > 90
);

-- Create a view to show each student’s name, department, and score.
CREATE VIEW students_view
AS
SELECT students.name,departments.name as department,score FROM students
JOIN departments ON students.department_id = departments.id;

SELECT * FROM students_view;

-- Create a view that lists all students enrolled in any course with the enrollment date.
CREATE VIEW enrolled_students
AS
SELECT s.*,ce.enrolled_on FROM students as s
JOIN course_enrollments as ce ON ce.student_id =  s.id;

SELECT * FROM enrolled_students;

-- Create a function that takes a student's score and returns a grade (e.g., A, B, C, F).
CREATE or replace function grade_count(score int)
RETURNS VARCHAR(10)
LANGUAGE plpgsql
AS
$$
    BEGIN
        IF score >= 70 AND score < 80 THEN
            RETURN 'A';
        ELSEIF score >=80 AND score < 100 THEN
            RETURN 'A+';
        ELSEIF score >=50 AND score < 60 THEN
            RETURN 'B';
        ELSEIF score >=40 AND score < 50 THEN
            RETURN 'C';
        ELSE
            RETURN 'F';
        END IF;
    END;
$$;


SELECT grade_count(90);

CREATE or replace FUNCTION get_student_details(student_id int)
RETURNS TABLE(
    name VARCHAR(50),
    department_name VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN QUERY
        SELECT s.name,d.name as department_name
        FROM students as s
        JOIN departments as d ON s.department_id = d.id
        WHERE s.id=student_id;
    END;
$$;

SELECT * FROM get_student_details(7);

SELECT * FROM students;