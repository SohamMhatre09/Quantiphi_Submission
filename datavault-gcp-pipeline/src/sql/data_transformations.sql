-- SQL statements for transforming the sales data in BigQuery

-- Example transformation: Calculate total sales amount and group by region
CREATE OR REPLACE TABLE `your_project_id.your_dataset_id.transformed_sales_data` AS
SELECT
    region,
    SUM(sales_amount) AS total_sales,
    COUNT(*) AS total_transactions
FROM
    `your_project_id.your_dataset_id.raw_sales_data`
GROUP BY
    region;

-- Additional transformation: Add a column for tax amount based on region-specific tax rates
CREATE OR REPLACE TABLE `your_project_id.your_dataset_id.final_sales_data` AS
SELECT
    *,
    CASE
        WHEN region = 'North' THEN total_sales * 0.05
        WHEN region = 'South' THEN total_sales * 0.07
        WHEN region = 'East' THEN total_sales * 0.06
        WHEN region = 'West' THEN total_sales * 0.04
        ELSE 0
    END AS tax_amount
FROM
    `your_project_id.your_dataset_id.transformed_sales_data`;