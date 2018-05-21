HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
#INTERVAL="${COLLECTD_INTERVAL:-10}"
INTERVAL=30
# For all the following commands HOME should be set to the directory that has -my.cnf file with password information.

# Flexible parameter to grab global variables- On the frontend side, use keys like mysql.status[Com_insert].
# Key syntax is mysql-status[variable].
while sleep "$INTERVAL" ; do
  #Read more https://linux-die.net/man/5/collectd-exec
  #An Identifier is of the form " host / plugin - instance / type - instance "
  #Refer for all typesdb to use like links-cinder  https://github-com/collectd/collectd/blob/master/src/types.db

  val=$(systemctl list-units |grep -i openstack-ceilometer-central |grep -ic running) 
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-ceilometer-central\"  interval=$INTERVAL N:$val" 

  val=$(systemctl list-units |grep -i openstack-ceilometer-compute |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-ceilometer-compute\"  interval=$INTERVAL N:$val" 

  val=$(systemctl list-units |grep -i openstack-ceilometer-collector |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-ceilometer-collector\"  interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-aodh-notifier |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-aodh-notifier\"  interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-aodh-evaluator |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-aodh-evaluator\" interval=$INTERVAL N:\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-openvswitch-agent |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-neutron-openvswitch-agent\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-compute |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-nova-compute\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-api |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-nova-api\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-conductor |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-nova-conductor\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-consoleauth |grep -ic running)

  val=$(systemctl list-units |grep -i openstack-nova-novncproxy |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-nova-novncproxy\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-scheduler |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-nova-scheduler\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-cinder-api |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-cinder-api\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-cinder-scheduler |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-cinder-scheduler\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-glance-api |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-glance-api\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-glance-registry |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-glance-registry\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api-cfn |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-heat-api-cfn\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-heat-api\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-engine |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-heat-engine\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-auditor |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-account-auditor\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-reaper |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-account-reaper\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-replicator |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-account-replicator\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-account\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-auditor |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-container-auditor\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-replicator |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-container-replicator\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-container\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-updater |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-container-updater\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-auditor |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-object-auditor\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-replicator |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-object-replicator\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-object\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-updater |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-object-updater\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-proxy |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-swift-proxy\" interval=$INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-api |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-vitrage-api\" interval=$INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-graph |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-vitrage-graph\" interval=$INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-notifier |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-vitrage-notifier\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i ntpd |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ntpd-service\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i sshd |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-sshd-service\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i libvirtd |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-libvirtd-service\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i haproxy |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-haproxy-service\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i httpd |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-httpd-service\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-dhcp-agent |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-neutron-dhcp-agent\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-l3-agent |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-neutron-l3-agent\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-metadata-agent |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-neutron-metadata-agent\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-server |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-neutron-server\" interval=$INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api-cloudwatch |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-openstack-heat-api-cloudwatch\" interval=$INTERVAL N:$val"

  val=$(ps aux | awk '{ print $8 " " $2 }' | grep -w Z | wc -l)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-zombieprocess-process\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/netif_discovery-sh)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-net-phys-if-discovery\" interval=$INTERVAL N:$val"

  val=$(if [ $(cat /sys/class/net/$1/operstate)= "up" ]; then cat /sys/class/net/$1/carrier; else echo "0"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-net-if-carrier-status \" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/discover_disk-sh)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-disk-discovery\" interval=$INTERVAL N:$val"

  val= $(/usr/local/sbin/smart-temp-sh /dev/$1 Temperature_Celsius)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-smart-temp\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/smart-health-sh /dev/$1)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-smart-health\" interval=$INTERVAL N:$val"

  val=$(if [ $(ceph health | awk '{print $1}')= "HEALTH_OK" ]; then echo "0"; else echo "1"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-health\" interval=$INTERVAL N:$val"

  val=$(ceph osd tree | grep -w down | wc -l)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-osd\" interval=$INTERVAL N:$val"

  val=$($(ceph status |sed -n '/monmap/s/-* \([0-9]*\) mons.*/\1/p'); if [[ "$ACTIVE" != "" ]]; then echo "0"; else echo "1"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-mon\" interval=$INTERVAL N:$val"

  val= $(ceph osd df | awk '{print $7}' | grep -v USE | sed 's/\-[0-9]*//g' | awk 'NF' > OSDUSE ; for i in `cat OSDUSE` ; do if [ $i -gt 85 ]; then echo "1"; else echo "0"; fi; done)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-capacity\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh total)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-total\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh in)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-osd_in\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh up)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-osd_up\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh active)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-active\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh backfill)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-backfill\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh clean)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-clean\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh creating)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-creating\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh degraded)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-degraded\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh down)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-down\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh deep)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-deep\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh incomplete)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-incomplete\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh inconsistent)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-inconsistent\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh peering)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-peering\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh peered)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-peered\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh undersized)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-undersized\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh recovering)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-recovering\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh remapped)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-remapped\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh repair)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-repair\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh scrubbing)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-scrubbing\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh stale)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-stale\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh waitBackfill)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-waitBackfill\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh totalrados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-rados_total\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh usedrados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-rados_used\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh freerados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-rados_free\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh wrbps)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-wrbps\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh rdbps)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-rdbps\" interval=$INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status-sh ops)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir-nfvi/count-ceph-ops\" interval=$INTERVAL N:$val"
done
