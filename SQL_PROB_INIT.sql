-- Query the two cities in STATION with the shortest and longest CITY names,
-- as well as their respective lengths (i.e.: number of characters in the name).
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT CITY, CHAR_LENGTH(CITY) FROM STATION 
WHERE CHAR_LENGTH(CITY) IN (
SELECT MAX(CHAR_LENGTH(CITY)) FROM STATION
UNION 
SELECT MIN(CHAR_LENGTH(CITY)) FROM STATION
) ORDER BY CHAR_LENGTH(CITY) DESC, CITY LIMIT 2;
           
           

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
-- but did not realize her keyboard's  key was broken until after completing the calculation.
-- She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed),
-- and the actual average salary.
--Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.   

SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, '0', ''))) FROM EMPLOYEES;
                                      


-- We define an employee's total earnings to be their monthly worked,
-- and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees 
-- who have maximum total earnings. Then print these values as  space-separated integers.                                     

SELECT (salary * months), COUNT(employee_id)
FROM Employee GROUP BY (salary * months) ORDER BY (salary * months) DESC  LIMIT 1;
