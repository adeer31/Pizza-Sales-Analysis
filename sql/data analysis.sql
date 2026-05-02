-- TOTAL TRANSACTION --
SELECT 
	COUNT(order_id) AS total_orders
FROM orders;

-- TOTAL PIZZA SOLD --
SELECT 
	SUM(quantity) AS total_pizzas_sold
FROM order_details;

-- TOTAL REVENUE --
SELECT 
	ROUND(SUM(od.quantity * p.price),2) AS total_revenue
FROM order_details od
JOIN pizzas p 
	USING(pizza_id);

-- AVERAGE PIZZA PER ORDER
SELECT
	SUM(od.quantity) / COUNT(DISTINCT o.order_id) AS average_pizza_per_order
FROM order_details od
JOIN orders o
	USING(order_id);
    
-- AVERAGE ORDER VALUES
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) / COUNT(DISTINCT o.order_id) AS avg_value_per_order
FROM order_details od
JOIN pizzas p USING(pizza_id)
JOIN orders o USING(order_id);

-- TREND FOR TOTAL ORDER --
SELECT
	DAYNAME(date) AS day,
    COUNT(DISTINCT order_id) AS total_order
FROM orders
JOIN order_details
	USING(order_id)
GROUP BY day, WEEKDAY(date)
ORDER BY WEEKDAY(date);

-- DAILY REVENUE --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	date,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN orders o
	USING(order_id)
GROUP BY date
ORDER BY date;

-- TOTAL REVENUE BY MONTH --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	MONTH(o.date) AS month,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN orders o
	USING(order_id)
GROUP BY month;

-- TOTAL REVENUE BY HOUR --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	HOUR(o.time) AS hour,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN orders o
	USING(order_id)
GROUP BY hour
ORDER BY hour;

-- TOTAL SALES BY PIZZA CATEGORY --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	pt.category AS category,
    SUM(r.quantity) AS total_sold,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN  pizza_types pt
	USING(pizza_type_id)
GROUP BY category;

-- TOP 10 MOST POPULAR PIZZA --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	pt.name,
    SUM(r.quantity) AS total_sold,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN pizza_types pt
	USING(pizza_type_id)
GROUP BY name
ORDER BY total_sold DESC
LIMIT 10;

-- THE MOST FAVOURITE SIZES --
WITH revenue AS
	(SELECT
		*,
        od.quantity * p.price AS revenue
	FROM order_details od
    JOIN pizzas p
		USING(pizza_id)
)
SELECT
	r.size,
    SUM(r.quantity) AS total_sold,
    ROUND(SUM(r.revenue),2) AS total_revenue
FROM revenue r
JOIN pizza_types pt
	USING(pizza_type_id)
GROUP BY size
ORDER BY total_sold DESC;

-- REVENUE GROWTH --
WITH monthly_revenue AS (
    SELECT 
        MONTH(o.date) AS month,
        SUM(od.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN order_details od
		USING(order_id)
    JOIN pizzas p
		USING(pizza_id)
    GROUP BY MONTH(o.date)
)
SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS prev_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY month)) 
        / LAG(total_revenue) OVER (ORDER BY month) * 100, 2
    ) AS growth_percent
FROM monthly_revenue;