/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

EXEC Bronze.load_bronze

CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '==============================================';
		PRINT 'Loading Bronze Layer';
		PRINT '===============================================';

		PRINT'-------------------------------------------------';
		PRINT  'Loading CRM tables';
		PRINT '-------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating table : Bronze.cust_info';
		TRUNCATE TABLE Bronze.crm_cust_info

		PRINT 'Inserting into : Bronze.cust_info';
		BULK INSERT Bronze.crm_cust_info
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		PRINT 'Truncating table : Bronze.prd_info';
		TRUNCATE TABLE Bronze.crm_prd_info

		PRINT 'Inserting into : Bronze.prd_info';
		BULK INSERT Bronze.crm_prd_info
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT 'Truncating table : Bronze.sales_details';
		TRUNCATE TABLE Bronze.crm_sales_details

		PRINT 'Inserting into : Bronze.sales_details';
		BULK INSERT Bronze.crm_sales_details
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '==============================================';
		PRINT 'Loading Bronze Layer';
		PRINT '===============================================';
	
		PRINT'-------------------------------------------------';
		PRINT  'Loading ERP tables';
		PRINT '-------------------------------------------------';

		PRINT 'Truncating table : Bronze.erp_loc_a101';
		TRUNCATE TABLE Bronze.erp_loc_a101

		PRINT 'Inserting into : Bronze.erp_loc_a101';
		BULK INSERT Bronze.erp_loc_a101
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT 'Truncating table : Bronze.cust_az12';
		TRUNCATE TABLE Bronze.erp_cust_az12

		PRINT 'Inserting into : Bronze.erp_cust_az12';
		BULK INSERT Bronze.erp_cust_az12
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT 'Truncating table : Bronze.px_cat_g1v2';
		TRUNCATE TABLE Bronze.erp_px_cat_g1v2

		PRINT 'Inserting into : Bronze.erp_px_cat_g1v2';
		BULK INSERT Bronze.erp_px_cat_g1v2
		FROM 'C:\Users\morem\Desktop\Placement Preparation\Projects\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
    PRINT '======================================';
    PRINT 'ERROR OCCURRED DURING EXECUTION LOADING BRONZE LAYER';
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Number:  ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
    PRINT 'Error State:   ' + CAST(ERROR_STATE() AS NVARCHAR(10));
    PRINT '======================================';
END CATCH;

END
