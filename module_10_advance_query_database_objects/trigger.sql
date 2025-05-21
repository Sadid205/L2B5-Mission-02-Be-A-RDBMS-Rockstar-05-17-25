/*
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions. 
*/

-- Table-Level Events:
    -- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
    -- Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW] 
-- EXECUTE FUNCTION function_name();


CREATE Table my_users
(
    user_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO my_users VALUES ('Mezba', 'mezba@mail.com'), ('Mir', 'mir@mail.com');

SELECT * FROM my_users;
SELECT * FROM deleted_user_audit;

CREATE Table deleted_user_audit
(
    delete_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);

DROP TABLE delete_user_audit;
-- trigger
CREATE or REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO deleted_user_audit VALUES(OLD.user_name,now());
        RAISE NOTICE 'Deleted user autid log created';
        RETURN OLD;
    END
$$;

CREATE or REPLACE TRIGGER save_deleted_user_triger
BEFORE DELETE
on my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE user_name = 'Mir';