DROP DATABASE app;

CREATE SCHEMA app;

CREATE TABLE app.human (name VARCHAR(255) NOT NULL PRIMARY KEY);

CREATE TABLE app.dog (
    name VARCHAR(255) NOT NULL PRIMARY KEY,
    owner VARCHAR(255) NOT NULL,
    CONSTRAINT owner_key FOREIGN KEY (owner) REFERENCES app.human(name) ON DELETE CASCADE
);


INSERT INTO app.human VALUES ('Annabel'), ('Charles');

SELECT * FROM app.human;

INSERT INTO app.dog VALUES ('Pringle', 'Annabel');

-- this fails
-- INSERT INTO app.dog VALUES ('Perdita', 'Robert'); 

SELECT * FROM app.dog;

DELETE FROM app.human WHERE name = 'Annabel';

-- The deletion of annabel killed annabel's dog(s)
SELECT * FROM app.dog;