echo "Starting deployment, applying workloads"
cat source/devops/deploy/workloads.yml
gke-deploy run --filename=source/devops/deploy/workloads.yml --location=europe-west6 --cluster=autopilot-cluster-1
