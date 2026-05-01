# 🍕 Pizza Sales Analysis (SQL & Power BI)

📌 Project Overview
This project analyzes one year of pizza sales data to uncover business insights related to revenue, customer behavior, and product performance. The analysis is performed using SQL for data exploration and transformation, while Power BI is used to build interactive dashboards for visualizing key metrics and trends.

📊 Dataset
The dataset is sourced from the Maven Analytics Data Playground and covers January–December 2015. It includes:
Orders: order_id, date, and time
Order Details: order_details_id, order_id, pizza_id, quantity
Pizzas: pizza_id, pizza_type_id, size, price
Pizza Types: pizza_type_id, name, category, ingredients

🛠️ Tech Stack & Tools
SQL: Data querying, aggregation, and business logic
Power BI: Data visualization and dashboard development
Key Techniques:
1. Multi-table joins
2. CTEs (Common Table Expressions)
3. Aggregations & grouping
4. Window functions (LAG for growth analysis)
5. Time-based analysis (hourly, daily, monthly trends)

🎯 Key Business Questions Answered
💰 Revenue & Orders
1. How many total orders were placed throughout the year?
2. How many pizzas were sold in total?
3. What is the total revenue generated?
4. On average, how many pizzas are included in each order?
5. What is the average order value (AOV)?

📅 Time-Based Analysis
1. Which days of the week generate the highest number of orders?
2. How does revenue perform on a daily basis?
3. What are the monthly revenue trends across the year?
4. At what hours does the restaurant experience peak sales activity?

🍕 Product Performance
1. Which pizza categories contribute the most to total sales and revenue?
2. What are the top 10 most popular pizzas based on quantity sold?
3. Which pizza sizes are most preferred by customers?

📈 Growth Analysis
1. How does revenue change month-over-month?
2. What is the percentage growth or decline in revenue compared to the previous month?

📈 Key Insights
1. Friday has the highest number of orders, exceeding both Saturday and Sunday.
2. Sales peak at 12:00 PM and 6:00 PM, which align with typical lunch and dinner times.
3. All pizza categories contribute relatively evenly to the total revenue.
4. The Classic Deluxe Pizza is the most popular item, with 2,453 pizzas sold and generating $38,180.50 in revenue.
5. Large (L) pizzas are the most preferred size and contribute 45.9% of the total revenue.

📊 Power BI Dashboard
The dashboard translates SQL outputs into interactive visuals, including:
1. A bar chart showing daily trends in total orders
2. A line chart illustrating monthly revenue performance
3. A chart displaying the top 10 most popular pizzas based on sales
4. A matrix visualization showing the distribution of orders across hours and days to identify peak activity patterns
5. Interactive filters for pizza category and size to enable deeper analysis

📌 Conclusion
This project demonstrates how SQL and Power BI can be used to transform raw sales data into meaningful and actionable insights. The analysis reveals clear patterns in customer behavior, peak ordering times, and product performance, which can support more effective business decisions. By combining data processing with interactive visualization, the project provides a comprehensive view of sales trends and highlights opportunities to optimize operations and improve overall performance.
