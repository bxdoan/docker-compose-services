#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s" # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

#docker-compose -f "$SCRIPT_HOME/docker-compose.yml" down #TODO we have error when stopping by docker-compose down > Removing network postgres_default; where is this network from?
if [[ $1 == 'gc' ]]; then
    GC="gc_"
    GIIA="_$GC_INSTANCE_ID"
else
    GC=""
    GIIA=""
fi

CONTAINER_NAME="${GC}postgres${GIIA}"; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
CONTAINER_NAME="${GC}pgadmin_container${GIIA}"; docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
CONTAINER_NAME="${GC}mongo${GIIA}";             docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
CONTAINER_NAME="${GC}rabbitmq${GIIA}";          docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
CONTAINER_NAME="${GC}redis${GIIA}";             docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME