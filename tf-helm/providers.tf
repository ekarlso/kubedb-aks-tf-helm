
provider "kubernetes" {}

provider "helm" {
  install_tiller  = true
  service_account = "${module.tiller_sa.service_account}"
  tiller_image    = "${var.tiller_image}"

  kubernetes {}
}