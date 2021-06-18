# create kubernetes cluster
gcloud config set compute/zone us-central1-a

# starup the cluster
gcloud container clusters create awwvision \
    --num-nodes 2 \
    --scopes cloud-platform

# use the container's credentials
gcloud container clusters get-credentials awwvision

# verify that everything is working
kubectl cluster-info

# update package
sudo apt-get update

# install virtual env
sudo apt-get install virtualenv -y

virtualenv -p python3 venv

# activate virtual env
source venv/bin/activate

# get the sample
gsutil -m cp -r gs://spls/gsp066/cloud-vision .

# ch dir
cd cloud-vision/python/awwvision

# build
make all

# check resource on the cluster
kubectl get pods

# get list of deployments
kubectl get deployments -o wide

# get IP addr of service
kubectl get svc awwvision-webapp