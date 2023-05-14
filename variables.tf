variable "agent_count" {
  default = 1
}

# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "cluster_name" {
  default = "boochis-hlf-dev-cluster"
}

variable "acr_name" {
  default = "boochis2hlf2dev2acr"
}

variable "dns_prefix" {
  default = "boochis-hlf-dev-dns"
}

# Refer to https://azure.microsoft.com/global-infrastructure/services/?products=monitor for available Log Analytics regions.
variable "log_analytics_workspace_location" {
  default = "southindia"
}

variable "log_analytics_workspace_name" {
  default = "boochis-hlf-dev-wsp"
}

# Refer to https://azure.microsoft.com/pricing/details/monitor/ for Log Analytics pricing
variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "resource_group_location" {
  default     = "southindia"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "boochis-hlf-dev-rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDQJEaoMsy3Owj9OoTQcib1gGazU3tFd+Y7H99eGpqFYRqBBT1GkEEiEJUOsXz7yFag8N0jTzTGCHAwwCbpm7hg9hGC8JRxHF7Q7DLxUIeWkBKT4mW1YQulJu0cfqFX3x8x29ak2d7d4frgaUYoc1XMm9xNnZg9rlLDN8LH7PfcSMqXSY0kQilAJz3SmcDthG3bnSja8qcY1gvbkNalq/tLUkbud8DcQdqIGWtmyUh089yzIIeKnrUSv4zxMMGksOD8gd9FVGy4nqK3wCNEASUBB8DvI8NMfqSJIMWmqTYwJ1rYejbQbp4o3HmHl4MYkQRPvzcy4sSBBz0iqVDbzuM5TMR+Riw5aswhsKpeFwG9XFp1hlmfT0YH1SbX45KMgQWIDKZzPLgNWEwfMiPuA8KZfiPlX+5UZaKMsGG1TPmNCdB+hH/fBokqkFZ4wfDlJZ5jOSL4y6DCghBaDY2/fxZGIV3x5FjAuG7LUcE9yko8b57Yev/A62Pv7hJyOs86DU= generated-by-azure"
}

variable "SSH_PRIVATE_KEY" {
  description = "Path to the SSH private key file"
}
