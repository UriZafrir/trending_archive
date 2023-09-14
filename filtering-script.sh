#!/bin/bash
#script to search for a keyword for all trending repositories in github
# Get a list of all folders in the current directory
folders=$(find . -maxdepth 1 -type d)

# Loop through each folder
for folder in $folders; do
  # Check if it's the current directory (.) or parent directory (..)
  if [ "$folder" != "." ] && [ "$folder" != ".." ]; then
    # Extract the folder name
    folder_name=$(basename "$folder")

    # Change to the folder
    cd "$folder" || exit 1

    # Run script and create a file with a name like "filtered<foldername>.txt"
    grep -rni "gpt" | sed 's/.*https/https/' > "../filtered${folder_name}.txt"
    #echo ${folder_name}
    
    # Change back to the original directory
    cd - || exit 1
  fi
done
