source /workspace/devops_env
(
  cd /workspace/$DEVOPS_ENV_BUILD_TYPE/build/
  docker build -t builder-image -f /workspace/$DEVOPS_ENV_BUILD_TYPE/build/Dockerfile /workspace/$DEVOPS_ENV_BUILD_TYPE/build/
)

BUILD_SCRIPT=''
if test -f "/workspace/src/build.sh"; then
  echo "---- Starting custom build file ----"
  BUILD_SCRIPT="/workspace/src/build.sh"
else
  echo "---- Starting default devops build ----"
  BUILD_SCRIPT="/workspace/$DEVOPS_ENV_BUILD_TYPE/build/build.sh"
fi
docker run --mount type=bind,source=/workspace,target=/workspace/ builder-image bash -c "cd /workspace/src && $BUILD_SCRIPT"
