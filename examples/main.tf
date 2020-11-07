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

module resource_group {
  source  = "massimo1993/resource-group/azure"
  version = "0.0.1"

  info = var.info
  tags = var.tags

  region = var.region
}

module application_insights {
  source  = "massimo1993/application-insights/azure"
  version = "0.0.1"

  info = var.info
  tags = var.tags

  resource_group = module.resource_group.name
  region         = module.resource_group.region

  application_type     = "java"
  daily_data_cap_in_gb = 20
}
