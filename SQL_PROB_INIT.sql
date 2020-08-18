-- MIN CITY NAME AND MAX CITY MANE WITH LENGTH --

SELECT CITY, CHAR_LENGTH(CITY) FROM STATION 
WHERE CHAR_LENGTH(CITY) IN (
SELECT MAX(CHAR_LENGTH(CITY)) FROM STATION
UNION 
SELECT MIN(CHAR_LENGTH(CITY)) FROM STATION
) ORDER BY CHAR_LENGTH(CITY) DESC, CITY LIMIT 2;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
--Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.   
           
SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, '0', ''))) FROM EMPLOYEES;
