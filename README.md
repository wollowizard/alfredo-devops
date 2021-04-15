gcloud config set project alfredo-devops

gcloud builds submit  --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_PROJECT=alfredo-hello-world,_MS=hello-world-service,_BRANCH=master .






cloud-build-local --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_PROJECT=alfredo-hello-world,_MS=hello-world-service,_BRANCH=master --dryrun=false .



cloud-build-local --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master --dryrun=true .



gcloud builds submit  --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master .
