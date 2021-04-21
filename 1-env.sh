source "/workspace/src/devops/config" #creates var $build_type and var image_name
_BRANCH=$1
DEVOPS_ENV_SANITIZED_BRANCH=${_BRANCH//\//-}
DEVOPS_ENV_SANITIZED_BRANCH=${DEVOPS_ENV_SANITIZED_BRANCH//\./-}
export DEVOPS_ENV_SANITIZED_BRANCH

export DEVOPS_ENV_BUILD_TYPE=$build_type
export DEVOPS_ENV_IMAGE_NAME=$image_name


source /workspace/version.sh
cd /workspace/src
export DEVOPS_ENV_SRC_VERSION=$(getVersion)
export DEVOPS_ENV_SRC_NEXT_VERSION=$(getNextVersion)

env | grep "^DEVOPS_ENV_" >> /workspace/devops_env
env | grep "^DEVOPS_ENV_"
