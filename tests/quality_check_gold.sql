# Gold Layer Quality Checks

## Objective

The purpose of these quality checks is to ensure that the Gold Layer contains accurate, complete, and business-ready data for reporting and analytics.

---

## 1. Primary Key Validation

Verify that surrogate keys are unique and not null.

### Customer Dimension

```sql
SELECT customer_key, COUNT(*)
FROM Gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;
```

### Product Dimension

```sql
SELECT product_key, COUNT(*)
FROM Gold.dim_product
GROUP BY product_key
HAVING COUNT(*) > 1;
```

---

## 2. Null Value Checks

Ensure critical columns do not contain NULL values.

### Customers

```sql
SELECT *
FROM Gold.dim_customers
WHERE customer_id IS NULL;
```

### Products

```sql
SELECT *
FROM Gold.dim_product
WHERE product_id IS NULL;
```

### Sales

```sql
SELECT *
FROM Gold.fact_sales
WHERE order_number IS NULL;
```

---

## 3. Referential Integrity Checks

Verify that all foreign keys in the fact table exist in the corresponding dimensions.

### Product Validation

```sql
SELECT *
FROM Gold.fact_sales fs
LEFT JOIN Gold.dim_product dp
ON fs.product_key = dp.product_key
WHERE dp.product_key IS NULL;
```

### Customer Validation

```sql
SELECT *
FROM Gold.fact_sales fs
LEFT JOIN Gold.dim_customers dc
ON fs.customer_id = dc.customer_id
WHERE dc.customer_id IS NULL;
```

---

## 4. Duplicate Record Checks

### Customers

```sql
SELECT customer_id, COUNT(*)
FROM Gold.dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
```

### Products

```sql
SELECT product_number, COUNT(*)
FROM Gold.dim_product
GROUP BY product_number
HAVING COUNT(*) > 1;
```

---

## 5. Sales Validation

Check for invalid sales values.

```sql
SELECT *
FROM Gold.fact_sales
WHERE sales_amount < 0
   OR quantity <= 0
   OR price < 0;
```

---

## 6. Date Validation

Ensure date relationships are valid.

```sql
SELECT *
FROM Gold.fact_sales
WHERE shipping_date < order_date
   OR due_date < order_date;
```

---

## 7. Record Count Validation

Compare source and target record counts.

```sql
SELECT COUNT(*) AS Sales_Source
FROM Silver.crm_sales_details;

SELECT COUNT(*) AS Sales_Gold
FROM Gold.fact_sales;
```

---

## Expected Result

* No duplicate surrogate keys.
* No NULL values in critical business columns.
* No orphan foreign keys.
* No negative sales or invalid quantities.
* Valid date relationships.
* Record counts aligned with source data.
* Gold Layer ready for reporting and analytics.
