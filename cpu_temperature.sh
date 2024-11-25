#!/bin/bash
# Script to show the CPU temperature on a Linux system

# Check if lm-sensors is installed
if ! command -v sensors &> /dev/null; then
    echo "Error: 'lm-sensors' is not installed. Install it using: sudo apt install lm-sensors"
    exit 1
fi

# Get the CPU temperature
CPU_TEMP=$(sensors | grep -i 'Core 0' | awk '{print $3}' | sed 's/[^0-9]*//g')

# If Core 0 temperature is not available, try fetching other cores' temperature
if [ -z "$CPU_TEMP" ]; then
    CPU_TEMP=$(sensors | grep -i 'temp' | awk '{print $2}' | sed 's/[^0-9]*//g' | head -n 1)
fi

# Report the CPU temperature
if [ -n "$CPU_TEMP" ]; then
    echo "Current CPU Temperature: $CPU_TEMP°C"
else
    echo "Could not retrieve CPU temperature."
fi

