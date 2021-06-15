terraform {
  backend "azurerm" {
    resource_group_name  = "rg-common-dev-001"
    storage_account_name = "stcommondev001"
    container_name       = "terraform"
    key                  = "app-insights-api-keys.tfstate"
    snapshot             = true
  }
}
