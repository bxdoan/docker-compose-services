#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

CONTAINER_NAME='bxd_postgres'
POSTGRES_USER='postgres'

# run the container
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE DATABASE IF NOT EXISTS atlas;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE DATABASE IF NOT EXISTS atlas_test;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE ROLE IF NOT EXISTS autoarmour;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE ROLE IF NOT EXISTS minion;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -d atlas -c "CREATE EXTENSION IF NOT EXISTS postgis;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -d atlas_test -c "CREATE EXTENSION IF NOT EXISTS postgis;"
