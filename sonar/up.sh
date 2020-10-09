#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

# run the container
sudo sysctl -w vm.max_map_count=262144
docker-compose -f "$SCRIPT_HOME/docker-compose.yml" up -d --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2

# aftermath note
echo "
remomerber run: sudo sysctl -w vm.max_map_count=262144
# after container run, we can visit pgAdmin page: localhost:9000/

Username: sonar
Password: sonar
"
