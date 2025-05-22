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

SELECT * FROM students;
INSERT INTO students (name,age,score,department_id) VALUES
('Alice Johnson', 20, 85, 1),
('Bob Smith', 22, 90, 2),
('Charlie Brown', 19, 78, 3),
('David Wilson', 21, 88, 1),
('Emma Davis', 23, 92, 2),
('Frank Martin', 20, 81, 3),
('Grace Lee', 22, 87, 1),
('Henry Thompson', 24, 93, 2),
('Isabella White', 19, 76, 3),
('Jack Harris', 21, 89, 1),
('Katherine Clark', 22, 85, 2),
('Liam Walker', 20, 82, 3),
('Mia Hall', 23, 94, 1),
('Nathan Scott', 21, 88, 2),
('Olivia Adams', 19, 79, 3),
('Peter Baker', 22, 86, 1),
('Quinn Carter', 20, 90, 2),
('Rachel Evans', 24, 95, 3),
('Samuel Green', 21, 83, 1),
('Taylor King', 22, 91, 2);


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

-- Write a stored procedure to update a student's department.
CREATE Procedure update_student(std_id int,dpt_id int)
LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE students
        set department_id = dpt_id
        WHERE students.id = std_id;
    END
$$;

call update_student(1,4);
SELECT * FROM students;

SELECT * FROM students
LEFT JOIN course_enrollments ON students.id = course_enrollments.student_id;

-- Write a procedure to delete students who haven't enrolled in any course.
CREATE PROCEDURE delete_students()
LANGUAGE plpgsql
AS
$$
    BEGIN 
        DELETE FROM students
        WHERE id IN (
            SELECT s.id FROM students as s
            LEFT JOIN course_enrollments as ce ON s.id = ce.student_id
            WHERE ce.student_id IS NULL
        );
    END
$$;

call delete_students();
SELECT * FROM students;

CREATE TABLE enrollments_log(
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    enroll_time TIMESTAMP
);

-- Create a trigger that automatically logs enrollment when a student is added to course_enrollments.

CREATE or replace FUNCTION add_logs()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO enrollments_log(student_id,enroll_time) VALUES(NEW.student_id,now());
        RETURN OLD;
    END
$$;

CREATE TRIGGER add_enrolled_student
AFTER INSERT
ON course_enrollments
FOR EACH ROW
EXECUTE FUNCTION add_logs();

SELECT * FROM enrollments_log;

INSERT INTO course_enrollments(student_id,course_title,enrolled_on) VALUES
(8, 'Psychology', '2025-05-08'),
(7, 'History', '2025-05-07');

-- TRUNCATE Table enrollments_log;

-- Add a trigger that sets the score to 0 if a new student record is added without a score.

CREATE or replace FUNCTION add_score()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        IF NEW.score IS NULL THEN
            NEW.score := 0;
        END IF;
        RETURN NEW;
    END;
$$;

CREATE or replace TRIGGER add_score_trigger
BEFORE INSERT
ON students
FOR EACH ROW
EXECUTE FUNCTION add_score();

INSERT INTO students(name,age,department_id) VALUES
('Charlie Brown', 19, 3),
('David Wilson', 21, 1);
SELECT * FROM students WHERE department_id = 3;

-- Add an index to the score column in the students table.
DO $$ 
DECLARE 
    i INT := 1;
BEGIN
    WHILE i <= 600000 LOOP
        INSERT INTO students (name, age, score, department_id)
        VALUES ('Student ' || i, 18 + (i % 10), 50 + (i % 51), 1 + (i % 8));
        i := i + 1;
    END LOOP;
END $$;

-- Add an index to the score column in the students table.
CREATE INDEX idx_students_score
ON students(score);
-- Compare query performance with and without indexes using EXPLAIN.
EXPLAIN ANALYSE
SELECT * FROM students WHERE score = 88;

DROP INDEX idx_students_score;

-- Add a composite index on student_id and enrolled_on in the course_enrollments table.
CREATE INDEX idx_course_enrollments_student_id_enrolled_on
ON course_enrollments(student_id,enrolled_on);

-- Compare query performance with and without indexes using EXPLAIN.
EXPLAIN ANALYSE
SELECT * FROM course_enrollments WHERE student_id=704438 AND enrolled_on='2024-06-01';

