
SHOW timezone;

SELECT now()

CREATE TABLE timez (ts TIMESTAMP without time zone,tsz TIMESTAMP with time zone);

INSERT INTO timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00');

SELECT * FROM timez;

SELECT now();

SELECT CURRENT_DATE;

SELECT now()::time;


SELECT to_char(now(),'DDD');

SELECT CURRENT_DATE -INTERVAL '1 year 2 month';

select age(CURRENT_DATE,'2002-05-17');

SELECT * FROM students;

ALTER TABLE students
    ADD COLUMN dob DATE DEFAULT '2000-05-21';
INSERT INTO students (roll,name,age,department,score,status,student_email,last_login,dob) VALUES
(301, 'Abdullah', 21, 'CSE', 85, 'Passed', 'abdullah301@example.com', '2025-05-01', '2004-03-15'),
(302, 'Rahim', 22, 'EEE', 78, 'Passed', 'rahim302@example.com', '2024-10-21', '2003-07-22'),
(303, 'Karim', 20, 'BBA', 67, 'Passed', 'karim303@example.com', '2025-04-15', '2005-01-10'),
(304, 'Fatima', 23, 'CSE', 92, 'Passed', 'fatima304@example.com', '2024-12-08', '2002-09-05'),
(305, 'Hassan', 21, 'EEE', 55, 'Failed', 'hassan305@example.com', '2025-03-10', '2004-06-18'),
(306, 'Aisha', 22, 'BBA', 89, 'Passed', 'aisha306@example.com', '2025-02-05', '2003-11-25'),
(307, 'Mehedi', 24, 'CSE', 74, 'Passed', 'mehedi307@example.com', '2024-09-29', '2001-08-19'),
(308, 'Nadia', 20, 'EEE', 90, 'Passed', 'nadia308@example.com', '2025-01-25', '2005-04-12'),
(309, 'Ibrahim', 23, 'BBA', 60, 'Passed', 'ibrahim309@example.com', '2024-11-19', '2002-06-07'),
(310, 'Tariq', 21, 'CSE', 80, 'Passed', 'tariq310@example.com', '2025-06-05', '2004-09-30'),
(311, 'Zara', 22, 'EEE', 95, 'Passed', 'zara311@example.com', '2025-04-29', '2003-05-14'),
(312, 'Omar', 23, 'BBA', 40, 'Failed', 'omar312@example.com', '2024-08-14', '2002-12-02'),
(313, 'Samira', 20, 'CSE', 88, 'Passed', 'samira313@example.com', '2025-03-21', '2005-07-09'),
(314, 'Farhan', 24, 'EEE', 79, 'Passed', 'farhan314@example.com', '2024-07-23', '2001-10-16'),
(315, 'Lina', 22, 'BBA', 82, 'Passed', 'lina315@example.com', '2025-05-30', '2003-03-28'),
(316, 'Adnan', 21, 'CSE', 73, 'Passed', 'adnan316@example.com', '2024-12-31', '2004-11-04'),
(317, 'Sara', 23, 'EEE', 58, 'Failed', 'sara317@example.com', '2025-02-28', '2002-09-21'),
(318, 'Rafi', 20, 'BBA', 94, 'Passed', 'rafi318@example.com', '2024-06-09', '2005-05-30'),
(319, 'Yasmin', 22, 'CSE', 87, 'Passed', 'yasmin319@example.com', '2025-01-10', '2003-08-25'),
(320, 'Zayed', 24, 'EEE', 65, 'Passed', 'zayed320@example.com', '2024-05-17', '2001-07-14');


SELECT age(CURRENT_DATE,dob),* FROM students;

SELECT extract(month from '2025-01-25'::date)

SELECT 'y'::BOOLEAN