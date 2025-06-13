variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region where GCP resources will be created"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket for raw data"
  type        = string
}

variable "bigquery_dataset" {
  description = "The name of the BigQuery dataset for processed data"
  type        = string
}

variable "pubsub_topic" {
  description = "The name of the Pub/Sub topic for triggering the Dataflow pipeline"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account used for Dataflow and Cloud Functions"
  type        = string
}