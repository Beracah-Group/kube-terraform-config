# specify the provider
provider "kubernetes" {}

# Downloading plugin for provider "kubernetes"...

# schedule a simple app
terraform init resource "kubernetes_pod" "echo" {
  metadata {
    name = "echo-example"

    labels {
      App = "echo"
    }
  }

  spec {
    container {
      # image is the only thing that changes incase of making an application upgrade.
      image = "hashicorp/http-echo:0.2.1"
      name  = "example2"
      args  = ["-listen=:80", "-text='Hello World'"]

      port {
        container_port = 80
      }
    }
  }
}

# provision a service
resource "kubernetes_service" "echo" {
  metadata {
    name = "echo-example"
  }

  spec {
    selector {
      App = "${kubernetes_pod.echo.metadata.0.labels.App}"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = "${kubernetes_service.echo.load_balancer_ingress.0.ip}"
}
