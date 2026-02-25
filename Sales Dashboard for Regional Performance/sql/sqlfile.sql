

SELECT SUM(SALES) AS total_sales
FROM sales_data_sample;

SELECT COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales_data_sample;

SELECT SUM(QUANTITYORDERED) AS total_quantity
FROM sales_data_sample;

SELECT 
    SUM(SALES) / COUNT(DISTINCT ORDERNUMBER) AS avg_order_value
FROM sales_data_sample;

SELECT 
    AVG(PRICEEACH) AS avg_price
FROM sales_data_sample;

#Sales by Territory

SELECT 
    TERRITORY,
    SUM(SALES) AS total_sales
FROM sales_data_sample
GROUP BY TERRITORY
ORDER BY total_sales DESC;

#Sales Contribution by Territory (%)

SELECT 
    TERRITORY,
    SUM(SALES) AS territory_sales,
    ROUND(
        SUM(SALES) * 100.0 / 
        (SELECT SUM(SALES) FROM sales_data_sample),
        2
    ) AS percentage_contribution
FROM sales_data_sample
GROUP BY TERRITORY;


SELECT 
    PRODUCTLINE,
    SUM(SALES) AS productline_sales
FROM sales_data_sample
GROUP BY PRODUCTLINE
ORDER BY productline_sales DESC;


SELECT 
    PRODUCTCODE,
    SUM(SALES) AS product_sales
FROM sales_data_sample
GROUP BY PRODUCTCODE
ORDER BY product_sales DESC
LIMIT 5;


SELECT 
    YEAR_ID,
    MONTH_ID,
    SUM(SALES) AS monthly_sales
FROM sales_data_sample
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

#Quarterly Sales Trend

SELECT 
    YEAR_ID,
    QTR_ID,
    SUM(SALES) AS quarterly_sales
FROM sales_data_sample
GROUP BY YEAR_ID, QTR_ID
ORDER BY YEAR_ID, QTR_ID;



SELECT 
    CUSTOMERNAME,
    SUM(SALES) AS customer_revenue
FROM sales_data_sample
GROUP BY CUSTOMERNAME
ORDER BY customer_revenue DESC
LIMIT 5;

SELECT 
    DEALSIZE,
    SUM(SALES) AS deal_sales
FROM sales_data_sample
GROUP BY DEALSIZE;


SELECT DISTINCT TERRITORY
FROM sales_data_sample;

SELECT DISTINCT YEAR_ID
FROM sales_data_sample;

SELECT YEAR_ID, MONTH_ID, SUM(SALES)
FROM sales_data_sample
WHERE TERRITORY = 'South'
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;



WITH festival AS (
    SELECT COALESCE(SUM(SALES),0) AS festival_sales
    FROM sales_data_sample
    WHERE TERRITORY = 'NA'
    AND YEAR_ID = 2004
    AND MONTH_ID = 10
),
post_festival AS (
    SELECT COALESCE(SUM(SALES),0) AS post_sales
    FROM sales_data_sample
    WHERE TERRITORY = 'NA'
    AND YEAR_ID = 2004
    AND MONTH_ID = 11
)

SELECT 
    f.festival_sales,
    p.post_sales,
    CASE 
        WHEN f.festival_sales = 0 THEN 0
        ELSE ROUND(
            ((f.festival_sales - p.post_sales) 
            / f.festival_sales) * 100, 2
        )
    END AS percentage_decline
FROM festival f, post_festival p;


SELECT 
    YEAR_ID,
    MONTH_ID,
    SUM(SALES) AS monthly_sales,
    LAG(SUM(SALES)) OVER (
        PARTITION BY TERRITORY 
        ORDER BY YEAR_ID, MONTH_ID
    ) AS previous_month_sales
FROM sales_data_sample
WHERE TERRITORY = 'NA'
GROUP BY YEAR_ID, MONTH_ID;


