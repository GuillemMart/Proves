#!/bin/sh

if [ "$(docker ps -aq -f name=rosepetal-dep-rethinkdb)" ]; then
    docker stop rosepetal-dep-rethinkdb 2>/dev/null
    docker rm -f rosepetal-dep-rethinkdb
fi

docker run -d --name rosepetal-dep-rethinkdb \
  -p 7080:7080 \
  -p 28015:28015 \
  -p 29015:29015 \
  -v /opt/storage/backup:/var/lib/rethinkdb/ \
  rosepetal-dep-rethinkdb
  
