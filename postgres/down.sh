#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s" # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

#docker-compose -f "$SCRIPT_HOME/docker-compose.yml" down #TODO we have error when stopping by docker-compose down > Removing network postgres_default; where is this network from?
if [[ $1 == 'gc' ]]; then
    CONTAINER_NAME='gc_postgres'; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
else
    CONTAINER_NAME='bxd_postgres'; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
fi

CONTAINER_NAME='pgadmin_container'; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
