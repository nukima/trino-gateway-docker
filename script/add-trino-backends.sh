#!/usr/bin/env sh

BASE_DIR=$(pwd)
#Start a pair of trino servers on different ports
# docker run --name trino467 -d -p 8081:8080 -v $BASE_DIR/etc/trino-467/config.properties:/etc/trino/config.properties trinodb/trino:467
# docker run --name trino425 -d -p 8082:8080 -v $BASE_DIR/etc/trino-425/config.properties:/etc/trino/config.properties trinodb/trino:425

#Add the trino servers as Gateway backends
curl -H "Content-Type: application/json" -X POST localhost:9080/gateway/backend/modify/add -d \
'{"name": "trino467",
  "proxyTo": "http://localhost:8081",
  "active": true,
  "routingGroup": "adhoc"
}'
curl -H "Content-Type: application/json" -X POST localhost:9080/gateway/backend/modify/add -d \
'{"name": "trino425",
  "proxyTo": "http://localhost:8082",
  "active": true,
  "routingGroup": "report"
}'