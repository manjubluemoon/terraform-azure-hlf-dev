resource "azurerm_resource_group" "boochis-hlf-dev-rg" {
  name     = var.resource_group_name
  location = var.locationk8s
}

resource "azurerm_kubernetes_cluster" "boochis-hlf-dev-k8s-cluster" {
  name                = var.cluster_name
  location            = var.locationk8s
  resource_group_name = azurerm_resource_group.boochis-hlf-dev-rg.name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "boss"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name            = "default"
    node_count      = var.agent_count
    vm_size         = "Standard_D11"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  tags = {
    Environment = "Development"
  }

  depends_on = [
    azurerm_resource_group.boochis-hlf-dev-rg,
  ]

  # Adding manifests for Hyperledger Fabric CA, orderer, and peer
  resource "kubernetes_manifest" "boochis-hlf-dev-ca" {
    manifest = file("${path.module}/hyperledger-ca.yaml")
    depends_on = [
      azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster
    ]
  }

  resource "kubernetes_manifest" "boochis-hlf-dev-orderer" {
    manifest = file("${path.module}/hyperledger-orderer.yaml")
    depends_on = [
      kubernetes_manifest.boochis-hlf-dev-ca,
      azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster
    ]
  }

  resource "kubernetes_manifest" "boochis-hlf-dev-peer" {
    manifest = file("${path.module}/hyperledger-peer.yaml")
    depends_on = [
      kubernetes_manifest.boochis-hlf-dev-ca,
      kubernetes_manifest.boochis-hlf-dev-orderer,
      azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster
    ]
  }
}
