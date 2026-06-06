# Gold Layer

## Overview

The Gold Layer represents the business-ready data model of the data warehouse. It contains cleansed, transformed, and aggregated data organized into Fact and Dimension tables following a Star Schema design. This layer is optimized for reporting, analytics, and business intelligence workloads.

---

## Objectives

* Provide a single source of truth for business reporting.
* Support analytical queries with optimized dimensional modeling.
* Improve data accessibility and performance for BI tools.
* Maintain consistent business definitions across reports.

---

## Data Model

### Dimension Tables

#### dim_customers

Stores customer-related attributes including personal information, demographics, and location details.

**Source Tables**

* Silver.crm_cust_info
* Silver.erp_LOC_az12
* Silver.erp_LOC_a101

**Business Key**

* customer_id

**Surrogate Key**

* customer_key

---

#### dim_product

Stores product master data and active product information.

**Source Table**

* Silver.crm_prd_info

**Business Key**

* product_number

**Surrogate Key**

* product_key

---

### Fact Tables

#### fact_sales

Stores transactional sales data and references dimension tables through keys.

**Source Table**

* Silver.crm_sales_details

**Referenced Dimensions**

* dim_customers
* dim_product

**Grain**

* One record per sales order line item.

---

## Gold Layer Views

### Create Customer Dimension

```sql
CREATE VIEW Gold.dim_customers AS
-- Customer Dimension View
```

### Create Product Dimension

```sql
CREATE VIEW Gold.dim_product AS
-- Product Dimension View
```

### Create Sales Fact Table

```sql
CREATE VIEW Gold.fact_sales AS
-- Sales Fact View
```

---

## Star Schema

fact_sales
├── customer_id → dim_customers
└── product_key → dim_product

---

## Benefits

* Business-ready analytical dataset
* Improved query performance
* Simplified reporting structure
* Consistent dimensional modeling
* Scalable architecture for future enhancements
