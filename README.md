# SQL Sales & Revenue Analysis

## Project Overview
This project analyzes transactional sales data to evaluate revenue performance and identify key business insights.

## Business Questions
- Which products generate the most revenue?
- How does revenue trend month over month?
- Which products contribute most to overall performance?

## Dataset Structure
Two main tables were used:
- Products (product_id, product_name, category)
- Sales (order_id, order_date, product_id, quantity, unit_price)

## Approach
- Designed relational schema
- Used JOINs to combine tables
- Applied aggregations (SUM, GROUP BY)
- Calculated revenue using quantity × unit_price
- Analyzed monthly revenue trends

## Key Insights
- Revenue fluctuated across months
- March recorded the highest revenue
- Top-performing products contributed significantly to total sales

## Tools Used
- PostgreSQL
- SQL

