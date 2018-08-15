#!/bin/bash

#set -x
#exec > /var/log/`basename $0`.log 2>&1

#health=$(smartctl -H $1 | sed "s/[a-z]*//g" | grep -i SMART | awk -F ":" '{print $2}')
health=$(sudo smartctl -H $1 | sed 's/.*://' | sed 's/smartctl.*//' | sed 's/Copyright.*//' | sed 's/===.*//' | awk 'NF')

# REPORT hard drive's health

if [ $health = "PASSED" ]; then
	echo "0"
else 
	echo "1" 
fi
