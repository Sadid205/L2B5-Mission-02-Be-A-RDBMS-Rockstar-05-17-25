CREATE Table students (
    id SERIAL PRIMARY KEY,
    roll INT UNIQUE,
    name VARCHAR(50),
    age INT,
    department VARCHAR(20),
    score INT,
    status VARCHAR(20)
)

-- Add Column

ALTER TABLE students
    ADD COLUMN email VARCHAR(50) NOT NULL;

-- Rename Column
ALTER TABLE students
    RENAME COLUMN email to student_email;

-- Add UNIQUE constraint 
ALTER TABLE students
    ADD constraint unique_students_student_email UNIQUE(student_email);


CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credit INT
)


SELECT * FROM students

ALTER TABLE students
DROP COLUMN last_login;

-- Insert data into students table.
INSERT INTO students (roll,name,age,department,score,status,student_email) VALUES
(101, 'Abdullah', 21, 'CSE', 85, 'Passed', 'abdullah101@example.com'),
(102, 'Rahim', 22, 'EEE', 78, 'Passed', 'rahim102@example.com'),
(103, 'Karim', 20, 'BBA', 67, 'Passed', 'karim103@example.com'),
(104, 'Fatima', 23, 'CSE', 92, 'Passed', 'fatima104@example.com'),
(105, 'Hassan', 21, 'EEE', 55, 'Failed', 'hassan105@example.com'),
(106, 'Aisha', 22, 'BBA', 89, 'Passed', 'aisha106@example.com'),
(107, 'Mehedi', 24, 'CSE', 74, 'Passed', 'mehedi107@example.com'),
(108, 'Nadia', 20, 'EEE', 90, 'Passed', 'nadia108@example.com'),
(109, 'Ibrahim', 23, 'BBA', 60, 'Passed', 'ibrahim109@example.com'),
(110, 'Tariq', 21, 'CSE', 80, 'Passed', 'tariq110@example.com'),
(111, 'Zara', 22, 'EEE', 95, 'Passed', 'zara111@example.com'),
(112, 'Omar', 23, 'BBA', 40, 'Failed', 'omar112@example.com'),
(113, 'Samira', 20, 'CSE', 88, 'Passed', 'samira113@example.com'),
(114, 'Farhan', 24, 'EEE', 79, 'Passed', 'farhan114@example.com'),
(115, 'Lina', 22, 'BBA', 82, 'Passed', 'lina115@example.com'),
(116, 'Adnan', 21, 'CSE', 73, 'Passed', 'adnan116@example.com'),
(117, 'Sara', 23, 'EEE', 58, 'Failed', 'sara117@example.com'),
(118, 'Rafi', 20, 'BBA', 94, 'Passed', 'rafi118@example.com'),
(119, 'Yasmin', 22, 'CSE', 87, 'Passed', 'yasmin119@example.com'),
(120, 'Zayed', 24, 'EEE', 65, 'Passed', 'zayed120@example.com');

INSERT INTO students (roll,name,age,department,score,status,student_email) VALUES
(121, 'Amin', 22, 'CSE', NULL, 'Pending', 'amin121@example.com'),
(122, 'Rubina', 20, 'EEE', 85, 'Passed', 'rubina122@example.com'),
(123, 'Sajid', 23, 'BBA', NULL, 'Pending', 'sajid123@example.com'),
(124, 'Farah', 21, 'CSE', 78, 'Passed', 'farah124@example.com'),
(125, 'Nasir', 24, 'EEE', NULL, 'Pending', 'nasir125@example.com'),
(126, 'Tania', 22, 'BBA', 90, 'Passed', 'tania126@example.com'),
(127, 'Kabir', 23, 'CSE', NULL, 'Pending', 'kabir127@example.com'),
(128, 'Nusrat', 20, 'EEE', 95, 'Passed', 'nusrat128@example.com'),
(129, 'Imran', 21, 'BBA', NULL, 'Pending', 'imran129@example.com'),
(130, 'Jahid', 24, 'CSE', 88, 'Passed', 'jahid130@example.com');


-- Write a query to find all students who have a score greater than 80 and not null
SELECT * FROM students
 WHERE score > 80 and score IS NOT NULL;

-- Use the NOT operator to exclude students from a specific department.

SELECT * FROM students
    WHERE NOT department = 'EEE';

-- Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM students
    WHERE name LIKE 'A%';

SELECT * FROM students
    WHERE NAME ILIKE 'A%';

-- Select all students whose age is between 18 and 25.
SELECT * FROM students
    WHERE age BETWEEN 18 AND 25;

-- Retrieve rows using IN for a specific set of roll numbers.

SELECT * FROM students;

-- Retrieve rows using IN for a specific set of roll numbers.
SELECT * FROM students
    WHERE roll IN (101,102,105,109,125);

-- Count how many students exist in the students table.
SELECT count(*) FROM students;




-- Find the average score of students in a specific department.
SELECT avg(score) FROM students
    WHERE department = 'CSE';

-- Get the maximum and minimum age of all students.
SELECT max(age) FROM students;
SELECT min(age) FROM students;


SELECT * FROM students;

-- Update the status of students who scored less than 50 to 'failed'
UPDATE students
    set "status" = 'failed'
    WHERE score < 60;
SELECT * FROM students
    WHERE score < 60;

ALTER TABLE students
    ADD COLUMN last_login DATE DEFAULT '01-02-25';

INSERT INTO students (roll,name,age,department,score,status,student_email,last_login) VALUES
(201, 'Abdullah', 21, 'CSE', 85, 'Passed', 'abdullah201@example.com', '2025-05-01'),
(202, 'Rahim', 22, 'EEE', 78, 'Passed', 'rahim202@example.com', '2024-10-21'),
(203, 'Karim', 20, 'BBA', 67, 'Passed', 'karim203@example.com', '2025-04-15'),
(204, 'Fatima', 23, 'CSE', 92, 'Passed', 'fatima204@example.com', '2024-12-08'),
(205, 'Hassan', 21, 'EEE', 55, 'Failed', 'hassan205@example.com', '2025-03-10'),
(206, 'Aisha', 22, 'BBA', 89, 'Passed', 'aisha206@example.com', '2025-02-05'),
(207, 'Mehedi', 24, 'CSE', 74, 'Passed', 'mehedi207@example.com', '2024-09-29'),
(208, 'Nadia', 20, 'EEE', 90, 'Passed', 'nadia208@example.com', '2025-01-25'),
(209, 'Ibrahim', 23, 'BBA', 60, 'Passed', 'ibrahim209@example.com', '2024-11-19'),
(210, 'Tariq', 21, 'CSE', 80, 'Passed', 'tariq210@example.com', '2025-06-05'),
(211, 'Zara', 22, 'EEE', 95, 'Passed', 'zara211@example.com', '2025-04-29'),
(212, 'Omar', 23, 'BBA', 40, 'Failed', 'omar212@example.com', '2024-08-14'),
(213, 'Samira', 20, 'CSE', 88, 'Passed', 'samira213@example.com', '2025-03-21'),
(214, 'Farhan', 24, 'EEE', 79, 'Passed', 'farhan214@example.com', '2024-07-23'),
(215, 'Lina', 22, 'BBA', 82, 'Passed', 'lina215@example.com', '2025-05-30'),
(216, 'Adnan', 21, 'CSE', 73, 'Passed', 'adnan216@example.com', '2024-12-31'),
(217, 'Sara', 23, 'EEE', 58, 'Failed', 'sara217@example.com', '2025-02-28'),
(218, 'Rafi', 20, 'BBA', 94, 'Passed', 'rafi218@example.com', '2024-06-09'),
(219, 'Yasmin', 22, 'CSE', 87, 'Passed', 'yasmin219@example.com', '2025-01-10'),
(220, 'Zayed', 24, 'EEE', 65, 'Passed', 'zayed220@example.com', '2024-05-17');

SELECT * FROM students;

-- Delete students who have not logged in since last year.
DELETE FROM students
    WHERE last_login < '2025-01-01';

-- Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM students LIMIT 5 OFFSET 5;
