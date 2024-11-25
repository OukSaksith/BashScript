#!/bin/bash
# Script to get the location of an IP address

# Prompt user for IP address input
read -p "Enter an IP address: " ip_address

# Validate if the input is a valid IP address
if ! [[ "$ip_address" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "Error: Please enter a valid IP address."
    exit 1
fi

# Get the location details using ipinfo.io API (this will give information in JSON format)
response=$(curl -s "http://ipinfo.io/$ip_address/json")

# Extract city, region, and country from the JSON response using grep and awk
city=$(echo "$response" | grep -oP '"city": *"\K[^"]+')
region=$(echo "$response" | grep -oP '"region": *"\K[^"]+')
country=$(echo "$response" | grep -oP '"country": *"\K[^"]+')

# Check if the response contains location information
if [ -z "$city" ] || [ -z "$region" ] || [ -z "$country" ]; then
    echo "Error: Could not retrieve location for IP address $ip_address."
else
    echo "Location for IP address $ip_address: $city, $region, $country"
fi

