provider "kubernetes" {
  config_path    = "~/.kube/config"
  # host = "https://127.0.0.1:55664"
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "helloworld"
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name      = "helloworld-deployment"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "hello_world_app"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello_world_app"
        }
      }

      spec {
        container {
          name  = "helloworld-app"
          image = "talaharon23/helloworld-app:1.1"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  metadata {
    name      = "helloworld-service"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = "hello_world_app"
    }

    port {
      port        = 8080
      target_port = 80
    }
  }
}

resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name = "helloworld-ingress"
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/*"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = kubernetes_service.app_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

