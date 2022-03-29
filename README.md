This repository is for study only.


It facilitates the creation of a Kubernetes cluster - with an example app - using Terraform, in DigitalOcean and AWS.

DigitalOcean


DigitalOcean modules are divided in four separated modules. The main, which will be the entry point and will call other modules. The k8scluster with the definition and meta for the Kubernetes cluster. The nginx module which will install the nginx-ingress into the k8s cluster and finally, the example app that holds simple docker app to test and access the neginx ingress.



The main module will group the other modules in a logical order* * passing output variables to other modules input variables as necessary.


# Modules Inputs and Outputs


## k8scluster Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| do_token | Digital Ocean Personal access token | string |  | **yes** |
| do_k8s_clustername | Digital Ocean Kubernetes cluster name | string |  | yes |

## k8scluster Outputs

| Name | Description |
|------|-------------|
| k8s_endpoint | Kubernetes Cluster endpoints |
| k8s_token | Kubernetes Cluster Token |
| k8s_certificate | Kubernetes Cluster Certificate |
| k8s_do_kube_config | Kubernetes Cluster kube config |


## Test

Get your newly deployed cluster name (you'll need doctl cli)

``doctl kubernetes cluster list``

Add the credentials to your local kubeconfig
``doctl kubernetes cluster kubeconfig save <cluster-name>``

Access
``kubectl --context=<cluster-name> get pods --all-namespaces``

