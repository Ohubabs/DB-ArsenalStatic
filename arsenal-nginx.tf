resource "helm_release" "arsenal-nginx" {
  name       = "arsenal"
  create_namespace = true
  namespace = "arsenal"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"
  
  values = [
    "${file("nginx.yml")}"
  ]

}
