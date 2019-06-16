DROP DATABASE IF EXISTS counter;

CREATE DATABASE counter CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE counter;
DROP TABLE IF EXISTS countable; 
CREATE TABLE countable(
	count Int,
    PRIMARY KEY (count)
);
INSERT INTO countable VALUES(0);