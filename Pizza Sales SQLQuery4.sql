select* from Pizza_Sales
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


--Daily Trend
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) as Total_Orders
from Pizza_Sales
GROUP BY DATENAME(DW, order_date)

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) as Total_Orders
from Pizza_Sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--Percentage Sales by Pizza Category
SELECT pizza_category, SUM(total_price) as Total_Sales, sum(total_price)*100 / (SELECT sum(total_price) from Pizza_Sales) AS PCT
FROM Pizza_Sales
GROUP BY pizza_category

--Percentage Sales by Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2)) as Total_Sales, 
CAST(sum(total_price)*100 / (SELECT sum(total_price) from Pizza_Sales) AS DECIMAL (10,2)) AS PCT
FROM Pizza_Sales
GROUP BY pizza_size
ORDER BY PCT ASC

--Pizzas Sold by Category
SELECT pizza_category, sum(quantity) as Total_Pizzas_Sold from Pizza_Sales
GROUP BY pizza_category


--Top 5 and Bottom 5
SELECT TOP 5 pizza_name, sum(quantity) as Total_Pizzas_Sold from Pizza_Sales
GROUP BY pizza_name
order by Total_Pizzas_Sold
