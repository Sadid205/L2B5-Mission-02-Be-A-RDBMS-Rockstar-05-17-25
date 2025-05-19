CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('shagor'),
('nodi');
INSERT INTO post (title,user_id) VALUES
('Enjoing a sunny day with Akash!',2),
('Batash just shared an amazing recipe!',1),
('Exploring adventures with sagor',4),
('Nodi''s wisdom always leaves me inspired',4);

SELECT * FROM "user";
SELECT * FROM "post";

-- inner join
SELECT * FROM post as p
   INNER JOIN "user" as u on p.user_id = u.id;

SELECT * FROM "user"
    JOIN post on post.user_id = "user".id;

INSERT INTO post(id,title,user_id) VALUES
(5,'this is a post title',NULL);
-- left join
SELECT * FROM post as p
   LEFT OUTER JOIN "user" as u on p.user_id = u.id;
-- right join
SELECT * FROM post as p
   RIGHT OUTER JOIN "user" as u on p.user_id = u.id;
-- full outer join
SELECT * FROM post as p
   FULL OUTER JOIN "user" as u on p.user_id = u.id;
