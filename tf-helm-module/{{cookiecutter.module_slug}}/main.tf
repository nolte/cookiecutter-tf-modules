
{%- if cookiecutter.k8s_create_namespace == "y" %}
resource "kubernetes_namespace" "release" {
  depends_on = [var.depends_list]
  metadata {
    name = var.release_namespace
  }
}
{% else %}
data "kubernetes_namespace" "release" {
  metadata {
    name = var.release_namespace
  }
}
{%- endif -%}

resource "helm_release" "release" {
  {% if cookiecutter.k8s_create_namespace != "y" %}depends_on = [var.depends_list]{% endif %}
  name       = "{{ cookiecutter.helm_release_name }}"
  repository = "{{ cookiecutter.helm_chart_repository }}"
  chart      = "{{ cookiecutter.helm_chart }}"
  namespace  = {% if cookiecutter.k8s_create_namespace == "y" %}kubernetes_namespace.release.metadata[0].name{% else %}data.kubernetes_namespace.release.metadata[0].name{% endif %}
  values = [
    "${templatefile("${path.module}/files/values.yml", {
      CLUSTER_DOMAIN = var.ingress_domain,
    })}"
  ]
}