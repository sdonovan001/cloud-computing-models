# Infrastructer as a Service

<img src="../images/models2.png" alt="On Nooo!" witdh="550" height="550">

## Overview
IaaS is a cloud computing model where on-demand infrastructure resources, such as compute, storage, networking and virtualization, are provided to organizations over the internet. These services are typically offerend in a pay-as-you-go manner where your usage is metered and you receive a monthly bill. IaaS frees organizations from the cost and complexity of buying and managing infrastructure resources and managing data centers.

### Responsibilities
With IaaS, the cloud provider is responsible for the hardware and virtualization layers of the application stack.  They have to purchase and maintain bare metal servers, network gear, storage and provide a virtualization solution.  They are also responsible for the data center power, cooling and security.  The customer is responsible for everything above the virtualization layer of the application stack: OS, runtime, scaling, application and data.

### Flexibility
IaaS is the most flexible of the three common cloud computing models. Customers have complete control above the virtualization layer.  They not only control the size of their VM wrt CPU and memory, they also can pick between different underlying processor types. They can even decide if there should be accelerators (GPUs / TPUs) housed in their VMs.  

Not only is IaaS the most flexible cloud computing model, it also provides an added dimension of flexibility over on-prem based solutions.  If you have to quickly scale your applications because of some business opportunity, you don't need to purchase more hardware, wait for it to be delivered and physically deploy it.  With IaaS... worst case... you simply run a script to scale your applications... best case... you do nothing because you already planed for it by leveraging common IaaS scaling techniques in your initial deployment. 

### Operational Load
Since customers are still responsible for the bulk of the application stack with IaaS, they will have a greater operational load than with PaaS or SaaS solutions.  They are responsible for patching OSs, securing VM access, upgrading application runtimes, scaling application and providinig fault tolerance and DR.  IaaS does have a lower operational load than On-Prem based solutions since customers don't have to manage the physical assets or data centers.

### Staffing / Skills
With IaaS, the customer is still responsible for most of the application stack so there is not a significant drop in staffing levels or the skills required of the staff.  The staffing levels for your data center engineers will be reduced but when you also take into consideration that your infrastructure engineers will need to learn how to manage cloud resources via your providers APIs, there isn't a significant change in this dimension when moving from On-Prem to IaaS solutions.

### Total Cost of Ownership (TCO)
IaaS reduces your upfront capital expenditures. Since billing is based on a pay-as-you-go model, you only have to pay for compute, storage and networking resources that you consume.  Cloud provider billiing systems make it fairly easy to monitor, predict and contain costs.  When you take into consideration operational load and staffing, IaaS is typically the most expensive of the three common cloud computing models. 

## Example IaaS Deployment using Google Cloud Build, Packer and Terraform
We will automate our deployment by leveraging [Google Cloud Build](https://cloud.google.com/build?hl=en), [HashiCorp Packer](https://www.packer.io/) and [HashiCorp Terraform](https://www.terraform.io/).  
* __Google Cloud Build__ - A GCP service that automates the process of building, testing and deploying applications.  
* __HashiCorp Packer__ - An open-source tool that automates the creation of machine images across multiple platforms.
* __HashiCorp Terraform__ - An open-source tool that enables you to deploy and manage infrastructure as Code (IaC).

We will break our deployment into two distinct steps: 
* We will use Cloud Build and Packer to package our stock charting application into a runnable OS image.  Step by step instructions along with the necessary artifacts can be found in the [packer](./packer) directory.
* We will use Terraform to stand up a GCE VM running our new OS image (i.e. deploy our application).  Step by step instructions along with the necessary artifacts can be found in the [terraform](./terraform) directory.

:warning: We have significantly simplified our IaaS deployment. If this were a production application we would need to worry about fault tolerance, disaster recovery and scalability.  These concerns can easily be addressed using widely available cloud computing constructs such as managed instance groups, load balancers and multi-region deployments.
