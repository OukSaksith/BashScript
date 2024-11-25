
#!/bin/bash
# Script to display hardware information for a Linux system

echo "=================================="
echo "        Hardware Information      "
echo "=================================="

# CPU Information
echo "CPU Information:"
lscpu | grep -E "Model name|Socket|Core\(s\) per socket|Thread\(s\) per core|Architecture" | awk -F: '{print $1": "$2}'

# Memory Information
echo ""
echo "Memory Information:"
free -h | awk '/^Mem:/ {print "Total Memory: " $2 "\nUsed Memory: " $3 "\nFree Memory: " $4}'

# Disk Information
echo ""
echo "Disk Information:"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E "^sd|^nvme"

# Network Interfaces
echo ""
echo "Network Interfaces:"
ip -o link show | awk -F': ' '{print $2}'

# PCI Devices
echo ""
echo "PCI Devices:"
lspci | head -10

# USB Devices
echo ""
echo "USB Devices:"
lsusb

# Hardware Summary
echo ""
echo "Hardware Summary:"
echo "CPU Count: $(grep -c ^processor /proc/cpuinfo)"
echo "Total Memory: $(free -h | awk '/^Mem:/ {print $2}')"
echo "Total Disk Space: $(df -h --total | grep total | awk '{print $2}')"

echo "=================================="

