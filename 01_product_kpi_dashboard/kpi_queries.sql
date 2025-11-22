-- Daily Active Users
SELECT event_date, COUNT(DISTINCT user_id) AS dau
FROM events
GROUP BY 1;

-- Weekly Active Users
SELECT DATE_TRUNC('week', event_date) AS week, COUNT(DISTINCT user_id) AS wau
FROM events
GROUP BY 1;

-- MAU
SELECT DATE_TRUNC('month', event_date) AS month, COUNT(DISTINCT user_id) AS mau
FROM events
GROUP BY 1;

-- Retention (D1 example)
WITH first_visit AS (
  SELECT user_id, MIN(event_date) AS signup_date
  FROM events
  GROUP BY 1
),
activity AS (
  SELECT e.user_id,
         signup_date,
         event_date,
         DATE_DIFF(event_date, signup_date, DAY) AS day_number
  FROM events e
  JOIN first_visit f ON e.user_id = f.user_id
)
SELECT signup_date, day_number, COUNT(DISTINCT user_id)
FROM activity
GROUP BY 1,2;
