provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "raw_data_bucket" {
  name     = "${var.project_id}-raw-data"
  location = var.region
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "processed_data_bucket" {
  name     = "${var.project_id}-processed-data"
  location = var.region
  storage_class = "STANDARD"
}

resource "google_storage_bucket" "archived_data_bucket" {
  name     = "${var.project_id}-archived-data"
  location = var.region
  storage_class = "ARCHIVE"
}

resource "google_pubsub_topic" "data_upload_topic" {
  name = "${var.project_id}-data-upload"
}

resource "google_pubsub_subscription" "data_upload_subscription" {
  name  = "${var.project_id}-data-upload-subscription"
  topic = google_pubsub_topic.data_upload_topic.id
}

resource "google_bigquery_dataset" "sales_data_dataset" {
  dataset_id = "${var.project_id}_sales_data"
  location   = var.region
}

resource "google_dataflow_job" "data_processing_job" {
  name     = "${var.project_id}-data-processing-job"
  template = "gs://dataflow-templates/wordcount/template"
  parameters = {
    inputFile  = "gs://${google_storage_bucket.raw_data_bucket.name}/*.csv"
    outputFile = "gs://${google_storage_bucket.processed_data_bucket.name}/output"
  }
}

output "raw_data_bucket_name" {
  value = google_storage_bucket.raw_data_bucket.name
}

output "processed_data_bucket_name" {
  value = google_storage_bucket.processed_data_bucket.name
}

output "archived_data_bucket_name" {
  value = google_storage_bucket.archived_data_bucket.name
}

output "pubsub_topic_name" {
  value = google_pubsub_topic.data_upload_topic.name
}

output "bigquery_dataset_id" {
  value = google_bigquery_dataset.sales_data_dataset.dataset_id
}