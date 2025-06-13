#!/bin/bash

echo "Counting lines in all .txt files..."

for file in *.txt
do
  if [[ -f "$file" ]]; then
    line_count=$(wc -l < "$file")
    echo "$file has $line_count lines."
  else
    echo "No .txt files found."
  fi
done
