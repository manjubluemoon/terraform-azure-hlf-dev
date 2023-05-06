provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "kubernetes" {
  load_config_file       = false
  host                   = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.host
  username               = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.username
  password               = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config.0.cluster_ca_certificate)
}

provider "kubectl" {
  config_path = var.kube_config_path
}

terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
        }
  }
}
