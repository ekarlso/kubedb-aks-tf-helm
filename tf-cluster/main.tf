resource "azurerm_resource_group" "test-rg" {
  name = "${var.resourcegroup_name}"
  location = "${var.resourcegroup_location}"
}

module "aks" {
  source                  = "github.com/evry-ace/tf-azure-aks"
  resource_group_name     = "${azurerm_resource_group.test-rg.name}"
  resource_group_location = "${var.resourcegroup_location}"
  environment             = "test"
  ssh_public_key          = "${var.ssh_public_key}"
  cluster_name            = "${var.cluster_name}"
  dns_prefix              = "${var.dns_prefix}"

  client_id     = "${var.client_id}"
  client_secret = "${var.client_secret}"

  rbac_server_app_id     = "${var.aks_rbac_server_app_id}"
  rbac_server_app_secret = "${var.aks_rbac_server_app_secret}"
  rbac_client_app_id     = "${var.aks_rbac_client_app_id}"

  k8s_version = "1.12.7"

  aks_docker_bridge_cidr = "172.17.0.1/16"
  aks_pod_cidr           = "${var.aks_pod_cidr}"
  aks_service_cidr       = "${var.aks_service_cidr}"
  aks_dns_service_ip     = "${var.aks_dns_service_ip}"

  create_vnet        = true
}

# module "tiller_sa" {
#   source = "github.com/evry-ace/tf-helm-sa"
# }
