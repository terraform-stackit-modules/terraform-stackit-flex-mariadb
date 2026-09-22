variable "project_id" {
  description = "STACKIT project ID to which the instance is associated."
  type        = string
}

variable "instance_id" {
  description = "ID of the MariaDB instance the credentials belong to."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

variable "credentials" {
  description = <<-EOT
    Map of credentials to create on the instance, keyed by a stable identifier. Each value:
      - `rotate_when_changed` : optional map whose change forces recreation (rotation) of the
                                credential, e.g. wired to a `time_rotating` resource id.
    Generated username/password/uri are exposed via sensitive outputs.
  EOT
  type = map(object({
    rotate_when_changed = optional(map(string))
  }))
  default = {}
}
