#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

POSTGRES_USER='postgres'

if [[ $1 == 'gc' ]]; then
    CONTAINER_NAME="gc_postgres_dn"
else
    CONTAINER_NAME="postgres"
fi

# run the container
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE DATABASE atlas;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE DATABASE atlas_test;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE ROLE autoarmour;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -c "CREATE ROLE minion;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -d atlas -c "CREATE EXTENSION postgis;"
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER -d atlas_test -c "CREATE EXTENSION postgis;"
