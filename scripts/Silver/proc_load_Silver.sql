/*========================================================================================================================
    STORED PROCEDURE: proc_load_Silver
==========================================================================================================================

    PURPOSE
    -------
    This stored procedure loads data from the Bronze Layer into the Silver Layer.
    During the loading process, data is cleansed, validated, standardized, and
    transformed according to business rules to ensure high-quality data for
    reporting, analytics, and downstream processing.

    PROCESS FLOW
    ------------
    1. Truncate existing Silver tables.
    2. Extract data from Bronze tables.
    3. Remove duplicate records.
    4. Standardize text values and formats.
    5. Validate data quality rules.
    6. Handle null and invalid values.
    7. Apply business transformations.
    8. Load cleansed data into Silver tables.

    SOURCE LAYER
    ------------
    Bronze

    TARGET LAYER
    ------------
    Silver

    TABLES LOADED
    -------------
    - Silver.crm_cust_info
    - Silver.crm_prd_info
    - Silver.crm_sales_details
    - Silver.erp_LOC_a101
    - Silver.erp_LOC_az12
    - Silver.erp_px_cat_g1v2

    DATA QUALITY CHECKS
    -------------------
    - Duplicate Removal
    - Null Handling
    - Data Standardization
    - Invalid Date Validation
    - Business Rule Validation
    - Reference Data Cleansing

    EXECUTION
    ---------
    EXEC Silver.proc_load_Silver;

    PROJECT
    -------
    SQL Data Warehouse Project

========================================================================================================================*/


/*========================================================================================================================
    Load Customer Information
    - Remove duplicate customer records
    - Standardize marital status values
    - Standardize gender values
    - Trim unwanted spaces
========================================================================================================================*/


/*========================================================================================================================
    Load Product Information
    - Clean product keys
    - Standardize product line values
    - Replace null product costs
    - Calculate product end dates
========================================================================================================================*/


/*========================================================================================================================
    Load Sales Information
    - Validate sales amounts
    - Correct missing sales values
    - Correct missing prices
    - Apply sales business rules
========================================================================================================================*/


/*========================================================================================================================
    Load ERP Location Data
    - Clean customer identifiers
    - Standardize country names
    - Handle missing country values
========================================================================================================================*/


/*========================================================================================================================
    Load ERP Customer Demographics
    - Clean customer identifiers
    - Validate birth dates
    - Standardize gender values
========================================================================================================================*/


/*========================================================================================================================
    Load ERP Product Categories
    - Load category hierarchy
    - Preserve maintenance attributes
========================================================================================================================*/
