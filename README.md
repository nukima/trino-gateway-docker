# Trino Gateway Docker Setup

This repository provides scripts and configurations to set up a Trino Gateway with Docker.

## Directory Structure

- `etc/`: Contains configuration files for different Trino versions.
- `script/`: Contains shell scripts and a Python client for managing Trino backends and the gateway.
- `trino-gateway/`: Contains SQL scripts, JAR files, and configuration files for the Trino Gateway.

## Scripts

- `script/quickstart.sh`: Sets up and starts the Trino Gateway and PostgreSQL database.
- `script/stop-docker.sh`: Stops and removes Docker containers for PostgreSQL and Trino.
- `script/add-trino-backends.sh`: Adds Trino backends to the gateway.
- `script/trino-client.py`: Python client to interact with the Trino Gateway.

## Usage

1. Run `script/quickstart.sh` to set up and start the Trino Gateway and PostgreSQL database.
2. Use `script/add-trino-backends.sh` to add Trino backends to the gateway.
3. Use `script/trino-client.py` to interact with the Trino Gateway.
4. Use `trino-gateway/routing-rules.yml` to define routing rules for the Trino Gateway.
5. Run `script/stop-docker.sh` to stop and remove the Docker containers.

## Configuration

- `trino-gateway/quickstart-config.yaml`: Configuration file for the Trino Gateway.
- `trino-gateway/routing-rules.yml`: Routing rules for the Trino Gateway.
- `etc/trino-425/config.properties`: Configuration for Trino version 425.
- `etc/trino-467/config.properties`: Configuration for Trino version 467.

## License

This project is licensed under the MIT License.