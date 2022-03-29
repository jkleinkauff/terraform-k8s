resource "helm_release" "nginx_ingress" {
  name = "nginx-ingress-controller"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  timeout    = "600"

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}