source /workspace/devops_env
DOCKERFILE_PATH=/workspace/$DEVOPS_ENV_BUILD_TYPE/build

if test -f "/workspace/src/devops/build/Dockerfile"; then
  DOCKERFILE_PATH=/workspace/src/build
fi

docker build -t tmp-builder-image $DOCKERFILE_PATH
docker run --mount type=bind,source=/workspace,target=/workspace/ tmp-builder-image
