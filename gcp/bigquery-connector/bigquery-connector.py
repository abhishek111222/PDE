from warnings import filterwarnings
from google.cloud import bigquery

# Initialize the BigQuery client
client = bigquery.Client()

# Now you can use the client to interact with BigQuery



query = """
    SELECT name, COUNT(*) as name_count
    FROM `bigquery-public-data.usa_names.usa_1910_2013`
    GROUP BY name
    ORDER BY name_count DESC
    LIMIT 10
"""
query_job = client.query(query)  # Run the query

# Print the results
for row in query_job:
    print(f"name: {row.name}, count: {row.name_count}")

