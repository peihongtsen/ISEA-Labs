#!/bin/bash
echo "System Resource Monitoring"
read -p "How many times would you like to monitor the system? " iterations
for ((i=1; i<=iterations; i++))
do
    echo "----- Monitoring $i -----"
    echo "CPU Usage:"
    top -b -n1 | grep "Cpu(s)"
    echo "Memory Usage:"
    free -h
    echo "Disk Usage:"
    df -h | grep "^/dev"
    echo "-----------------------"
    sleep 5s
done
echo "Monitoring complete."
