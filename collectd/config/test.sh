#Author APuttur 2018
HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
INTERVAL="${COLLECTD_INTERVAL:-10}"


while sleep "$INTERVAL"; do
  #Read more https://linux.die.net/man/5/collectd-exec
  #An Identifier is of the form " host / plugin - instance / type - instance "
  #Refer for all typesdb to use like links-cinder  https://github.com/collectd/collectd/blob/master/src/types.db
  val=$(systemctl is-active snmpd >/dev/null 2>&1 && echo 1 || echo 0)
  echo "PUTVAL \"$HOSTNAME/openstack-api/links-cinder-api\" interval=$INTERVAL N:$val"
done
 


