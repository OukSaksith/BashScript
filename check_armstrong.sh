#!/bin/bash
# Script to check if a number is an Armstrong number

# Prompt user for input
read -p "Enter a number: " number

# Check if input is a valid number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid positive integer."
    exit 1
fi

# Calculate the number of digits
num_digits=${#number}

# Initialize a variable to hold the sum of digits raised to the power of num_digits
sum=0

# Store the original number to compare later
temp=$number

# Loop through each digit of the number
while [ $temp -gt 0 ]; do
    # Get the last digit of the number
    digit=$((temp % 10))
    
    # Raise the digit to the power of num_digits and add it to the sum
    sum=$((sum + digit**num_digits))
    
    # Remove the last digit from the number
    temp=$((temp / 10))
done

# Check if the sum equals the original number
if [ $sum -eq $number ]; then
    echo "$number is an Armstrong number."
else
    echo "$number is not an Armstrong number."
fi

