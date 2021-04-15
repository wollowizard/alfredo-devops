source /workspace/devops_env
if test -f "/workspace/source/build.sh"; then
  echo "---- Starting custom build file ----"
  (
    cd /workspace/source
    chmod +x ./build.sh
    ./build.sh
  )
else
  echo "---- Starting default devops build ----"
  (
    cd /workspace/source
    /workspace/$DEVOPS_ENV_BUILD_TYPE/build.sh
  )
fi
