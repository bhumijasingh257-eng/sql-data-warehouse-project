# Data Dictionary

## Dimension Table: dim_customers

| Column Name     | Data Type    | Description                                          |
| --------------- | ------------ | ---------------------------------------------------- |
| customer_key    | INT          | Surrogate key generated using ROW_NUMBER().          |
| customer_id     | INT          | Original customer identifier from source CRM system. |
| customer_number | NVARCHAR(50) | Unique customer business key.                        |
| first_name      | NVARCHAR(50) | Customer first name.                                 |
| last_name       | NVARCHAR(50) | Customer last name.                                  |
| material_status | NVARCHAR(50) | Customer marital status.                             |
| gender          | NVARCHAR(50) | Customer gender derived from CRM and ERP sources.    |
| create_date     | DATE         | Customer record creation date.                       |
| birthdate       | DATE         | Customer date of birth.                              |
| country         | NVARCHAR(50) | Customer country/location information.               |

---

## Dimension Table: dim_product

| Column Name    | Data Type     | Description                                     |
| -------------- | ------------- | ----------------------------------------------- |
| product_key    | INT           | Surrogate key generated using ROW_NUMBER().     |
| product_id     | INT           | Original product identifier from source system. |
| product_number | NVARCHAR(50)  | Product business key.                           |
| product_name   | NVARCHAR(100) | Product name.                                   |
| cost           | DECIMAL       | Product cost.                                   |
| product_line   | NVARCHAR(50)  | Product category or product line.               |
| start_date     | DATE          | Product validity start date.                    |

---

## Fact Table: fact_sales

| Column Name   | Data Type    | Description                                  |
| ------------- | ------------ | -------------------------------------------- |
| order_number  | NVARCHAR(50) | Unique sales order number.                   |
| product_key   | INT          | Foreign key referencing dim_product.         |
| customer_id   | INT          | Customer identifier linked to dim_customers. |
| order_date    | DATE         | Date when the order was placed.              |
| shipping_date | DATE         | Date when the order was shipped.             |
| due_date      | DATE         | Expected delivery/due date.                  |
| sales_amount  | DECIMAL      | Total sales amount for the transaction.      |
| quantity      | INT          | Quantity of products sold.                   |
| price         | DECIMAL      | Unit selling price of the product.           |

---

## Data Model Relationships

| Source Table | Target Table  | Join Condition                                     |
| ------------ | ------------- | -------------------------------------------------- |
| fact_sales   | dim_product   | fact_sales.product_key = dim_product.product_key   |
| fact_sales   | dim_customers | fact_sales.customer_id = dim_customers.customer_id |

---

## Notes

* Surrogate keys are generated using SQL Server `ROW_NUMBER()`.
* Customer data is integrated from CRM and ERP source systems.
* Product dimension contains only active products (`prd_end_dt IS NULL`).
* Fact table stores transactional sales records and references dimension tables for analytics.
* The model follows a Star Schema design to support reporting and business intelligence workloads.
