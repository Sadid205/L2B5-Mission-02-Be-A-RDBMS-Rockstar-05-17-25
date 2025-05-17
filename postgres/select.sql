CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('John', 'Doe', 20, 'A+', 'Computer Science', 'johndoe@example.com', '2005-04-15', 'O+', 'USA'),
('Emily', 'Smith', 22, 'B', 'Mathematics', NULL, '2003-08-21', 'A-', 'UK'),
('Raj', 'Kumar', 19, 'A', 'Physics', 'rajkumar@example.com', '2006-01-10', 'B+', 'India'),
('Sara', 'Ahmed', 21, 'C+', 'Biology', NULL, '2004-07-30', 'AB-', 'Bangladesh'),
('Liam', 'Brown', 18, 'B-', 'Chemistry', 'liambrown@example.com', '2007-11-05', 'O-', 'Canada'),
('Sophia', 'Garcia', 23, 'A', 'Engineering', 'sophiagarcia@example.com', '2002-06-17', 'B-', 'Mexico'),
('Ethan', 'Williams', 20, 'A-', 'Data Science', NULL, '2005-09-25', 'O+', 'Australia'),
('Mia', 'Johnson', 22, 'B+', 'Medicine', 'miajohnson@example.com', '2003-05-14', 'A+', 'Germany'),
('Noah', 'Martinez', 19, 'C', 'Philosophy', NULL, '2006-03-08', 'AB+', 'Spain'),
('Aisha', 'Khan', 21, 'A', 'Economics', 'aishakhan@example.com', '2004-12-22', 'B+', 'Pakistan'),
('William', 'Taylor', 20, 'B-', 'Psychology', 'williamtaylor@example.com', '2005-07-19', 'O-', 'France'),
('Olivia', 'Harris', 22, 'A', 'Political Science', NULL, '2003-11-02', 'A-', 'Italy'),
('Daniel', 'Rodriguez', 19, 'C+', 'Music', 'danielrodriguez@example.com', '2006-05-31', 'B+', 'Brazil'),
('Chloe', 'Scott', 21, 'B+', 'Journalism', 'chloescott@example.com', '2004-09-15', 'AB-', 'South Africa'),
('James', 'Wilson', 18, 'A-', 'Astronomy', NULL, '2007-12-20', 'O+', 'Japan'),
('Emma', 'Evans', 23, 'B', 'Marketing', 'emmaevans@example.com', '2002-03-07', 'B-', 'Netherlands'),
('Benjamin', 'Thomas', 20, 'A+', 'Statistics', 'benjaminthomas@example.com', '2005-06-11', 'A+', 'Russia'),
('Charlotte', 'White', 22, 'B-', 'Literature', NULL, '2003-10-04', 'O-', 'China'),
('Lucas', 'Green', 19, 'C', 'History', 'lucasgreen@example.com', '2006-08-28', 'AB+', 'Argentina'),
('Ella', 'Moore', 21, 'A', 'Sociology', NULL, '2004-02-18', 'B+', 'South Korea');

SELECT *  FROM students ORDER BY dob DESC;

SELECT DISTINCT blood_group from students;


-- Select students from the USA
-- Select students with 'A' grade in Physics
-- Select students with a  specific blood group ('A+')
-- Select students from the USA or from Australia
-- Select students from the USA or from Australia and the age is 20
-- Select students with a grade of 'A' or 'B' in Math or Physics:
-- Select students than 20

-- where
SELECT * from students
    WHERE (country = 'USA' OR country = 'Bangladesh') and age = 20;


SELECT * from students
    where country <> 'USA';

SELECT length(first_name)  from students;

/*
@Scalar functions
UPPER() Converts a string to uppercase.
LOWER() Converts a string to lowercase
CONCAT() Concatenates two or more strings.
LENGTH() Returns the number of charecters in a string.


@Aggregate functions
AVG() Calculate the average of a set of values.
MAX() Returns the max value in a set.
MIN() Returns the minimum value in a set.
SUM() Calculates the sum of values in a set.
COUNT() Counts the number of rows in a set.
*/


SELECT count(*) from students;

SELECT max(length(first_name)) from students;

SELECT * FROM students;

SELECT * from students
    WHERE NOT country = 'USA';

-- SELECT NULL = 1;

select * FROM students
    WHERE email IS NOT NULL;

SELECT COALESCE(email,'Email not provided') as "Email",blood_group,first_name from students


-- SELECT * FROM students WHERE country = 'USA' or country='Canada' or country='UK';
SELECT * FROM students 
    WHERE country IN('USA','UK','Canada');
SELECT * FROM students 
    WHERE country NOT IN('USA','UK','Canada');

SELECT * FROM students 
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob;

SELECT * FROM students
    WHERE first_name LIKE '___a';

SELECT * FROM students
    WHERE first_name ILIKE 'A%';


SELECT * FROM students 
    WHERE country NOT IN('USA','UK','Canada') LIMIT 5;

SELECT * FROM students LIMIT 5 OFFSET 5*0;
SELECT * FROM students LIMIT 5 OFFSET 5*1;
SELECT * FROM students LIMIT 5 OFFSET 5*2;
SELECT * FROM students LIMIT 5 OFFSET 5*3;



SELECT * FROM students
    WHERE country = 'Argentina';

DELETE FROM students
    WHERE grade = 'C' AND country='Argentina';


SELECT * FROM students;

UPDATE students
    set email = 'default@gmail.com',age = 30,course=''
    WHERE student_id = 44;
