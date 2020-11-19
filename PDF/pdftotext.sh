#!/bin/sh

PDF_FILE_PATH=./

find "$PDF_FILE_PATH" -name '*.pdf' -print0 | while IFS= read -r -d '' filename; do
echo $filename
pdftotext -layout "$filename" "$filename.txt"
done
