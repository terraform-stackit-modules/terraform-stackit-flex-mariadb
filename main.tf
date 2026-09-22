module "instance" {
  source = "./modules/instance"

  create_instance = var.create_instance
  project_id      = var.project_id
  region          = var.region
  name            = var.name
  mariadb_version = var.mariadb_version
  plan_name       = var.plan_name
  parameters      = var.parameters
}

module "credential" {
  source = "./modules/credential"

  project_id  = var.project_id
  region      = var.region
  instance_id = coalesce(module.instance.instance_id, var.instance_id)
  credentials = var.credentials
}
