#
# var.services is a required input variable for Consul Terraform Sync regardless
# of the type of task condition
#
# An example of the services input value:
# services = {
#   "app-id-01.worker-01.dc1" : {
#     id              = "app-id-01"
#     name            = "app"
#     ...
#   },
#   "web.worker-01.dc1" : {
#     ...
#   }
# }
#
variable "services" {
  description = "Consul services monitored by Consul-Terraform-Sync"
  type = map(
    object({
      id        = string
      name      = string
      kind      = string
      address   = string
      port      = number
      meta      = map(string)
      tags      = list(string)
      namespace = string
      status    = string

      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)

      cts_user_defined_meta = map(string)
    })
  )
}

#
# var.catalog_services is a Consul Terraform Sync provided additional input
# variable for modules to execute on a catalog-services condition
#
# An example of the catalog_services input value:
# catalog_services = {
#   "api" = ["blue", "green"]
#   "consul" = []
#   "web" = ["tag"]
# }
#
variable "catalog_services" {
  description = "Consul catalog service names and tags monitored by Consul-Terraform-Sync"
  type = map(list(string))
}

#
# Your module for can include input variables to be used by CTS operators for
# customizing the module based on their infastructure. CTS supports both
# optional and required variables.
#
variable "service_group_name" {
  description = "Name of the service group"
  type        = string

  # Set the default argument to a default value to declare an optional variable.
  # Omit the default argument for required ariables.
  default = ""

  # Set the sensitive flag for input variables that contain secret or sensitive
  # values. When set, Terraform will redact the value from output when Terraform
  # commands are run.
  sensitive = false
}
