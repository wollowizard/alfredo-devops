#!/bin/bash -x
# https://stackoverflow.com/questions/50755859/pull-and-push-image-to-another-project-using-gcloud-container-builder works as owner
source /workspace/devops_env
dockerfile="/workspace/$DEVOPS_ENV_BUILD_TYPE/run/Dockerfile"
if test -f "/workspace/src/devops/run/Dockerfile"; then
  dockerfile="/workspace/src/devops/run/Dockerfile"
fi

branchInImageName=$DEVOPS_ENV_SANITIZED_BRANCH
if [ $DEVOPS_ENV_SANITIZED_BRANCH == "master" ]; then
  branchInImageName=""
fi

imageWithRepo="gcr.io/sunrise-devops/$DEVOPS_ENV_IMAGE_NAME/$branchInImageName"
DEVOPS_ENV_IMAGE_TO_DEPLOY="$imageWithRepo"

echo "Creating and pushing docker image $imageWithRepo"
docker build -t "$imageWithRepo" -f $dockerfile /workspace/src
docker push "$imageWithRepo"


if [ $DEVOPS_ENV_SANITIZED_BRANCH == "master" ]; then
  taggedImage="$imageWithRepo:$DEVOPS_ENV_SRC_VERSION"
  docker tag $imageWithRepo $taggedImage
  docker push $taggedImage
  DEVOPS_ENV_IMAGE_TO_DEPLOY=$taggedImage
fi


export DEVOPS_ENV_IMAGE_TO_DEPLOY
env | grep "^DEVOPS_ENV_" >> /workspace/devops_env
env | grep "^DEVOPS_ENV_"
