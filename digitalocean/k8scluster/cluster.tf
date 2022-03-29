resource "random_id" "cluster_name" {
  byte_length = 6
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = format("%s-%s", var.do_k8s_clustername, random_id.cluster_name.hex)
  region  = "sfo3"
  version = "1.21.10-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}


resource "local_file" "kubeconfigdo" {
  content  = digitalocean_kubernetes_cluster.k8s.kube_config[0].raw_config
  filename = "${path.module}/kubeconfig_do"
}