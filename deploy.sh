echo "Starting deployment, applying workloads"
cat /workspace/src/devops/deploy/workloads.yml
gke-deploy run --filename=src/devops/deploy/workloads.yml --location=europe-west6 --cluster=autopilot-cluster-1
