
locals {
  EXTRA_VALUES = {
  }
}


resource "helm_release" "release" {
  name       = "{{ cookiecutter.helm_release_name }}"
  repository = "{{ cookiecutter.helm_chart_repository }}"
  chart      = "{{ cookiecutter.helm_chart }}"
  {% if cookiecutter.helm_chart_version != "latest" -%}version      = var.chart_version{%- endif %}
  namespace  = var.release_namespace
  values = [
    yamlencode(local.EXTRA_VALUES),
    yamlencode(var.extra_values)
  ]
}