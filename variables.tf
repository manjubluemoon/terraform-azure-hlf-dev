variable "resource_group_location" {
  default       = "South India"
  description   = "Location of the resource group."
}

variable "agent_count" {
    default = 1
}

variable "ssh_public_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDQJEaoMsy3Owj9OoTQcib1gGazU3tFd+Y7H99eGpqFYRqBBT1GkEEiEJUOsXz7yFag8N0jTzTGCHAwwCbpm7hg9hGC8JRxHF7Q7DLxUIeWkBKT4mW1YQulJu0cfqFX3x8x29ak2d7d4frgaUYoc1XMm9xNnZg9rlLDN8LH7PfcSMqXSY0kQilAJz3SmcDthG3bnSja8qcY1gvbkNalq/tLUkbud8DcQdqIGWtmyUh089yzIIeKnrUSv4zxMMGksOD8gd9FVGy4nqK3wCNEASUBB8DvI8NMfqSJIMWmqTYwJ1rYejbQbp4o3HmHl4MYkQRPvzcy4sSBBz0iqVDbzuM5TMR+Riw5aswhsKpeFwG9XFp1hlmfT0YH1SbX45KMgQWIDKZzPLgNWEwfMiPuA8KZfiPlX+5UZaKMsGG1TPmNCdB+hH/fBokqkFZ4wfDlJZ5jOSL4y6DCghBaDY2/fxZGIV3x5FjAuG7LUcE9yko8b57Yev/A62Pv7hJyOs86DU= generated-by-azure"
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
