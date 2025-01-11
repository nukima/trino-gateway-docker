#!/usr/bin/env sh

docker kill local-postgres && docker rm local-postgres
docker kill trino467 && docker rm trino467
docker kill trino425 && docker rm trino425