# Deploying GCE VM with Terraform
### Prerequsites
* Install [Google Cloud CLI](https://cloud.google.com/sdk?hl=en).
* Use gcloud to enable the following APIs:
  ```
  gcloud services enable compute.googleapis.com
  ```
* Install [Terraform](https://developer.hashicorp.com/terraform/install#darwin).
* Terraform must be able to authenticate to Google Cloud in order to use GCP APIs to manage your cloud infrastructure.  You can use the gcloud CLI to create [Application Default Credentials](https://cloud.google.com/docs/authentication/application-default-credentials) that can be used by terraform when it makes calls to GCP APIs.  
  ```
  gcloud auth application-default login
  ```
  
### Initialize Terraform
Terraform must persist state to manager your infrastructure.  It uses `backends` to persist state.  The default backend is a local backend which stores state on the local filesystem, locks that state using system APIs, and performs operations locally.  While using a local backend is not suitable for managing large scale production environments, it is perfectly fine for small scale demos.  We will rely on the default local backend for our example deployment.

* When you initialize terraform it will download the appropriate terraform provider required to interact with your cloud provider, create a local state file to store state in and create a lock file to track the specific provider version used.
  ```
  terraform init
  ```
### Deploy Application

### Test Deployment
* Get the __public-ip-address__ for the stock symbol charting application you just deployed:
  ```
  terraform show | grep nat_ip | awk '{print $3 }'
  ```
* Enter `http://[public-ip-address]/chart/goog` in your browser of choice and the application you just deployed will chart the last six months of Google's stock price. 
### Delete Deployment

---
### Terraform Details (What's Happening Behind the Curtain)
