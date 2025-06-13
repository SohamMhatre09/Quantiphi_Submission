# Deployment Guide for DataVault GCP Pipeline

## Overview
This guide provides step-by-step instructions for deploying the DataVault GCP Pipeline, which processes sales data using Google Cloud Platform services. The pipeline utilizes Cloud Storage, BigQuery, Dataflow, and Cloud Pub/Sub to ensure secure and efficient data processing.

## Prerequisites
- A Google Cloud Platform account with billing enabled.
- The Google Cloud SDK installed on your local machine.
- Access to the project directory containing the DataVault GCP Pipeline files.

## Step 1: Set Up Google Cloud Project
1. Log in to your Google Cloud Console.
2. Create a new project or select an existing project.
3. Enable the following APIs:
   - Cloud Storage API
   - BigQuery API
   - Dataflow API
   - Pub/Sub API

## Step 2: Configure IAM Roles
1. Navigate to the IAM & Admin section in the Google Cloud Console.
2. Assign the necessary roles to your service accounts as defined in `config/iam/service_account_roles.json`.

## Step 3: Create Pub/Sub Topics and Subscriptions
1. Use the configurations in `config/pubsub/topics.json` and `config/pubsub/subscriptions.json` to create the required Pub/Sub topics and subscriptions.
2. You can use the Google Cloud Console or the `gcloud` command-line tool to create these resources.

## Step 4: Set Up Cloud Storage Buckets
1. Create the Cloud Storage buckets for raw, processed, and archived data.
2. Use the bucket policies defined in `config/iam/bucket_policies.json` to restrict access to these buckets.

## Step 5: Deploy the Dataflow Pipeline
1. Navigate to the `infrastructure/scripts` directory.
2. Run the setup script to initialize the GCP resources:
   ```
   bash setup_gcp.sh
   ```
3. Deploy the Dataflow pipeline using the deploy script:
   ```
   bash deploy.sh
   ```

## Step 6: Load Sample Data
1. Upload the sample sales data CSV file located in `data/sample/sales_data.csv` to the raw data bucket in Cloud Storage.

## Step 7: Monitor the Pipeline
1. Set up monitoring and alerts as defined in `config/monitoring/alerts.json`.
2. Use Cloud Monitoring and Cloud Logging to track the performance and logs of the pipeline.

## Step 8: Troubleshooting
Refer to the `docs/troubleshooting.md` file for instructions on monitoring and troubleshooting the pipeline in case of issues.

## Conclusion
Following these steps will successfully deploy the DataVault GCP Pipeline, enabling you to process sales data securely and efficiently using Google Cloud Platform services. For further assistance, refer to the documentation in the `docs` directory.