DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks
(
    id SERIAL PRIMARY KEY,
    title VARCHAR (255),
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    completed BOOLEAN
);

ALTER TABLE tasks
ALTER COLUMN created_at SET DEFAULT NOW();

ALTER TABLE tasks
DROP COLUMN "completed";

ALTER TABLE tasks
ADD completed_at TIMESTAMP;

ALTER TABLE tasks 
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('STUDY PostgreSQL', 'Read all the documentation');

SELECT id, title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = NOW()
WHERE title = 'STUDY PostgreSQL';

SELECT * FROM tasks
WHERE completed_at IS NULL;

SELECT * FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake ', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT * FROM tasks
WHERE title
LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE 'mistake 1';

SELECT id, title
FROM tasks 
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title like '%mistake%';

SELECT * FROM tasks
ORDER BY title ASC;