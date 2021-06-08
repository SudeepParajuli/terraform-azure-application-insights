# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# Reference the Azure Provider documentation for more information.
#
# https://www.terraform.io/docs/providers/azurerm/index.html

variable info {
  type = object({
    project     = string
    environment = string
    sequence    = string
  })

  description = "Info object used to construct naming convention for application insights."

  validation {
    condition     = length(var.info.project) <= 79
    error_message = "Maximum of 79 characters allowed."
  }

  validation {
    condition = (
      can(regex("^[[:alnum:]]+$", var.info.project)) &&
      can(regex("^[[:alnum:]]+$", var.info.environment))
    )

    error_message = "Invalid character, alphanumeric values are supported."
  }

  validation {
    condition     = var.info.sequence > 0 && var.info.sequence <= 999
    error_message = "Sequence number must be between 1 and 999."
  }
}

variable tags {
  type        = map(string)
  description = "Tags object used to tag application insights."

  validation {
    condition = length([
      for key, value in var.tags : true
        if length(key) <= 512

    ]) == length(var.tags)

    error_message = "Tag name must not exceed 512 characters."
  }

  validation {
    condition = length([
      for key, value in var.tags : true
        if length(value) <= 256

    ]) == length(var.tags)

    error_message = "Tag value must not exceed 256 characters."
  }

  validation {
    condition = length([
      for key, value in var.tags : true
        if can(regex("^[[:alnum:]]+$", key)) &&
           can(regex("^[[:alnum:]]+$", value))

    ]) == length(var.tags)

    error_message = "Invalid character, alphanumeric values are supported."
  }
}

variable resource_group {
  type        = string
  description = "Name of the resource group where the application insights will be deployed."
}

variable region {
  type        = string
  description = "Region where the application insights will be created."
}

variable application_type {
  type        = string
  description = "Specifies the type of application insights to create."

  default = "web"

  validation {
    condition = (
      contains(
        [
          "ios", "java", "MobileCenter", "Node.JS",
          "other", "phone", "store", "web"
        ],
        var.application_type
      )
    )

    error_message = "Invalid application type was specified."
  }
}

variable daily_data_cap {
  type        = number
  description = "Specifies the application insights daily data volume cap in GB."

  default = 10

  validation {
    condition     = var.daily_data_cap > 0 && var.daily_data_cap <= 1000
    error_message = "Daily data cap must be between 1 and 1000."
  }
}

variable data_cap_notifications_disabled {
  type        = bool
  description = "Should notification emails for daily data cap be disabled."

  default = false
}

variable retention_days {
  type        = number
  description = "Specifies the retention period in days."

  default = 60

  validation {
    condition = (
      contains(
        [30, 60, 90, 120, 180, 270, 365, 550, 730], var.retention_days
      )
    )

    error_message = "Invalid retention days was specified."
  }
}

variable sampling_percentage {
  type        = number
  description = "The rate at which telemetry is sent to your application."

  default = null

  validation {
    condition = (
      var.sampling_percentage == null ? true :
      var.sampling_percentage > 0 &&
      var.sampling_percentage <= 100
    )

    error_message = "Sampling percentage must be between 1 and 100."
  }
}

variable disable_ip_masking {
  type        = bool
  description = "Should IP masking be disabled when logging IP address."

  default = false
}
