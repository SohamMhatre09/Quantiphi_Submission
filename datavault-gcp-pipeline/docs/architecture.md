# DataVault Solutions GCP Architecture Overview

## Introduction
This document provides an overview of the architecture for the DataVault Solutions project, which leverages Google Cloud Platform (GCP) services to create a secure, scalable, and efficient data processing pipeline for enterprise data storage and processing.

## Architecture Components

### 1. Google Cloud Storage (GCS)
- **Purpose**: GCS is used for storing raw, processed, and archived data. It provides a durable and highly available storage solution.
- **Bucket Structure**:
  - `gs://datavault-raw-data/`: For storing raw CSV files.
  - `gs://datavault-processed-data/`: For storing processed data.
  - `gs://datavault-archived-data/`: For storing archived data.

### 2. Google Cloud Pub/Sub
- **Purpose**: Pub/Sub is a messaging service that allows for asynchronous communication between services. It triggers the data processing pipeline when new data is uploaded to the raw data bucket.
- **Components**:
  - **Topic**: `datavault-new-data`
  - **Subscription**: `datavault-data-trigger`

### 3. Google Dataflow
- **Purpose**: Dataflow is a fully managed service for stream and batch data processing. It is used to process the sales data, including parsing, validation, and enrichment.
- **Pipeline Steps**:
  - Ingest raw CSV files from GCS.
  - Validate records for missing or incorrect fields.
  - Enrich data with additional metadata (e.g., tax rates).
  - Store processed data back into GCS and BigQuery.

### 4. Google BigQuery
- **Purpose**: BigQuery is a serverless, highly scalable, and cost-effective multi-cloud data warehouse. It is used for storing and analyzing processed sales data.
- **Tables**:
  - `sales_data`: Stores the enriched sales data.

### 5. Google Cloud Identity and Access Management (IAM)
- **Purpose**: IAM is used to manage access to GCP resources securely. It ensures that only authorized users and service accounts can access the storage buckets and BigQuery datasets.
- **Roles**:
  - Service accounts with specific roles for accessing GCS, Dataflow, and BigQuery.

### 6. Monitoring and Logging
- **Purpose**: Cloud Monitoring and Cloud Logging are used to monitor the performance of the pipeline and log events for troubleshooting.
- **Alerts**:
  - Alerts for failed Dataflow jobs.
  - Alerts for high latency in Pub/Sub message processing.
  - Alerts for exceeding BigQuery query quotas.

## Conclusion
The architecture designed for DataVault Solutions effectively utilizes GCP services to create a robust data processing pipeline. By leveraging Cloud Storage, Pub/Sub, Dataflow, and BigQuery, the solution ensures scalability, security, and performance, meeting the needs of enterprise data storage and processing.