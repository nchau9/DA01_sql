--hw1
SELECT name FROM city
WHERE countrycode = 'USA'
AND population >120000
--hw2
SELECT * FROM CITY
WHERE countrycode = 'JPN'
--hw3
SELECT city, state
FROM station
--hw4
SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%' 
--hw5
SELECT DISTINCT city 
FROM STATION
WHERE city LIKE '%a' 
OR city LIKE '%e'
OR city LIKE '%i'
OR city LIKE '%o'
OR city LIKE '%u'
--hw6 
SELECT DISTINCT city FROM station
WHERE city NOT LIKE 'a%' 
AND city NOT LIKE 'e%' 
AND city NOT LIKE 'i%' 
AND city NOT LIKE 'o%' 
AND city NOT LIKE 'u%'
--hw7 
SELECT name FROM employee
ORDER BY name ASC 
--hw8 
SELECT name FROM employee
WHERE salary >2000 AND months <10
ORDER BY employee_id ASC
--hw9 
SELECT product_id FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y'
--hw10
SELECT name FROM customer
WHERE referee_id != 2 OR referee_id IS NULL
--hw11
SELECT name, population, area FROM world
WHERE area >= 3000000 
OR population >= 25000000
--hw12
SELECT DISTINCT author_id AS id FROM views
WHERE author_id = viewer_id
ORDER BY id ASC
--hw13 
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL
--hw14
select index, start_date, end_date, yearly_salary from lyft_drivers
where yearly_salary <=30000 OR yearly_salary >=70000
--hw15
select advertising_channel from uber_advertising
Where money_spent >100000 AND year = 2019
