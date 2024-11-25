#!/bin/bash
# Script to check if a number is prime

# Prompt user for input
read -p "Enter a number: " number

# Check if input is a valid positive integer
if ! [[ "$number" =~ ^[0-9]+$ ]] || [ "$number" -le 1 ]; then
    echo "Error: Please enter a valid positive integer greater than 1."
    exit 1
fi

# Check for primality
is_prime=true

# We only need to check divisibility up to the square root of the number
for ((i=2; i*i<=number; i++)); do
    if ((number % i == 0)); then
        is_prime=false
        break
    fi
done

# Output result
if [ "$is_prime" = true ]; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi

