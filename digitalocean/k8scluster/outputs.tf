output "k8s_endpoint" {
  sensitive = true
  value     = data.digitalocean_kubernetes_cluster.k8s.endpoint
}

output "k8s_token" {
  sensitive = true
  value     = data.digitalocean_kubernetes_cluster.k8s.kube_config[0].token
}

output "k8s_certificate" {
  sensitive = true
  value = base64decode(
    data.digitalocean_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  )
}
