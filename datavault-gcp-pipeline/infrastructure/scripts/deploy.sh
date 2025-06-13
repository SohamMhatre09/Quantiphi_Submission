#!/bin/bash

# Set variables
PROJECT_ID="your-gcp-project-id"
REGION="us-central1"
DATAFLOW_JOB_NAME="dataflow-sales-pipeline"
CLOUD_FUNCTION_NAME="trigger-sales-pipeline"
BUCKET_NAME="your-gcs-bucket-name"

# Deploy Dataflow pipeline
gcloud dataflow jobs run $DATAFLOW_JOB_NAME \
    --gcs-location gs://$BUCKET_NAME/dataflow/templates/sales_pipeline_template \
    --parameters inputFile=gs://$BUCKET_NAME/raw/sales_data.csv,outputTable=$PROJECT_ID:dataset.processed_sales_data \
    --region $REGION

# Deploy Cloud Function
gcloud functions deploy $CLOUD_FUNCTION_NAME \
    --runtime python39 \
    --trigger-topic sales-data-upload \
    --source src/cloud_functions/ \
    --entry-point trigger_pipeline \
    --region $REGION \
    --project $PROJECT_ID

echo "Deployment completed successfully."