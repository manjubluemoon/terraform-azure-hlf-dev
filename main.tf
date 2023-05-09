resource "azurerm_role_assignment" "boochis-hlf-dev-rbac" {
  scope                            = azurerm_container_registry.boochis-hlf-dev-acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.boochis-hlf-dev-cluster.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
  
  # Service principal arguments
  service_principal_id     = var.service_principal_id
  service_principal_secret = var.service_principal_secret
}
