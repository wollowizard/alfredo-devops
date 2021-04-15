# https://stackoverflow.com/questions/50755859/pull-and-push-image-to-another-project-using-gcloud-container-builder works as owner
echo "----- Start build and push images -----"
source /workspace/devops_env
_BRANCH=$1
DOCKERFILE="workspace/$DEVOPS_ENV_BUILD_TYPE/Dockerfile"
if test -f "workspace/source/Dockerfile"; then
  echo "---- Using custom docker file from source ----"
  DOCKERFILE="workspace/source/Dockerfile"
fi

#IMAGE_NAME="gcr.io/$_PROJECT/$_MS"
IMAGE_NAME="gcr.io/sunrise-devops/$DEVOPS_ENV_IMAGE_NAME"
if [ $_BRANCH != master ]; then
  IMAGE_NAME="$IMAGE_NAME/$_BRANCH"
fi

echo "Creating docker image $IMAGE_NAME"
docker build -t "$IMAGE_NAME" -f $DOCKERFILE source
echo "Pushing docker image $IMAGE_NAME"
docker push "$IMAGE_NAME"

if [ $_BRANCH == master ]; then
  TAGGED_IMAGE="$IMAGE_NAME:$DEVOPS_ENV_SOURCE_VERSION"
  echo "Creating docker image $TAGGED_IMAGE"
  docker tag "$IMAGE_NAME" "$TAGGED_IMAGE"
  echo "Pushing docker image $IMAGE_NAME"
  docker push "$TAGGED_IMAGE"
fi

echo "----- End build and push images -----"
