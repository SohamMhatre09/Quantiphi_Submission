from apache_beam import Pipeline
from apache_beam.options.pipeline_options import PipelineOptions
from transforms.validation import validate_record
from transforms.enrichment import enrich_data
import apache_beam as beam

def run(argv=None):
    # Define pipeline options
    options = PipelineOptions(argv)

    # Create a Dataflow pipeline
    with Pipeline(options=options) as p:
        (p
         | 'Read CSV' >> beam.io.ReadFromText('gs://your-bucket-name/raw/sales_data.csv')
         | 'Parse CSV' >> beam.Map(lambda line: line.split(','))
         | 'Validate Records' >> beam.Filter(validate_record)
         | 'Enrich Data' >> beam.Map(enrich_data)
         | 'Write to BigQuery' >> beam.io.WriteToBigQuery(
             'your-project-id:your_dataset.your_table',
             schema='field1:STRING,field2:FLOAT,field3:STRING',
             write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND)
         | 'Write to Cloud Storage' >> beam.io.WriteToText('gs://your-bucket-name/processed/sales_data', file_name_suffix='.csv')
        )

if __name__ == '__main__':
    run()