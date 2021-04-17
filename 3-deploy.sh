#!/bin/bash -x
source /workspace/devops_env
_BRANCH=$1
export CLOUDSDK_COMPUTE_REGION=europe-west6
export CLOUDSDK_CONTAINER_CLUSTER=autopilot-cluster-1
gcloud container clusters get-credentials --zone "$CLOUDSDK_COMPUTE_ZONE" "$CLOUDSDK_CONTAINER_CLUSTER"

export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

#helm template /workspace/charts/sunrise-devops-chart/ \
#  -f /workspace/charts/sunrise-devops-chart/values.yaml \
#  -f /workspace/src/devops/deploy/values.yaml \
#  --set image.fullName=$DEVOPS_ENV_IMAGE_FULL_NAME


helm upgrade --install $DEVOPS_ENV_APP_FULLNAME /workspace/charts/sunrise-devops-chart \
  -f /workspace/charts/sunrise-devops-chart/values.yaml \
  -f /workspace/src/devops/deploy/values.yaml \
  --set image.fullName=$DEVOPS_ENV_IMAGE_FULL_NAME \
  --set branch=$BRANCH
