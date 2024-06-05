--ex1 https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
SELECT name
FROM STUDENTS 
WHERE marks > 75 
ORDER BY RIGHT(name,3), ID ASC
--ex2 https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50
SELECT user_id,
CONCAT (UPPER(LEFT(name,1)), LOWER (RIGHT(name, LENGTH(name)-1))) AS name
FROM Users
ORDER BY user_id
--ex3 https://datalemur.com/questions/total-drugs-sales
SELECT manufacturer,
'$'||ROUND(sum(total_sales)/1000000,0)||' '||'million'AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sum(total_sales) desc, manufacturer
--ex4 https://datalemur.com/questions/sql-avg-review-ratings
SELECT 
EXTRACT(MONTH FROM submit_date) AS mth,
product_id,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id
--ex5 https://datalemur.com/questions/teams-power-users
SELECT sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)=8
AND EXTRACT(YEAR FROM sent_date)=2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
--ex6 https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50
SELECT tweet_id
FROM tweets
WHERE LENGTH(content)>15
--ex7 https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/?envType=study-plan-v2&envId=top-sql-50
--ex8 https://platform.stratascratch.com/coding/2151-number-of-hires-during-specific-time-period?code_type=1
SELECT  
COUNT(employee_id) as number_employee
from employees
WHERE EXTRACT (MONTH FROM joining_date) between 1 and 7
AND EXTRACT (YEAR FROM joining_date)=2022
--ex9 https://platform.stratascratch.com/coding/9829-positions-of-letter-a?code_type=1
