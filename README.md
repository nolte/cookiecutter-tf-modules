# Terrafom Module Templates


## Usage

```bash
export GENERATE_PROJECT_NAME="tf-k8s-influxdb"
cookiecutter gh:nolte/vscode-devcontainers --directory="cookiecutter-project" project_slug="${GENERATE_PROJECT_NAME}" project_type="devops" extra_dockerfile="n"
cookiecutter gh:nolte/tf-boostrap --directory="tf-boostrap" project_slug="${GENERATE_PROJECT_NAME}" --checkout feature/tf-helm-modules
cd ./${GENERATE_PROJECT_NAME}/modules
cookiecutter gh:nolte/tf-boostrap --directory="tf-helm-module" --checkout feature/tf-helm-modules

cookiecutter /workspace/tf-boostrap module_slug="tf-k8s-influxdb"
cd ./tf-k8s-influxdb/modules
cookiecutter /workspace/tf-helm-module module_slug="install" helm_chart="influxdb" helm_chart_repository="https://helm.influxdata.com/"

cookiecutter /workspace/tf-helm-module module_slug="install" helm_chart="keycloak" helm_chart_repository="https://codecentric.github.io/helm-charts"
```


## Links

* [terraform-provider-kubernetes](https://www.terraform.io/docs/providers/kubernetes/index.html)
* [terraform-provider-helm](https://www.terraform.io/docs/providers/helm/index.html)