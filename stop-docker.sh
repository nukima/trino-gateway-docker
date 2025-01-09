#!/usr/bin/env sh

docker kill local-postgres && docker rm local-postgres
docker kill trino1 && docker rm trino1
docker kill trino2 && docker rm trino2