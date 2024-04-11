USE pandemic;

-- Adding dates in infectious_cases_normalized
ALTER TABLE infectious_cases_normalized 
ADD COLUMN start_date DATE NULL AFTER year,
ADD COLUMN cur_date DATE NULL AFTER start_date,
ADD COLUMN subtract_year INT NULL AFTER cur_date;

-- Start Date
DROP FUNCTION IF EXISTS fn_start_date;

DELIMITER //

CREATE FUNCTION fn_start_date(year INT)
RETURNS DATE
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result DATE;
    SET result = MAKEDATE(year, 1);
    RETURN result;
END //

DELIMITER ;

-- Current Date
DROP FUNCTION IF EXISTS fn_cur_date;

DELIMITER //

CREATE FUNCTION fn_cur_date()
RETURNS DATE
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result DATE;
    SET result = CURDATE();
    RETURN result;
END //

DELIMITER ;

-- Subtract Year
DROP FUNCTION IF EXISTS fn_subtract_year;

DELIMITER //

CREATE FUNCTION fn_subtract_year(cur_date DATE, start_date DATE)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    SET result = YEAR(cur_date) - YEAR(start_date);
    RETURN result;
END //

DELIMITER ;

-- Update infectious_cases_normalized
UPDATE infectious_cases_normalized
SET cur_date = fn_cur_date(),
start_date = fn_start_date(year),
subtract_year = fn_subtract_year(cur_date, start_date);