WITH funnel AS (
  SELECT user_id,
         MAX(CASE WHEN event_name = 'view_product' THEN 1 END) AS viewed,
         MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 END) AS added,
         MAX(CASE WHEN event_name = 'checkout' THEN 1 END) AS checkout,
         MAX(CASE WHEN event_name = 'payment' THEN 1 END) AS payment,
         MAX(CASE WHEN event_name = 'purchase' THEN 1 END) AS purchase
  FROM events
  GROUP BY 1
)
SELECT
  SUM(viewed) AS views,
  SUM(added) AS add_to_cart,
  SUM(checkout) AS checkout,
  SUM(payment) AS payment,
  SUM(purchase) AS purchases
FROM funnel;
