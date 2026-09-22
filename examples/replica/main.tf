#####################################################################################
# "replica" example — self-contained, requires only `project_id`.
#
# High-availability MariaDB Flex. NOTE: unlike AWS RDS (which has an explicit
# `replicate_source_db`), STACKIT MariaDB replication is carried by the PLAN — a
# replicated plan (suffix `-replica`) provisions a managed primary/replica topology.
# There is no separate "replica instance" resource to wire to a source.
#####################################################################################

module "flex_mariadb" {
  source = "../.."

  project_id      = var.project_id
  name            = "example-mariadb-replica"
  mariadb_version = "10.11"

  # Replicated plan → managed primary + replica(s) under the hood.
  plan_name = "stackit-mariadb-1.2.10-replica"

  parameters = {
    sgw_acl = "10.0.0.0/8"
  }

  credentials = {
    app = {}
  }
}
