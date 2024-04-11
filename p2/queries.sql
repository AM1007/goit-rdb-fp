USE pandemic;

CREATE TABLE countries(
id INT PRIMARY KEY AUTO_INCREMENT,
code VARCHAR(8) UNIQUE,
country VARCHAR(32) NOT NULL UNIQUE
);

INSERT INTO countries (code, country)
SELECT DISTINCT code, entity FROM infectious_cases;

CREATE TABLE infectious_cases_normalized 
AS SELECT * FROM infectious_cases;

ALTER TABLE infectious_cases_normalized
ADD id INT PRIMARY KEY AUTO_INCREMENT FIRST,
ADD country_id INT AFTER id,
ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(id);

UPDATE infectious_cases_normalized i, countries c  
SET i.country_id = c.id WHERE c.code = i.code;

ALTER TABLE infectious_cases_normalized
DROP COLUMN entity,
DROP COLUMN code;