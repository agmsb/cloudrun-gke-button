## Under the hood

Execute the bash script below:

```
./scripts/provision.sh
```

This is what the bash script does:

* Enables appropriate Google Cloud Platform APIs for GKE, Cloud Run, Cloud Build, and Container Registry.
* Installs `kubectx` and `kubens`
* Creates GKE Cluster with these add-ons: `HorizontalPodAutoscaling,HttpLoadBalancing,Istio,CloudRun`
* Renames the cluster context to `cloud-run-gke`
* Patches `config-network` ConfigMap to allow for outbound access from Pod IP range and Service IP range
* Patches `config-domain` ConfigMap to use `xip.io` for wildcard DNS to provide working domain for deployed services. 

## Now what?

Deploy something to both Cloud Run and Cloud Run on GKE! This repo will be updated with an example shortly. 

