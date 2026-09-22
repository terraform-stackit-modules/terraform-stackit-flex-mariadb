# ─── Core ─────────────────────────────────────────────────────────────────────

variable "project_id" {
  description = "STACKIT project ID to which the MariaDB instance and its credentials are associated."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

# ─── Instance ─────────────────────────────────────────────────────────────────

variable "create_instance" {
  description = "Whether to create the MariaDB instance. Set to false to manage credentials against an existing instance provided via `instance_id`."
  type        = bool
  default     = true
}

variable "instance_id" {
  description = "ID of an existing MariaDB instance. Used for credentials when `create_instance` is false."
  type        = string
  default     = null
}

variable "name" {
  description = "Instance name."
  type        = string
  default     = null
}

variable "mariadb_version" {
  description = "The MariaDB service version, e.g. \"10.11\"."
  type        = string
  default     = null
}

variable "plan_name" {
  description = "The selected plan name, e.g. \"stackit-mariadb-1.2.10-replica\". List plans with the `stackit_mariadb_instance` service plans."
  type        = string
  default     = null
}

variable "parameters" {
  description = <<-EOT
    Optional instance configuration parameters (all optional):
    `sgw_acl`, `enable_monitoring`, `monitoring_instance_id`, `graphite`, `metrics_frequency`,
    `metrics_prefix`, `max_disk_threshold`, `syslog`.
  EOT
  type = object({
    sgw_acl                = optional(string)
    enable_monitoring      = optional(bool)
    monitoring_instance_id = optional(string)
    graphite               = optional(string)
    metrics_frequency      = optional(number)
    metrics_prefix         = optional(string)
    max_disk_threshold     = optional(number)
    syslog                 = optional(list(string))
  })
  default = null
}

# ─── Credentials ──────────────────────────────────────────────────────────────

variable "credentials" {
  description = <<-EOT
    Map of credentials to create on the instance, keyed by a stable identifier. Each value:
      - `rotate_when_changed` : optional map whose change forces credential rotation.
    Generated passwords/URIs are exposed via the `credential_passwords` / `credential_uris`
    outputs (sensitive).
  EOT
  type = map(object({
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}
