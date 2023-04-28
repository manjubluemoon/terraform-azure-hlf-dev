output "aks_cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.name
}

output "aks_cluster_resource_group" {
  description = "Name of the resource group that the AKS cluster is in."
  value       = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.resource_group_name
}

output "aks_cluster_location" {
  description = "Location of the AKS cluster."
  value       = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.location
}

output "aks_cluster_kube_config" {
  description = "Kube config for the AKS cluster."
  value       = azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.kube_config_raw
}

output "hyperledger_ca_username" {
  description = "Username for the Hyperledger Fabric CA."
  value       = var.ca_username
}

output "hyperledger_ca_password" {
  description = "Password for the Hyperledger Fabric CA."
  value       = var.ca_password
}

output "hyperledger_orderer_address" {
  description = "The address of the Hyperledger Fabric orderer."
  value       = var.orderer_address
}

output "hyperledger_peer_address" {
  description = "The address of the Hyperledger Fabric peer."
  value       = var.peer_address
}
