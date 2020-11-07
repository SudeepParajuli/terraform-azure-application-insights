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
}

variable tags {
  type        = map(string)
  description = "Tags object used to tag application insights resource."
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
  description = "Specifies the type of Application Insights to create."

  default = "web"
}

variable daily_data_cap {
  type        = number
  description = "Specifies the Application Insights daily data volume cap in GB."

  default = 10
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
}

variable sampling_percentage {
  type        = number
  description = "The rate at which telemetry is sent to your application."

  default = null
}

variable disable_ip_masking {
  type        = bool
  description = "Should IP masking be disabled when logging IP address."

  default = false
}
