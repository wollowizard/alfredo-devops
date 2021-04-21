#!/bin/bash

source /workspace/devops_env
DOCKERFILE=/workspace/$DEVOPS_ENV_BUILD_TYPE/build/Dockerfile

if test -f "/workspace/src/devops/build/Dockerfile"; then
  DOCKERFILE=/workspace/src/devops/build/Dockerfile
fi

docker build -t tmp-builder-image -f $DOCKERFILE /workspace/src
docker run --mount type=bind,source=/workspace/src,target=/workspace/src --workdir=/workspace/src tmp-builder-image
