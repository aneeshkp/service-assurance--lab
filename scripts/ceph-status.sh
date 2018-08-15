#!/bin/bash

#set -x

#exec > /var/log/`basename $0`.log 2>&1

ceph_bin="/bin/ceph"
rados_bin="/bin/rados"

# Initialising variables
creating=0
down=0
deep=0
scrubbing=0
degraded=0
inconsistent=0
peering=0
repair=0
recovering=0
backfill=0
waitBackfill=0
incomplete=0
stale=0
remapped=0
undersized=0
peered=0

# Get data
pginfo=$(echo -n "  pgmap $($ceph_bin pg stat)" | sed -n "s/.*pgmap/pgmap/p")
pgstats=$(echo $pginfo | cut -d':' -f3 | cut -d';' -f1| sed 's/ /\\ /g')

# read kbps B/s
num_rdbps()
{
rdbps=$(echo $pginfo | sed -n '/pgmap/s/.* \([0-9]* .\?\)B\/s rd.*/\1/p' | sed -e "s/K/*1000/ig;s/M/*1000*1000/i;s/G/*1000*1000*1000/i;s/E/*1000*1000*1000*1000/i" | bc)
if [[ "$rdbps" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# write kbps B/s
num_wrbps()
{
wrbps=$(echo $pginfo | sed -n '/pgmap/s/.* \([0-9]* .\?\)B\/s wr.*/\1/p' | sed -e "s/K/*1000/ig;s/M/*1000*1000/i;s/G/*1000*1000*1000/i;s/E/*1000*1000*1000*1000/i" | bc)
if [[ "$wrbps" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# ops
num_ops()
{
ops=$(echo $pginfo | sed -n '/pgmap/s/.* \([0-9]*\) op\/s.*/\1/p')
if [[ "$ops" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_osd_total
num_osd_total()
{
ceph_osd_total=$($ceph_bin osd dump |grep "^osd"| wc -l)
if [[ "$ceph_osd_total" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_osd_up
num_osd_up()
{
ceph_osd_up=$($ceph_bin osd dump |grep "^osd"| awk '{print $1 " " $2 " " $3}'|grep up|wc -l)
if [[ "$ceph_osd_up" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_osd_in
num_osd_in()
{
ceph_osd_in=$($ceph_bin osd dump |grep "^osd"| awk '{print $1 " " $2 " " $3}'|grep in|wc -l)
if [[ "$ceph_osd_in" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_rados_total
num_rados_total()
{
rados_total=$($rados_bin df | grep "total space"| awk '{print $3}')
if [[ "$rados_total" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_rados_used
num_rados_used()
{
rados_used=$($rados_bin df | grep "total used"| awk '{print $3}')
if [[ "$rados_used" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# num_rados_free
num_rados_free()
{
rados_free=$($rados_bin df | grep "total avail"| awk '{print $3}')
if [[ "$rados_free" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# active_pg
num_active_pg()
{
active_pg=$(echo $pginfo | sed -n '/active+clean/s/.* \([0-9]*\) active+clean.*/\1/p')
if [[ "$active_pg" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# clean_pg
num_clean_pg()
{
clean_pg=$(echo $pginfo | sed -n '/active+clean/s/.* \([0-9]*\) active+clean.*/\1/p')
if [[ "$clean_pg" != "" ]]
then
  echo 0
else
  echo 1
fi
}

# Array
IFS=', ' read -a array <<< "$pgstats"
for element in "${array[@]}"
do
    element=$(echo "$element" | sed 's/^ *//g')

    # Get elements
    number=$(echo $element | cut -d' ' -f1)
    data=$(echo $element | cut -d' ' -f2)

    # Agregate data
    if [ "$(echo $data | grep creating | wc -l)" == 1 ]
    then
          creating=$(echo $creating+$number|bc)
    fi

    if [ "$(echo $data | grep down | wc -l)" == 1 ]
    then
          down=$(echo $down+$number|bc)
    fi

    if [ "$(echo $data | grep deep | wc -l)" == 1 ]
    then
          deep=$(echo $deep+$number|bc)
    fi

    if [ "$(echo $data | grep scrubbing | wc -l)" == 1 ]
    then
          scrubbing=$(echo $scrubbing+$number|bc)
    fi

    if [ "$(echo $data | grep degraded | wc -l)" == 1 ]
    then
          degraded=$(echo $degraded+$number|bc)
    fi

    if [ "$(echo $data | grep inconsistent | wc -l)" == 1 ]
    then
          inconsistent=$(echo $inconsistent+$number|bc)
    fi

    if [ "$(echo $data | grep peering | wc -l)" == 1 ]
    then
          peering=$(echo $peering+$number|bc)
    fi

    if [ "$(echo $data | grep repair | wc -l)" == 1 ]
    then
          repair=$(echo $repair+$number|bc)
    fi

    if [ "$(echo $data | grep recovering | wc -l)" == 1 ]
    then
          recovering=$(echo $recovering+$number|bc)
    fi

    if [ "$(echo $data | grep backfill | wc -l)" == 1 ]
    then
          backfill=$(echo $backfill+$number|bc)
    fi

    if [ "$(echo $data | grep waitBackfill | wc -l)" == 1 ]
    then
          waitBackfill=$(echo $waitBackfill+$number|bc)
    fi

    if [ "$(echo $data | grep incomplete | wc -l)" == 1 ]
    then
          incomplete=$(echo $incomplete+$number|bc)
    fi

    if [ "$(echo $data | grep stale | wc -l)" == 1 ]
    then
          stale=$(echo $stale+$number|bc)
    fi

    if [ "$(echo $data | grep remapped | wc -l)" == 1 ]
    then
          remapped=$(echo $remapped+$number|bc)
    fi

    if [ "$(echo $data | grep undersized | wc -l)" == 1 ]
    then
          undersized=$(echo $undersized+$number|bc)
    fi

    if [ "$(echo $data | grep peered | wc -l)" == 1 ]
    then
          peered=$(echo $peered+$number|bc)
    fi
done

# Return the value
case $1 in
  creating)
    echo $creating
  ;;
  down)
    echo $down
  ;;
  deep)
    echo $deep
  ;;
  scrubbing)
    echo $scrubbing
  ;;
  degraded)
    echo $degraded
  ;;
  inconsistent)
    echo $inconsistent
  ;;
  peering)
    echo $peering
  ;;
  repair)
    echo $repair
  ;;
  recovering)
    echo $recovering
  ;;
  backfill)
    echo $backfill
  ;;
  waitBackfill)
    echo $waitBackfill
  ;;
  incomplete)
    echo $incomplete
  ;;
  stale)
    echo $stale
  ;;
  remapped)
    echo $remapped
  ;;
  undersized)
    echo $undersized
  ;;
  peered)
    echo $peered
  ;;
  ops)
    num_ops
  ;;
  wrbps)
    num_wrbps
  ;;
  rdbps)
    num_rdbps
  ;;
  total)
    num_osd_total
  ;;
  up)
    num_osd_up
  ;;
  "in")
    num_osd_in
  ;;
  totalrados)
    num_rados_total
  ;;
  usedrados)
    num_rados_used
  ;;
  freerados)
    num_rados_free
  ;;
  active)
    num_active_pg
  ;;
  clean)
    num_clean_pg
  ;;
esac
