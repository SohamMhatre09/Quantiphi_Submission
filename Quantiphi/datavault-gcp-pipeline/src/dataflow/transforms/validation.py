def validate_record(record):
    """
    Validate a single record from the sales data.

    Args:
        record (dict): A dictionary representing a single record.

    Returns:
        bool: True if the record is valid, False otherwise.
    """
    required_fields = ['id', 'date', 'amount', 'region']
    
    for field in required_fields:
        if field not in record or record[field] is None:
            return False
    
    # Additional validation can be added here (e.g., checking data types)
    
    return True