variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "create_instance" {
  description = "Whether to create the MariaDB instance."
  type        = bool
  default     = true
}

variable "name" {
  description = "Instance name."
  type        = string
}

variable "mariadb_version" {
  description = "The MariaDB service version, e.g. \"10.11\"."
  type        = string
}

variable "plan_name" {
  description = "The selected plan name, e.g. \"stackit-mariadb-1.2.10-replica\"."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

variable "parameters" {
  description = <<-EOT
    Optional configuration parameters. All fields optional:
      - `sgw_acl`                : comma-separated CIDR list allowed to access the instance.
      - `enable_monitoring`      : enable monitoring.
      - `monitoring_instance_id` : STACKIT monitoring instance ID.
      - `graphite`               : Graphite server URL (host:port).
      - `metrics_frequency`      : metrics emission frequency in seconds.
      - `metrics_prefix`         : prefix for emitted metrics.
      - `max_disk_threshold`     : max disk threshold in MB (instance stops if exceeded).
      - `syslog`                 : list of syslog servers.
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
