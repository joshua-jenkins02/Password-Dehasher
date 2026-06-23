#!/bin/bash

# Usage: ./hash_lines.sh input.txt

echo -e "What hashing algorithm would you like to you?\n"

echo -e "1. MD5\n2. SHA-1\n3. SHA-224\n4. SHA-256\n5. SHA-384\n6. SHA-512\n"

read hashing_algorithm

if [[ $hashing_algorithm -eq 1 ]]; 
then
	hashing_algorithm="md5sum"
	echo -e "You have selected MD5\n"
	sleep 5
elif [[ $hashing_algorithm -eq 2 ]]; then
	hashing_algorithm="sha1sum"
	echo -e "You have selected SHA-1\n"
	sleep 5
elif [[ $hashing_algorithm -eq 3 ]]; then
	hashing_algorithm="sha224sum"
	echo -e "You have selected SHA-224\n"
	sleep 5
elif [[ $hashing_algorithm -eq 4 ]]; then
	hashing_algorithm="sha256sum"
	echo -e "You have selected SHA-256\n"
	sleep 5
elif [[ $hashing_algorithm -eq 5 ]]; then
	hashing_algorithm="sha384sum"
	echo -e "You have selected SHA-384\n"
	sleep 5
elif [[ $hashing_algorithm -eq 6 ]]; then
	hashing_algorithm="sha512sum"
	echo -e "You have selected SHA-512\n"
	sleep 5
else
	echo -e "Please run the script again and select a valid hashing algorithm\n"
	exit
fi

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

    hash=$(printf "%s" "$line" | $hashing_algorithm | awk '{print $1}')



    # Print original line and hash

    echo "$line : $hash"

done < "$1"
