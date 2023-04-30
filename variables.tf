variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "locationk8s" {
  description = "The location in which to create the AKS cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster to create."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix to use with the AKS cluster."
  type        = string
}

variable "ssh_public_key" {
  description = "The public key to use for SSH access to the AKS cluster."
  type        = string
}

variable "agent_count" {
  description = "The number of agent nodes to provision in the AKS cluster."
  type        = number
  default     = 2
}

variable "aks_service_principal_app_id" {
  description = "The application ID of the service principal used by AKS."
  type        = string
}

variable "aks_service_principal_client_secret" {
  description = "The client secret of the service principal used by AKS."
  type        = string
}

variable "ca_cert_path" {
  description = "The path to the CA server TLS cert file."
  type        = string
}

variable "ca_key_path" {
  description = "The path to the CA server TLS key file."
  type        = string
}

variable "ca_password_path" {
  description = "The path to the CA server TLS key password file."
  type        = string
}

variable "orderer_cert_path" {
  description = "The path to the orderer TLS cert file."
  type        = string
}

variable "orderer_key_path" {
  description = "The path to the orderer TLS key file."
  type        = string
}

variable "peer_cert_path" {
  description = "The path to the peer TLS cert file."
  type        = string
}

variable "peer_key_path" {
  description = "The path to the peer TLS key file."
  type        = string
}

variable "org1_admin_cert_path" {
  description = "The path to the Org1 admin TLS cert file."
  type        = string
}

variable "org1_admin_key_path" {
  description = "The path to the Org1 admin TLS key file."
  type        = string
}

variable "org1_user_cert_path" {
  description = "The path to the Org1 user TLS cert file."
  type        = string
}

variable "org1_user_key_path" {
  description = "The path to the Org1 user TLS key file."
  type        = string
}

variable "org2_admin_cert_path" {
  description = "The path to the Org2 admin TLS cert file."
  type        = string
}

variable "org2_admin_key_path" {
  description = "The path to the Org2 admin TLS key file."
  type        = string
}

variable "org2_user_cert_path" {
  description = "The path to the Org2 user TLS cert file."
  type        = string
}

variable "org2_user_key_path" {
  description = "The path to the Org2 user TLS key file."
  type        = string
}
