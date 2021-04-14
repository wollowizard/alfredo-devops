# https://stackoverflow.com/questions/50755859/pull-and-push-image-to-another-project-using-gcloud-container-builder works as owner
echo "----- Start build and push images -----"
TYPE=$1
_PROJECT=$2
_MS=$3
_BRANCH=$4
DOCKERFILE="./$TYPE/Dockerfile"
if test -f "./source/Dockerfile"; then
  echo "---- Using custom docker file from source ----"
  DOCKERFILE="./source/Dockerfile"
fi

#IMAGE_NAME="gcr.io/$_PROJECT/$_MS"
IMAGE_NAME="gcr.io/sunrise-devops/$_MS"
if [ $_BRANCH != master ]; then
  IMAGE_NAME="$IMAGE_NAME/$_BRANCH"
fi

source /workspace/build_vars

echo "Creating docker image $IMAGE_NAME"
docker build -t "$IMAGE_NAME" -f $DOCKERFILE source
echo "Pushing docker image $IMAGE_NAME"
docker push "$IMAGE_NAME"

if [ $_BRANCH == master ]; then
  TAGGED_IMAGE="$IMAGE_NAME:$BUILD_SOURCE_VERSION"
  echo "Creating docker image $TAGGED_IMAGE"
  docker tag "$IMAGE_NAME" "$TAGGED_IMAGE"
  echo "Pushing docker image $IMAGE_NAME"
  docker push "$TAGGED_IMAGE"
fi

echo "----- End build and push images -----"
