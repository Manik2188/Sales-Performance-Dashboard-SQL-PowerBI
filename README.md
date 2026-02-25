# Sales-Performance-Dashboard-SQL-PowerBI
End-to-end Sales Data Analysis project using SQL for data extraction and transformation and Power BI for interactive dashboard creation. Includes KPI calculations, DAX measures, regional performance insights, and business recommendations.

📊 Sales Performance Dashboard | SQL & Power BI
📌 Project Overview

This project focuses on analyzing regional and product-wise sales performance using SQL for data extraction and transformation and Power BI for interactive dashboard development.

The goal of this project was to transform raw transactional data into meaningful business insights and support data-driven decision-making.

🎯 Project Objectives

Clean and transform raw sales data using SQL

Join multiple relational tables

Create calculated metrics such as Profit and Margin

Develop KPIs using DAX in Power BI

Build an interactive dashboard

Identify key business insights and performance trends

🗂 Dataset Description

The dataset contains 25,000+ sales records with the following fields:

Order ID

Order Date

Region

Product ID

Product Category

Customer Segment

Sales Amount

Quantity

Discount

Cost Price

The data was structured across multiple relational tables and joined using SQL.

🛠 Work Done in SQL
✅ Data Cleaning

Removed duplicate records

Handled NULL values

Standardized date formats

✅ Data Transformation

Created calculated column for Profit

Performed aggregations using SUM(), COUNT(), GROUP BY

✅ Data Joining

Used INNER JOIN to combine Sales, Product, and Customer tables

✅ Time-Based Analysis

Monthly and yearly sales trend analysis

Regional performance breakdown

📈 Work Done in Power BI
🔹 Data Modeling

Built Star Schema model

Created relationships between tables

Developed Date hierarchy (Year, Quarter, Month)

🔹 KPIs Created (Using DAX)
Total Sales = SUM(Sales[Sales_Amount])

Total Orders = DISTINCTCOUNT(Sales[Order_ID])

Total Quantity = SUM(Sales[Quantity])

Total Profit = 
SUMX(
    Sales,
    Sales[Sales_Amount] - (Sales[Cost_Price] * Sales[Quantity])
)

Profit Margin % = 
DIVIDE([Total Profit], [Total Sales], 0)

Average Order Value = 
DIVIDE([Total Sales], [Total Orders], 0)
📊 Dashboard Features

KPI Cards (Total Sales, Total Orders, Total Profit, Margin %)

Regional Sales Bar Chart

Monthly Sales Trend Line Chart

Category-wise Performance Chart

Top 10 Products Analysis

Customer Segment Distribution

Interactive Filters & Slicers

🔍 Key Insights

South region experienced post-festival sales decline

Technology category generated highest revenue

Corporate segment contributed highest profit

High discount percentage reduced profit margin

Top 20% products generated majority of total revenue

💡 Business Impact

This dashboard enables management to:

Monitor sales performance in real time

Identify underperforming regions

Optimize discount strategies

Improve product focus

Support data-driven strategic decisions

🧰 Tools & Technologies Used

SQL

Power BI

DAX

Data Modeling

Business Intelligence Techniques

📂 Project Structure
Sales-Performance-Dashboard-SQL-PowerBI/
│
├── data/
├── sql_queries/
├── powerbi_dashboard.pbix
├── Project_Report.docx
└── README.md
🚀 Future Improvements

Add forecasting model

Automate data refresh

Integrate real-time database connection

Deploy dashboard to Power BI Service

👨‍💻 Author

Satyam Kumar
Aspiring Data Analyst | SQL | Power BI | Business Intelligence
