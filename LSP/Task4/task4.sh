#!/bin/bash

# Function to print number of lines in a file
count_lines() {
    file="$1"
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        echo "$file has $lines lines."
    else
        echo "$file does not exist."
    fi
}

# List of files to iterate over
files=("file1.txt" "file2.txt" "file3.txt")

# Loop over each file and call the function
for file in "${files[@]}"
do
    count_lines "$file"
done
