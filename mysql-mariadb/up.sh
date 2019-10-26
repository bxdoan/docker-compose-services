#!/usr/bin/env bash

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path

CONTAINER_NAME='bxd_mariadb'
MARIADB_ROOT_PASSWORD='root'

# run the container
docker-compose -f "$SCRIPT_HOME/docker-compose.yml" up -d --force-recreate  # ref. https://forums.docker.com/t/named-volume-with-postgresql-doesnt-keep-databases-data/7434/2

# aftermath note
echo "
# after container run, we can use 'psql' via
docker exec -it $CONTAINER_NAME mysql -u root -p$MARIADB_ROOT_PASSWORD

# or first step 1/2, open bash prompt first
docker exec -it $CONTAINER_NAME bash #ref. https://askubuntu.com/a/507009/22308
# then step 2/2, run psql
mysql -u root -p$MARIADB_ROOT_PASSWORD

# if you don't have local mysql command, then make this alias
echo \"
# create mysql command
alias mysql='docker exec -it $CONTAINER_NAME mysql -u root -p$MARIADB_ROOT_PASSWORD'
\" >> $HOME/.bashrc
mysql --version  # aftermath check
"
