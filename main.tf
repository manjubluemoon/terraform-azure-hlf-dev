resource "azurerm_kubernetes_cluster" "boochis-hlf-dev-k8s-cluster" {
    name                = var.cluster_name
    location            = var.locationk8s
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

resource "azurerm_resource_group" "boochis-hlf-dev-rg" {
  name     = var.resource_group_name
  location = var.locationk8s
}


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
}
