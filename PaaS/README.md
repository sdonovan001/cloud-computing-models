# Platform as a Service

<img src="../images/models3.png" alt="On Nooo!" witdh="550" height="550">

## Overview

## Example Cloud Run Deployment using Google Cloud SDK

### Prerequsites

### Build / Deploy Service


### Test Service
Our service requires authentication so we will use the [Cloud Run proxy](https://cloud.google.com/sdk/gcloud/reference/run/services/proxy) to provide it.  This will allow us to send our requests to a service running on localhost that will attach the appropriate credentials and forward the request to the backend service.
* Start the proxy with the command below after replacing *my-project_id* with your project identifier.
  ```
  gcloud run services proxy chart-app --project [my-project-id]
  ```
### Delete Service
* Delete the Cloud Run stock symbol charting service.
  ```
  gcloud run services delete chart-app
  ```
  * foo
  * bar
