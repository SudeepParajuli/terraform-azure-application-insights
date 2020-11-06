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

module resource_group {
  source  = "massimo1993/resource-group/azure"
  version = "0.0.1"

  info = var.info
  tags = var.tags

  region = var.region
}
