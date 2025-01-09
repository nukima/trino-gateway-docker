# Trino Gateway Quickstart

This repository provides a quickstart setup for running a Trino Gateway with PostgreSQL persistence and multiple Trino backends using Docker.

## Repository Structure

- `add-trino-backends.sh`: Script to start Trino servers and add them as backends to the Trino Gateway.
- `docker-compose.yml`: Docker Compose configuration to set up PostgreSQL, Trino servers, and the Trino Gateway.
- `gateway-ha-persistence-postgres.sql`: SQL script to initialize the PostgreSQL database schema for the Trino Gateway.
- `gateway-ha.jar`: The Trino Gateway application JAR file.
- `quickstart-config.yaml`: Configuration file for the Trino Gateway.
- `quickstart.sh`: Script to set up and start the Trino Gateway and PostgreSQL database.
- `stop-docker.sh`: Script to stop and remove Docker containers for PostgreSQL and Trino servers.

## Prerequisites

- Docker
- Docker Compose
- curl

## Quickstart Guide

1. **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Run the quickstart script:**
    ```sh
    ./quickstart.sh
    ```
    This script will:
    - Download the [gateway-ha.jar](http://_vscodecontentref_/0) if not present.
    - Copy the necessary configuration files.
    - Start the PostgreSQL database and initialize it with the provided SQL script.
    - Start the Trino Gateway server.

3. **Add Trino backends:**
    ```sh
    ./add-trino-backends.sh
    ```
    This script will:
    - Start two Trino servers on different ports.
    - Add these Trino servers as backends to the Trino Gateway.

4. **Access the Trino Gateway:**
    - The Trino Gateway will be accessible at `http://localhost:9080`.

## Stopping the Services

To stop and remove the Docker containers for PostgreSQL and Trino servers, run:
```sh
./stop-docker.sh
```

## Configuration
* Trino Gateway Configuration: Modify the `quickstart-config.yaml` file to change the Trino Gateway settings.
* PostgreSQL Initialization: The `gateway-ha-persistence-postgres.sql` file contains the SQL script to initialize the PostgreSQL database schema.
