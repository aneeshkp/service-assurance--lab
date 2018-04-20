#!/bin/bash

alerts='[
  {
    "labels": {
       "alertname": "instance_down",
       "instance": "10.19.110.5",
       "service": "prometheus",
       "severity": "Critical"
      
     },
     "annotations": {
        "info": "The instance 10.19.110.5 is down",
        "summary": "instance 10.19.110.5 is down"
      }
  }
]'

URL="http://10.19.110.5:9093"

curl -XPOST -d"$alerts" $URL/api/v1/alerts

