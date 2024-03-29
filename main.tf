# Generate random resource group name
#resource "random_pet" "rg_name" {
#  prefix = var.resource_group_name_prefix
#}

resource "azurerm_resource_group" "boochis-hlf-dev-rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "boochis-hlf-dev-wsp" {
  location            = var.log_analytics_workspace_location
  # The WorkSpace name has to be unique across the whole of azure;
  # not just the current subscription/tenant.
  name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
  resource_group_name = azurerm_resource_group.boochis-hlf-dev-rg.name
  sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "boochis-hlf-dev-soln" {
  location              = azurerm_log_analytics_workspace.boochis-hlf-dev-wsp.location
  resource_group_name   = azurerm_resource_group.boochis-hlf-dev-rg.name
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.boochis-hlf-dev-wsp.name
  workspace_resource_id = azurerm_log_analytics_workspace.boochis-hlf-dev-wsp.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}

resource "azurerm_container_registry" "boochis-hlf-dev-acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.boochis-hlf-dev-rg.name
  location            = azurerm_resource_group.boochis-hlf-dev-rg.location
  sku                 = "Standard"
}

resource "azurerm_kubernetes_cluster" "boochis-hlf-dev-cluster" {
  location            = azurerm_resource_group.boochis-hlf-dev-rg.location
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.boochis-hlf-dev-rg.name
  dns_prefix          = var.dns_prefix

  tags                = {
    Environment = "Development"
    Project     = "Boochis Hyperledger Fabric"
  }

  default_node_pool {
    name       = "agentpool"
    #vm_size    = "Standard_D2_v2"
    vm_size = "Standard_B2s"
    node_count = var.agent_count

    }

  linux_profile {
    admin_username = "boss"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  identity {
    type = "SystemAssigned"
  }

}

#resource "azurerm_role_assignment" "boochis-hlf-dev-rbac" {
#  principal_id             = azurerm_kubernetes_cluster.boochis-hlf-dev-cluster.identity[0].principal_id
#  role_definition_name     = "AcrPull"
#  scope                    = azurerm_container_registry.boochis-hlf-dev-acr.id
#  skip_service_principal_aad_check = true
#}
