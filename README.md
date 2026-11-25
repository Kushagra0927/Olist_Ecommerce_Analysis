# Olist E-commerce Sales & Delivery Analysis

## Project Overview
This project focuses on analyzing the Olist Brazilian E-Commerce Public Dataset to understand sales performance, product category performance, delivery efficiency, and customer review patterns.

Using Python (Pandas, NumPy, Matplotlib) and SQL (MySQL), I performed data cleaning, data transformation, exploratory data analysis, and business-focused analysis across multiple related datasets.

The analysis aims to identify sales trends, evaluate delivery performance, understand customer review patterns, and identify the geographical distribution of orders.

The project combines Python-based analysis in Jupyter Notebook with SQL queries in MySQL Workbench to explore business questions and derive actionable insights.

## Business Problem
An e-commerce business needs to understand its sales performance, product category contributions, delivery efficiency, and customer satisfaction to make informed business decisions.

The Olist dataset contains information about orders, order items, customers, products, and customer reviews. By analyzing these related datasets, the business can identify sales patterns, evaluate delivery performance, understand customer feedback, and examine the geographical distribution of its orders.


### Project Objectives
- Analyze monthly item sales trends to understand how sales performance changes over time.
- Identify product categories contributing the highest item sales.
- Measure the proportion of delivered orders that arrived after their estimated delivery dates.
- Examine the relationship between delivery delays and customer review scores.
- Identify the states contributing the highest number of orders.

## Dataset
This project uses the **Olist Brazilian E-Commerce Public Dataset**, which is publicly available on Kaggle:

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The analysis uses six related CSV files containing information about orders, order items, customers, products, customer reviews, and product category translations.


## Tools & Technologies

| Tools | Purpose |
|---|---|
| Python | Data cleaning, manipulation, and analysis. |
| Pandas | CSV ingestion, data cleaning, merging, grouping, and aggregation. |
| NumPy | Numerical operations and data manipulation. |
| Matplotlib | Creating visualizations to communicate analytical findings. |
| JupyterLab | Performing Python analysis in an interactive notebook environment. |
| MySQL 8 | Database management and SQL-based data analysis. |
| MySQL Workbench | Importing datasets, managing database tables, and executing SQL queries. |

## Skills demonstrated
CSV ingestion, data validation, missing-value checks, date parsing, joins/merges, grouping and aggregation, SQL joins, KPI calculation, charting, and communicating business implications.

## Project Structure

```text
Project_01/
│
├── data/
│   ├── olist_customers_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   └── product_category_name_translation.csv
│
├── outputs/
│   ├── category_sales.csv
│   ├── data_quality_report.csv
│   ├── delivery_kpi.csv
│   ├── monthly_item_sales.png
│   ├── monthly_sales.csv
│   ├── order_level_analysis.csv
│   ├── review_by_delivery_status.csv
│   ├── state_performance.csv
│   ├── top_category.png
│   └── top_state_by_orders.png
│
├── SQL1/
│   └── analysis_by_SQL.sql
│
├── Olist_Analysis.ipynb
│
└── README.md
```

## Directory and File Description

- **data/** – Contains the six CSV datasets used for Python analysis.
- **outputs/** – Stores the generated analytical summary CSV files and visualization charts.
- **SQL1/** – Contains the SQL file with queries used for database analysis.
- **Olist_Analysis.ipynb** – Jupyter Notebook containing the step-by-step Python analysis, organized into nine Markdown sections.
- **README.md** – Documents the project, its objectives, methodology, tools, and findings.



## How the Analysis Works

The project uses Python and SQL to analyze the Olist e-commerce dataset and answer business-related questions.


### 1. Python Analysis

The Python analysis is performed using Pandas, NumPy, and Matplotlib in Jupyter Notebook.

The workflow consists of the following steps:

**1. Data Loading:** Load the six CSV datasets into Pandas DataFrames.

**2. Data Inspection and Cleaning:** Examine dataset dimensions, column information, missing values, and duplicate records. Parse order timestamps into appropriate datetime formats.

**3. Data Transformation and Aggregation:** Aggregate order-item information at the order level before combining datasets to maintain the correct level of analysis and avoid accidental double-counting.

**4. Data Integration:** Combine relevant order, customer, product, and review information using Pandas merges.

**5. Exploratory Data Analysis:** Analyze monthly item sales, product category performance, delivery delays, customer review patterns, and state-wise order distribution.

**6. KPI Calculation and Visualization:** Calculate delivery performance metrics and other business indicators. Create charts to communicate analytical findings.

**7. Export Results:** Save analytical summaries as CSV files and visualizations as PNG files in the outputs/ directory.



### 2. SQL Analysis

SQL analysis is performed using MySQL 8 and MySQL Workbench.

The workflow includes:

1. Importing the required CSV datasets into MySQL tables.
2. Using SQL joins, aggregate functions, grouping, and Common Table Expressions (CTEs) to analyze related datasets.
3. Executing queries to examine monthly item sales, product category performance, and customer review patterns across delivery statuses.

   

## Key Findings and Business Insights

The analysis revealed several insights into sales performance, product category contributions, delivery efficiency, customer reviews, and geographical order distribution.

### 1. Monthly Item Sales

The top three months with highest item sales:

| Month | Item Sales(BRL) | Orders |
|---|---:|---:|
| 2017-11 | 1010271.37 | 7,544 |
| 2018-04 | 996647.75 | 6,939 |
| 2018-05 | 996517.68 | 6,873 |

- November 2017 recorded the highest monthly item sales, amounting to **R$1,010,271.37**.

**Business Insight:** The business can investigate seasonal demand patterns and use historical sales trends to support inventory and promotional planning.

### 2. Product Category Performance

The top three product categories by item sales were:

| Product Category | Item Sales(BRL) |
|---|---:|
| Health & Beauty | 1,258,681.34 |
| Watches & Gifts | 1,205,005.68 |
| Bed, Bath & Table | 1,036,988.68 |

- Health & Beauty was the highest-performing category by item sales.

**Business Insight:** The business can prioritize inventory planning and monitor demand across its highest-performing product categories.

### 3. Delivery Performance

- Total eligible delivered orders: **96,470**
- Late orders: **7,826**
- Late delivery rate: **8.11%**

The late delivery rate was calculated using delivered orders with both actual and estimated delivery dates available.

**Business Insight:** The business can investigate delivery delays and identify opportunities to improve delivery reliability.

### 4. Customer Review Analysis

The average customer review scores differed across delivery groups:

| Delivery Group | Orders with Reviews | Average Review Score |
|---|---:|---:|
| On-time / early | 88,163 | 4.29 |
| Late | 7,661 | 2.57 |
| Unknown | 2,849 | 1.75 |

**unknown =** deliveries that are not classified because the required delivery dates were unavailable.

- Late-delivered orders had a substantially lower average review score than on-time or early-delivered orders.

**Business Insight:** Improving delivery reliability may help improve customer experience. However, the observed relationship does not establish causation.

### 5. Geographical Order Distribution

The three states with the highest number of orders were:

| State | Number of Orders | Item Sales(BRL) |
|---|---:|---:|
| São Paulo (SP) | 41,746 | 5,202,955.05 |
| Rio de Janeiro (RJ) | 12,852 | 1,824,092.67 |
| Minas Gerais (MG) | 11,635 | 1,585,308.03 |

- São Paulo contributed the highest number of orders and the highest item sales among the states analyzed.

**Business Insight:** The business can prioritize logistics and inventory planning in high-demand states while exploring growth opportunities in other regions.



## Conclusion

This project explored the Olist Brazilian E-Commerce dataset to understand sales performance, product category trends, delivery reliability, customer review patterns, and state-wise order distribution.

Using Python and SQL, I performed data cleaning, transformation, aggregation, data integration, exploratory data analysis, and KPI calculation. I also created visualizations and exported analytical results to support the findings.

The analysis highlighted differences in product category performance, monthly sales patterns, and customer review scores across delivery groups. It also demonstrated how data analysis can help an e-commerce business identify areas for improvement in sales planning, delivery operations, and customer experience.

