output "credential_ids" {
  description = "Map of credential key to credential ID."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.credential_id }
}

output "usernames" {
  description = "Map of credential key to generated username."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.username }
}

output "hosts" {
  description = "Map of credential key to host."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.host }
}

output "ports" {
  description = "Map of credential key to port."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.port }
}

output "passwords" {
  description = "Map of credential key to generated password. Sensitive."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.password }
  sensitive   = true
}

output "uris" {
  description = "Map of credential key to connection URI. Sensitive."
  value       = { for k, c in stackit_mariadb_credential.this : k => c.uri }
  sensitive   = true
}
