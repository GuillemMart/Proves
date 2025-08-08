#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: No version tag provided."
  echo "Usage: ./build.sh <version-tag>"
  exit 1
fi

VERSION_TAG=$1
ARTIFACT_PATH="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE_NAME}"

docker build \
  -f Dockerfile.rethinkdb \
  --progress=plain \
  --compress \
  --squash \
  -t "${ARTIFACT_PATH}:latest" \
  -t "${ARTIFACT_PATH}:${VERSION_TAG}" \
  .
