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

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
-- Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle

SELECT 
CASE
WHEN (A = B AND B = C AND C = A) THEN 'Equilateral'
WHEN (A + B > C) AND (A = B OR B = C OR C = A) THEN 'Isosceles'
WHEN (A + B > C) THEN 'Scalene'
ELSE 'Not A Triangle'
END
FROM TRIANGLES
                                      
-- PIVOT TABLE

SELECT D.Name, P.Name, S.Name, A.Name
FROM(
SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS num
FROM occupations
WHERE Occupation = 'Doctor'
) D
RIGHT JOIN (
SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS num
FROM occupations
WHERE Occupation = 'Professor'
) P ON D.num = P.num
LEFT JOIN (
SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS num
FROM occupations
WHERE Occupation = 'Singer'
) S ON D.num = S.num OR P.num = S.num
LEFT JOIN (
SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS num
FROM occupations
WHERE Occupation = 'Actor'
) A ON D.num = A.num OR P.num = A.num OR S.num = A.num;

