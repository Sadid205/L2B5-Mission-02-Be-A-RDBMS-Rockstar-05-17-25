-- Active: 1747413813562@@127.0.0.1@5432@ph
SELECT * FROM person2;

ALTER Table person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;
ALTER Table person2
    DROP COLUMN email;

ALTER TABLE person2
    RENAME COLUMN age to user_age

ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50)

INSERT INTO person2 values(8,'test2',45,'test@gmail.com')

ALTER Table person2
    ALTER COLUMN user_age set NOT NULL;

ALTER TABLE person2
    ALTER COLUMN user_age DROP NOT NULL;


-- unique constraints 
ALTER TABLE person2
    ADD constraint unique_person2_user_age UNIQUE(user_age);

ALTER TABLE person2
    DROP constraint unique_person2_user_age;

DROP TABLE person2;

TRUNCATE TABLE person2;