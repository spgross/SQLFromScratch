Question 1 code:

SELECT *
FROM survey
LIMIT 10;

 
Question 2 and 3 code:
 
SELECT question, COUNT (user_id)
FROM survey
GROUP BY question;

Question 4 code:
 
SELECT *
FROM quiz
LIMIT 5;
 
SELECT *
FROM home_try_on
LIMIT 5;
 
SELECT *
FROM purchase
LIMIT 5;

Question 5 code:
 
WITH funnel AS (
  SELECT quiz.user_id, 
 CASE
  WHEN home_try_on.user_id IS NOT NULL
      THEN 'True'
      ELSE 'False'
  END AS 'is_home_try_on',
 home_try_on.number_of_pairs,
 CASE
  WHEN purchase.user_id IS NOT NULL
      THEN 'True'
      ELSE 'False'
  END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
  ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
  ON quiz.user_id = purchase.user_id)

SELECT *
FROM funnel
LIMIT 10;

Question 6/7 code:

WITH funnel AS (...)
SELECT is_home_try_on, COUNT (*)
FROM funnel
GROUP BY is_home_try_on;

WITH funnel AS (...)
SELECT is_purchase, COUNT (*)
FROM funnel
GROUP BY is_purchase;

WITH funnel AS (...)
SELECT number_of_pairs, COUNT(number_of_pairs), COUNT(is_purchase)
FROM funnel
WHERE is_purchase = 'True'
GROUP BY number_of_pairs;

WITH funnel AS (...)
SELECT question, response, COUNT (user_id)
FROM survey
GROUP BY response
ORDER BY question;

WITH funnel AS (...)
SELECT style, model_name, color, price, COUNT (user_id) AS bought
FROM purchase
GROUP BY product_id
ORDER BY bought DESC; 
