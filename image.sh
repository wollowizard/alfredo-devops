# https://stackoverflow.com/questions/50755859/pull-and-push-image-to-another-project-using-gcloud-container-builder works as owner
source /workspace/devops_env
_BRANCH=$1
DOCKERFILE="/workspace/$DEVOPS_ENV_BUILD_TYPE/run/Dockerfile"
if test -f "/workspace/src/devops/run/Dockerfile"; then
  DOCKERFILE="/workspace/src/devops/run/Dockerfile"
fi

IMAGE_NAME="gcr.io/sunrise-devops/$DEVOPS_ENV_IMAGE_NAME"
if [ $_BRANCH != master ]; then
  IMAGE_NAME="$IMAGE_NAME/$_BRANCH"
fi

docker build -t "$IMAGE_NAME" -f $DOCKERFILE /workspace/src
docker push "$IMAGE_NAME"

if [ $_BRANCH == master ]; then
  TAGGED_IMAGE="$IMAGE_NAME:$DEVOPS_ENV_SRC_VERSION"
  echo "Creating docker image $TAGGED_IMAGE"
  docker tag "$IMAGE_NAME" "$TAGGED_IMAGE"
  echo "Pushing docker image $IMAGE_NAME"
  docker push "$TAGGED_IMAGE"
fi
