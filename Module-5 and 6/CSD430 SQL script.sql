
DROP USER IF EXISTS 'student1'@'localhost';
CREATE USER 'student1'@'localhost' IDENTIFIED BY 'pass';


DROP DATABASE IF EXISTS csd430;
CREATE DATABASE csd430;
USE csd430;
GRANT ALL PRIVILEGES ON csd430.* TO 'student1'@'localhost';

DROP TABLE IF EXISTS Noah_movies_data;
CREATE TABLE Noah_movies_data(
MovieID INT NOT NULL AUTO_INCREMENT,
Title VARCHAR(200) NOT NULL,
Genre VARCHAR(200) NOT NULL,
Released YEAR NOT NULL,
Tomatoes INT NOT NULL,
PRIMARY KEY(MovieID)
);
-- 1
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('The Odyssey', 'Action/Fantasy', 2026, 94);
-- 2
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Ratatouille', 'Family/Comedy', 2007, 96);
-- 3
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Interstellar', 'Sci-fi/Adventure', 2014, 73);
-- 4
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Inception', 'Sci-fi/Action', 2010, 86);
-- 5
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Dune', 'Sci-fi/Adventure', 2021, 83);
-- 6
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Project Hail Mary', 'Sci-fi/Adventure', 2026, 95);
-- 7
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Avengers: Endgame', 'Action/Sci-fi', 2019, 94);
-- 8 
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('The Hunger Games', 'Action/Sci-fi', 2015, 70);
-- 9
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Shark Tale', 'Family/Adventure', 2004, 35);
-- 10
INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes)
VALUES('Surf''s Up', 'Family/Comedy', 2007, 78);