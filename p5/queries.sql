DROP FUNCTION IF EXISTS fn_subtract_now_year;

DELIMITER //

CREATE FUNCTION fn_subtract_now_year(year INT)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    SET result = YEAR(CURDATE()) - year;
    RETURN result;
END //

DELIMITER ;

SELECT fn_subtract_now_year(1984);


DROP FUNCTION IF EXISTS fn_calc_illnesses_per_period;

DELIMITER //

CREATE FUNCTION fn_calc_illnesses_per_period(num_illnesses_per_year DOUBLE, period INT)
RETURNS DOUBLE
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result DOUBLE;
    SET result = num_illnesses_per_year / period;
    RETURN result;
END //

DELIMITER ;

SELECT fn_calc_illnesses_per_period(20000, 4);