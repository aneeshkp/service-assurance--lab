HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
#INTERVAL="${COLLECTD_INTERVAL:-10}"
INTERVAL= 60

# Key syntax is mysql-status[variable].
while sleep "$INTERVAL" ; do
  #Read more https://linux-die.net/man/5/collectd-exec
  #An Identifier is of the form " host / plugin - instance / type - instance "
  #Refer for all typesdb to use like links-cinder  https://github-com/collectd/collectd/blob/master/src/types.db

  val=$(sudo systemctl is-active openstack-ceilometer-central >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-ceilometer-central\"  interval=$INTERVAL N:$val"  
  [ $val -eq 0 ] && send_alert 'openstack-ceilometer-central' 'OpenStack Ceilometer Central is down'
  
  val=$(sudo systemctl is-active openstack-ceilometer-collector >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-ceilometer-collector\"  interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-ceilometer-collector' 'OpenStack Ceilometer Collector is down'
  
  val=$(sudo systemctl is-active openstack-ceilometer-notification >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-ceilometer-notification\"  interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-ceilometer-notification' 'OpenStack Ceilometer Notification is down'

  val=$(sudo systemctl is-active openstack-aodh-notifier >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-aodh-notifier\"  interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-aodh-notifier' 'OpenStack Aodh Notifier is down'

  val=$(sudo systemctl is-active openstack-aodh-evaluator >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-aodh-evaluator\" interval=$INTERVAL N:\" interval=INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-aodh-evaluator' 'OpenStack Aodh Evaluator is down'

  val=$(sudo systemctl is-active neutron-openvswitch-agent >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-neutron-openvswitch-agent\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'neutron-openvswitch-agent' 'Neutron Openvswitch Agent is down'

  val=$(sudo systemctl is-active openstack-nova-api >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-nova-api\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-nova-api' 'OpenStack Nova API is down'

  val=$(sudo systemctl is-active openstack-nova-conductor >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-nova-conductor\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-nova-conductor' 'OpenStack Nova Conductor is down'

  val=$(sudo systemctl is-active openstack-nova-consoleauth >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-nova-consoleauth\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-nova-consoleauth' 'OpenStack Nova VNC console auth server is down'

  val=$(sudo systemctl is-active openstack-nova-novncproxy >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-nova-novncproxy\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-novncproxy' 'OpenStack Nova NoVNC Proxy is down'

  val=$(sudo systemctl is-active openstack-nova-scheduler >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-nova-scheduler\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-nova-scheduler' 'OpenStack Nova Scheduler is down'

  val=$(sudo systemctl is-active openstack-cinder-api >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-cinder-api\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-cinder-api' 'OpenStack Cinder API is down'

  val=$(sudo systemctl is-active openstack-cinder-scheduler >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-cinder-scheduler\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-cinder-scheduler' 'OpenStack Cinder Scheduler is down'

  val=$(sudo systemctl is-active openstack-glance-api >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-glance-api\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-glance-api' 'OpenStack Glance API is down'

  val=$(sudo systemctl is-active openstack-glance-registry >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-glance-registry\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-glance-registry' 'OpenStack Glance Registry is down'

  val=$(sudo systemctl is-active openstack-heat-api-cfn >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-heat-api-cfn\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-heat-api-cfn' 'OpenStack Heat CFN-compatible API is down'

  val=$(sudo systemctl is-active openstack-heat-api >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-heat-api\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-heat-api' 'OpenStack Heat API is down'

  val=$(sudo systemctl is-active openstack-heat-engine >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-heat-engine\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-heat-engine' 'OpenStack Heat Engine is down'

  val=$(sudo systemctl is-active openstack-swift-account-auditor >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-account-auditor\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-account-auditor' 'OpenStack Swift Account Auditor is down'

  val=$(sudo systemctl is-active openstack-swift-account-reaper >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-account-reaper\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-account-reaper' 'OpenStack Swift Account Reaper is down'

  val=$(sudo systemctl is-active openstack-swift-account-replicator >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-account-replicator\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-account-replicator' 'OpenStack Swift Account Replicator is down'

  val=$(sudo systemctl is-active openstack-swift-account >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-account\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-account' 'OpenStack Swift Account is down'

  val=$(sudo systemctl is-active openstack-swift-container-auditor >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-container-auditor\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-container-auditor' 'OpenStack Swift Container Auditor is down'

  val=$(sudo systemctl is-active openstack-swift-container-replicator >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-container-replicator\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-container-replicator' 'OpenStack Swift Container Replicator is down'

  val=$(sudo systemctl is-active openstack-swift-container >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-container\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-container' 'OpenStack Swift Container is down'

  val=$(sudo systemctl is-active openstack-swift-container-updater >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-container-updater\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-container-updater' 'OpenStack Swift Container Updater is down'

  val=$(sudo systemctl is-active openstack-swift-object-auditor >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-object-auditor\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-object-auditor' 'OpenStack Swift Obejct Auditor is down'

  val=$(sudo systemctl is-active openstack-swift-object-replicator >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-object-replicator\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-object-replicator' 'OpenStack Swift Object Replicator is down'

  val=$(sudo systemctl is-active openstack-swift-object >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-object\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-object' 'OpenStack Swift Object is down'

  val=$(sudo systemctl is-active openstack-swift-object-updater >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-object-updater\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-object-updater' 'OpenStack Swift Object Updater is down'

  val=$(sudo systemctl is-active openstack-swift-proxy >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-swift-proxy\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-swift-proxy' 'OpenStack Swift Proxy is down'

  val=$(sudo systemctl is-active ntpd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-ntpd-service\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'ntpd' 'NTP Daemon is down'

  val=$(sudo systemctl is-active sshd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-sshd-service\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'sshd-service' 'SSH Daemon is down'

  val=$(sudo systemctl is-active libvirtd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-libvirtd-service\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'libvirtd-service' 'Virtualization Daemon is down'

  val=$(sudo systemctl is-active haproxy >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-haproxy-service\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'haproxy-service' 'HA Proxy Service is down'

  val=$(sudo systemctl is-active httpd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-httpd-service\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'httpd-service' 'httpd server is down'

  val=$(sudo systemctl is-active neutron-dhcp-agent >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-neutron-dhcp-agent\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'neutron-dhcp-agent' 'Neutron DHCP Agent is down'

  val=$(sudo systemctl is-active neutron-l3-agent >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-neutron-l3-agent\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'neutron-l3-agent' 'Neutron L3 Agent is down'

  val=$(sudo systemctl is-active neutron-metadata-agent >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-neutron-metadata-agent\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'neutron-metadata-agent' 'Neutron Metadata Agent is down'

  val=$(sudo systemctl is-active neutron-server >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-neutron-server\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'neutron-server' 'Neutron Server is down'

  val=$(sudo systemctl is-active openstack-heat-api-cloudwatch >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-openstack-heat-api-cloudwatch\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'openstack-heat-api-cloudwatch' 'OpenStack Heat API Cloudwatch is down'

  val=$(ps aux | awk '{ print $8 " " $2 }' | grep -w Z | wc -l)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-zombieprocess-process\" interval=$INTERVAL N:$val"
  [ $val -gt 0 ] && send_alert 'zombie-processes' $val' Zombie process(es) found'

  #val=$(/usr/local/sbin/netif_discovery.sh)
  #val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  #echo "PUTVAL \"$HOSTNAME/nfvi-services/service-net-phys-if-discovery\" interval=$INTERVAL N:$val"

  #val=$(if [ $(cat /sys/class/net/$1/operstate)= "up" ]; then cat /sys/class/net/$1/carrier; else echo "0"; fi;)
  #val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  #echo "PUTVAL \"$HOSTNAME/nfvi-services/service-net-if-carrier-status \" interval=$INTERVAL N:$val"

  #val=$(/usr/local/sbin/discover_disk.sh)
  #val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  #echo "PUTVAL \"$HOSTNAME/nfvi-services/service-disk-discovery\" interval=$INTERVAL N:$val"

  #val= $(/usr/local/sbin/smart-temp.sh /dev/$1 Temperature_Celsius)
  #val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  #echo "PUTVAL \"$HOSTNAME/nfvi-services/service-smart-temp\" interval=$INTERVAL N:$val"

  #val=$(/usr/local/sbin/smart-health.sh /dev/$1)
  #val=$(if [$val -z ]; then echo 0; else echo $val; fi)
  #echo "PUTVAL \"$HOSTNAME/nfvi-services/service-smart-health\" interval=$INTERVAL N:$val"

  val=$(sudo systemctl is-active corosync >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-corosync\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'corosync' 'Corosync is down'

  val=$(sudo systemctl is-active pcsd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-pcsd\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'pcsd' 'PCS Daemon is down'

  val=$(sudo systemctl is-active pacemaker >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/nfvi-services/service-pacemaker\" interval=$INTERVAL N:$val"
  [ $val -eq 0 ] && send_alert 'pacemaker' 'Pacemaker is down'
done
