
variable "depends_list" {
  default = []

}

output "depend_on" {
  # list all resources in this module here so that other modules are able to depend on this
  value = [
  ]
}
