_SOURCE_REPO=$1
_TYPE=$2
git clone $_SOURCE_REPO source

#imports getVersion and getNextVersion
eval "source ./$_TYPE/version.sh"

#imports create_variables
eval "source ./utils/yaml.sh"


cd source
export BUILD_SOURCE_VERSION=$(getVersion)
export BUILD_SOURCE_NEXT_VERSION=$(getNextVersion)

create_variables "./devops/config.yml"
export BUILD_IMAGE_NAME=$image_name

env | grep "^BUILD_" >/workspace/build_vars
env | grep "^BUILD_"

