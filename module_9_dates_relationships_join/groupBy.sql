CREATE TABLE students(
    roll INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(20),
    score INT,
    status VARCHAR(20),
    student_email VARCHAR(100) UNIQUE,
    last_login DATE,
    dob DATE,
    blood_group VARCHAR(3),
    country VARCHAR(50),
    course VARCHAR(100)

);
SELECT * FROM students;
INSERT INTO students (roll, name, age, department, score, status, student_email, last_login, dob, blood_group, country, course) VALUES
(341, 'Harun', 22, 'CSE', 81, 'Passed', 'harun341@example.com', '2025-05-02', '2003-02-10', 'O+', 'Bangladesh', 'Database Systems'),
(342, 'Sumaiya', 21, 'EEE', 77, 'Passed', 'sumaiya342@example.com', '2024-11-11', '2004-05-15', 'A-', 'India', 'Circuit Analysis'),
(343, 'Tanzim', 23, 'BBA', 63, 'Passed', 'tanzim343@example.com', '2025-03-14', '2002-12-08', 'B+', 'Pakistan', 'Marketing Strategies'),
(344, 'Mithila', 22, 'CSE', 88, 'Passed', 'mithila344@example.com', '2024-09-19', '2003-09-25', 'AB+', 'Nepal', 'Artificial Intelligence'),
(345, 'Sakib', 20, 'EEE', 56, 'Failed', 'sakib345@example.com', '2025-01-09', '2005-06-17', 'O-', 'Bangladesh', 'Power Electronics'),
(346, 'Rima', 24, 'BBA', 90, 'Passed', 'rima346@example.com', '2025-04-07', '2001-04-23', 'A+', 'Sri Lanka', 'Financial Accounting'),
(347, 'Rakib', 22, 'CSE', 72, 'Passed', 'rakib347@example.com', '2024-07-30', '2003-11-28', 'B-', 'India', 'Data Structures'),
(348, 'Tasnim', 21, 'EEE', 85, 'Passed', 'tasnim348@example.com', '2025-06-01', '2004-08-03', 'AB-', 'Bangladesh', 'Digital Signal Processing'),
(349, 'Nayeem', 23, 'BBA', 59, 'Passed', 'nayeem349@example.com', '2024-10-15', '2002-05-19', 'O+', 'Pakistan', 'Organizational Behavior'),
(350, 'Shafi', 22, 'CSE', 79, 'Passed', 'shafi350@example.com', '2025-02-25', '2003-07-11', 'A-', 'Nepal', 'Computer Networks'),
(351, 'Sadia', 21, 'EEE', 93, 'Passed', 'sadia351@example.com', '2024-08-08', '2004-03-14', 'B+', 'Bangladesh', 'Microelectronics'),
(352, 'Tahmid', 24, 'BBA', 42, 'Failed', 'tahmid352@example.com', '2025-04-13', '2001-09-21', 'AB+', 'India', 'International Business'),
(353, 'Jannat', 22, 'CSE', 86, 'Passed', 'jannat353@example.com', '2024-12-03', '2003-06-09', 'O-', 'Sri Lanka', 'Artificial Intelligence'),
(354, 'Miraz', 20, 'EEE', 78, 'Passed', 'miraz354@example.com', '2025-01-17', '2005-02-27', 'A+', 'Bangladesh', 'Control Systems'),
(355, 'Safwan', 23, 'BBA', 65, 'Passed', 'safwan355@example.com', '2024-07-26', '2002-08-11', 'B-', 'Pakistan', 'Strategic Management'),
(356, 'Anika', 21, 'CSE', 75, 'Passed', 'anika356@example.com', '2025-05-30', '2004-11-12', 'AB-', 'Bangladesh', 'Operating Systems'),
(357, 'Zahin', 22, 'EEE', 55, 'Failed', 'zahin357@example.com', '2024-06-05', '2003-04-05', 'O+', 'India', 'Embedded Systems'),
(358, 'Mahi', 20, 'BBA', 88, 'Passed', 'mahi358@example.com', '2025-03-18', '2005-12-15', 'A-', 'Nepal', 'Corporate Finance'),
(359, 'Arif', 23, 'CSE', 91, 'Passed', 'arif359@example.com', '2024-09-14', '2002-07-28', 'B+', 'Sri Lanka', 'Cybersecurity'),
(360, 'Labib', 21, 'EEE', 70, 'Passed', 'labib360@example.com', '2025-02-09', '2004-05-04', 'AB+', 'Pakistan', 'Power Systems');
-- ALTER TABLE students
--     ADD COLUMN country VARCHAR(20);
-- DROP Table students;

SELECT country,age FROM students 
    GROUP BY country;

SELECT country,count(*),avg(age) FROM students
    GROUP BY country;


SELECT country,avg(age) FROM students
    GROUP BY country
        HAVING avg(age)>20.90;

-- Filter Groups Using HAVING to Show Only Countries with Average Age Above 22
SELECT country,avg(age) FROM students
    GROUP BY country
        HAVING avg(age)>22;
-- Count Students Born in Each Year
SELECT extract(year from dob) as birth_year,count(*)
    FROM students
    GROUP BY birth_year;



