

output "release_namespace" {
  value = {% if cookiecutter.k8s_create_namespace == "y" %}kubernetes_namespace.release.metadata[0].name{% else %}data.kubernetes_namespace.release.metadata[0].name{% endif %}
}

output "depend_on" {
  # list all resources in this module here so that other modules are able to depend on this
  value = [
    helm_release.helm_release,
    {% if cookiecutter.k8s_create_namespace == "y" %}kubernetes_namespace.release{% endif %}
  ]
}
