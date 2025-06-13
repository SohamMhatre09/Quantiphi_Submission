output "bucket_name" {
  value = google_storage_bucket.raw_data_bucket.name
}

output "bigquery_dataset_id" {
  value = google_bigquery_dataset.sales_data_dataset.dataset_id
}

output "dataflow_job_name" {
  value = google_dataflow_job.sales_data_pipeline.job_id
}

output "pubsub_topic_name" {
  value = google_pubsub_topic.sales_data_topic.name
}

output "pubsub_subscription_name" {
  value = google_pubsub_subscription.sales_data_subscription.name
}