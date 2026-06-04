/*
=========================================
Bronze Layer Load Script
=========================================
Purpose:
Load raw data from external CSV files into
Bronze schema tables.

Warning:
- Ensure CSV file paths are correct.
- SQL Server service account must have access
  to the source files.
- Data is loaded as-is without transformations.
=========================================
*/

USE DataWarehouse;
GO

-- Load Customer Data
BULK INSERT Bronze.crm_cust_info
FROM 'C:\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

-- Load Product Data
BULK INSERT Bronze.crm_prd_info
FROM 'C:\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

-- Load Sales Data
BULK INSERT Bronze.crm_sales_details
FROM 'C:\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO
