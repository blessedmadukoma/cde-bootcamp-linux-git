#!/bin/bash

env_file=".env"

if [ -f "$env_file" ]; then
    # Source the .env file to load environment variables
    set -o allexport
    source "$env_file"
else
    echo ".env file not found!"
fi

# Directory containing the CSV files
csv_dir="parch_and_posey"

# Loop through each CSV file in the directory
for csv_file in "$csv_dir"/*.csv; do
  # Get the table name based on the CSV file name
  table_name=$(basename "$csv_file" .csv)

  # Import the CSV file into the PostgreSQL database
  psql -h "$POSTGRES_HOST" -d "$SHELL_DESTINATION_DB" -U "$POSTGRES_USER" -p "$POSTGRES_PORT" -c "\COPY $table_name FROM '$csv_file' WITH CSV HEADER"

  echo "Imported $csv_file into $table_name"
done
