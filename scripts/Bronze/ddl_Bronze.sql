/*=============================================================
  Author      : Bhumija Singh
  Project     : SQL Data Warehouse Project
  Layer       : Bronze
  Description : Raw data ingestion layer.
                Data is loaded directly from source files
                without any transformations.

  Warning     : Do not perform data cleaning or business
                transformations in the Bronze layer.
                Store source data as-is.

  Created On  : 04-Jun-2026
=============================================================*/

USE DataWarehouse;
GO

/*=============================================================
  Create Bronze Schema
=============================================================*/
IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'Bronze'
)
BEGIN
    EXEC('CREATE SCHEMA Bronze');
END;
GO

/*=============================================================
  CRM Customer Information
=============================================================*/
IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_cust_info;
GO

CREATE TABLE Bronze.crm_cust_info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(20),
    cst_gndr NVARCHAR(10),
    cst_create_date DATE
);
GO

/*=============================================================
  CRM Product Information
=============================================================*/
IF OBJECT_ID('Bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_prd_info;
GO

CREATE TABLE Bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(100),
    prd_cost DECIMAL(10,2),
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);
GO

/*=============================================================
  CRM Sales Details
=============================================================*/
IF OBJECT_ID('Bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_sales_details;
GO

CREATE TABLE Bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales DECIMAL(10,2),
    sls_quantity INT,
    sls_price DECIMAL(10,2)
);
GO

/*=============================================================
  ERP Customer Information
=============================================================*/
IF OBJECT_ID('Bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_cust_az12;
GO

CREATE TABLE Bronze.erp_cust_az12 (
    CID NVARCHAR(50),
    BDATE DATE,
    GEN NVARCHAR(10)
);
GO

/*=============================================================
  ERP Location Information
=============================================================*/
IF OBJECT_ID('Bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_loc_a101;
GO

CREATE TABLE Bronze.erp_loc_a101 (
    CID NVARCHAR(50),
    CNTRY NVARCHAR(50)
);
GO

/*=============================================================
  ERP Product Categories
=============================================================*/
IF OBJECT_ID('Bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_px_cat_g1v2;
GO

CREATE TABLE Bronze.erp_px_cat_g1v2 (
    ID NVARCHAR(50),
    CAT NVARCHAR(50),
    SUBCAT NVARCHAR(50),
    MAINTENANCE NVARCHAR(50)
);
GO

PRINT 'Bronze Layer Tables Created Successfully';
GO
