# Create a resource group
resource "azurerm_resource_group" "boochis-hlf-dev-rg" {
  name     = var.resource_group_name
  location = var.locationk8s
}

# Create an AKS cluster
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

  depends_on = [
    azurerm_resource_group.boochis-hlf-dev-rg
  ]

  tags = {
    Environment = "Development"
  }
}

# Create a public IP for the AKS cluster
resource "azurerm_public_ip" "boochis-hlf-dev-public-ip" {
  name                = "${azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster.name}-public-ip"
  location            = var.locationk8s
  resource_group_name = azurerm_resource_group.boochis-hlf-dev-rg.name
  allocation_method   = "Static"

  tags = {
    Environment = "Development"
  }
}

# Install and configure Helm
resource "null_resource" "helm_installation" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.boochis-hlf-dev-public-ip.ip_address
      user        = "admin"
      private_key = file("~/.ssh/id_rsa")
    }

    inline = [
      "kubectl apply -f https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get-helm-3",
      "kubectl create serviceaccount tiller --namespace kube-system",
      "kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller",
      "kubectl patch deploy --namespace kube-system tiller-deploy -p '{\"spec\":{\"template\":{\"spec\":{\"serviceAccount\":\"tiller\"}}}}'",
      "helm repo add stable https://charts.helm.sh/stable",
      "helm repo update"
    ]
  }

  depends_on = [
    azurerm_kubernetes_cluster.boochis-hlf-dev-k8s-cluster,
    azurerm_public_ip.boochis-hlf-dev-public-ip
  ]
}
