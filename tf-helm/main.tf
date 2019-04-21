module "tiller_sa" {
  source = "github.com/evry-ace/tf-helm-sa"
}

variable "tiller_image" {
  default = "gcr.io/kubernetes-helm/tiller:v2.13.1"
}

variable "kubedb_version" {
  default = "0.11.0"
}

data "helm_repository" "appscode" {
  name = "appscode"
  url  = "https://charts.appscode.com/stable/"
}

resource "helm_release" "kubedb-operator" {
  name       = "kubedb-operator"
  namespace  = "kube-system"
  chart      = "kubedb"
  repository = "${data.helm_repository.appscode.metadata.0.name}"
  version    = "${var.kubedb_version}"
}

resource "helm_release" "kubedb-catalog" {
  name       = "kubedb-catalog"
  namespace  = "kube-system"
  chart      = "kubedb-catalog"
  repository = "${data.helm_repository.appscode.metadata.0.name}"
  version    = "${var.kubedb_version}"

  depends_on = [
    "helm_release.kubedb-operator"
  ]

  values = [<<EOF
dockerRegistry: "kubedb"
catalog:
  elasticsearch: true
  etcd: false
  memcached: false
  mongo: false
  mysql: false
  postgres: false
  redis: false
EOF
  ]
}