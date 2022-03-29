module "k8scluster" {
  source             = "../k8scluster"
  do_token           = var.do_token
  do_k8s_clustername = "k8s-cluster-tf"
}

module "nginx-ingress" {
  source = "../nginx"

  k8s_endpoint    = module.k8scluster.k8s_endpoint
  k8s_token       = module.k8scluster.k8s_token
  k8s_certificate = module.k8scluster.k8s_certificate
}

# module "example-app" {
#   source = "../example-app"
# }