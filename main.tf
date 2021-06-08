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

terraform {
  required_version = ">= 0.15.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.56.0"
    }
  }
}

locals {
  project     = lower(var.info.project)
  environment = lower(var.info.environment)

  tags = merge(
    {
      for key, value in var.tags : lower(key) => lower(value)
    },
    {
      project     = local.project
      environment = local.environment
      source      = "terraform"
    }
  )
}
