Select transaction_date,
       dayname(transaction_date) AS day_name,
       CASE
       WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
       ELSE 'Weekday'
       END AS day_classification,
       MONTHNAME(transaction_date) AS month_name,
       
       transaction_time,
       CASE
       WHEN transaction_time BETWEEN '06:00:00' AND '08:59:59' THEN 'Morning'
       WHEN transaction_time BETWEEN '09:00:00' AND '11:59:59' THEN 'MidDay'
       WHEN transaction_time BETWEEN '12:00:00' AND '14:59:59' THEN 'Noon'
       WHEN transaction_time BETWEEN '15:00:00' AND '17:59:59' THEN 'Afternoon'
       WHEN transaction_time>= '18:00:00' THEN 'Evening'
       END AS time_classification,
       HOUR(transaction_time) AS hour_of_day,
       store_location,
       product_category,
       product_detail,
       product_type,

       ---ID's
       COUNT(DISTINCT transaction_id) AS number_of_sales,
       ---Revenue calculation
       SUM(unit_price*transaction_qty) AS Revenue
       
From BRIGHTLIGHT.COFFEESHOP.TRANSACTIONS
GROUP BY ALL;
