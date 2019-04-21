## Azure Provider ##
variable "subscription_id" {
  description = "Azure Subscription"
}

variable "client_id" {
  description = "Azure Client ID"
}

variable "client_secret" {
  description = "Azure Client Secret"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}


## Environment variables ##
variable "resourcegroup_name" {
  description = "Name of RG the environment will run inside"
}

variable "resourcegroup_location" {
  description = "Location of the RG the environment will run inside"
  default     = "West Europe"
}

## AKS variables ##
variable "cluster_name" {
  description = "Name for the k8s cluster"
  default     = "ace_cluster"
}

variable "ssh_public_key" {
  description = "Public SSH key to distribute to images"
}

variable "dns_prefix" {
  description = "DNS prefix for resources"
}

variable "aks_pod_cidr" {}

variable "aks_service_cidr" {}
variable "aks_dns_service_ip" {}

variable "aks_rbac_client_app_id" {
  description = "Client App ID for RBAC"
}

variable "aks_rbac_server_app_id" {
  description = "Server App ID for RBAC"
}

variable "aks_rbac_server_app_secret" {
  description = "Server Secret ID for RBAC"
}
