# Module {{ cookiecutter.module_slug }} for Helm Chart {{ cookiecutter.helm_chart }}

```hcl
module "{{ cookiecutter.helm_chart }}" {
  src = "../{{ cookiecutter.module_slug }}"
}
```