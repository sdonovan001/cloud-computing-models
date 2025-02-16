# Building GCE Images with Packer and Cloud Build
## Prerequesites

* Install [Google Cloud CLI](https://cloud.google.com/sdk?hl=en).
* Use gcloud to enable the following APIs:
  ```
  gcloud services enable sourcerepo.googleapis.com
  gcloud services enable compute.googleapis.com
  gcloud services enable servicemanagement.googleapis.com
  gcloud services enable storage-api.googleapis.com
  ```
* To use Packer with Cloud Build, grant the [Compute Engine Instance Admin role (roles/compute.instanceAdmin.v1)](https://cloud.google.com/artifact-registry/docs/access-control#grant) to your build service account.
* To store the Google Cloud Build packer community builder in Artifact Registry, grant the [Artifact Registry Writer role (roles/artifactregistry.writer)](https://cloud.google.com/artifact-registry/docs/access-control#grant) to your build service account.

## Download and Build the Packer Builder Image
Cloud Build provides a community builder docker image that can be used to invode packer commands via Cloud Build. Before you can use it, you must build it and push it to the Artifact Registry in your GCP project.

* Clone the [cloud-builders-community](https://github.com/GoogleCloudPlatform/cloud-builders-community) repository.
  ```
  git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
  ```
* Build the Packer Docker image:
  ```
  cd cloud-builders-community/packer
  gcloud builds submit .
  ```
  
## Configuring Cloud Build to run your Packer Builder Image
* Export GCP project variables.  Replace *my-project-id* below with your GCP project identifier.
  ```
  export PROJECT_ID=my-project-id
  export PROJECT_NUMBER=`gcloud projects list --filter="$PROJECT_ID" --format="value(PROJECT_NUMBER)"
  ```
* Create Service Account for your Packer builds to run as:
  ```
  gcloud iam service-accounts create packer --description "Packer image builder"
  ```
* Grant the appropriate roles to the Packer Service Account:
  ```
  gcloud projects add-iam-policy-binding $PROJECT_ID \
  --role="roles/compute.instanceAdmin.v1" \
  --member="serviceAccount:packer@${PROJECT_ID}.iam.gserviceaccount.com"
  gcloud projects add-iam-policy-binding $PROJECT_ID \
  --role="roles/iam.serviceAccountUser" \
  --member="serviceAccount:packer@${PROJECT_ID}.iam.gserviceaccount.com"
  ```


## Submit your Build

Create step by step doc from
https://cloud.google.com/build/docs/building/build-vm-images-with-packer
https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/packer
https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/packer/examples/gce
