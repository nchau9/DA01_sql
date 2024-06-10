--hw1
SELECT
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
--hw2 
SELECT
x,
y,
z,
CASE
WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle;
--hw3 
SELECT ROUND((COUNT(CASE WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 END) / COUNT(*)) * 100, 1) AS uncategorised_call_pct
FROM callers;
--hw4
SELECT c.name
FROM Customer c
LEFT JOIN Customer r ON c.referee_id = r.id
WHERE r.id != 2 OR c.referee_id IS NULL;
--hw5
SELECT
CASE
WHEN pclass = 1 THEN 'first_class'
WHEN pclass = 2 THEN 'second_class'
WHEN pclass = 3 THEN 'third_class'
END AS passenger_class,
SUM(CASE WHEN survived = 1 THEN 1 ELSE 0 END) AS survivors,
SUM(CASE WHEN survived = 0 THEN 1 ELSE 0 END) AS non_survivors
FROM titanic
GROUP BY passenger_class;
