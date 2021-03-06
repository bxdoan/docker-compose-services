#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

CONTAINER_NAME='nn_xenial'

# run the container
docker-compose -f "$SCRIPT_HOME/docker-compose.yml" up -d --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2

# aftermath note
echo "
# after container up, connect to bash prompt
docker exec -it $CONTAINER_NAME bash
"
