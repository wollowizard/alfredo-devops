#!/bin/bash -x

_SRC_REPO_URL=$1
_BRANCH=$2

source /workspace/utils/yaml.sh

git clone $_SRC_REPO_URL src
git checkout $_BRANCH

create_variables "/workspace/src/devops/config.yaml"
create_variables "/workspace/src/devops/deploy/values.yaml"
export DEVOPS_ENV_APP_NAME=$app_name
export DEVOPS_ENV_APP_FULLNAME="$app_name-$_BRANCH"
export DEVOPS_ENV_BUILD_TYPE=$build_type

source /workspace/version.sh
cd /workspace/src
export DEVOPS_ENV_SRC_VERSION=$(getVersion)
export DEVOPS_ENV_SRC_NEXT_VERSION=$(getNextVersion)

env | grep "^DEVOPS_ENV_" >> /workspace/devops_env
env | grep "^DEVOPS_ENV_"

