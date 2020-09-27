variable "namespace" {
  default = "{{ cookiecutter.k8s_namespace_name }}"
}

{% if cookiecutter.helm_chart_version != "latest" -%}
variable "chart_version" {
  default = "{{ cookiecutter.helm_chart_version }}"
}
{%- endif %}

variable "extra_values" {
  default = {}
}
