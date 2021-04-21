#!/bin/bash -x
source /workspace/devops_env
export CLOUDSDK_COMPUTE_REGION=europe-west6
export CLOUDSDK_CONTAINER_CLUSTER=autopilot-cluster-1
gcloud container clusters get-credentials --zone "$CLOUDSDK_COMPUTE_ZONE" "$CLOUDSDK_CONTAINER_CLUSTER"

export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

releaseName="$DEVOPS_ENV_IMAGE_NAME-$DEVOPS_ENV_SANITIZED_BRANCH"

helm template $releaseName /workspace/charts/sunrise-devops-chart/ \
  -f /workspace/charts/sunrise-devops-chart/values.yaml \
  -f /workspace/src/devops/deploy/values.yaml \
  --set image.fullName=$DEVOPS_ENV_IMAGE_TO_DEPLOY


helm upgrade --install $releaseName /workspace/charts/sunrise-devops-chart \
  -f /workspace/charts/sunrise-devops-chart/values.yaml \
  -f /workspace/src/devops/deploy/values.yaml \
  --set image.fullName=$DEVOPS_ENV_IMAGE_TO_DEPLOY \
