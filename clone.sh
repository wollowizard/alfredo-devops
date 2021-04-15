_SOURCE_REPO=$1
_BRANCH=$2

source /workspace/utils/yaml.sh

git clone $_SOURCE_REPO source
git checkout $_BRANCH

create_variables "/workspace/source/devops/config.yml"
export DEVOPS_ENV_IMAGE_NAME=$image_name
export DEVOPS_ENV_BUILD_TYPE=$build_type

source /workspace/version.sh
cd /workspace/source
export DEVOPS_ENV_SOURCE_VERSION=$(getVersion)
export DEVOPS_ENV_SOURCE_NEXT_VERSION=$(getNextVersion)

env | grep "^DEVOPS_ENV_" >/workspace/devops_env
env | grep "^DEVOPS_ENV_"

