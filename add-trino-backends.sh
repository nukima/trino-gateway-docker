#!/usr/bin/env sh

#Start a pair of trino servers on different ports
docker run --name trino1 -d -p 8081:8080 trinodb/trino
docker run --name trino2 -d -p 8082:8080 trinodb/trino

#Add the trino servers as Gateway backends
curl -H "Content-Type: application/json" -X POST localhost:9080/gateway/backend/modify/add -d '{"name": "trino1",
                                                                                                "proxyTo": "http://localhost:8081",
                                                                                                "active": true,
                                                                                                "routingGroup": "adhoc"
                                                                                              }'
curl -H "Content-Type: application/json" -X POST localhost:9080/gateway/backend/modify/add -d '{"name": "trino2",
                                                                                                "proxyTo": "http://localhost:8082",
                                                                                                "active": true,
                                                                                                "routingGroup": "adhoc"
                                                                                              }'