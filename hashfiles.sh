#!/bin/bash

# Usage: ./hash_lines.sh input.txt



# Check if file exists

if [[ ! -f "$1" ]]; then

    echo "Error: File not found."

    exit 1

fi



# Read file line by line

while IFS= read -r line || [[ -n "$line" ]]; do

    # Skip empty lines if desired

    if [[ -z "$line" ]]; then

        continue

    fi



    # Hash the line (without adding extra newline)

    hash=$(printf "%s" "$line" | sha1sum | awk '{print $1}')



    # Print original line and hash

    echo "$line : $hash"

done < "$1"
