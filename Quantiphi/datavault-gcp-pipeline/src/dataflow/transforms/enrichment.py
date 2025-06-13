def enrich_data(record):
    # Example of region-specific tax rates
    tax_rates = {
        'North': 0.07,
        'South': 0.06,
        'East': 0.08,
        'West': 0.05
    }

    # Enrich the record with tax rate based on region
    region = record.get('region')
    if region in tax_rates:
        record['tax_rate'] = tax_rates[region]
    else:
        record['tax_rate'] = 0.0  # Default tax rate if region is unknown

    return record