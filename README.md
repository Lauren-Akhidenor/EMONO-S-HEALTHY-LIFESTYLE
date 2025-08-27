# Emono's Healthy Lifestyle: Complete SQL Database Project


Welcome to the **Emono's Healthy Lifestyle** SQL project repository! This repository contains all SQL scripts for managing and analyzing **health-focused products, clients, employees, projects, farmers, crops, and sales**. It supports efficient operations, sales tracking, and data-driven decision-making for wellness and nutrition initiatives.

**GitHub Repository:** [![Emono's Healthy Lifestyle](https://img.shields.io/badge/Emono's%20Healthy%20Lifestyle-✔️?style=for-the-badge&color=800020&labelColor=F5F5DC)](https://github.com/Lauren-Akhidenor/EMONO-S-HEALTHY-LIFESTYLE)


---

## Project Overview

This project provides a comprehensive relational database for Emono’s Healthy Lifestyle, integrating multiple components:

- **Clients and Products:** Track health products, clients, and sales transactions.  
- **Employees and Projects:** Manage staff, departments, and wellness projects.  
- **Farmers and Crops:** Monitor farmers, crops, harvest sales, and revenue.  
- **Analytics & Reporting:** Aggregate sales and project data using OLAP queries and ETL checkpoints.

The database enables sales analytics, employee tracking, project management, and crop monitoring in a single unified system.

---

## Database Components

The database consists of the following main tables:

- **COUNTRY** – Stores countries for clients, farmers, or branches.  
- **REGION** – Tracks regions within countries; linked to COUNTRY.  
- **CLIENT** – Stores client information (city, region, country).  
- **PRODUCT** – Tracks health products, including category, cost, sale price, and supplier.  
- **SALES** – Records product sales linking products, clients, and dates.  
- **DEPARTMENT** – Functional areas like IT, HR, Marketing.  
- **EMPLOYEE** – Staff information, roles, salaries, and department affiliation.  
- **PROJECT** – Wellness programs, campaigns, or workshops.  
- **EMPLOYEE_PROJECT** – Links employees to projects with specific roles.  
- **FARMER** – Farmers supplying healthy crops.  
- **CROP** – Crop details including category, cost, and supplier.  
- **HARVEST_SALES** – Tracks crop sales linking farmers, crops, and dates.  
- **DimDate & MONTH_NAME** – Dimension tables for reporting and analytics.

---

## SQL Scripts & Files

| Script Type | File | Description |
|------------|------|-------------|
| **DDL** | [DDLGOMYCODE.sql](https://github.com/Lauren-Akhidenor/EMONO-S-HEALTHY-LIFESTYLE/blob/main/DDLGOMYCODE.sql) | Creates all tables with primary and foreign keys |
| **DML** | [DML GOMYCODE.sql](https://github.com/Lauren-Akhidenor/EMONO-S-HEALTHY-LIFESTYLE/blob/main/DML%20GOMYCODE.sql) | Inserts sample data into tables |
| **OLAP / Analytics** | [GOMYCOD SQL OLAP.sql](https://github.com/Lauren-Akhidenor/EMONO-S-HEALTHY-LIFESTYLE/blob/main/GOMYCOD%20SQL%20OLAP.sql) | Analytical queries for sales and employee insights |
| **ETL / Combined Project** | [Emono's Lifestyle 1.sql](https://github.com/Lauren-Akhidenor/EMONO-S-HEALTHY-LIFESTYLE/blob/main/Emono%27s%20Lifestyle%201.sql) | Extract, transform, load data processes, Full setup including DDL, DML, ETL, and sample analytics |
---

## Database Architecture & ER Diagram


The database relationships can be represented as follows:

COUNTRY --< REGION --< CLIENT --< SALES >-- PRODUCT
DEPARTMENT ---------
EMPLOYEE_PROJECT >-- PROJECT
FARMER --< HARVEST_SALES >-- CROP
DimDate --< SALES
DimDate --< HARVEST_SALES
MONTH_NAME --< DimDate


**Legend:**  
- `--<` = One-to-many relationship  
- Tables like `SALES` and `HARVEST_SALES` link transactions to clients/farmers and products/crops.  
- `DimDate` and `MONTH_NAME` are dimension tables used for analytics and reporting.  


## Example Tables & Use Cases

### COUNTRY

| idCountry | country |
|-----------|---------|
| 1         | Nigeria |
| 2         | Kenya   |

### CLIENT

| idcli | city    | idRegion |
|-------|---------|----------|
| 101   | Lagos   | 1        |
| 102   | Nairobi | 2        |

### PRODUCT

| idproduit | name        | category  | cost_price | sale_price | supplier       |
|-----------|------------|-----------|------------|------------|----------------|
| 201       | Protein Bar| Nutrition | 2.50       | 5.00       | Healthy Foods  |

### SALES

| idproduit | idDate | idcli | delivery_date | quantity | amount |
|-----------|--------|-------|---------------|---------|--------|
| 201       | 202401 | 101   | 2024-01-15    | 10      | 50.00  |

### EMPLOYEE_PROJECT

| employee_num_e | project_num_p | role               |
|----------------|---------------|------------------|
| 101            | 201           | Frontend Developer|
| 104            | 201           | Backend Developer |

### HARVEST_SALES

| idCrop | idDate | idFarmer | delivery_date | quantity_kg | revenue |
|--------|--------|----------|---------------|-------------|---------|
| 301    | 202401 | 401      | 2024-01-20    | 500.00      | 1500.00 |

---

## Analytics & OLAP Queries

- **Total Sales by Country** – Identify top-performing regions  
- **Sales by Year** – Monitor trends over time  
- **Sales by Product** – Analyze revenue by product category  
- **Employee & Project Reports** – Track staff allocation, project progress, and roles  

---

## SQL Operations Used

- **DDL:** `CREATE TABLE`, `DROP TABLE`  
- **DML:** `INSERT INTO`, `UPDATE`, `DELETE`  
- **OLAP:** `SELECT ... GROUP BY` for analytical insights  
- **ETL:** Extract, transform, load data


## Getting Started

Open your SQL environment (e.g., SQL Server Management Studio, MySQL Workbench, or any preferred SQL tool) and run the SQL scripts in the following order:

1. **DDL Scripts** – `DDLGOMYCODE.sql`  
   _Creates all tables with primary and foreign keys_

2. **DML Scripts** – `DML GOMYCODE.sql`  
   _Inserts sample data into tables_

3. **OLAP Queries** – `GOMYCOD SQL OLAP.sql`  
   _Performs analytical queries for sales and employee insights_

4. **ETL / Combined Project Script** – `Emono's Lifestyle 1.sql`  
   _Full setup including DDL, DML, ETL, and sample analytics_

---

### Start Exploring the Database

Manage products, employees, projects, and harvest sales, and run analytics to gain insights.

---
 

*Stay healthy and data-driven with **Emono's Healthy Lifestyle**!*


