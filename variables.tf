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
    default = "boochis-hlf-dev-dns"
}

variable cluster_name {
    default = "boochis-hlf-dev-cluster"
}

variable resource_group_name {
    default = "boochis-hlf-dev-rg"
}

variable locationk8s {
    default = "South India"
}

variable aks_service_principal_app_id {
    default= "e9f91da8-c684-4cc4-b2d3-cabf7112e7c0"
}

variable aks_service_principal_client_secret{
    default = "ePf8Q~doRQy3isQoZgNWuJlrkEKG9n0y679h8c_s"
}

variable aks_service_principal_object_id {
    default= "c007453b-b40b-44cc-a1e5-d777a94f23ce"
}

variable "namespace" {
  type    = string
  default = "default"
}

variable "orderer_name" {
  type    = string
  default = "orderer.example.com"
}

variable "peer_name" {
  type    = string
  default = "peer0.org1.example.com"
}

variable "ca_cert" {
  type = string
}

variable "ca_key" {
  type = string
}

variable "orderer_cert" {
  type = string
}

variable "orderer_key" {
  type = string
}

variable "peer_cert" {
  type = string
}

variable "peer_key" {
  type = string
}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "cluster_name" {}
variable "dns_prefix" {}
variable "agent_count" {}
