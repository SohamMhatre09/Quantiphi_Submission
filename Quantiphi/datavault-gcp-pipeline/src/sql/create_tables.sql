CREATE TABLE IF NOT EXISTS `your_project_id.your_dataset.sales_data` (
    id STRING NOT NULL,
    product_name STRING NOT NULL,
    quantity INT64 NOT NULL,
    price FLOAT64 NOT NULL,
    sale_date DATE NOT NULL,
    region STRING NOT NULL,
    tax_rate FLOAT64
);

CREATE TABLE IF NOT EXISTS `your_project_id.your_dataset.processed_sales_data` (
    id STRING NOT NULL,
    product_name STRING NOT NULL,
    quantity INT64 NOT NULL,
    price FLOAT64 NOT NULL,
    sale_date DATE NOT NULL,
    region STRING NOT NULL,
    tax_rate FLOAT64,
    total_price FLOAT64 NOT NULL
);