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
# The example block below describes creating a service group configured with
# registered Consul services
#
resource "myprovider_service_group" "consul_service" {
  for_each = var.catalog_services

  name     = var.service_group_name
  services = [keys(var.catalog_services)]
}
