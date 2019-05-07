# Cloud Run on GKE Button

This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreements with Google. This is NOT a Google official product.

*tl;dr* Deploy Cloud Run on GKE really, really fast with the button below

## Overview

There's been a lot of hype around [Cloud Run](https://cloud.google.com/run/), Google Cloud's solution for fully-managed serverless containers.

One of my favorite bits about it is the ~ _p o r t a b i l i t y_ ~ it provides. 

You see, Cloud Run is standardized on [Knative](https://knative.dev/docs/) APIs, which means that I can take a container running on Cloud Run and deploy it to any Kubernetes cluster running Knative. 

> It is useful to note that  Knative is an OSS framework that aims for an easier experience for developers to deploy to Kubernetes and Istio. 

As expected, Kubernetes clusters on Google Kubernetes Engine have this capability baked in through a `CloudRun` add-on. Even better, when you create a GKE cluster with the add-on, it is integrated into the Cloud Run interface as a deployment target.

## Requirements and setup

Requirements:

* Google Cloud Platform project
* Cloud Shell

Setup: 

There is a little bit of legwork to get Cloud Run going on GKE, so I've packaged the setup into a neat little button below.

[![Open in Cloud Shell](http://gstatic.com/cloudssh/images/open-btn.svg)](https://console.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/agmsb/cloudrun-gke-button.git&cloudshell_git_branch=master&cloudshell_tutorial=README.md)

## Under the hood

Once you click the button, this repository will be cloned into your Google Cloud Shell environment. Execute the bash script below:

```
./provision.sh
```

This is what the bash script does:
* Installs `kubectx` and `kubens`
* Creates GKE Cluster with these add-ons: `HorizontalPodAutoscaling,HttpLoadBalancing,Istio,CloudRun`
* Renames the cluster context to `cloud-run-gke`
* Patches `config-network` ConfigMap to allow for outbound access from Pod IP range and Service IP range
* Patches `config-domain` ConfigMap to use `xip.io` for wildcard DNS to provide working domain for deployed services. 

## Now what?

Deploy something to both Cloud Run and Cloud Run on GKE! An example will be coming shortly. 

_Note: this repo was directly inspired by [Cloud Run Button](https://github.com/jamesward/cloud-run-button)._

## Cleanup

Execute the bash script below:

```
./cleanup.sh
```


## TODO

* provide source to url example for both cloud run and cloud run on GKE with HTTP-Doom