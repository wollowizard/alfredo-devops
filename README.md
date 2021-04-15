gcloud config set project sunrise-devops

cloud-build-local --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master --dryrun=true .

gcloud builds submit  --config=cloudbuild-nodejs12.yaml --substitutions=_SOURCE_REPO=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master .
