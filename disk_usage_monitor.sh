#!/bin/bash
# Script to monitor disk usage and report if it crosses a threshold

# Set the threshold percentage (e.g., 90%)
THRESHOLD=90

# Get the disk usage for the root partition
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# Report the current disk usage
echo "Current Disk Usage: $DISK_USAGE%"

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage ($DISK_USAGE%) has exceeded the threshold ($THRESHOLD%)!"
else
    echo "Disk usage ($DISK_USAGE%) is within the safe threshold ($THRESHOLD%)."
fi

