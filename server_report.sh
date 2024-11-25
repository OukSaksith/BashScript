#!/bin/bash
# Script to report server-related information

echo "---------------------------------------------"
echo "          SERVER INFORMATION REPORT          "
echo "---------------------------------------------"

# Hostname
echo "Hostname: $(hostname)"

# Operating System
echo "Operating System: $(lsb_release -d | awk -F'\t' '{print $2}')"

# Kernel Version
echo "Kernel Version: $(uname -r)"

# CPU Information
echo "CPU Model: $(lscpu | grep 'Model name:' | awk -F':' '{print $2}' | xargs)"
echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"

# Memory Usage
echo "Memory Usage:"
free -h | awk '/^Mem:/ {printf "  Total: %s, Used: %s, Free: %s\n", $2, $3, $4}'

# Disk Usage
echo "Disk Usage:"
df -h --total | grep 'total' | awk '{printf "  Total: %s, Used: %s, Available: %s\n", $2, $3, $4}'

# Uptime
echo "Uptime: $(uptime -p)"

# Number of Active Users
echo "Active Users: $(who | wc -l)"

# Network Information
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Default Gateway: $(ip route | grep default | awk '{print $3}')"

echo "---------------------------------------------"
echo "           END OF SERVER REPORT              "
echo "---------------------------------------------"

