_TYPE=$1

if test -f "./source/build.sh"; then
  echo "---- Starting custom build file ----"
  chmod +x ./source/build.sh
  ./source/build.sh
else
  echo "---- Starting default devops build ----"
  cd source
  eval "../$_TYPE/build.sh"
fi
