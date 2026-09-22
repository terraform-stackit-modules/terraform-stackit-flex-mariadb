#####################################################################################
# "complete" example — self-contained, requires only `project_id`.
#
# Prod-like MariaDB Flex instance: monitoring enabled, ACL restricted, and multiple
# credentials (one for the app, one read-only consumer). Mirrors the "complete-mysql"
# example of terraform-aws-modules/terraform-aws-rds.
#####################################################################################

module "flex_mariadb" {
  source = "../.."

  project_id      = var.project_id
  name            = "example-mariadb-complete"
  mariadb_version = "10.11"
  plan_name       = "stackit-mariadb-1.2.10-replica"

  parameters = {
    sgw_acl           = "10.0.0.0/8"
    enable_monitoring = false
    metrics_frequency = 60
  }

  credentials = {
    app      = {}
    readonly = {}
  }
}
