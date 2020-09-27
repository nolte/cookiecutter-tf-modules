variable "namespace" {
  default = "{{ cookiecutter.k8s_namespace_name }}"
}

variable "extra_values" {
  default = {}
}
