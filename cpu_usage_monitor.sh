#!/bin/bash
# Script to monitor CPU usage and report if it exceeds a threshold

# Set the threshold percentage (e.g., 80%)
THRESHOLD=80

# Check if 'bc' is installed
if ! command -v bc &> /dev/null; then
    echo "Error: 'bc' is not installed. Install it using: sudo apt install bc"
    exit 1
fi

# Get the current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Debugging: Print the raw output from 'top'
echo "Raw CPU line: $(top -bn1 | grep "Cpu(s)")"
echo "Parsed CPU usage: $CPU_USAGE%"

# Check if CPU usage exceeds the threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "WARNING: CPU usage ($CPU_USAGE%) has exceeded the threshold ($THRESHOLD%)!"
else
    echo "CPU usage ($CPU_USAGE%) is within the safe threshold ($THRESHOLD%)."
fi

