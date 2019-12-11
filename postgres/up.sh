#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

CONTAINER_NAME='bxd_postgres'
POSTGRES_USER='postgres'

# run the container
docker-compose -f "$SCRIPT_HOME/docker-compose.yml" up -d --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2

if [[ $1 == 'gc' ]]; then
    docker rename ${CONTAINER_NAME} gc_postgres
    CONTAINER_NAME='gc_postgres'
fi

# aftermath note
echo "
# after container run, we can use 'psql' via
docker exec -it $CONTAINER_NAME psql -U $POSTGRES_USER

# or first step 1/2, open bash prompt first
docker exec -it $CONTAINER_NAME bash #ref. https://askubuntu.com/a/507009/22308
# then step 2/2, run psql
psql -U $POSTGRES_USER

# after container run, we can visit pgAdmin page: localhost:5050/

Username: admin@pgadmin.org
Password: admin
"
