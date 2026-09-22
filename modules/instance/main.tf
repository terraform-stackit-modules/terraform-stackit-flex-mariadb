resource "stackit_mariadb_instance" "this" {
  count = var.create_instance ? 1 : 0

  project_id = var.project_id
  region     = var.region
  name       = var.name
  version    = var.mariadb_version
  plan_name  = var.plan_name

  parameters = var.parameters
}
