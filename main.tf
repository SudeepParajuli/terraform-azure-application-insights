# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# ARM_ACCESS_KEY
#
# Reference the Azure Provider documentation for more information.
#
# https://www.terraform.io/docs/providers/azurerm/index.html

provider azurerm {
  features {}
}

terraform {
  required_version = "~> 0.13.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.33.0"
    }
  }
}

locals {
  project     = title(var.info.project)
  environment = title(var.info.environment)

  tags = merge(
    {
      for key, value in var.tags : key => title(value)
    },
    {
      project     = local.project
      environment = local.environment
    }
  )
}

module naming {
  source  = "Azure/naming/azurerm"
  version = "0.1.0"

  suffix = [local.project]
}
