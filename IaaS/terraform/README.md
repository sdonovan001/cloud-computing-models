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
* Get public IP address for the stock symbol charting application you just deployed:
  ```terraform show | grep nat_ip | awk '{print $3 }'```

### Delete Deployment

---
### Terraform Details (What's Happening Behind the Curtain)
