#!/bin/bash

exec > /var/log/`basename $0`.log 2>&1

interfaces=$(ls -1 /sys/class/net/ | grep -v "bonding_masters")
last_interface=$(ls -1 /sys/class/net/ | tail -n 1)

echo -e "{"
echo -e "\t\"data\":[\n";

for netif in $interfaces; do

   echo -en "\t\t{ \"{#PHYSNET}\":\"$netif\"\t}"

   if [ -z $(echo "$netif" | grep "$last_interface") ]; then
      echo -en ","
   fi

   echo ""

done

echo -e  "\n\t]"
echo -e  "}"
