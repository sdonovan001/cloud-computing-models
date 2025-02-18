# Deploying GCE VM with Terraform
### Prerequsites
* Install [Google Cloud CLI](https://cloud.google.com/sdk?hl=en).
* Use gcloud to enable the following APIs:
  ```
  gcloud services enable compute.googleapis.com
  ```
* Install [Terraform](https://developer.hashicorp.com/terraform/install#darwin).
  
### Initialize Terraform


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
