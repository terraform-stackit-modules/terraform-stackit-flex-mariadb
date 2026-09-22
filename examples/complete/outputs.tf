output "instance_id" {
  description = "The ID of the MariaDB instance created by the example."
  value       = module.flex_mariadb.instance_id
}

output "credential_ids" {
  description = "The credential IDs created by the example (app + readonly)."
  value       = module.flex_mariadb.credential_ids
}
