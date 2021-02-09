_SOURCE_REPO=$1
_TYPE=$2
git clone $_SOURCE_REPO source

eval "source ./$_TYPE/version.sh"
cd source
export BUILD_SOURCE_VERSION=$(getVersion)
export BUILD_SOURCE_NEXT_VERSION=$(getNextVersion)
env | grep "^BUILD_" >/workspace/build_vars
env | grep "^BUILD_"

