#!/bin/bash

#set -x
#exec > /var/log/`basename $0`.log 2>&1

#if [ $# -ne 2 ];then
#	echo "Usage: $0 <device> <parameter>"
#	exit
#fi

#temperature=$(smartctl -A $1 | grep $2 | tr -s ' ' | sed "s/^[[:space:]]*\(.*\)[[:space:]]*$/\1/" | cut -d " " -f 10)
#temperature=$(sudo smartctl -A $1 | grep -i "Temperature_Celsius" | awk '{print $10}')

# REPORT when hard drive's temperature is above 60C

#if [[ $temperature -gt 60 ]]; then
#        echo "1"
#else
#        echo "0"
#fi

if [ $# -ne 2 ];
then
echo "Usage: $0 <device> <parameter>"
exit
fi

temperature=$(sudo smartctl -A $1 | grep $2 | tr -s ' ' | sed "s/^[[:space:]]*\(.*\)[[:space:]]*$/\1/" | cut -d " " -f 10)

if [[ $temperature -gt 60 ]]; then
        echo "1"
else
        echo "0"
fi

