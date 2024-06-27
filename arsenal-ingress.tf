## Need to either setup a certificate with arsenal-issuer for the NGINX ingress or use AWS ACM to create a certificate for provisioning the ALB ingress. Having a certificate 
## allows for the secure encrypted expore of your application to the internet.


##NGINX

/*resource "kubernetes_ingress_v1" "arsenal-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "arsenal"
    namespace = "arsenal"
    annotations = {
        "cert-manager.io/cluster-issuer" = "arsenal-issuer"
  }
  }
  spec {
    ingress_class_name = "nginx"
    tls {
      secret_name = "arsenal-secret"
      hosts = ["arsenal.<aws-registered-domainname>"] 
    }
    rule {
      host = "arsenal.<aws-registered-domainname>"  
      http {
        path {
          path = "/"
          backend {
            service {
              name = "arsenal-nginx" #arsenal
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}*/

##ALB

/*resource "kubernetes_ingress_v1" "arsenal" {
  wait_for_load_balancer = true
  metadata {
    name = "arsenal"
    namespace = "arsenal"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "arsenal"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
        "alb.ingress.kubernetes.io/certificate-arn" = ""
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "arsenal-nginx"
        port {
          number = 80
        }
      }
    }
    rule {
      host = "arsenal.<aws-registered-domainname>"  
      http {
        path {
          path = "/"
          path_type = "Exact"
          backend {
            service {
              name = "arsenal-nginx"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}*/
