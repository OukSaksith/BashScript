#!/bin/bash
# Script to gather and display server-related information

echo "=================================="
echo "      Server Information          "
echo "=================================="

# Hostname
echo "Hostname: $(hostname)"

# Operating System and Kernel
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"

# Uptime
echo "System Uptime: $(uptime -p)"

# CPU Information
echo "CPU Information:"
lscpu | grep "Model name" | awk -F: '{print $2}' | sed 's/^ //'

# Memory Usage
echo "Memory Usage:"
free -h | awk '/^Mem:/ {print "Total: " $2 ", Used: " $3 ", Free: " $4}'

# Disk Usage
echo "Disk Usage:"
df -h | grep "^/dev/" | awk '{print $1 ": " $5 " used (" $3 "/" $2 ")"}'

# Network Information
echo "Network Information:"
ip -4 addr | grep inet | awk '{print "IP Address: " $2}' | sed 's/\/.*//'

# Active Connections
echo "Active Network Connections:"
ss -tuln

echo "=================================="

