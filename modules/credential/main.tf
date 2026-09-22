resource "stackit_mariadb_credential" "this" {
  for_each = var.credentials

  project_id          = var.project_id
  region              = var.region
  instance_id         = var.instance_id
  rotate_when_changed = each.value.rotate_when_changed
}
