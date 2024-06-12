--hw1 https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
SELECT
co.Continent,
FLOOR(AVG(ci.Population)) AS AvgCityPopulation
FROM
CITY ci
JOIN
COUNTRY co ON ci.CountryCode = co.Code
GROUP BY
co.Continent;
--hw2 https://datalemur.com/questions/signup-confirmation-rate
SELECT 
ROUND(
CAST(SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(e.email_id) * 100, 2
  ) AS confirm_rate
FROM  emails e
LEFT JOIN  texts t ON e.email_id = t.email_id
WHERE t.signup_action IS NOT NULL;
--hw3 https://datalemur.com/questions/time-spent-snaps
SELECT ab.age_bucket,
ROUND((SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) * 100.0) / 
(SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END)), 2) AS send_perc,
ROUND((SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) * 100.0) / 
(SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END)), 2) AS open_perc
FROM activities a
JOIN age_breakdown ab ON a.user_id = ab.user_id
GROUP BY ab.age_bucket;
--hw4 https://datalemur.com/questions/supercloud-customer
SELECT cc.customer_id
FROM customer_contracts cc
JOIN products p ON cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT p.product_category) = (SELECT COUNT(DISTINCT product_category) FROM products);
--hw5 https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50
SELECT e.employee_id, e.name,
COUNT(r.employee_id) AS reports_count,
ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
--hw6 https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50
SELECT p.product_name,
SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
--hw7 https://datalemur.com/questions/sql-page-with-no-likes
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;

