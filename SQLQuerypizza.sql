
SELECT * FROM pizza_sales

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders 
from pizza_sales
GROUP BY DATENAME(DW, order_date)