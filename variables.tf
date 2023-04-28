# Resource group
variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
}

# AKS cluster
variable "locationk8s" {
  description = "The Azure location to deploy the AKS cluster in."
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster to create."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the AKS cluster."
  type        = string
}

variable "agent_count" {
  description = "The number of agent nodes to provision in the AKS cluster."
  type        = number
}

variable "ssh_public_key" {
  description = "SSH public key used for accessing the AKS cluster."
  type        = string
}

variable "aks_service_principal_app_id" {
  description = "Application ID of the service principal used for the AKS cluster."
  type        = string
}

variable "aks_service_principal_client_secret" {
  description = "Client secret of the service principal used for the AKS cluster."
  type        = string
}

# Hyperledger Fabric
variable "org_name" {
  description = "Name of the Hyperledger Fabric organization."
  type        = string
}

variable "msp_id" {
  description = "MSP ID of the Hyperledger Fabric organization."
  type        = string
}

variable "ca_username" {
  description = "Username for the Hyperledger Fabric CA."
  type        = string
}

variable "ca_password" {
  description = "Password for the Hyperledger Fabric CA."
  type        = string
}

variable "orderer_address" {
  description = "The address of the Hyperledger Fabric orderer."
  type        = string
}

variable "peer_address" {
  description = "The address of the Hyperledger Fabric peer."
  type        = string
}

variable "peer_private_key_file_path" {
  description = "Path to the private key file for the Hyperledger Fabric peer."
  type        = string
}
