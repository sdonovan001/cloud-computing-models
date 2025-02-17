# Infrastructer as a Service

<img src="../images/models2.png" alt="On Nooo!" witdh="550" height="550">

## Overview
With IaaS you are responsible for everything above the virtualization layer.  Think of it as "Virtualization-as-a-Service".  This is the most flexible of the three models since you control everything above the virtualization layer.  Your staff is not only responsible for designing, building and supporting the application but they are also responsible for *right sizing* the VMs, deploying the OS, patching the OS, securing the OS... essentially they have all of the same responsibilities they have with on On-site / On-prem solution with the exception of the procurment / deployment / support of the physical assets.

While IaaS does come with the benefit of shifting CapEx costs to OpEx costs (you don't *own* the physical assets... you *rent* them), you still have many of the same costs you would have with an On-site / On-prem model. With IaaS your datacenter staffing / management costs  will be reduced a bit but your people are still responsible for much of the application stack and therfore the costs associated with that.  

One huge benefit with IaaS is the speed at which you can implement chage across your organization. Lets say you recognize an opportunity to leapfrog your competition by significantly scaling the deployment of one of you applications.  In the On-site / On-prem model it might take you months to get the required hardware ordered and deployed.  With an IaaS solution... it will only take minutes!
## Packer
Add diagram and description
<img src="../images/packer-build.png" alt="On Nooo!" witdh="550" height="550">
1. You start your build by executing `gcloud builds submit --config=cloudbuild.yaml`.
2. Gcloud packages up the build artifacts specified in your `cloudbuild.yaml`.
3. Gcloud sends your build artifacts to the Google Cloud Build service.
4. Cloud Build runs the build steps defined in your `cloudbuild.yaml` using the appropriate Docker container.
5. A temporary GCE VM is stood up using the source OS specified in your `build.pkr.hcl` file.
6. The provisioners defined in your `build.pkr.hcl` file are run mutating the OS (installing / configuring your application).
7. The temporary GCE VM is shut down taking special care to __not__ delete the boot disk.
8. A new GCE OS Image is created from the boot disk and the boot disk is deleted.


## Terraform
Add diagram and description
