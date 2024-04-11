USE pandemic;

SELECT id, MAX(number_rabies) AS max_value, MIN(number_rabies) AS min_value, 
AVG(number_rabies) AS average_value FROM infectious_cases_normalized
WHERE number_rabies IS NOT NULL AND number_rabies <> ''
GROUP BY id
ORDER BY average_value DESC
LIMIT 10;