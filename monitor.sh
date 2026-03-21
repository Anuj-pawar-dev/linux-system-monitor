#!/bin/bash

echo "==========================="
echo "  Linux System Monitor"
echo "==========================="

echo ""
echo "system uptime:"
uptime

echo ""
echo "cpu usage:"
top -bn1 | grep "%Cpu(s)"

echo""
echo "memoory usage:"
free -h

echo""
echo "top 5 processes by memory usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_int=${cpu%.*}
if [ "$cpu_int" -gt 80]
then
	echo"WARNING: High CPU Usage!"
fi

