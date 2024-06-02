--hw1
SELECT DISTINCT city 
FROM station
WHERE ID %2=0
--hw2
SELECT COUNT(city) - COUNT(DISTINCT CITY) FROM station
--hw4
SELECT 
ROUND(CAST(SUM(item_count * order_occurrences) AS DECIMAL) / SUM(order_occurrences), 1) AS mean
FROM items_per_order;
--hw5
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(skill)=3
--hw6
SELECT user_id,
DATE(max(post_date)) - DATE(min(post_date)) as days_between
FROM posts
WHERE post_date >= '2021-01-01' AND post_date <'2022-01-01'
GROUP BY user_id;
HAVING COUNT (post_id) >=2
--hw7
SELECT 
MAX(issued_amount)-MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
--hw8
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss
--hw9
SELECT * FROM cinema
WHERE id%2=1 AND description != 'boring'
order by rating DESC
--hw10
SELECT 
teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id
--hw11
SELECT user_id, COUNT(follower_id) as followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id
--hw12
SELECT class
FROM COURSES
GROUP BY class
HAVING COUNT(Student)>=5
