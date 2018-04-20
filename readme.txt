systemctl restart qdrouterd
systemctl restart prometheus
systemctl restart elasticsearch
#docker run -tid -debug --net=host --pid=host -v `pwd`/collect_config:/opt/collectd/etc/collectd.conf.d  -v /var/run:/var/run -v /tmp:/tmp  --privileged nfvpe/barometer-collectd /run_collectd.sh
#FOR elastic Search
#iptables -I INPUT -p tcp --dport 9200 -j ACCEPT
#FOR QDR router listener
#iptables -I INPUT -p tcp --dport 5672 -j ACCEPT
#FOR node exporter
#iptables -I INPUT -p tcp --dport 5672 -j ACCEPT
#/sbin/iptables-save


##Running POC
#cd gocode/src/github.com/redhat-nfvpe/service-assurance-poc/

#Access Web ui
#Prometheus exression browser
http://10.19.110.5:9090/graph

#elastic search
http://10.19.110.5:9200/
#Show all indices
http://10.19.110.5:9200/_cat/indices?v
#Query Index all indices starts with collectd 
#to test ifconfig eno2 down
http://10.19.110.5:9200/http://10.19.110.5:9200/collectd_connectivity/_search?pretty/_search?pretty
#Graphana
http://10.19.110.5:3000/
user:admin/admin

#unsee
 docker run -d -p 5000:5000 -e PORT=5000 -e ALERTMANAGER_URI=http://10.19.110.5:9093 cloudflare/unsee:latest
