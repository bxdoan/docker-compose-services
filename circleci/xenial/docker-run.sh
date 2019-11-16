#!/usr/bin/env bash
#!/usr/bin/env bash

sample_usage="
# Build new image with command
./build-image.sh

# Run docker with command
./docker-run.sh

"

s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
a="$SCRIPT_HOME/.." ;                a=$(cd "$a" && pwd) ; APP_HOME="$a"

IMAGE_NAME='bxdoan/circleci:xenial'
CONTAINER='bxd_circleci'

cd "$SCRIPT_HOME"
    # stop if any running container exists
    c=$CONTAINER
    docker stop $c 2>&1 1>/dev/null
    docker rm $c   2>&1 1>/dev/null

    # load custom mapped exposed-port if nay - default 6000 if not specified
    if [[ -z $PORT ]]; then PORT=5000; fi

    # run it
    docker run  --name $CONTAINER  -d                             $IMAGE_NAME
                #container name    #run as daemon aka background  #image name
cd --


# aftermath check
echo
docker ps | grep -E "$IMAGE_NAME|IMAGE"
echo "
Container log can be viewed by (press ^C to exit watch)
$ watch docker logs $CONTAINER

"

