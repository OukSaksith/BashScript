#!/bin/bash
# Script to convert a decimal number to binary

# Prompt user for input
read -p "Enter a decimal number: " decimal

# Check if the input is a valid positive integer
if ! [[ "$decimal" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid positive integer."
    exit 1
fi

# Convert decimal to binary using bc
binary=$(echo "obase=2; $decimal" | bc)

# Output the result
echo "Binary representation of $decimal is: $binary"

