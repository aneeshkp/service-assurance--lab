#!/bin/bash

#exec > /var/log/`basename $0`.log 2>&1

#disks=$(cat /proc/diskstats | awk '{print $3}' | sed 's/[0-9]*//g' | uniq)
#last_disks=$(cat /proc/diskstats | awk '{print $3}' | sed 's/[0-9]*//g' | uniq| tail -n 1)

disks=$(cat /proc/diskstats | awk '{print $3}' | egrep -v "sr|dm|loop" | sed 's/[0-9]*//g' | uniq)
last_disks=$(cat /proc/diskstats | awk '{print $3}' | egrep -v "sr|dm|loop" | sed 's/[0-9]*//g' | uniq| tail -n 1)

echo -e "{"
echo -e "\t\"data\":[\n";

for disk in $disks; do

   echo -en "\t\t{ \"{#DISK}\":\"$disk\" }"

   if [ -z $(echo "$disk" | grep "$last_disks") ]; then
      echo -en ","
   fi

   echo ""

done

echo -e  "\n\t]"
echo -e  "}"
