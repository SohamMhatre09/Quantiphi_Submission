from google.cloud import pubsub_v1
import json
import os

def trigger_dataflow(event, context):
    """Triggered from a message on a Cloud Pub/Sub topic."""
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    print(f"Received message: {pubsub_message}")

    # Extract the bucket and file name from the message
    message_data = json.loads(pubsub_message)
    bucket_name = message_data['bucket']
    file_name = message_data['name']

    # Here you would typically trigger the Dataflow job
    # For example, using the Dataflow client library
    # dataflow_client = DataflowClient()
    # dataflow_client.run_job(bucket_name, file_name)

    print(f"Triggering Dataflow pipeline for file: gs://{bucket_name}/{file_name}")

# Note: Ensure that the necessary permissions are set for the Cloud Function to access Pub/Sub and Dataflow.