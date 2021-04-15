source /workspace/devops_env

if test -f "./source/build.sh"; then
  echo "---- Starting custom build file ----"
  chmod +x ./source/build.sh
  ./source/build.sh
else
  echo "---- Starting default devops build ----"
  cd source
  eval "../$DEVOPS_ENV_BUILD_TYPE/build.sh"
fi
