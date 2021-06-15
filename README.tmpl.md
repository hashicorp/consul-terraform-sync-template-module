## Consul Terraform Sync Module <!-- update module title -->

This section begins the template for the module README used for documentation.

The title of the README should include the network infrastructure along with the high level feature of the module. For example, _"MyProvider Firewall Address Group module for Network Infrastructure Automation (NIA)"_ or _"MyProvider LB Service Group module for Consul Terraform Sync"_

In the first section after the title, introduce the high level automation goal of the module and how it works in conjunction with Consul Terraform Sync. An example summary:

This Terraform module creates an address group for MyProvider Firewall for each service and adds service IP addresses to the groups. Using the module in automation with [Consul Terraform Sync](https://www.consul.io/docs/nia) will dynamically add or remove service instances from the address group based on [Consul service discovery](https://www.consul.io/).

<!-- end replace -->

## Feature

<!-- replace template instructions below with your content -->

In this section, describe the feature and set of resources the module manages as well as the expected condition type of a task configured with this module. For example:

The module creates an address group if it does not already exist, and applies an existing policy group to the address group when specified for the service. The module executes on the default services condition, when there are any changes to the instances of the specified services.

<!-- end -->

## Requirements

### Ecosystem Requirements

<!-- replace template instructions below with your content -->

Specify any version requirements for the network  infrastructure needed for the module.

Consul Terraform Sync supports Terraform >= 0.13. However, your module may require a higher Terraform version constraint based on Terraform features and syntax used.

<!-- end -->

| Ecosystem | Version |
|-----------|---------|
| network infrastructure | >= X.Y.Z |
| [consul](https://www.consul.io/downloads) | >= 1.7 |
| [consul-terraform-sync](https://www.consul.io/docs/nia) | >= 0.1.0 |
| [terraform](https://www.terraform.io) | >= 0.13 |

### Terraform Providers

| Name | Version |
|------|---------|
| myprovider | >= 1.1.0 |

## Setup

<!-- replace template instructions below with your content -->

List prerequisites and outline detailed steps in this section for users to setup the network infrastructure for automation with Consul Terraform Sync. An example set of instructions can look like:

1. Create a user on the network platform for the purpose of automation with Consul Terraform Sync.
1. Create a restricted token for the user from step 1. This token will be used for authentication with MyProvider in Consul Terraform Sync configuration.
1. (Optional) Create a policy group with restricted permissions. The policy name can then be used to apply the policy on the automated address group.

<!-- end -->

## Usage

<!-- begin template instructions replace -->

Highlight any required [input variables](https://consul.io/docs/nia/configuration#variable_files), [user-defined metadata](https://consul.io/docs/nia/configuration#cts_user_defined_meta), or [provided input variables](https://consul.io/docs/nia/terraform-modules#optional-input-variables) and provide an example configuration for Consul Terraform Sync for your module.

<!-- end -->

| User-defined meta | Required | Description |
|-------------------|----------|-------------|
| policy_name | true | The name of an existing policy to apply to the address group for the service |

**User Config for Consul Terraform Sync**

example.hcl
```hcl
task {
  name           = "fw-address-group"
  description    = "automate firewall address group with Consul services"
  source         = "namespace/your-module"
  version        = "0.0.0"
  providers      = ["myprovider"]
  services       = ["web", "app"]
  variable_files = ["task-fw-address-group.tfvars"]
}

driver "terraform" {
  required_providers = {
    myprovider = {
      source  = "namespace/myprovider"
      version = "1.1.2"
    }
  }
}

terraform_provider "myprovider" {
  address = "myprovider.example.com"

  task_env {
    "MYPROVIDER_TOKEN" = "{{ env \"CTS_MYPROVIDER_TOKEN\" }}"
  }
}

service {
  name = "app"
  cts_user_defined_meta = {
    policy_name = "cts_app_firewall_policy"
  }
}
```

**Variable file**

Optional input variable file defined by a user for the task above.

task-fw-address-group.tfvars
```hcl
address_group_prefix = "consul-"
address_group_tags   = ["consul", "consul-terraform-sync"]
```
