# Platform as a Service

<img src="../images/models3.png" alt="On Nooo!" witdh="550" height="550">

## Overview

## Example Cloud Run Deployment using Google Cloud SDK

### Prerequsites

### Build / Deploy Service
* The Google Cloud SDK CLI (gcloud) enables us to build and deploy our application with a single command.
  ```
  gcloud run deploy --source chart-app
  ```
  * When you are prompted for the service name, press __enter__ and accept the default.
  * If you are prompted to enable any additional APIs respond by entering __y__.
  * When prompted for region, select the region of your choice.
  * If you are prompted to create a repository in the region, respond by enteriing __y__.
  * If you are prompted to *allow unauthenticated invocations*, respond by entering __n__.

* Once you have answered all of the prompts a Docker container will be built from the provided source, it will be pushed to the appropriate repository in the selected region and a Cloud Run service will be started to run your charting application.  This can take a minute or two so be patient.

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
