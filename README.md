# Customer Sales ETL Pipeline using Apache NiFi

## 📌 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline using **Apache NiFi** and **MySQL**.
The pipeline extracts customer, product, and order data from CSV files, validates and routes the data using Apache NiFi, loads it into MySQL, and generates a consolidated Sales Report via a SQL join across the loaded tables.

## 🚀 Technologies Used
- Apache NiFi
- MySQL
- MySQL Workbench
- SQL
- CSV Files

## 📂 Project Structure
Customer-Sales-ETL/
│
├── Dataset/
│   ├── Customers.csv
│   ├── Products.csv
│   └── Orders.csv
│
├── SQL/
│   ├── Create_Database.sql
│   ├── Create_Tables.sql
│   ├── Insert_Data.sql
│   └── Sales_Report.sql
│
├── NiFi_Flow/
│   └── Customer_Sales_ETL.xml
│
├── Screenshots/
│   ├── Workflow.png
│   └── SalesReport.png
│
├── Output/
│   └── Sales_Report.csv
│
└── README.md

## 🔄 ETL Workflow

### Extract
- Read `Customers.csv`
- Read `Products.csv`
- Read `Orders.csv`

### Transform
- **In NiFi:** validate and filter records using `QueryRecord`, convert CSV records to a structured format using `ConvertRecord`
- **In MySQL:** generate the Sales Report by joining the `Customers`, `Products`, and `Orders` tables via `ExecuteSQL`, then load the joined result back through

NiFi
> Note: record-level validation and format conversion happen inside NiFi; the cross-table join and aggregation logic that produces the Sales Report is implemented in SQL, with NiFi orchestrating the extract/load around it.

### Load
- Load `Customers` into MySQL
- Load `Products` into MySQL
- Load `Orders` into MySQL
- Load `Sales_Report` into MySQL

## 🏗️ Workflow Architecture

Customers.csv → GetFile → ConvertRecord → QueryRecord → PutDatabaseRecord → Customers
Products.csv  → GetFile → ConvertRecord → QueryRecord → PutDatabaseRecord → Products
Orders.csv    → GetFile → ConvertRecord → QueryRecord → PutDatabaseRecord → Orders

ExecuteSQL (JOIN across Customers, Products, Orders)
      │
ConvertRecord
      │
PutDatabaseRecord
      │
 Sales_Report

## 📊 Output
The final **Sales_Report** table/CSV contains:
- Order ID
- Customer Details
- Product Details
- Category
- Quantity
- Price
- Total Amount
- Order Date

## ✨ Features
- End-to-end ETL pipeline (Extract → Transform → Load)
- CSV file processing via NiFi's `GetFile` processor
- Record-level data validation with `QueryRecord.`
- MySQL integration via `PutDatabaseRecord` / `ExecuteSQL`
- Automated Sales Report generation through a SQL join
- Visual, flow-based orchestration with Apache NiFi

## 📸 Screenshots
- Apache NiFi Workflow — `Screenshots/Workflow.png`
- Sales Report Output — `Screenshots/SalesReport.png`

## 👨‍💻 Author
**Abiram R.T.**
