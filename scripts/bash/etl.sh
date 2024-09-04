#!/bin/bash

env_file=".env"

if [ -f "$env_file" ]; then
    # Source the .env file to load environment variables
    set -o allexport
    source "$env_file"
else
    echo ".env file not found!"
fi

# Create a new folder called "raw"
mkdir -p raw

# update permissions on the raw folder
chmod 755 raw

# Extract CSV file - download from the URL

curl $URL -o raw/2023-finance-year.csv
if [ $? -eq 0 ]; then
  echo "File downloaded successfully to raw directory."
else
  echo "Error downloading file."
  exit 1
fi

# Transform the data

# create a new folder called "Transformed"
mkdir -p Transformed

# update permissions on the Transformed folder
chmod 755 Transformed

# awk -F',' 'BEGIN {print "Year,Value,Units,variable_code"} 
# NR>1 {
#     # Remove double quotes from any field
#     gsub(/"/, "", $0);
#     # Print Year, Value, Units, Variable_code (fields 1, 9, 5, and 6)
#     print $1 "," $9 "," $5 "," $6
# }' raw/2023-finance-year.csv > Transformed/2023_year_finance.csv

# Use cut to extract fields 1, 9, 5, and 6, then add the header manually
echo "Year,Value,Units,variable_code" > Transformed/2023_year_finance.csv
cut -d',' -f1,9,5,6 raw/2023-finance-year.csv | tail -n +2 >> Transformed/2023_year_finance.csv

# display the file has been transformed and savd
echo "Data transformed and saved to Transformed/2023_year_finance.csv"

# Load the transformed data in Gold

# create a new folder called "Gold"
mkdir -p Gold

# load the transformed csv file from Transformd folder to the Gold folder
mv Transformed/2023_year_finance.csv Gold/

# display the data has been loaded
echo "Data loaded to Gold directory."