# Template Module for Consul Terraform Sync

<!-- replace this file with content in README.tmpl.md -->

This repository is a template for structuring a compatible Terraform module for [Consul Terraform Sync](https://www.consul.io/docs/nia). The files contain standard sections and provide a guideline for writing documentation and framework for developing a module. You can clone this repository to begin building a module by following the structure and replacing instructions with content for your module.

The template repository includes:
* [README](README.tmpl.md) for module documentation
  * Rename the file [README.tmpl.md](README.tmpl.md) to README.md to replace this file.
  * In the raw markdown of the file, there are HTML comments `<!-- replace -->` to indicate text that can be replaced with documentation for your module. The comments themselves can also be removed.
* Standard module structure for Consul Terraform Sync
  * [main.tf](main.tf): the primary entry point for the module
  * [variables.tf](variables.tf): contains variable declarations, including the required `var.services` for Consul Terraform Sync compatibility.

This repository has different branches that can be checked out to see templates for various features that may have different supported variable and documentation recommendations.
 * `main` branch: basic template for default services condition and intermediate input variables
 * [`catalog-services-condition-template`](https://github.com/hashicorp/consul-terraform-sync-template-module/tree/catalog-services-condition-template) branch: template for catalog-service condition

Visit Terraform documentation for detailed information on [creating modules](https://www.terraform.io/docs/language/modules/develop/index.html) and the [standard module structure](https://www.terraform.io/docs/language/modules/develop/structure.html). Details on Consul Terraform Sync specifications and requirements for modules are outlined in the [official Consul docs](https://www.consul.io/docs/nia/installation/requirements#how-to-create-a-compatible-terraform-module). After you have completed and tested your module, you can share your module by [publishing it on the Terraform Registry](https://www.terraform.io/docs/registry/modules/publish.html) or a [private registry](https://www.terraform.io/docs/registry/private.html).

A complete example of a compatible Terraform module can be referenced [here](https://registry.terraform.io/modules/CheckPointSW/dynobj-nia/checkpoint/latest).

## Terraform Resources

Creating integrations for Consul Terraform Sync involves understanding Terraform and Terraform modules.

[terraform.io](https://www.terraform.io/docs/language/index.html) is a great resource for learning Terraform. Below is a curated list of useful Terraform Learn tutorials to help you begin building a module.
* [Configuration Language](https://learn.hashicorp.com/collections/terraform/configuration-language)
  * [`local` value](https://learn.hashicorp.com/tutorials/terraform/locals)
  * [expressions](https://learn.hashicorp.com/tutorials/terraform/expressions?in=terraform/configuration-language)
  * [`for_each`](https://learn.hashicorp.com/tutorials/terraform/for-each?in=terraform/configuration-language)

Visit the project wiki to view additional resources specific to Consul Terraform Sync and Terraform, like transforming `var.services` and setting up an environment to test compatible modules.
* https://github.com/hashicorp/consul-terraform-sync-template-module/wiki
