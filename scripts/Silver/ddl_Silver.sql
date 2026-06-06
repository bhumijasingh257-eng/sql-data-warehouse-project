/*========================================================================================================================
    SILVER LAYER - DATA CLEANSING & TRANSFORMATION
==========================================================================================================================

    PURPOSE
    -------
    This script loads data from the Bronze Layer into the Silver Layer by applying
    data cleansing, validation, standardization, and transformation rules to ensure
    high-quality and consistent data for analytical processing.

    TRANSFORMATIONS APPLIED
    -----------------------
    1. Remove duplicate records
    2. Handle null and missing values
    3. Standardize text formats
    4. Apply business rules and validations
    5. Correct invalid dates and values
    6. Clean customer, product, sales and ERP data
    7. Create derived attributes where required

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

    PROJECT
    -------
    SQL Data Warehouse Project

========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.crm_cust_info
    PURPOSE:
        - Remove duplicate customer records
        - Standardize marital status values
        - Standardize gender values
        - Trim unwanted spaces
========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.crm_prd_info
    PURPOSE:
        - Clean product keys
        - Standardize product line values
        - Replace null product costs
        - Calculate product end dates
========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.crm_sales_details
    PURPOSE:
        - Validate sales amounts
        - Correct missing sales values
        - Correct missing prices
        - Apply sales business rules
========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.erp_LOC_a101
    PURPOSE:
        - Clean customer identifiers
        - Standardize country names
        - Handle missing country values
========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.erp_LOC_az12
    PURPOSE:
        - Clean customer identifiers
        - Validate birth dates
        - Standardize gender values
========================================================================================================================*/


/*========================================================================================================================
    TABLE: Silver.erp_px_cat_g1v2
    PURPOSE:
        - Load product category information
        - Preserve category hierarchy
        - Preserve maintenance attributes
