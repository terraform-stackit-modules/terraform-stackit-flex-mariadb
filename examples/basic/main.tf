#####################################################################################
# Terraform module examples are meant to show an _example_ on how to use a module
# per use-case. The code below should not be copied directly but referenced in order
# to build your own root module that invokes this module.
#
# This example is self-contained and requires only `project_id`: it creates a
# MariaDB Flex instance and a credential on it.
#####################################################################################

module "flex_mariadb" {
  source = "../.."

  project_id      = var.project_id
  name            = "example-mariadb"
  mariadb_version = "10.11"
  plan_name       = "stackit-mariadb-1.2.10-replica"

  parameters = {
    sgw_acl = "0.0.0.0/0"
  }

  credentials = {
    app = {}
  }
}
