# Building GCE Images with Packer and Cloud Build

* Install [Google Cloud CLI](https://cloud.google.com/sdk?hl=en)
* Use gcloud to enable the following APIs:
```
gcloud services enable sourcerepo.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable servicemanagement.googleapis.com
gcloud services enable storage-api.googleapis.com
```
* To use Packer with Cloud Build, grant the [Compute Engine Instance Admin role (roles/compute.instanceAdmin.v1)](https://cloud.google.com/artifact-registry/docs/access-control#grant) to your build service account.
* To store the Google Cloud Build packer community builder in Artifact Registry, grant the [Artifact Registry Writer role (roles/artifactregistry.writer)](https://cloud.google.com/artifact-registry/docs/access-control#grant) to your build service account

Create step by step doc from
https://cloud.google.com/build/docs/building/build-vm-images-with-packer
https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/packer
https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/packer/examples/gce
