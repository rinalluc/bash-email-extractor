#!/bin/bash
start0=`date +%s`

echo -n "Enter the folder to process [Enter]: "
read input
echo -n "Enter the output file [Enter]: "
read output

max_filesize_bytes=20000000

# Validation of input and output paths
if [[ ! -d "$input" ]]; then
    echo "Error: Input folder does not exist."
    exit 1
fi

# Clear existing output file
> "$output"

echo -e "Splitting large files..."

for file in "$input"/*; do
    filesize=$(stat -c%s "$file")
    if (( filesize > max_filesize_bytes )); then
        echo "$file"
        split -b "$max_filesize_bytes" --numeric-suffixes "$file" "$file"-split-
        echo "...splitted!"
    fi
done

echo -e "-------------------------------------------------"

echo -e "Extracting email addresses..."

for file in "$input"/*; do
    filesize=$(stat -c%s "$file")
    if (( filesize <= max_filesize_bytes )); then
        echo "$file"
        start=`date +%s`
        grep -E -o "[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}" "$file" >> temp.tmp
        end=`date +%s`
        runtime=$((end-start))
        echo -e "File completed in $runtime sec"
    fi
done

echo -e "-------------------------------------------------"

echo -e "Removing duplicate email addresses..."

start=`date +%s`
awk '!a[$0]++' temp.tmp >> "$output"
end=`date +%s`
runtime=$((end-start))
echo "Removed duplicates in $runtime sec"

echo -e "-------------------------------------------------"

echo -e "Cleaning up..."

# Remove the temporary file
rm temp.tmp

# Remove the splitted files
find "$input" -type f -name "*-split-*" -exec rm -f {} \;

echo -e "-------------------------------------------------"

end0=`date +%s`
runtime0=$((end0-start0))
echo -e "Entire process completed in $runtime0 sec\n"
