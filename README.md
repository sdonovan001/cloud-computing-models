# Public Cloud Hosting Models 
---
## Overview
The contents of this repo explain the differences between the most common cloud hosting models.  Before you can embark down a cloud computing journey, it is important that you understand the different cloud hosting models.  The three main models are __Infrastructure-as-a-Service (IaaS)__, __Platform-as-a-Service (PaaS)__ and __Software-as-a-Service (SaaS)__.

<img src="/images/models1.png" alt="On Nooo!" witdh="550" height="550">

The image above illustrates the different application stack responsibilities for each of the hosting models. As you progress from the left to the right (On-site -> SaaS), your responsibilities decrease and the cloud providers responsibilites increase.  This repo contains examples of a stock charting application deployed using IaaS, PaaS and SaaS hosting models on __Google Cloud Platform__.  The examples will make use of __Google Cloud CLI__, __HashiCorp Packer__ and __HashiCorp Terraform__.  If you wish to deploy these examples to you own GCP project, use the following links to install the tooling.

* [Installing Google Cloud CLI](https://cloud.google.com/sdk/docs/install) 
* [Installing HasiCorp Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
* [Installing HashiCorp Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

For more details on each hosting model see the README in their respective directories in the repo.
* [Infrastructure-as-a-Service (IaaS)](/IaaS/README.md)
* [Platform-as-a-Service (PaaS)](/PaaS/README.md)
* [Software-as-a-Service (SaaS)](/SaaS/README.md)

## Stock Charting Application
The charting application is a simple python based REST application that graphs the last six months of a companies stock price. It throws in a couple of moving averages and technical indicators as well.  It returns the graph in Scalable Vector Graphics (svg) format which can easily be displayed by all major web browsers.

| Method | URL                          | Returns              |
---------|------------------------------|----------------------|
| GET    | ip_addr/status               | {"status": "OK"}     | 
| GET    | ip_addr/chart/[stock-symbol] | <svg ...> ... <\/svg> |

---
![Oh Noooo!](/images/goog-iaas.png "Six month chart for GOOG")
