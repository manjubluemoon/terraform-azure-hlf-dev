variable "resource_group_location" {
  default       = "South India"
  description   = "Location of the resource group."
}

variable "agent_count" {
    default = 1
}

variable "ssh_public_key" {
    default = "Enter_ssh_public_key"
}

variable "dns_prefix" {
    default = "gritfyk8s"
}

variable cluster_name {
    default = "gritfyk8s"
}

variable resource_group_name {
    default = "gritfy"
}

variable locationk8s {
    default = "South India"
}

variable aks_service_principal_app_id {
    default= "Enter_aks_service_principal_app_id"
}

variable aks_service_principal_client_secret{
    default = "Enter_aks_service_principal_client_secret"
}

variable aks_service_principal_object_id {
    default= "Enter_aks_service_principal_object_id"
}
