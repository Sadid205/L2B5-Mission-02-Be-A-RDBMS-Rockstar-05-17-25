CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
)

ALTER TABLE post
    ALTER COLUMN user_id set NOT NULL

INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('shagor'),
('nodi');
SELECT * FROM "post";

INSERT INTO post (title,user_id) VALUES
('Enjoing a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with sagor',4),
('Nodi''s wisdom always leaves me inspired',4);

INSERT INTO post (title,user_id) VALUES ('test',NULL)

-- Insertion constraint on INSERT post
-- Attempting to insert a post with a user ID that does not exist
-- Inserting a post with a valid user ID
-- Attempting to insert a post without specifying a user ID


-- Deletion constraint on DELETE user
-- Cascading Deletion -> ON DELETE CASCADE
-- Setting NULL -> ON DELETE SET NULL
-- REstrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default)