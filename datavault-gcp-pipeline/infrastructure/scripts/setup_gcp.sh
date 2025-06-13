#!/bin/bash

# This script automates the initial setup of GCP resources for DataVault Solutions.

# Set variables
PROJECT_ID="your-gcp-project-id"
REGION="us-central1"
BUCKET_NAME="datavault-solutions-bucket"
DATASET_NAME="sales_data_dataset"
TOPIC_NAME="data-upload-topic"
SUBSCRIPTION_NAME="data-upload-subscription"

# Create a new Cloud Storage bucket
gsutil mb -p $PROJECT_ID -l $REGION gs://$BUCKET_NAME

# Create BigQuery dataset
bq mk --project $PROJECT_ID $DATASET_NAME

# Create Pub/Sub topic
gcloud pubsub topics create $TOPIC_NAME --project=$PROJECT_ID

# Create Pub/Sub subscription
gcloud pubsub subscriptions create $SUBSCRIPTION_NAME --topic=$TOPIC_NAME --project=$PROJECT_ID

# Output the created resources
echo "Created Cloud Storage bucket: gs://$BUCKET_NAME"
echo "Created BigQuery dataset: $DATASET_NAME"
echo "Created Pub/Sub topic: $TOPIC_NAME"
echo "Created Pub/Sub subscription: $SUBSCRIPTION_NAME"