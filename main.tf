resource "azuredevops_agent_pool" "pool" {
  name           = var.agent_pool_name
  auto_provision = false
}

resource "kubernetes_namespace" "az_devops_agent" {
  metadata {
    name = "azdevopsagent-ns"
  }
}

resource "kubernetes_secret" "az_devops" {
    metadata {
      name = "azdevagent-secret"
      namespace = kubernetes_namespace.az_devops_agent.metadata[0].name
    }

    data = {
        "AZP_URL" = "https://dev.azure.com/${var.azure_devops_org_name}"
        "AZP_POOL" = azuredevops_agent_pool.pool.name
        "AZP_TOKEN" = var.azure_devops_personal_access_token
    }
  
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "azdevagent-deployment"
    namespace = kubernetes_namespace.az_devops_agent.metadata[0].name
    labels = {
      app = var.kube_dep_label_name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.kube_dep_label_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.kube_dep_label_name
        }
      }

      spec {
        container {
          image = "${var.acr_url}/azdevagent:latest"
          name  = var.azure_devops_container_agent_name

          env {
              name = "AZP_URL"
              value_from {
                secret_key_ref {
                    name = kubernetes_secret.az_devops.metadata[0].name
                    key  = "AZP_URL"
                }
              }
          }

          env {
              name = "AZP_POOL"
              value_from {
                secret_key_ref {
                    name = kubernetes_secret.az_devops.metadata[0].name
                    key  = "AZP_POOL"
                }
              }
          }

          env {
              name = "AZP_TOKEN"
              value_from {
                secret_key_ref {
                    name = kubernetes_secret.az_devops.metadata[0].name
                    key  = "AZP_TOKEN"
                }
              }
          }

          volume_mount {
            mount_path = "/var/run/docker.sock"
            name = "docker-volume"
          }
        }

        volume {
            name = "docker-volume"
            host_path {
              path = "/var/run/docker.sock"
            }
        }
      }
    }
  }
}