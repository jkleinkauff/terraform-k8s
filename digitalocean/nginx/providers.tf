provider "helm" {
  kubernetes {
    host             = var.k8s_endpoint
    token            = var.k8s_token
    cluster_ca_certificate = var.k8s_certificate
  }
}