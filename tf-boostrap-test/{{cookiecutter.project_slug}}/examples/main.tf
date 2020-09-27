module "install" {
  source "../../modules/install"
}


output "helm_release" {
  value = module.install.release
}