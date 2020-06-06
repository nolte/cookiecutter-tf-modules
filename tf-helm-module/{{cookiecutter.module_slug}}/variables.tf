variable "release_namespace" {
  default = "{{ cookiecutter.k8s_namespace_name }}"
}

variable "ingress_domain" {
  type = string
}

variable "depends_list" {
  default = []
}