provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  version         = "v1.22.0"
}

# provider "azuread" {
#   subscription_id = "${var.subscription_id}"
#   client_id       = "${var.client_id}"
#   client_secret   = "${var.client_secret}"
#   tenant_id       = "${var.tenant_id}"
#   version         = "v0.2.0"
# }

terraform {
  backend "azurerm" {
    container_name = "terraform-state"
    key            = "maze-aks.terraform.tfstate"
  }
}

