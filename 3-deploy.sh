echo "Starting deployment, applying workloads"
source /workspace/devops_env

kubectl config current-context

kubectl cluster-info

#export CLOUDSDK_COMPUTE_REGION=europe-west6
#export CLOUDSDK_CONTAINER_CLUSTER=autopilot-cluster-1
#export VERIFY_CHECKSUM=false
#curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
#
#
#
#echo "Starting deployment, applying workloads1"
#helm template -f /workspace/charts/sunrise-devops-chart/values.yaml -f /workspace/src/devops/deploy/values.yaml \
#  "$DEVOPS_ENV_APP_NAME" /workspace/charts/sunrise-devops-chart \
#  --set image.fullName="$DEVOPS_ENV_IMAGE_FULL_NAME"
#
#echo "Starting deployment, applying workloads2"
#helm install -f /workspace/charts/sunrise-devops-chart/values.yaml -f /workspace/src/devops/deploy/values.yaml \
#  "$DEVOPS_ENV_APP_NAME" /workspace/charts/sunrise-devops-chart \
#  --set image.fullName="$DEVOPS_ENV_IMAGE_FULL_NAME"
#
#echo "Starting deployment, applying workloads3"
