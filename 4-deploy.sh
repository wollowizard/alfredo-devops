echo "Starting deployment, applying workloads"
source /workspace/devops_env
helm template -f /workspace/charts/sunrise-devops-charts/values.yaml -f /workspace/src/devops/deploy/values.yaml \
  $DEVOPS_ENV_APP_NAME /workspace/charts/sunrise-devops-charts \
  --set image.fullName=$DEVOPS_ENV_IMAGE_FULL_NAME


##cat /workspace/src/devops/deploy/workloads.yml
##gke-deploy run --filename=src/devops/deploy/workloads.yml --location=europe-west6 --cluster=autopilot-cluster-1
