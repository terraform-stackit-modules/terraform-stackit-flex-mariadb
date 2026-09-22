output "instance_id" {
  description = "The ID of the MariaDB instance (created, or the provided instance_id when create_instance is false)."
  value       = coalesce(module.instance.instance_id, var.instance_id)
}

output "plan_id" {
  description = "The resolved plan ID of the instance (null when the instance is not created by this module)."
  value       = module.instance.plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the instance (null when the instance is not created by this module)."
  value       = module.instance.dashboard_url
}

output "credential_ids" {
  description = "Map of credential key to credential ID."
  value       = module.credential.credential_ids
}

output "credential_usernames" {
  description = "Map of credential key to generated username."
  value       = module.credential.usernames
}

output "credential_passwords" {
  description = "Map of credential key to generated password. Sensitive."
  value       = module.credential.passwords
  sensitive   = true
}

output "credential_uris" {
  description = "Map of credential key to connection URI. Sensitive."
  value       = module.credential.uris
  sensitive   = true
}
