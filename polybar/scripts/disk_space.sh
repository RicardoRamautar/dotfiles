#!/bin/bash

# Get disk usage for the root partition
disk_usage=$(df / | grep / | awk '{ print $2 " " $3 " " $4 }')

# Format output: total used free (in GB)
read total empty used free <<< $(echo $disk_usage | awk '{printf "%.2f GB %.2f GB %.2f GB", $1/1024/1024, $2/1024/1024, $3/1024/1024}')
echo "$used"
