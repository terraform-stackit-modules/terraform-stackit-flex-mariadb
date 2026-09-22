output "instance_id" {
  description = "The ID of the replicated MariaDB instance created by the example."
  value       = module.flex_mariadb.instance_id
}
