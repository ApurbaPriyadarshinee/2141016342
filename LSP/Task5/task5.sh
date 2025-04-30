#!/bin/bash

word="example"
file="sample.txt"

if [ -f "$file" ]; then
    echo "Occurrences of '$word' in $file (sorted):"
    grep -i "$word" "$file" | sort
else
    echo "File '$file' not found."
fi
