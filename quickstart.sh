#!/usr/bin/env sh

VERSION=7

# Copy necessary files to current directory

# Check and get the Gateway Jar
if [[ -f "gateway-ha.jar" ]]; then
    echo "Found gateway-har.jar file in current directory."
else
    echo "Failed to find gateway-ha.jar in current directory. Fetching version $VERSION from Maven Central repository."
    curl https://repo1.maven.org/maven2/io/trino/gateway/gateway-ha/${VERSION}/gateway-ha-${VERSION}-jar-with-dependencies.jar -o ./gateway-ha.jar
fi

# Check and get the Config.yaml
if [[ -f "quickstart-config.yaml" ]]; then
    echo "Found quickstart-config.yaml file in current directory."
else
    cp ../docs/quickstart-config.yaml ./quickstart-config.yaml
fi

# Check and get the postgres.sql
if [[ -f "gateway-ha-persistence-postgres.sql" ]]; then
    echo "Found gateway-ha-persistence-postgres.sql file in current directory."
else
    cp ../gateway-ha/src/main/resources/gateway-ha-persistence-postgres.sql ./gateway-ha-persistence-postgres.sql
fi

#Check if DB is running
if docker ps --format '{{.Names}}' | grep -q '^local-postgres$'; then
    echo "PostgreSQL database container 'localhost-postgres' is already running. Only starting Trino Gateway."
else
    echo "PostgreSQL database container 'localhost-postgres' is not running. Proceeding to initialize and run database server."
    export PGPASSWORD=mysecretpassword
    docker run -v "$(pwd)"/gateway-ha-persistence-postgres.sql:/tmp/gateway-ha-persistence-postgres.sql --name local-postgres -p 5432:5432 -e POSTGRES_PASSWORD=$PGPASSWORD -d postgres:latest
    #Make sure the DB has time to initialize
    sleep 5

    #Initialize the DB
    docker exec local-postgres psql -U postgres -h localhost -c 'CREATE DATABASE gateway'
    docker exec local-postgres psql -U postgres -h localhost -d gateway -f /tmp/gateway-ha-persistence-postgres.sql
fi


#Start Trino Gateway server.
export JAVA_HOME=/home/manhnk/.jdks/temurin-17.0.13
$JAVA_HOME/bin/java -Xmx1g --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -jar ./gateway-ha.jar server ./quickstart-config.yaml