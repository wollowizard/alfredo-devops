gcloud config set project sunrise-devops

cloud-build-local --substitutions=_SRC_REPO_URL=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master --dryrun=false .

gcloud builds submit  --config=cloudbuild.yaml --substitutions=_SRC_REPO_URL=https://github.com/wollowizard/hello-world-service.git,_BRANCH=master .
