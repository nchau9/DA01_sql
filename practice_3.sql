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
