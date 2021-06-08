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

provider azurerm {
  features {}
}

module resource_group {
  source  = "massimo1993/resource-group/azure"
  version = "1.0.0"

  info   = var.info
  region = var.region

  tags = var.tags
}

module application_insights {
  #source  = "massimo1993/application-insights/azure"
  #version = "1.0.0"

  source = "../../"

  info = var.info

  resource_group = module.resource_group.name
  region         = var.region

  application_type = "java"
  daily_data_cap   = var.daily_data_cap

  tags = var.tags
}
