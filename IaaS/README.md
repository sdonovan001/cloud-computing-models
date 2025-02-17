# Infrastructer as a Service

<img src="../images/models2.png" alt="On Nooo!" witdh="550" height="550">

## Overview
With IaaS you are responsible for everything above the virtualization layer.  Think of it as "Virtualization-as-a-Service".  This is the most flexible of the three models since you control everything above the virtualization layer.  Your staff is not only responsible for designing, building and supporting the application but they are also responsible for *right sizing* the VMs, deploying the OS, patching the OS, securing the OS... essentially they have all of the same responsibilities they have with on On-site / On-prem solution with the exception of the procurment / deployment / support of the physical assets.

While IaaS does come with the benefit of shifting CapEx costs to OpEx costs (you don't *own* the physical assets... you *rent* them), you still have many of the same costs you would have with an On-site / On-prem model. With IaaS your datacenter staffing / management costs will be somewhat reduced but your people are still responsible for much of the application stack and therfore the *costs* associated with that.  

A huge benefit of IaaS is the speed at which you can implement chage across your organization. Lets say you recognize an opportunity to leapfrog your competition by significantly scaling the deployment of one of you applications globaly.  In the On-site / On-prem model it might take you months to get the required hardware ordered and deployed.  With an IaaS cloud hosting solution... it will only take minutes!
## Example Deployment using Google Cloud Build, Packer and Terraform
When deploying IaaS application, you are responsible for building OS images, standing up and configuring servers, identifying and managing your storage needs and properly configuring your network resources.  Since we want our deployment to be easily repeatable, we will automate these steps by leveraging [Google Cloud Build](https://cloud.google.com/build?hl=en), [HashiCorp Packer](https://www.packer.io/) and [HashiCorp Terraform](https://www.terraform.io/).  
* Google Cloud Build is a GCP service that automates the process of building, testing and deploying applications.  
* HashiCorp Packer is an open-source tool that automates the creation of machine images across multiple platforms.
* HashiCorp Terraform is an open-source tool that lets yoou build, change and manage infrastructure as Code (IaC).

We will break our deployment into two distinct steps: 
* We will use Cloud Build and Packer to package our stock charting application into a runnable OS image.  Step by step instructions along with the necessary artifacts can be found in the [packer](./packer) directory.
* We will use Terraform to stand up a GCE VM running our new OS image (i.e. deploy our application).  Step by step instructions along with the necessary artifacts can be found in the [terraform](./terraform) directory.
