#!/bin/bash
# Script to calculate and display the size of a specified directory

# Prompt the user to enter the directory path
read -p "Enter the directory path: " kk

# Check if the path is a valid directory
if [ -d "$kk" ]; then
    echo "Calculating the size of the directory..."
    size=$(du -sh "$kk" 2>/dev/null | cut -f1)
    echo "The size of the directory '$kk' is: $size"
else
    echo "Error: '$kk' is not a valid directory or does not exist."
fi
