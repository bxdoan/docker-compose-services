#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

if [[ $1 == 'gc' ]]; then
    GC="gc_"
    GIIA="_$GC_INSTANCE_ID"
else
    GC=""
    GIIA=""
fi
CONTAINER_NAME="${GC}postgres${GIIA}"
# run the container
GC_INSTANCE_ID_APPEND=$GIIA GC=$GC docker-compose -f "$SCRIPT_HOME/docker-compose.yml" up -d --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2

if [[ $1 == '-h' ]]; then
    echo "
# Create db normal with bxd_postgres
    ./up.sh
# Create db for gc with gc_postgres
    ./up.sh gc
"
    exit 1
fi

# aftermath note
echo "
# after container run, we can use 'psql' via
docker exec -it $CONTAINER_NAME psql -U postgres

# or first step 1/2, open bash prompt first
docker exec -it $CONTAINER_NAME bash #ref. https://askubuntu.com/a/507009/22308
# then step 2/2, run psql
psql -U postgres

# after container run, we can visit pgAdmin page: localhost:5050/

Username: admin@pgadmin.org
Password: admin
"
