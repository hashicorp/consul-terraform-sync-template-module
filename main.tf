terraform {
  required_providers {
    # Provider source is used for Terraform discovery and installation of
    # providers. Declare source for all providers required by the module.
    myprovider = {
      source  = "namespace/myprovider"
      version = "~>1.1.0"
    }
  }
}

#
# Declare resource blocks to describe module behaviors for the infrastructure.
#
# The example block below describes creating an address group for each Consul
# service and applies an existing policy to the group.
#
resource "myprovider_address_group" "consul_service" {
  for_each = local.consul_services

  name     = "${var.address_group_prefix}${each.key}"
  tags     = var.address_group_tags
  policies = [each.value.cts_user_defined_meta["policy_name"]]
}

#
# You can utilize the locals block to transform the var.services variable
# into a data structure for your module. For more examples of common data
# transformations visit the project wiki.
#
# The example below converts var.services to a map of service names to a list
# of service instances.
locals {
  # Group service instances by service name
  # consul_services = {
  #   "app" = [
  #     {
  #       "id" = "app-id-01"
  #       "name" = "app"
  #       "node_address" = "192.168.10.10"
  #     }
  #   ]
  # }
  consul_services = {
    for id, s in var.services : s.name => s...
  }
}
