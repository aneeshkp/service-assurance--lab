
HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
INTERVAL="${COLLECTD_INTERVAL:-10}"
# For all the following commands HOME should be set to the directory that has .my.cnf file with password information.

# Flexible parameter to grab global variables. On the frontend side, use keys like mysql.status[Com_insert].
# Key syntax is mysql.status[variable].
while sleep "$INTERVAL" ; do
  #Read more https://linux.die.net/man/5/collectd-exec
  #An Identifier is of the form " host / plugin - instance / type - instance "
  #Refer for all typesdb to use like links-cinder  https://github.com/collectd/collectd/blob/master/src/types.db

  val=$(systemctl list-units |grep -i openstack-ceilometer-central.service |grep -ic running) 
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-ceilometer-central.service\"  interval=INTERVAL N:$val" 

  val=$(systemctl list-units |grep -i openstack-ceilometer-compute.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-ceilometer-compute.service\"  interval=INTERVAL N:$val" 

  val=$(systemctl list-units |grep -i openstack-ceilometer-collector.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-ceilometer-collector.service\"  interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-aodh-notifier.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-aodh-notifier.service\"  interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-aodh-evaluator.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-aodh-evaluator.service\" interval=INTERVAL N:\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-openvswitch-agent.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/neutron-openvswitch-agent.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-compute.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-nova-compute.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-api.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-nova-api.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-conductor.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-nova-conductor.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-consoleauth.service |grep -ic running)

  val=$(systemctl list-units |grep -i openstack-nova-novncproxy.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-nova-novncproxy.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-nova-scheduler.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-nova-scheduler.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-cinder-api.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-cinder-api.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-cinder-scheduler.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-cinder-scheduler.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-glance-api.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-glance-api.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-glance-registry.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-glance-registry.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api-cfn.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-heat-api-cfn.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-heat-api.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-engine.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-heat-engine.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-auditor.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-account-auditor.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-reaper.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-account-reaper.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account-replicator.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-account-replicator.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-account.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-account.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-auditor.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-container-auditor.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-replicator.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-container-replicator.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-container.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-container-updater.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-container-updater.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-auditor.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-object-auditor.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-replicator.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-object-replicator.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-object.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-object-updater.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-object-updater.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-swift-proxy.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-swift-proxy.service\" interval=INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-api |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-vitrage-api.service\" interval=INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-graph |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-vitrage-graph.service\" interval=INTERVAL N:$val"

  val=$(pcs status |grep -i vitrage-notifier |grep -ic started)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-vitrage-notifier.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i ntpd.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ntpd.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i sshd.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/sshd.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i libvirtd.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/libvirtd.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i haproxy.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/haproxy.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i httpd.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/httpd.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-dhcp-agent.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/neutron-dhcp-agent.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-l3-agent.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/neutron-l3-agent.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-metadata-agent.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/neutron-metadata-agent.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i neutron-server.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/neutron-server.service\" interval=INTERVAL N:$val"

  val=$(systemctl list-units |grep -i openstack-heat-api-cloudwatch.service |grep -ic running)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/openstack-heat-api-cloudwatch.service\" interval=INTERVAL N:$val"

  val=$(ps aux | awk '{ print $8 " " $2 }' | grep -w Z | wc -l)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/zombieprocess\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/netif_discovery.sh)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/net.phys.if.discovery\" interval=INTERVAL N:$val"

  val=$(if [ $(cat /sys/class/net/$1/operstate)= "up" ]; then cat /sys/class/net/$1/carrier; else echo "0"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/net.if.carrier.status[*] \" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/discover_disk.sh)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/disk.discovery\" interval=INTERVAL N:$val"

  val= $(/usr/local/sbin/smart-temp.sh /dev/$1 Temperature_Celsius)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/smart.temp[*]\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/smart-health.sh /dev/$1)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/smart.health[*]\" interval=INTERVAL N:$val"

  val=$(if [ $(ceph health | awk '{print $1}')= "HEALTH_OK" ]; then echo "0"; else echo "1"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.health\" interval=INTERVAL N:$val"

  val=$(ceph osd tree | grep -w down | wc -l)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.osd\" interval=INTERVAL N:$val"

  val=$($(ceph status |sed -n '/monmap/s/.* \([0-9]*\) mons.*/\1/p'); if [[ "$ACTIVE" != "" ]]; then echo "0"; else echo "1"; fi;)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.mon\" interval=INTERVAL N:$val"

  val= $(ceph osd df | awk '{print $7}' | grep -v USE | sed 's/\.[0-9]*//g' | awk 'NF' > OSDUSE ; for i in `cat OSDUSE` ; do if [ $i -gt 85 ]; then echo "1"; else echo "0"; fi; done)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.capacity\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh total)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.total\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh in)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.osd_in\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh up)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.osd_up\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh active)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.active\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh backfill)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.backfill\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh clean)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.clean\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh creating)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.creating\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh degraded)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.degraded\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh down)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.down\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh deep)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.deep\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh incomplete)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.incomplete\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh inconsistent)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.inconsistent\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh peering)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.peering\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh peered)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.peered\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh undersized)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.undersized\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh recovering)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.recovering\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh remapped)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.remapped\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh repair)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.repair\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh scrubbing)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.scrubbing\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh stale)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.stale\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh waitBackfill)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.waitBackfill\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh totalrados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.rados_total\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh usedrados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.rados_used\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh freerados)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.rados_free\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh wrbps)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.wrbps\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh rdbps)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.rdbps\" interval=INTERVAL N:$val"

  val=$(/usr/local/sbin/ceph-status.sh ops)
  val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  echo "PUTVAL \"$HOSTNAME/mavenir.nfvi/ceph.ops\" interval=INTERVAL N:$val"
done
