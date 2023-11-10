#==================#
# Naming & Tagging #
#==================#

variable "environment" {
  description = "A naming object for the environment to provide both the environment's name and abbrevation for tagging and reporting purposes"
  type = object({
    name         = string
    abbreviation = string
  })

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.environment.name))
    error_message = "The environment name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-]*$", var.environment.abbreviation))
    error_message = "The environment abbreviation must be kebab case"
  }
}
variable "naming" {
  description = "A naming object to provide the display name of the service from the service catalog, and optionally also a resource name"
  type = object({
    display  = string
    resource = optional(string, null)
  })

  validation {
    condition     = can(regex("^[a-zA-Z 0-9\\-]*$", var.naming.display))
    error_message = "The service display name must only contain alphanumeric characters, spaces, and hyphens"
  }
  validation {
    condition     = can(regex("^[a-z0-9\\-]*$", var.naming.resource)) || var.naming.resource == null
    error_message = "If provided, the service resource name must be kebab case"
  }
}
variable "tagging" {
  description = "A collection of tags as key-value pairs to be applied to all applicable provisioned resources"
  type = object({
    additional_tags = optional(map(any), {})
    network         = string
    organization    = string
    owner           = string
    service_name    = optional(string, null)
    service_pattern = string
    tag_key_prefix  = string
  })
}

#==================#
# Resource Configs #
#==================#

variable "encrypt_private_key_secret" {
  type        = bool
  default     = true
  description = "Specifies whether or not to encrypt the secret that stores the private key"
}
variable "private_key_kms_arn" {
  type        = string
  default     = null
  description = "A KMS Key ARN for use in encrypting the secret that stores the private key"
}
variable "private_key_secret_recovery_window_in_days" {
  type        = number
  default     = 0
  description = "The number of days to retain the SecretsManager secret which contains the private key"
}
variable "private_key_kms_key_rotation_enabled" {
  type        = bool
  default     = true
  description = "Enable rotation of KMS key leveraged in encrypting the SecretsManager secret which contains the private key"
}
