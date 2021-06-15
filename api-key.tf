locals {
  permissions = {
    read = {
      read  = ["aggregate", "api", "draft", "extendqueries", "search"]
      write = []
    }

    write = {
      read  = []
      write = ["annotations"]
    }

    auth_sdk = {
      read  = ["agentconfig"]
      write = []
    }


    full_access = {
      read  = ["agentconfig", "aggregate", "api", "draft", "extendqueries", "search"]
      write = ["annotations"]
    }
  }
}

resource azurerm_application_insights_api_key api_key {
  for_each = {
    for key in var.api_keys : key.name => key
  }

  name                    = each.value.name
  application_insights_id = azurerm_application_insights.application_insights.id

  read_permissions  = local.permissions[each.value.permissions].read
  write_permissions = local.permissions[each.value.permissions].write
}
