#!/bin/bash

# Define source and destination directories
source_dir="csv"
destination_dir="json_and_CSV"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Move all CSV and JSON files
mv "$source_dir"/*.csv "$destination_dir" 2>/dev/null
mv "$source_dir"/*.json "$destination_dir" 2>/dev/null

echo "CSV and JSON files moved to $destination_dir"
