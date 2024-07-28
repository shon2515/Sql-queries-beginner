-- To overwiew database
select * from Sales

-- To view Sales Over Time
SELECT 
    date_info,
    SUM(Total_revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    date_info
ORDER BY 
    date_info;

-- To identify monthly patterns, aggregate the sales data by month
	SELECT 
    YEAR(date_info) AS Year,
    MONTH(date_info) AS Month,
    SUM(Total_revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    YEAR(date_info), MONTH(date_info)
ORDER BY 
    Year, Month;

-- To aggregate the sales data by quarter
SELECT 
    YEAR(date_info) AS Year,
    DATEPART(QUARTER, date_info) AS Quarter,
    SUM(total_revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    YEAR(date_info), DATEPART(QUARTER, date_info)
ORDER BY 
    Year, Quarter;

-- To identify any seasonal patterns
SELECT 
    MONTH(date_info) AS Month,
    AVG(Total_revenue) AS Average_Month_Rev
FROM 
    Sales
GROUP BY 
    MONTH(date_info)
ORDER BY 
    MONTH(date_info);
--To analyze sales trends for specific product categories over time
SELECT 
    YEAR(date_info) AS Year,
    MONTH(date_info) AS Month,
    Category,
    SUM(Total_revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    YEAR(date_info), MONTH(date_info), Category
ORDER BY 
    Year, Month, Category;

-- To analyze total and average revenue by regions
SELECT 
    region as Region,
    SUM(total_revenue) AS Total_Revenue,
	AVG(total_revenue) AS Average_Revenue
FROM 
    Sales
GROUP BY 
    Region
ORDER BY 
    total_revenue DESC;

	--To identify the total units sold for each product category in each region
SELECT
    Category,
    Region,
    SUM(Units_sold) AS Total_Units_Sold
FROM
    Sales 
GROUP BY
    Category,
    Region
ORDER BY
    Category,
    Region;

--To calculate total units sold by payment method
SELECT 
    payment_method as Payment_Method,
    SUM(units_sold) AS Total_Units_Sold
FROM 
    Sales
GROUP BY 
    payment_method
ORDER BY 
    Total_Units_Sold DESC;

--To calculate total revenue by payment method
SELECT 
    payment_method as Payment_Method,
    SUM(total_revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    payment_method
ORDER BY 
    Total_Revenue DESC;

--To calculate number of transactions by payment method
SELECT 
    payment_method as Payment_method,
    COUNT(Transaction_ID) AS Number_of_Transactions
FROM 
    Sales
GROUP BY 
    Payment_Method
ORDER BY 
    Number_of_Transactions DESC;

--To identify the most preferred payment method by region
SELECT 
    Region,
    Payment_method,
    COUNT(Transaction_ID) AS Number_of_Transactions
FROM 
    Sales
GROUP BY 
    Region, 
    Payment_method
ORDER BY 
    Region, 
    Number_of_Transactions;


