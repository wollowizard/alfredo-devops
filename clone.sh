_SOURCE_REPO=$1

eval "source ./utils/yaml.sh"

git clone $_SOURCE_REPO source


create_variables "./source/devops/config.yml"
export DEVOPS_ENV_IMAGE_NAME=$image_name
export DEVOPS_ENV_BUILD_TYPE=$build_type

eval "source ../$DEVOPS_ENV_BUILD_TYPE/version.sh"
cd source
export DEVOPS_ENV_SOURCE_VERSION=$(getVersion)
export DEVOPS_ENV_SOURCE_NEXT_VERSION=$(getNextVersion)
cd ..

env | grep "^DEVOPS_ENV_" >/workspace/devops_env
env | grep "^DEVOPS_ENV_"

