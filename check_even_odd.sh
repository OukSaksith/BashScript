#!/bin/bash
# Script to check if a number is odd or even

# Prompt the user for input
read -p "Enter a number: " number

# Check if the input is a valid integer
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please enter a valid integer."
    exit 1
fi

# Check if the number is even or odd
if (( number % 2 == 0 )); then
    echo "$number is even."
else
    echo "$number is odd."
fi

