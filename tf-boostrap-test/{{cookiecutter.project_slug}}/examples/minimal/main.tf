resource "kubernetes_namespace" "acc_namespace" {
  metadata {
    name = "acc-{{cookiecutter.project_slug}}"
  }
}

module "install" {
  source = "../../modules/install"
  namespace = kubernetes_namespace.acc_namespace.metadata[0].name
}

output "helm_release" {
  value = module.install.release
}