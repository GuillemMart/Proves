#docker build -t rosepetal-rethinkdb-image .
DOCKER_BUILDKIT=1 docker build -f Dockerfile.rethinkdb --progress=plain --compress --squash -t rosepetal-dep-rethinkdb . > build.log 2>&1
